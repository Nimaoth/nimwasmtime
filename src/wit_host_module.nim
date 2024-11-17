import std/[strformat, os, macros, strutils, json, genasts, options, tables, sugar]
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

macro importWitImpl(witPath: static[string], cacheFile: static[string], nameMap: static[Table[string, string]], worldName: static[string], dir: static[string], hostType: untyped): untyped =
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
  ctx.nameMap = nameMap
  ctx.useCustomBuiltinTypes = false

  let typeSection = ctx.genTypeSection(host=true)

  var linker = ident"linker"
  var host = ident"host"
  var store = ident"store"
  var defineComponentFun = genAst(linker, host, hostType):
    proc defineComponent*(linker: ptr LinkerT, host: hostType): WasmtimeResult[void] =
      discard

  let funDeclTempl = genAst(host, store, hostType):
    proc name*(host: hostType, store: ptr ContextT): void

  var funDeclarations = nnkStmtList.newTree()
  var defines = nnkStmtList.newTree()
  defineComponentFun[6] = defines

  let world = ctx.getWorld(worldName)

  for t in ctx.types:
    if t.refIndex.isSome:
      continue

    case t.kind
    of Resource:
      # let code = genAst(linker, env = t.env, name = t.name, typ = ident(ctx.getNimName(t.name, true))):
      #   ?linker.defineResource(env, name, typ)
      # defines.add code
      discard

    else:
      discard

  for fun in world.funcs:
    var body = nnkStmtList.newTree()

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

    let (flatFuncType, flatFuncTargetType) = ctx.flattenFuncType(fun, Lift)

    let implName = if fun.interfac.isSome:
      ident(fun.interfaceName.toCamelCase(false) & funcNimName.toCamelCase(true) & "")
    else:
      ident(funcNimName.toCamelCase(false) & "")

    let memory = ident"memory"

    var decl = funDeclTempl.copy()
    decl[0] = implName

    var call = nnkCall.newTree(implName, host, store)
    funDeclarations.add decl

    if fun.results.len > 0:
      # todo: multiple return values
      decl[3][0] = ctx.getTypeName(fun.results[0], Return)

    # args
    for i, p in fun.params:
      var name = ident(p.name.toCamelCase(false))

      let paramKind = ctx.getParamTypeKind(p.typ)

      if paramKind == BorrowedResource:
        let c = genAst(name):
          name[]
        call.add c
      else:
        call.add name

      var declParamType = ctx.getTypeName(p.typ, Parameter)
      if paramKind == BorrowedResource:
        declParamType = nnkVarTy.newTree(declParamType)
      decl[3].add nnkIdentDefs.newTree(name, declParamType, newEmptyNode())

      if p.typ.builtin != "":
        let typ = ctx.getTypeName(p.typ, Field)
        let c = genAst(name, typ, i):
          var name: typ
        body.add c

      else:
        let userType = ctx.types[p.typ.index]
        if userType.kind == Handle:
          let typ = ctx.getTypeName(p.typ, Field)
          if userType.owned:
            let c = genAst(store, name, ptrName = ident(name.repr & "Ptr"), typ, i):
              let ptrName = ?store.resourceHostData(parameters[i].addr, typ)
              var name = ptrName[]
              `=wasMoved`(ptrName[])
              ?store.resourceDrop(parameters[i].addr)
            body.add c

          else:
            let c = genAst(store, name, typ, i):
              let name = ?store.resourceHostData(parameters[i].addr, typ)
            body.add c

        else:
          let typ = ctx.getTypeName(p.typ, Field)
          let c = genAst(name, typ, i):
            var name: typ
          body.add c

    # lift parameters
    if flatFuncType.paramsFlat:
      let args = collect:
        for p in fun.params:
          ident(p.name)

      let loweredArgs = collect:
        for i in 0..flatFuncTargetType.params.high:
          let field = case flatFuncTargetType.params[i].normalize
          of I32: "i32"
          of I64: "i64"
          of F32: "f32"
          of F64: "f64"
          # of V128: "v128"
          # of AnyRef: "anyref"
          # of ExternRef: "externref"
          # of FuncRef: "funcref"
          else:
            error("not implemented")
          genAst(i, field = ident(field)):
            parameters[i].field

      proc memoryAccess(a: NimNode): NimNode =
        genAst(memory, a):
          memory[a].addr

      ctx.lift(loweredArgs, args, fun.params, body, Parameter, memoryAccess)
    else:
      let args = collect:
        for p in fun.params:
          ident(p.name)

      var i = 0
      let loweredArgs = collect:
        for p in flatFuncTargetType.params:
          while i mod p.byteAlignment != 0:
            inc i
          let field = case p.normalize
          of I32: "i32"
          of I64: "i64"
          of F32: "f32"
          of F64: "f64"
          # of V128: "v128"
          # of AnyRef: "anyref"
          # of ExternRef: "externref"
          # of FuncRef: "funcref"
          else:
            error("not implemented")
          let c = genAst(i, memory, t = p.nimTypeName.ident, field = ident(field)):
            cast[ptr t](memory[parameters[0].i32 + i].addr)[]
          i += p.byteSize
          c

      proc memoryAccess(a: NimNode): NimNode =
        genAst(memory, a):
          memory[a].addr

      ctx.lift(loweredArgs, args, fun.params, body, Parameter, memoryAccess)

    # call
    if fun.results.len > 0:
      var res = ident"res"

      var callAndResult = genAst(res, call):
        let res = call
        # parameters[0] = res.toVal # todo

      let r = fun.results[0]
      if r.builtin == "":
        let userType = ctx.types[r.index]
        if userType.kind == Handle and userType.owned:
          let typ = ctx.getTypeName(r, Field)
          callAndResult = genAst(store, res, call):
            let res = call
            parameters[0] = ?store.resourceNew(res)

      body.add callAndResult

    else:
      body.add call

    # drop
    for i, p in fun.params:
      var name = ident(p.name.toCamelCase(false))
      if p.typ.builtin == "":
        let userType = ctx.types[p.typ.index]
        if userType.kind == Handle and not userType.owned:
          let typ = ctx.getTypeName(p.typ, Field)
          let c = genAst(store, name, typ, i):
            ?store.resourceDrop(parameters[i].addr)
          body.add c

    var parameterTypes = nnkBracket.newTree()
    var resultTypes = nnkBracket.newTree()

    for t in flatFuncType.params:
      let name = case t.normalize
      of I32: "I32"
      of I64: "I64"
      of F32: "F32"
      of F64: "F64"
      else:
        error("not implemented")
      parameterTypes.add nnkDotExpr.newTree(ident"WasmValkind", ident(name))

    let code = genAst(store, linker, env = fun.env, name = fun.name, body, e = ident"e", ty = ident"ty", parameterTypes, resultTypes, res, memory, mainMemory = ident"mainMemory"):
      block:
        let e = block:
          var ty: ptr WasmFunctypeT = newFunctype(parameterTypes, resultTypes)
          linker.defineFuncUnchecked(env, name, ty):
            let mainMemory = caller.getExport("memory")
            let memory = cast[ptr UncheckedArray[uint8]](store.data(mainMemory.get.of_field.memory.addr))
            body

        if e.isErr:
          return e

    defines.add code

  let code = genAst(typeSection, funDeclarations, defineComponentFun):
    {.push hint[DuplicateModuleImport]:off.}
    import std/[options]
    from std/unicode import Rune
    import results, wit_types, wasmtime
    {.pop.}

    typeSection

    funDeclarations

    defineComponentFun

  let cacheFile = if cacheFile.isAbsolute:
    cacheFile
  else:
    dir / cacheFile

  hint "Write api to " & cacheFile
  writeFile(cacheFile, code.repr)

  return code

template importWit*(witPath: static[string], hostType: untyped, body: untyped): untyped =
  var cacheFile {.compiletime, inject.} = "host.nim"
  var world {.compiletime, inject.} = ""
  var nameMap {.compiletime.} = initTable[string, string]()
  template mapName(name: static[string], newName: untyped): untyped =
    nameMap[name] = $newName

  static:
    body

  importWitImpl(witPath, cacheFile, nameMap, world, instantiationInfo(-1, true).filename.replace("\\", "/").splitPath.head, hostType)
