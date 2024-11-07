import std/[strformat, os, macros, strutils, json, genasts, options, math, sugar, tables]
import wit, wit_gen

when not declared(buildOS):
  const buildOS {.magic: "BuildOS".}: string = hostOS
const windowsHost = buildOS == "windows"
const cmdPrefix = when windowsHost: "cmd /E:ON /C " else: ""

func hostQuoteShell(s: string): string =
  ## Quote ``s``, so it can be safely passed to shell.
  when not defined(windows) and windowsHost:
    result = quoteShellWindows(s)
  else:
    result = quoteShell(s)

macro wasmexport*(name: static[string], t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)
  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit"EMSCRIPTEN_KEEPALIVE $# $#$#")
  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree(codeGen)
  else:
    newProc[4].add codeGen
  newProc[4].add nnkCall.newTree(ident"exportC", newLit(name))
  result = newStmtList()
  result.add:
    quote do:
      {.emit: "/*INCLUDESECTION*/\n#include <emscripten.h>".}
  result.add:
    newProc

macro wasmimport*(name: static[string], env: static[string], t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)

  let module = env
  let name = name

  let attrib = if module != "":
    &"""__attribute__((__import_module__("{module}"), __import_name__("{name}")))"""
  else:
    &"""__attribute__((__import_name__("{name}")))"""

  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit(attrib & " $# $#$#"))

  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree()

  newProc[4] = nnkPragma.newTree(codeGen)
  newProc[4].add ident"importc"

  result = newStmtList()
  result.add:
    newProc

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], param: NimNode, typ: WitType, outCode: NimNode) =
  # let typ = ctx.despecialize(typ)
  # echo &"lower {param.repr}: {typ}, {loweredArgs[0].treeRepr}, {typ}"
  case typ.builtin
  of "void":
    outCode.add nnkDiscardStmt.newTree(newEmptyNode())

  of "bool":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      loweredArg = cast[int32](param)
    outCode.add code

  of "char":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      loweredArg = cast[int32](param)
    outCode.add code

  of "s8", "s16", "s32", "s64", "u8", "u16", "u32", "u64", "f32", "f64":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      loweredArg = param
    outCode.add code

  of "string":
    let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
      if param.len > 0:
        loweredPtr = cast[int32](param[0].addr)
      else:
        loweredPtr = 0
      loweredLen = param.len
    outCode.add code

  of "":
    let userType = ctx.types[typ.index]
    case userType.kind
    of List:
      let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
        if param.len > 0:
          loweredPtr = cast[int32](param[0].addr)
        else:
          loweredPtr = 0
        loweredLen = param.len
      outCode.add code

    of Enum:
      let t = ident(ctx.flattenType(typ)[0].nimTypeName)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        loweredArg = cast[t](param)
      outCode.add code

    of Flags:
      let t = ident(ctx.flattenType(typ)[0].nimTypeName)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        loweredArg = cast[t](param)
      outCode.add code

    of Option:
      let childAccess = nnkDotExpr.newTree(param, ident("get"))
      var lowerChild = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], childAccess, userType.optionTarget, lowerChild)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild):
        loweredTag = param.isSome.int32
        if param.isSome:
          lowerChild
      outCode.add code

    of Result:
      let childAccess = nnkDotExpr.newTree(param, ident("value"))
      let errAccess = nnkDotExpr.newTree(param, ident("error"))
      var lowerChild = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], childAccess, userType.resultOkTarget, lowerChild)
      var lowerError = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], errAccess, userType.resultErrTarget, lowerError)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild, lowerError):
        loweredTag = param.isErr.int32
        if param.isOk:
          lowerChild
        else:
          lowerError
      outCode.add code

    of Record:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        ctx.lower(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Tuple:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkBracketExpr.newTree(param, newLit(i))
        ctx.lower(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Variant:
      var cases = nnkCaseStmt.newTree(nnkDotExpr.newTree(param, ident"kind"))
      var addElse = false

      for f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        var caseCode = nnkStmtList.newTree()
        ctx.lower(loweredArgs[1..^1], fieldAccess, f.typ, caseCode)
        cases.add nnkOfBranch.newTree(ident(f.name.toCamelCase(true)), caseCode)

      if addElse:
        cases.add nnkElse.newTree(nnkStmtList.newTree(nnkDiscardStmt.newTree(newEmptyNode())))

      let code = genAst(loweredTag = loweredArgs[0], param, cases):
        loweredTag = param.kind.int32
        cases
      outCode.add code

    # todo
    # of Owned, Borrowed:

    else:
      error("Not implemented lower(" & $userType.kind & ")")

  else:
    error("Not implemented lower(" & $typ.builtin & ")")

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lower {p}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], p.typ, outCode)
    loweredI += ctx.flatTypeSize(p.typ)

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], results: openArray[WitType], outCode: NimNode) =
  var loweredI = 0
  for i, r in results:
    # echo &"{i}, {loweredI}: lower {r}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], r, outCode)
    loweredI += ctx.flatTypeSize(r)

proc lift(ctx: WitContext, loweredArgs: openArray[NimNode], param: NimNode, typ: WitType, outCode: NimNode) =
  # let typ = ctx.despecialize(typ)
  # echo &"lift {param.repr}: {typ}, {loweredArgs[0].treeRepr}"
  case typ.builtin
  of "void":
    outCode.add nnkDiscardStmt.newTree(newEmptyNode())

  of "bool":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      param = loweredArg != 0
    outCode.add code

  of "char":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      param = loweredArg.Rune
    outCode.add code

  of "s8", "s16", "s32", "s64", "u8", "u16", "u32", "u64", "f32", "f64":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      param = loweredArg
    outCode.add code

  of "string":
    let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
      param = ws(cast[ptr char](loweredPtr), loweredLen)
    outCode.add code

  of "":
    let userType = ctx.types[typ.index]
    case userType.kind
    of List:
      let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
        param = wl(cast[ptr typeof(param[0])](loweredPtr), loweredLen)
      outCode.add code

    of Enum:
      let t = ctx.getTypeName(typ)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        param = cast[t](loweredArg)
      outCode.add code

    of Flags:
      let t = ctx.getTypeName(typ)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        param = cast[t](loweredArg)
      outCode.add code

    of Option:
      let t = ctx.getTypeName(userType.optionTarget)
      let child = ident"temp"
      let childDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(child, t, newEmptyNode()))
      var lowerChild = nnkStmtList.newTree()
      ctx.lift(loweredArgs[1..^1], child, userType.optionTarget, lowerChild)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild, t, childDecl, child):
        if loweredTag != 0:
          childDecl
          lowerChild
          param = child.some
      outCode.add code

    of Result:
      let okType = ctx.getTypeName(userType.resultOkTarget)
      let errType = ctx.getTypeName(userType.resultErrTarget)
      let okChild = ident"tempOk"
      let errChild = ident"tempErr"
      let okChildDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(okChild, okType, newEmptyNode()))
      let errChildDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(errChild, errType, newEmptyNode()))
      var lowerChild = nnkStmtList.newTree()
      var lowerError = nnkStmtList.newTree()
      ctx.lift(loweredArgs[1..^1], okChild, userType.resultOkTarget, lowerChild)
      ctx.lift(loweredArgs[1..^1], errChild, userType.resultErrTarget, lowerError)

      let okCase = if okType.repr == "void":
        genAst(param, okType, errType):
          param = results.Result[okType, errType].ok()
      else:
        genAst(param, lowerChild, okType, errType, okChild, okChildDecl):
          okChildDecl
          lowerChild
          param = results.Result[okType, errType].ok(okChild)

      let errCase = if errType.repr == "void":
        genAst(param, okType, errType):
          param = results.Result[okType, errType].err()
      else:
        genAst(param, lowerError, okType, errType, errChild, errChildDecl):
          errChildDecl
          lowerError
          param = results.Result[okType, errType].err(errChild)

      let code = genAst(loweredTag = loweredArgs[0], okCase, errCase):
        if loweredTag == 0:
          okCase
        else:
          errCase
      outCode.add code

    of Variant:
      let objectTypeName = ident(userType.name.toCamelCase(true))
      let enumTypeName = ident(objectTypeName.repr & "Kind")
      let kindCode = genAst(t = enumTypeName, a = loweredArgs[0]):
        cast[t](a)

      var cases = nnkCaseStmt.newTree(kindCode)

      for f in userType.fields:
        let kindName = ident(f.name.toCamelCase(true))
        let fieldName = ident(f.name.toCamelCase(false))
        var lowerCode = nnkStmtList.newTree()

        let typ = ctx.getTypeName(f.typ)
        let temp = ident"temp"
        let tempDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(temp, typ, newEmptyNode()))
        ctx.lift(loweredArgs[1..^1], temp, f.typ, lowerCode)
        let caseCode = if typ.repr == "void":
          genAst(param, typ, t = objectTypeName, k = kindName):
            param = t(kind: k)
        else:
          genAst(param, lowerCode, temp, tempDecl, fieldName, t = objectTypeName, k = kindName):
            tempDecl
            lowerCode
            param = t(kind: k, fieldName: temp)

        cases.add nnkOfBranch.newTree(ident(f.name.toCamelCase(true)), caseCode)

      var addElse = false

      if addElse:
        cases.add nnkElse.newTree(nnkStmtList.newTree(nnkDiscardStmt.newTree(newEmptyNode())))

      let code = genAst(loweredTag = loweredArgs[0], param, cases):
        cases
      outCode.add code

    of Record:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        ctx.lift(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Tuple:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkBracketExpr.newTree(param, newLit(i))
        ctx.lift(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    # todo
    # of Owned, Borrowed:

    else:
      error("Not implemented lift(" & $userType.kind & ")")

  else:
    error("Not implemented lift(" & $typ.builtin & ")")

proc lift(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], results: openArray[WitType], outCode: NimNode) =
  var loweredI = 0
  for i, r in results:
    # echo &"{i}, {loweredI}: lift {r}"
    ctx.lift(loweredArgs[loweredI..^1], args[i], r, outCode)
    loweredI += ctx.flatTypeSize(r)

proc lift(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lift {p}"
    ctx.lift(loweredArgs[loweredI..^1], args[i], p.typ, outCode)
    loweredI += ctx.flatTypeSize(p.typ)

proc genFunction(ctx: WitContext, funcList: NimNode, fun: WitFunc) =
  let importTempl = genAst():
    proc foo*(a: int): bool {.wasmimport("", "").}

  let importWrapperTempl = genAst():
    proc foo*(a: int): bool =
      discard

  let (flatFuncType, flatFuncTargetType) = ctx.flattenFuncType(fun, Lower)

  # echo ""
  # echo &"genFunction {fun}\n{flatFuncTargetType}\n{flatFuncType}"
  # echo ""

  case fun.kind
  of Freestanding:
    let importedName = ident(fun.name.toCamelCase(false) & "Imported")

    block: # raw function
      var funNode = importTempl.copy()
      funNode[0][1] = importedName

      funNode[4][0][1] = newLit(fun.name)
      funNode[4][0][2] = newLit(fun.env)

      let retType = if flatFuncType.results.len == 0:
        ident"void"
      else:
        assert flatFuncType.results.len == 1
        flatFuncType.results[0].nimTypeName.ident

      funNode[3] = nnkFormalParams.newTree(retType)

      let args = collect:
        for i in 0..flatFuncType.params.high:
          ident("a" & $i)

      for i, t in flatFuncType.params:
        let n = ident(t.nimTypeName)
        funNode[3].add nnkIdentDefs.newTree(args[i], n, newEmptyNode())

      funcList.add funNode

    ############################# Flat

    block: # wrapper function
      var funNode = importWrapperTempl.copy()
      funNode[0][1] = ident(fun.name.toCamelCase(false))

      let retType = if fun.results.len == 0:
        ident"void"
      elif fun.results.len == 1:
        ctx.getTypeName(fun.results[0])
      else:
        var tup = nnkTupleConstr.newTree()
        for t in fun.results:
          tup.add ctx.getTypeName(t)
        tup

      funNode[3] = nnkFormalParams.newTree(retType)

      let args = collect:
        for p in fun.params:
          ident(p.name.toCamelCase(false))

      let results = if fun.results.len == 1:
        @[ident"result"]
      else:
        collect:
          for i in 0..fun.results.high:
            nnkBracketExpr.newTree(ident"result", newLit(i))

      var call = nnkCall.newTree(importedName)
      var vars = nnkVarSection.newTree()

      # Return value area
      # todo: specify aligment for retArea as 4/8 depending on args
      let retArea = ident"retArea"
      let retAreaPtr = genAst(retArea, cast[int32](retArea[0].addr))

      let needsRetArea = not flatFuncType.paramsFlat or not flatFuncType.resultsFlat
      if needsRetArea:
        var retAreaSize = max(flatFuncTargetType.paramsByteSize, flatFuncTargetType.resultsByteSize)
        let retAreaType = nnkBracketExpr.newTree(ident"array", newLit(retAreaSize), ident"uint8")
        vars.add nnkIdentDefs.newTree(retArea, retAreaType, newEmptyNode())

      var lowerCode = nnkStmtList.newTree()
      var liftCode = nnkStmtList.newTree()

      if flatFuncType.paramsFlat:
        # Pass args as flattened individual args
        let loweredArgs = collect:
          for i in 0..flatFuncTargetType.params.high:
            ident("arg" & $i)

        for i, arg in loweredArgs:
          let t = ident(flatFuncType.params[i].nimTypeName)
          vars.add nnkIdentDefs.newTree(arg, t, newEmptyNode())
          call.add arg

        ctx.lower(loweredArgs, args, fun.params, lowerCode)

      else:
        # Pass args through pointer
        call.add retAreaPtr

        var loweredPtrArgs: seq[NimNode]
        var i = 0
        for p in flatFuncTargetType.params:
          while i mod p.byteAlignment != 0:
            inc i
          let code = genAst(retArea, nimType = p.nimTypeName.ident, index = newLit(i)):
            cast[ptr nimType](retArea[index].addr)[]
          loweredPtrArgs.add code
          i += p.byteSize

        ctx.lower(loweredPtrArgs, args, fun.params, lowerCode)

      if flatFuncType.resultsFlat:
        discard
      else:
        call.add retAreaPtr

        var loweredPtrArgs: seq[NimNode]
        var i = 0
        for r in flatFuncTargetType.results:
          while i mod r.byteAlignment != 0:
            inc i
          let code = genAst(retArea, nimType = r.nimTypeName.ident, index = newLit(i)):
            cast[ptr nimType](retArea[index].addr)[]
          loweredPtrArgs.add code
          i += r.byteSize

        ctx.lift(loweredPtrArgs, results, fun.results, liftCode)

      funNode[6] = nnkStmtList.newTree()
      funNode[6].add vars
      funNode[6].add lowerCode
      funNode[6].add call

      if liftCode.len > 0:
        funNode[6].add liftCode

      # Add high level paramaters to generated fun
      for i, p in fun.params:
        let t = ctx.getTypeName(p.typ)
        funNode[3].add nnkIdentDefs.newTree(args[i], t, newEmptyNode())

      funcList.add funNode

proc genExport(ctx: WitContext, funcList: NimNode, fun: WitFunc) =
  let importTempl = genAst():
    proc foo(a: int): bool {.wasmexport("").} =
      discard

  let importWrapperTempl = genAst():
    proc foo(a: int): bool

  let (flatFuncType, flatFuncTargetType) = ctx.flattenFuncType(fun, Lift)

  # echo ""
  # echo &"genExport {fun}\n{flatFuncTargetType}\n{flatFuncType}"
  # echo ""

  case fun.kind
  of Freestanding:
    block: # wrapper function
      var funNode = importWrapperTempl.copy()
      funNode[0] = ident(fun.name.toCamelCase(false))

      let retType = if fun.results.len == 0:
        ident"void"
      elif fun.results.len == 1:
        ctx.getTypeName(fun.results[0])
      else:
        var tup = nnkTupleConstr.newTree()
        for t in fun.results:
          tup.add ctx.getTypeName(t)
        tup

      funNode[3] = nnkFormalParams.newTree(retType)

      let args = collect:
        for p in fun.params:
          ident(p.name.toCamelCase(false))

      # Add high level paramaters to generated fun
      for i, p in fun.params:
        let t = ctx.getTypeName(p.typ)
        funNode[3].add nnkIdentDefs.newTree(args[i], t, newEmptyNode())

      funcList.add funNode

    block: # raw function
      var funNode = importTempl.copy()
      funNode[0] = ident(fun.name.toCamelCase(false) & "Exported")

      funNode[4][0][1] = newLit(fun.name)

      let retType = if flatFuncType.results.len == 0:
        ident"void"
      else:
        assert flatFuncType.results.len == 1
        flatFuncType.results[0].nimTypeName.ident

      funNode[3] = nnkFormalParams.newTree(retType)

      let loweredArgs = collect:
        for i in 0..flatFuncType.params.high:
          ident("a" & $i)

      for i, t in flatFuncType.params:
        let n = ident(t.nimTypeName)
        funNode[3].add nnkIdentDefs.newTree(loweredArgs[i], n, newEmptyNode())

      var call = nnkCall.newTree(ident(fun.name.toCamelCase(false)))
      var vars = nnkVarSection.newTree()

      # Return value area
      # todo: specify aligment for retArea as 4/8 depending on args
      let retArea = ident(fun.name.toCamelCase(false) & "RetArea")

      let needsRetArea = not flatFuncType.paramsFlat or not flatFuncType.resultsFlat
      if needsRetArea:
        var retAreaSize = max(flatFuncTargetType.paramsByteSize, flatFuncTargetType.resultsByteSize)
        let retAreaType = nnkBracketExpr.newTree(ident"array", newLit(retAreaSize), ident"uint8")
        funcList.add nnkVarSection.newTree(nnkIdentDefs.newTree(retArea, retAreaType, newEmptyNode()))

      var lowerCode = nnkStmtList.newTree()
      var liftCode = nnkStmtList.newTree()

      let args = collect:
        for p in fun.params:
          ident(p.name)

      for i, arg in args:
        let t = ctx.getTypeName(fun.params[i].typ)
        vars.add nnkIdentDefs.newTree(arg, t, newEmptyNode())
        call.add arg

      if flatFuncType.paramsFlat:
        # Pass args as flattened individual args

        let loweredArgs = collect:
          for i in 0..flatFuncTargetType.params.high:
            ident("a" & $i)

        ctx.lift(loweredArgs, args, fun.params, liftCode)

      else:
        # Args passed through pointer
        var loweredPtrArgs: seq[NimNode]
        var i = 0
        for p in flatFuncTargetType.params:
          while i mod p.byteAlignment != 0:
            inc i
          let code = genAst(retArea, nimType = p.nimTypeName.ident, index = newLit(i)):
            cast[ptr nimType](a0 + index)[]
          loweredPtrArgs.add code
          i += p.byteSize

        ctx.lift(loweredPtrArgs, args, fun.params, liftCode)

      if flatFuncType.resultsFlat:
        discard
      else:
        var loweredPtrArgs: seq[NimNode]
        var i = 0
        for r in flatFuncTargetType.results:
          while i mod r.byteAlignment != 0:
            inc i
          let code = genAst(retArea, nimType = r.nimTypeName.ident, index = newLit(i)):
            cast[ptr nimType](retArea[index].addr)[]
          loweredPtrArgs.add code
          i += r.byteSize

        let resultName = ident"res"

        let results = if fun.results.len == 1:
          @[resultName]
        else:
          collect:
            for i in 0..fun.results.high:
              nnkBracketExpr.newTree(resultName, newLit(i))

        ctx.lower(loweredPtrArgs, results, fun.results, lowerCode)

        let retCode = genAst(retArea):
          cast[int32](retArea[0].addr)
        lowerCode.add retCode

        call = genAst(resultName, call):
          let resultName = call

      funNode[6] = nnkStmtList.newTree()
      funNode[6].add vars
      funNode[6].add liftCode
      funNode[6].add call

      if lowerCode.len > 0:
        funNode[6].add lowerCode

      funcList.add funNode

macro witBindGenImpl(witPath: static[string], dir: static[string], body: untyped): untyped =
  let path = if witPath.isAbsolute:
    witPath
  else:
    dir / witPath

  let cmd = &"wasm-tools component wit {path.hostQuoteShell} --json"
  hint "Running: " & cmdPrefix & cmd
  let res = gorgeEx(cmdPrefix & cmd)
  if res.exitCode != 0:
    error("Failed to read wit files:\n" & res.output)

  let json = try:
    res.output.parseJson()
  except Exception as e:
    error("Failed to decode json from wit: " & e.msg & "\n" & res.output)

  var ctx = newWitContext(json)
  ctx.useCustomBuiltinTypes = true

  # echo "------- exports"
  # echo ctx.exports.join("\n")
  # echo "-------"

  let typeSection = ctx.genTypeSection()

  var funcList = nnkStmtList.newTree()
  for f in ctx.funcs:
    ctx.genFunction(funcList, f)

  for f in ctx.exports:
    ctx.genExport(funcList, f)

  let code = genAst(typeSection, funcList):
    {.push hint[DuplicateModuleImport]:off.}
    import std/[options]
    from std/unicode import Rune
    import results, wit_types
    {.pop.}

    typeSection

    funcList

  hint "Write api to " & (dir / "guest.nim")
  writeFile(dir / "guest.nim", code.repr)
  return code

template witBindGen*(witPath: static[string], body: untyped): untyped =
  witBindGenImpl(witPath, instantiationInfo(-1, true).filename.replace("\\", "/").splitPath.head, body)
