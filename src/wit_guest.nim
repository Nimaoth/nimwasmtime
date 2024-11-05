import std/[strformat, os, macros, strutils, json, jsonutils, genasts, enumerate, options, sequtils, math, sugar, tables]
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

macro wasmexport*(t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)
  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit"EMSCRIPTEN_KEEPALIVE $# $#$#")
  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree(codeGen)
  else:
    newProc[4].add codeGen
  newProc[4].add ident"exportC"
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
      let code = genAst(loweredArg = loweredArgs[0], param = param):
        loweredArg = cast[int32](param)
      outCode.add code

    of Flags:
      let code = genAst(loweredArg = loweredArgs[0], param = param):
        loweredArg = cast[int32](param)
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
      return

  else:
    error("Not implemented lower(" & $typ.builtin & ")")
    return

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lower {p}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], p.typ, outCode)
    loweredI += ctx.flatTypeSize(p.typ)

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

  # echo res.output
  # echo "=== types"
  # echo ctx.types.join("\n")
  # echo "==="
  # echo "=== interfaces"
  # echo ctx.interfaces.join("\n")
  # echo "==="
  # echo "=== funcs"
  # echo ctx.funcs.join("\n")
  # echo "==="

  var typeSection = ctx.genTypeSection()

  var funcList = nnkStmtList.newTree()

  let importTempl = genAst():
    proc foo*(a: int): bool {.wasmimport("", "").}

  let importWrapperTempl = genAst():
    proc foo*(a: int): bool =
      discard

  for f in ctx.funcs:
    let flatFuncType = ctx.flattenFuncType(f)

    let loweredArgs = collect:
      for i in 0..flatFuncType.params.high:
        ident("arg" & $i)

    case f.kind
    of Freestanding:
      let importedName = ident(f.name.toCamelCase(false) & "Imported")
      block:
        var fun = importTempl.copy()
        fun[0][1] = importedName

        fun[4][0][1] = newLit(f.name)
        fun[4][0][2] = newLit(f.env)

        let retType = if f.results.len == 0:
          ident"void"
        elif f.results.len == 1:
          ctx.getTypeName(f.results[0])
        else:
          var tup = nnkTupleConstr.newTree()
          for t in f.results:
            tup.add ctx.getTypeName(t)
          tup

        fun[3] = nnkFormalParams.newTree(retType)

        let args = collect:
          for i in 0..flatFuncType.params.high:
            ident("a" & $i)

        for i, t in flatFuncType.params:
          let n = ident(coreTypeToNimName(t))
          fun[3].add nnkIdentDefs.newTree(args[i], n, newEmptyNode())

        funcList.add fun

      ############################# Flat

      block:
        var fun = importWrapperTempl.copy()
        fun[0][1] = ident(f.name.toCamelCase(false))

        let retType = if f.results.len == 0:
          ident"void"
        elif f.results.len == 1:
          ctx.getTypeName(f.results[0])
        else:
          var tup = nnkTupleConstr.newTree()
          for t in f.results:
            tup.add ctx.getTypeName(t)
          tup

        fun[3] = nnkFormalParams.newTree(retType)

        var call = nnkCall.newTree(importedName)
        var vars = nnkVarSection.newTree()
        for i, arg in loweredArgs:
          let t = ident(coreTypeToNimName(flatFuncType.params[i]))
          vars.add nnkIdentDefs.newTree(arg, t, newEmptyNode())
          call.add arg

        let args = collect:
          for p in f.params:
            ident(p.name.toCamelCase(false))

        fun[6].add vars

        var lowerCode = nnkStmtList.newTree()
        ctx.lower(loweredArgs, args, f.params, lowerCode)

        fun[6].add lowerCode
        fun[6].add call

        for i, p in f.params:
          let t = ctx.getTypeName(p.typ)
          fun[3].add nnkIdentDefs.newTree(args[i], t, newEmptyNode())
        funcList.add fun

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
