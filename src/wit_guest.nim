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
  let exportName = name.replace("-", "_")
  let attrib = if module != "":
    &"""__attribute__((__export_module__("{module}"), __export_name__("{exportName}")))"""
  else:
    &"""__attribute__((__export_name__("{exportName}")))"""

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
        let n = ident(t.nimTypeName)
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
        var retAreaSize = max(flatFuncTargetType.toCoreType.paramsByteSize, flatFuncTargetType.toCoreType.resultsByteSize)
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

        ctx.lower(loweredArgs, args, fun.params, lowerCode, Parameter, WitLowerContext(convertToCoreTypes: false))

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

        ctx.lower(loweredPtrArgs, args, fun.params, lowerCode, Parameter, WitLowerContext(convertToCoreTypes: false))

      if flatFuncType.resultsFlat:
        if fun.results.len > 0:
          let resultName = ident"res"
          call = genAst(resultName, call):
            let resultName = call
          proc memoryAccess(a: NimNode): NimNode = a
          var liftContext = WitLiftContext(memoryAccess: memoryAccess)
          ctx.lift(@[resultName], results, fun.results, liftCode, Return, liftContext)

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

        proc memoryAccess(a: NimNode): NimNode = a
        var liftContext = WitLiftContext(memoryAccess: memoryAccess)
        ctx.lift(loweredPtrArgs, results, fun.results, liftCode, Return, liftContext)

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
      let retAreaSize = max(flatFuncTargetType.toCoreType.paramsByteSize, flatFuncTargetType.toCoreType.resultsByteSize)
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

        proc memoryAccess(a: NimNode): NimNode = a
        var liftContext = WitLiftContext(memoryAccess: memoryAccess)
        ctx.lift(loweredArgs, args, fun.params, liftCode, Parameter, liftContext)

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

        proc memoryAccess(a: NimNode): NimNode = a
        var liftContext = WitLiftContext(memoryAccess: memoryAccess)
        ctx.lift(loweredPtrArgs, args, fun.params, liftCode, Parameter, liftContext)

        # todo: this is necessary for e.g. C, but not for Nim
        # let freeCode = genAst(retAreaSize):
        #   cabi_dealloc(a0, retAreaSize, 4) # todo: alignment
        # lowerCode.add freeCode

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
