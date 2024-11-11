import std/[strformat, os, macros, strutils, json, genasts, options, tables]
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
    proc defineComponent*(linker: ptr ComponentLinkerT, host: hostType): WasmtimeResult[void] =
      discard

  let funDeclTempl = genAst(host, store, hostType):
    proc name*(host: hostType, store: ptr ComponentContextT): void

  var funDeclarations = nnkStmtList.newTree()
  var defines = nnkStmtList.newTree()
  defineComponentFun[6] = defines

  let world = ctx.getWorld(worldName)

  for t in ctx.types:
    if t.refIndex.isSome:
      continue

    case t.kind
    of Resource:
      let code = genAst(linker, env = t.env, name = t.name, typ = ident(ctx.getNimName(t.name, true))):
        ?linker.defineResource(env, name, typ)
      defines.add code

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

    let implName = if fun.interfac.isSome:
      ident(fun.interfaceName.toCamelCase(false) & funcNimName.toCamelCase(true) & "")
    else:
      ident(funcNimName.toCamelCase(false) & "")

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
          let name = parameters[i].to(typ)
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
            let name = parameters[i].to(typ)
          body.add c

    # call
    if fun.results.len > 0:
      var res = ident"res"

      var callAndResult = genAst(res, call):
        let res = call
        results[0] = res.toVal

      let r = fun.results[0]
      if r.builtin == "":
        let userType = ctx.types[r.index]
        if userType.kind == Handle and userType.owned:
          let typ = ctx.getTypeName(r, Field)
          callAndResult = genAst(store, res, call):
            let res = call
            results[0] = ?store.resourceNew(res)

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

    let code = genAst(linker, env = fun.env, name = fun.name, body):
      linker.defineFunc(env, name):
        body

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
