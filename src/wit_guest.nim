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

macro wasmexport*(name: static[string], env: static[string], t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)

  let module = env

  let attrib = if module != "":
    &"""__attribute__((__export_name__("{module}#{name}")))"""
  else:
    &"""__attribute__((__export_name__("{name}")))"""

  # let attrib = &"""__attribute__((__export_name__("{name}"))) EMSCRIPTEN_KEEPALIVE"""

  let name = name.toCamelCase(false)

  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit(attrib & " EMSCRIPTEN_KEEPALIVE $# $#$#"))
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

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], param: NimNode, typ: WitType, outCode: NimNode, context: WitNimTypeNameContext) =
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

  of "s8", "s16", "u8", "u16", "s32", "u32":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      loweredArg = cast[int32](param)
    outCode.add code

  of "s64", "u64":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      loweredArg = cast[int64](param)
    outCode.add code

  of "f32", "f64":
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
      ctx.lower(loweredArgs[1..^1], childAccess, userType.optionTarget, lowerChild, context)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild):
        loweredTag = param.isSome.int32
        if param.isSome:
          lowerChild
      outCode.add code

    of Result:
      let childAccess = nnkDotExpr.newTree(param, ident("value"))
      let errAccess = nnkDotExpr.newTree(param, ident("error"))
      var lowerChild = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], childAccess, userType.resultOkTarget, lowerChild, context)
      var lowerError = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], errAccess, userType.resultErrTarget, lowerError, context)
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
        ctx.lower(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Tuple:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkBracketExpr.newTree(param, newLit(i))
        ctx.lower(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Variant:
      var cases = nnkCaseStmt.newTree(nnkDotExpr.newTree(param, ident"kind"))
      var addElse = false

      for f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        var caseCode = nnkStmtList.newTree()
        ctx.lower(loweredArgs[1..^1], fieldAccess, f.typ, caseCode, context)
        cases.add nnkOfBranch.newTree(ident(f.name.toCamelCase(true)), caseCode)

      if addElse:
        cases.add nnkElse.newTree(nnkStmtList.newTree(nnkDiscardStmt.newTree(newEmptyNode())))

      let code = genAst(loweredTag = loweredArgs[0], param, cases):
        loweredTag = param.kind.int32
        cases
      outCode.add code

    of Handle:
      let code = genAst(loweredArg = loweredArgs[0], param = param):
        loweredArg = cast[int32](param.handle - 1)
      outCode.add code

    else:
      error("Not implemented lower(" & $userType.kind & ")")

  else:
    error("Not implemented lower(" & $typ.builtin & ")")

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode, context: WitNimTypeNameContext) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lower {p}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], p.typ, outCode, context)
    loweredI += ctx.flatTypeSize(p.typ)

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], results: openArray[WitType], outCode: NimNode, context: WitNimTypeNameContext) =
  var loweredI = 0
  for i, r in results:
    # echo &"{i}, {loweredI}: lower {r}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], r, outCode, context)
    loweredI += ctx.flatTypeSize(r)

proc lift(ctx: WitContext, loweredArgs: openArray[NimNode], param: NimNode, typ: WitType, outCode: NimNode, context: WitNimTypeNameContext) =
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
    let t = ctx.getTypeName(typ, context)
    let code = genAst(loweredArg = loweredArgs[0], param = param, t):
      param = cast[t](loweredArg)
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
      let t = ctx.getTypeName(typ, context)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        param = cast[t](loweredArg)
      outCode.add code

    of Flags:
      let t = ctx.getTypeName(typ, context)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        param = cast[t](loweredArg)
      outCode.add code

    of Option:
      let t = ctx.getTypeName(userType.optionTarget, context)
      let child = ident"temp"
      let childDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(child, t, newEmptyNode()))
      var lowerChild = nnkStmtList.newTree()
      ctx.lift(loweredArgs[1..^1], child, userType.optionTarget, lowerChild, context)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild, t, childDecl, child):
        if loweredTag != 0:
          childDecl
          lowerChild
          param = child.some
      outCode.add code

    of Result:
      let okType = ctx.getTypeName(userType.resultOkTarget, context)
      let errType = ctx.getTypeName(userType.resultErrTarget, context)
      let okChild = ident"tempOk"
      let errChild = ident"tempErr"
      let okChildDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(okChild, okType, newEmptyNode()))
      let errChildDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(errChild, errType, newEmptyNode()))
      var lowerChild = nnkStmtList.newTree()
      var lowerError = nnkStmtList.newTree()
      ctx.lift(loweredArgs[1..^1], okChild, userType.resultOkTarget, lowerChild, context)
      ctx.lift(loweredArgs[1..^1], errChild, userType.resultErrTarget, lowerError, context)

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

        let typ = ctx.getTypeName(f.typ, context)
        let temp = ident"temp"
        let tempDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(temp, typ, newEmptyNode()))
        ctx.lift(loweredArgs[1..^1], temp, f.typ, lowerCode, context)
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
        ctx.lift(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context)
        loweredI += ctx.flatTypeSize(f.typ)

    of Tuple:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkBracketExpr.newTree(param, newLit(i))
        ctx.lift(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context)
        loweredI += ctx.flatTypeSize(f.typ)

    of Handle:
      let code = genAst(arg = loweredArgs[0], param):
        param.handle = arg + 1
      outCode.add code

    else:
      error("Not implemented lift(" & $userType.kind & ")")

  else:
    error("Not implemented lift(" & $typ.builtin & ")")

proc lift(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], results: openArray[WitType], outCode: NimNode, context: WitNimTypeNameContext) =
  var loweredI = 0
  for i, r in results:
    # echo &"{i}, {loweredI}: lift {r}"
    ctx.lift(loweredArgs[loweredI..^1], args[i], r, outCode, context)
    loweredI += ctx.flatTypeSize(r)

proc lift(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode, context: WitNimTypeNameContext) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lift {p}"
    ctx.lift(loweredArgs[loweredI..^1], args[i], p.typ, outCode, context)
    loweredI += ctx.flatTypeSize(p.typ)

proc genImport*(ctx: WitContext, funcList: NimNode, fun: WitFunc) =
  let importTempl = genAst():
    proc foo(a: int): bool {.wasmimport("", "").}

  let importWrapperTempl = genAst():
    proc foo*(a: int): bool {.nodestroy.} =
      discard

  let (flatFuncType, flatFuncTargetType) = ctx.flattenFuncType(fun, Lower)

  block:
    let funcNimName = case fun.kind
    of Freestanding:
      fun.name
    of Constructor:
      let i = fun.name.find("]")
      assert i != -1
      "new-" & fun.name[i + 1..^1]

    of Method, Static:
      let i = fun.name.find(".")
      assert i != -1
      fun.name[i + 1..^1]

    let importedName = if fun.interfac.isSome:
      ident(fun.interfaceName.toCamelCase(false) & funcNimName.toCamelCase(true) & "Imported")
    else:
      ident(funcNimName.toCamelCase(false) & "Imported")

    block: # raw function
      var funNode = importTempl.copy()
      funNode[0] = importedName

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
        let n = ident(t.normalize.nimTypeName)
        funNode[3].add nnkIdentDefs.newTree(args[i], n, newEmptyNode())

      funcList.add funNode

    ############################# Flat

    block: # wrapper function
      var funNode = importWrapperTempl.copy()
      funNode[0][1] = ident(funcNimName.toCamelCase(false))

      let retType = if fun.results.len == 0:
        ident"void"
      elif fun.results.len == 1:
        ctx.getTypeName(fun.results[0], Return)
      else:
        var tup = nnkTupleConstr.newTree()
        for t in fun.results:
          tup.add ctx.getTypeName(t, Return)
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
          let t = ident(flatFuncType.params[i].normalize.nimTypeName)
          vars.add nnkIdentDefs.newTree(arg, t, newEmptyNode())
          call.add arg

        ctx.lower(loweredArgs, args, fun.params, lowerCode, Parameter)

      else:
        # Pass args through pointer
        call.add retAreaPtr

        var loweredPtrArgs: seq[NimNode]
        var i = 0
        for p in flatFuncTargetType.params:
          while i mod p.byteAlignment != 0:
            inc i
          let code = genAst(retArea, nimType = p.normalize.nimTypeName.ident, index = newLit(i)):
            cast[ptr nimType](retArea[index].addr)[]
          loweredPtrArgs.add code
          i += p.byteSize

        ctx.lower(loweredPtrArgs, args, fun.params, lowerCode, Parameter)

      if flatFuncType.resultsFlat:
        if fun.results.len > 0:
          let resultName = ident"res"
          call = genAst(resultName, call):
            let resultName = call
          ctx.lift(@[resultName], results, fun.results, liftCode, Return)

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

        ctx.lift(loweredPtrArgs, results, fun.results, liftCode, Return)

      funNode[6] = nnkStmtList.newTree()
      funNode[6].add vars
      funNode[6].add lowerCode
      funNode[6].add call

      if liftCode.len > 0:
        funNode[6].add liftCode

      # Add high level paramaters to generated fun
      for i, p in fun.params:
        let t = ctx.getTypeName(p.typ, Parameter)
        funNode[3].add nnkIdentDefs.newTree(args[i], t, newEmptyNode())

      funcList.add funNode

proc genExport*(ctx: WitContext, funcList: NimNode, fun: WitFunc) =
  let importTempl = genAst():
    proc foo(a: int): bool {.wasmexport("", "").} =
      discard

  let importWrapperTempl = genAst():
    proc foo(a: int): bool

  let (flatFuncType, flatFuncTargetType) = ctx.flattenFuncType(fun, Lift)

  case fun.kind
  of Constructor:
    discard
  of Method:
    discard
  of Static:
    discard

  of Freestanding:
    block: # wrapper function
      var funNode = importWrapperTempl.copy()
      funNode[0] = ident(fun.name.toCamelCase(false))

      let retType = if fun.results.len == 0:
        ident"void"
      elif fun.results.len == 1:
        ctx.getTypeName(fun.results[0], Return)
      else:
        var tup = nnkTupleConstr.newTree()
        for t in fun.results:
          tup.add ctx.getTypeName(t, Return)
        tup

      funNode[3] = nnkFormalParams.newTree(retType)

      let args = collect:
        for p in fun.params:
          ident(p.name.toCamelCase(false))

      # Add high level paramaters to generated fun
      for i, p in fun.params:
        let t = ctx.getTypeName(p.typ, Parameter)
        funNode[3].add nnkIdentDefs.newTree(args[i], t, newEmptyNode())

      funcList.add funNode

    block: # raw function
      var funNode = importTempl.copy()
      funNode[0] = ident(fun.name.toCamelCase(false) & "Exported")

      funNode[4][0][1] = newLit(fun.name)
      funNode[4][0][2] = newLit(fun.env)

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
      let retAreaSize = max(flatFuncTargetType.paramsByteSize, flatFuncTargetType.resultsByteSize)
      if needsRetArea:
        let retAreaType = nnkBracketExpr.newTree(ident"array", newLit(retAreaSize), ident"uint8")
        funcList.add nnkVarSection.newTree(nnkIdentDefs.newTree(retArea, retAreaType, newEmptyNode()))

      var lowerCode = nnkStmtList.newTree()
      var liftCode = nnkStmtList.newTree()

      let args = collect:
        for p in fun.params:
          ident(p.name)

      for i, arg in args:
        let t = ctx.getTypeName(fun.params[i].typ, Field)
        vars.add nnkIdentDefs.newTree(arg, t, newEmptyNode())
        call.add arg

      if flatFuncType.paramsFlat:
        # Pass args as flattened individual args

        let loweredArgs = collect:
          for i in 0..flatFuncTargetType.params.high:
            ident("a" & $i)

        ctx.lift(loweredArgs, args, fun.params, liftCode, Parameter)

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

        ctx.lift(loweredPtrArgs, args, fun.params, liftCode, Parameter)

        let freeCode = genAst(retAreaSize):
          cabi_dealloc(a0, retAreaSize, 4) # todo: alignment
        lowerCode.add freeCode

      if flatFuncType.resultsFlat:
        if flatFuncType.results.len > 0:
          let t = flatFuncType.results[0].nimTypeName.ident
          call = genAst(t, call):
            cast[t](call)
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

        ctx.lower(loweredPtrArgs, results, fun.results, lowerCode, Return)

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

proc genResourceLifetimeFuncs(ctx: WitContext, funcList: NimNode) =
  let dropTempl = genAst(a = ident"a"):
    proc foo(a: int32): void {.wasmimport("", "").}

  for t in ctx.types:
    if t.refIndex.isSome:
      continue
    case t.kind
    of Resource:
      let dropName = if t.interfaceName != "":
        ident(t.interfaceName.toCamelCase(false) & t.name.toCamelCase(true) & "Drop")
      else:
        ident(t.name.toCamelCase(false) & "Drop")

      let typ = ident(t.name.toCamelCase(true))

      var dropImpl = dropTempl.copy()
      dropImpl[0] = dropName

      dropImpl[4][0][1] = newLit("[resource-drop]" & t.name)
      dropImpl[4][0][2] = newLit(t.env)

      let code = genAst(dropImpl, drop = dropName, typ, a = ident"a", b = ident"b"):
        dropImpl

        proc `=copy`*(a: var typ, b: typ) {.error.}
        proc `=destroy`*(a: typ) =
          if a.handle != 0:
            drop(a.handle - 1)

      funcList.add code

    else:
      discard

proc replace*(node: NimNode, key: NimNode, repl: seq[NimNode]) =
  for i, c in node:
    if c == key:
      node.del(i)
      for k, r in repl:
        node.insert(i + k, r)
    else:
      c.replace(key, repl)

macro importWitImpl(witPath: static[string], cacheFile: static[string], worldName: static[string], dir: static[string],
    customCodeGen:static[proc(
      ctx: WitContext, world: WitWorld, importSection: var NimNode, typeSection: var NimNode, funcList: var NimNode
    )]): untyped =
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

  var typeSection = ctx.genTypeSection(host=false)
  var funcList = nnkStmtList.newTree()
  var importSection = nnkStmtList.newTree()

  ctx.genResourceLifetimeFuncs(funcList)

  let world = ctx.getWorld(worldName)

  for f in world.funcs:
    ctx.genImport(funcList, f)

  for f in world.exports:
    ctx.genExport(funcList, f)

  if customCodeGen != nil:
    customCodeGen(ctx, world, importSection, typeSection, funcList)

  let code = genAst(importSection, typeSection, funcList):
    {.push hint[DuplicateModuleImport]:off.}
    import std/[options]
    from std/unicode import Rune
    import results, wit_types, wit_runtime
    {.pop.}

    importSection

    typeSection

    funcList

  let cacheFile = if cacheFile.isAbsolute:
    cacheFile
  else:
    dir / cacheFile

  hint "Write api to " & cacheFile
  writeFile(cacheFile, code.repr)

  return code

template importWit*(witPath: static[string], body: untyped): untyped =
  var cacheFile {.compiletime, inject.} = "guest.nim"
  var world {.compiletime, inject.} = ""
  var customCodeGenCode {.compiletime, inject.}: proc(ctx: WitContext, world: WitWorld, importSection: var NimNode, typeSection: var NimNode, funcList: var NimNode)

  template customCodeGen*(b: untyped) =
    customCodeGenCode = proc(ctx {.inject.}: WitContext, world {.inject.}: WitWorld, importSection {.inject.}: var NimNode, typeSection {.inject.}: var NimNode, funcList {.inject.}: var NimNode) =
      b

  static:
    body

  importWitImpl(witPath, cacheFile, world, instantiationInfo(-1, true).filename.replace("\\", "/").splitPath.head, customCodeGenCode)
