import std/[strformat, os, macros, strutils, json, genasts, options, tables, sugar]
import wit, wit_gen, wasmtime

when not declared(buildOS):
  const buildOS {.magic: "BuildOS".}: string = hostOS
const windowsHost = buildOS == "windows"
const cmdPrefix = when windowsHost: "cmd /E:ON /C " else: ""


type
  Slot = object
    data: pointer
    drop: proc(data: pointer, callDestroy: bool) {.cdecl.}

  WasmModuleResources* = object
    resources: seq[Slot]

proc resourceNew*[T](self: var WasmModuleResources, data: sink T): WasmtimeResult[int32] =
  proc dropImpl(b: pointer, callDestroy: bool) {.cdecl.} =
    let b = cast[ptr T](b)
    if callDestroy:
      `=destroy`(b[])
    deallocShared(b)

  let d = createShared(T)
  d[] = data.ensureMove

  var index = self.resources.len
  for i, r in self.resources:
    if r.data == nil:
      index = i
      break

  if index == self.resources.len:
    self.resources.add Slot()

  self.resources[index] = Slot(data: d, drop: dropImpl)

  return wasmtime.ok(index.int32)

proc resourceHostData*(self: var WasmModuleResources, handle: int32, T: typedesc): WasmtimeResult[ptr T] =
  assert handle >= 0
  assert handle < self.resources.len
  assert self.resources[handle].data != nil
  return wasmtime.ok(cast[ptr T](self.resources[handle].data))

proc resourceDrop*(self: var WasmModuleResources, handle: int32, callDestroy: bool): WasmtimeResult[void] =
  assert handle >= 0
  assert handle < self.resources.len
  assert self.resources[handle].data != nil
  self.resources[handle].drop(self.resources[handle].data, callDestroy)
  self.resources[handle] = Slot()

func hostQuoteShell(s: string): string =
  ## Quote ``s``, so it can be safely passed to shell.
  when not defined(windows) and windowsHost:
    result = quoteShellWindows(s)
  else:
    result = quoteShell(s)


proc coreTypeToFieldName(t: CoreType): string =
  case t.normalize
  of I32: "i32"
  of I64: "i64"
  of F32: "f32"
  of F64: "f64"
  # todo
  # of V128: "v128"
  # of AnyRef: "anyref"
  # of ExternRef: "externref"
  # of FuncRef: "funcref"
  else:
    error("not implemented")

proc coreTypeToWasmValkindName(t: CoreType): string =
  case t.normalize
  of I32: "I32"
  of I64: "I64"
  of F32: "F32"
  of F64: "F64"
  # todo
  # of V128: "
  # of AnyRef: "anyref"
  # of ExternRef: "externref"
  # of FuncRef: "funcref"
  else:
    error("not implemented")

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
      let dropName = "[resource-drop]" & t.name
      let code = genAst(host, linker, env = t.env, name = t.name, dropName, typ = ident(ctx.getNimName(t.name, true)), e = ident"e"):
        block:
          let e = block:
            linker.defineFuncUnchecked(env, dropName, newFunctype([WasmValkind.I32], [])):
              ?host.resources.resourceDrop(parameters[0].i32, callDestroy=true)
          if e.isErr:
            return e

      defines.add code
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
            let c = genAst(host, name, ptrName = ident(name.repr & "Ptr"), typ, i):
              var name: typ
            body.add c

          else:
            let c = genAst(host, name, typ, i):
              var name: ptr typ
            body.add c

        else:
          let typ = ctx.getTypeName(p.typ, Field)
          let c = genAst(name, typ, i):
            var name: typ
          body.add c


    proc resourceAccess(typ: WitType, arg: NimNode, param: NimNode): NimNode =
      let userType = ctx.types[typ.index]
      assert userType.kind == Handle
      let typ = ctx.getTypeName(typ, Field)
      if userType.owned:
        return genAst(host, arg, param, ptrName = ident("resPtr"), typ):
          block:
            let ptrName = ?host.resources.resourceHostData(arg, typ)
            param = ptrName[]
            ?host.resources.resourceDrop(arg, callDestroy=false)

      else:
        return genAst(host, arg, param, typ):
          param = ?host.resources.resourceHostData(arg, typ)

    # lift parameters
    if flatFuncType.paramsFlat:
      let args = collect:
        for p in fun.params:
          ident(p.name)

      let loweredArgs = collect:
        for i in 0..flatFuncTargetType.params.high:
          let field = flatFuncTargetType.params[i].coreTypeToFieldName
          genAst(i, field = ident(field)):
            parameters[i].field

      proc memoryAccess(a: NimNode): NimNode =
        genAst(memory, a):
          memory[a].addr

      var liftContext = WitLiftContext(memoryAccess: memoryAccess, resourceAccess: resourceAccess)
      ctx.lift(loweredArgs, args, fun.params, body, Parameter, liftContext)
    else:
      let args = collect:
        for p in fun.params:
          ident(p.name)

      var i = 0
      let loweredArgs = collect:
        for p in flatFuncTargetType.params:
          while i mod p.byteAlignment != 0:
            inc i
          let field = p.coreTypeToFieldName
          let c = genAst(i, memory, t = p.nimTypeName.ident, field = ident(field)):
            cast[ptr t](memory[parameters[0].i32 + i].addr)[]
          i += p.byteSize
          c

      proc memoryAccess(a: NimNode): NimNode =
        genAst(memory, a):
          memory[a].addr

      var liftContext = WitLiftContext(memoryAccess: memoryAccess, resourceAccess: resourceAccess)
      ctx.lift(loweredArgs, args, fun.params, body, Parameter, liftContext)

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
          callAndResult = genAst(host, res, call):
            let res = call
            parameters[0].i32 = ?host.resources.resourceNew(res)

      body.add callAndResult

    else:
      body.add call

    # todo
    # # lower results
    # if fun.results.len > 0:
    #   if flatFuncType.resultsFlat:
    #     discard
    #   else:
    #     ctx.lower(loweredArgs, args, fun.results, body, Return)

    var parameterTypes = nnkBracket.newTree()
    var resultTypes = nnkBracket.newTree()

    for t in flatFuncType.params:
      let name = t.coreTypeToWasmValkindName
      parameterTypes.add nnkDotExpr.newTree(ident"WasmValkind", ident(name))

    for t in flatFuncType.results:
      let name = t.coreTypeToWasmValkindName
      if flatFuncType.resultsFlat:
        resultTypes.add nnkDotExpr.newTree(ident"WasmValkind", ident(name))
      else:
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
