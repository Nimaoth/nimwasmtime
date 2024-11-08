# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import std/[strformat, sugar, options]

import unittest

import nimwasmtime

proc main*() =
  let config = WasmConfig.new()
  let engine = WasmEngine.new(config)
  let linker = WasmtimeLinker.new(engine)
  let store = WasmtimeStore.new(engine, nil, nil)
  let context = store.context()

  let wasmBytes = readFile("test.wasm")
  let module = WasmtimeModule.new(engine.it, wasmBytes).okOr(err):
    echo "Failed to create wasm module: ", err.msg
    return

  let moduleImports = module.imports
  let moduleExports = module.exports

  echo "Imports:"
  for i, e in moduleImports:
    echo &"  {i}: {e}"

  echo "Exports:"
  for i, e in moduleExports:
    echo &"  {i}: {e}"

  let wasiConfig = wasi_config_new()
  wasi_config_inherit_argv(wasiConfig)
  wasi_config_inherit_env(wasiConfig)
  wasi_config_inherit_stdin(wasiConfig)
  wasi_config_inherit_stdout(wasiConfig)
  wasi_config_inherit_stderr(wasiConfig)
  wasmtime_context_set_wasi(context, wasiConfig)

  linker.defineWasi().okOr(err):
    echo "Failed to create linker: ", err.msg
    return

  block:
    let paramTypes = [
      wasm_valtype_new(I32),
      wasm_valtype_new(I64),
    ]
    var paramTypesVec: wasm_valtype_vec_t
    wasm_valtype_vec_new(paramTypesVec.addr, paramTypes.len.csize_t, paramTypes[0].addr)

    let resultTypes = [
      wasm_valtype_new(I32),
    ]
    var resultTypesVec: wasm_valtype_vec_t
    wasm_valtype_vec_new(resultTypesVec.addr, resultTypes.len.csize_t, resultTypes[0].addr)

    var funcType = wasm_functype_new(paramTypesVec.addr, resultTypesVec.addr)
    defer:
      funcType.delete()

    proc cb(env: pointer, caller: ptr WasmtimeCaller, args: ptr UncheckedArray[WasmtimeVal],
      nargs: csize_t, results: ptr UncheckedArray[WasmtimeVal], nresults: csize_t):
        ptr wasm_trap_t {.cdecl.} =
      echo &"host test {args[0]}, {args[1]}"
      results[0] = 42069.int32.toWasmtimeVal

    linker.defineFunc("env", "host_test", funcType, cb).okOr(err):
      echo "Failed to define host function"

  let instance = linker.instantiate(context, module, nil).okOr(err):
    echo "Failed to instantiate wasm module: ", err.msg
    return

  echo "instance exports"
  for i in 0..<moduleExports.len:
    let mainExport = instance.getExport(context, i)
    if mainExport.isNone:
      echo &"  {i}: none"
      continue
    echo &"  {i}: {mainExport.get.name}"

  let mainExport = instance.getExport(context, "wasm_main")
  assert mainExport.isSome
  assert mainExport.get.kind == Func
  echo mainExport

  echo "Call wasm_main"
  mainExport.get.`of`.`func`.addr.call(context, [], [], nil).toResult(void).okOr(err):
    echo &"Failed to call wasm_main: {err.msg}"
    return

  let memoryExport = instance.getExport(context, "memory")
  assert memoryExport.isSome
  assert memoryExport.get.kind == Memory

  discard memoryExport.get.`of`.memory.addr.grow(context, 1).okOr(err):
    echo "Failed to grow memory: ", err
    0

  let memoryData = memoryExport.get.memory.data(context)
  echo memoryData[0..<5]

  echo "Called wasm_main"

  let testAddExport = instance.getExport(context, "test_add")
  assert testAddExport.isSome
  assert testAddExport.get.kind == Func

  echo "Call add"
  var res: array[1, WasmtimeVal]
  testAddExport.get.function.call(context, [
      123.int32.toWasmtimeVal, 456.int32.toWasmtimeVal
      ], res, nil).toResult(void).okOr(err):

    echo &"Failed to call test_add: {err.msg}"
    return

  echo "-> ", testAddExport.get.function.call(context, int32, 456.int32, 789.int32)


  echo "Called add -> ", res


proc main2*() =
  var v: wasm_byte_vec_t
  wasm_byte_vec_new_uninitialized(v.addr, 10)
  echo v


  let config = WasmConfig.new()
  let engine = WasmEngine.new(config)
  let store = WasmStore.new(engine)
  echo "Created store"

  let err = WasmtimeError.new("hello world")
  echo cast[int](err)
  echo err.msg

  let wasmBytes = readFile("/mnt/c/Absytree/wasm/test.wasm")
  var wasmBytesVec: wasm_byte_vec_t
  wasm_byte_vec_new(wasmBytesVec.addr, wasmBytes.len.csize_t, cast[ptr wasm_byte_t](wasmBytes[0].addr))

  echo "Validate: ", store.it.wasm_module_validate(wasmBytesVec.addr)
  let module = store.it.wasm_module_new(wasmBytesVec.addr)
  assert module != nil
  echo "Created module"

  var moduleExports: wasm_exporttype_vec_t
  module.wasm_module_exports(moduleExports.addr)
  echo "Module exports: ", moduleExports.size.int
  for i in 0..<moduleExports.size.int:
    let e: ptr wasm_exporttype_t = moduleExports.data[i]
    echo "  ", i, ": ", e.wasm_exporttype_name[], ", ", e.wasm_exporttype_type

  var moduleImports: wasm_importtype_vec_t
  module.wasm_module_imports(moduleImports.addr)
  echo "Module imports: ", moduleImports.size.int
  for i in 0..<moduleImports.size.int:
    let e: ptr wasm_importtype_t = moduleImports.data[i]
    echo "  ", i, ": ", e.wasm_importtype_name[], ", ", e.wasm_importtype_type

  var imports: seq[ptr wasm_extern_t] = @[]
  var importsVec: wasm_extern_vec_t
  wasm_extern_vec_new(importsVec.addr, imports.len.csize_t, imports[0].addr)
  let instance = store.it.wasm_instance_new(module, importsVec.addr, nil)
  assert instance != nil
  echo "Created instance"

  var instanceExports: wasm_extern_vec_t
  instance.wasm_instance_exports(instanceExports.addr)
  echo "Exports: ", instanceExports

  for i in 0..<instanceExports.size.int:
    let e: ptr wasm_extern_t = instanceExports.data[i]
    echo "  ", i, ": ", e.wasm_extern_kind, ", ", e.wasm_extern_type
    case e.wasm_extern_kind
    of Func:
      let f = e.wasm_extern_as_func()
      # let exportType: ptr wasm_exporttype_t =
      # let name = exportType.wasm_exporttype_name()
      # echo "Export: ", name[]

      # let t = e.wasm_as_func
      assert f != nil

      echo f[]

    else:
      discard

  let paramTypes = [
    wasm_valtype_new(I32),
    wasm_valtype_new(F32),
  ]
  var paramTypesVec: wasm_valtype_vec_t
  wasm_valtype_vec_new(paramTypesVec.addr, paramTypes.len.csize_t, paramTypes[0].addr)

  let resultTypes = [
    wasm_valtype_new(I64),
    wasm_valtype_new(ExternRef),
  ]
  var resultTypesVec: wasm_valtype_vec_t
  wasm_valtype_vec_new(resultTypesVec.addr, resultTypes.len.csize_t, resultTypes[0].addr)

  var funcType = wasm_functype_new(paramTypesVec.addr, resultTypesVec.addr)

proc main3*() =
  let config = WasmConfig.new()
  let engine = WasmEngine.new(config)
  let store = WasmtimeComponentStore.new(engine, nil, nil)
  echo store.it.isNil
  let context = store.context()

  wasmtime_component_store_limiter(store.it, int64.high, 10000, 1000, 1000, 1000)

  let linker = wasmtime_component_linker_new(engine.it)
  linker.defineWasi().okOr(err):
    echo "Failed to create linker: ", err.msg
    return


  echo "read file"
  let wasmBytes = readFile("tests/wasm/testc.wasm")
  # let module = WasmtimeModule.new(engine.it, wasmBytes).okOr(err):
  #   echo "Failed to create wasm module: ", err.msg
  #   return

  var c: ptr WasmtimeComponent = nil
  echo "create component"
  var err = wasmtime_component_from_binary(engine.it, wasmBytes[0].addr, wasmBytes.len.csize_t, c.addr)
  if err != nil:
    let res = err.toResult(int)
    echo "Failed to create wasm component: ", res.err.msg
    return

  echo "create instance"

  var instance: ptr WasmtimeComponentInstance = nil
  var trap: ptr wasm_trap_t = nil
  err = wasmtime_component_linker_instantiate(linker, context, c, instance.addr, trap.addr)
  if err != nil:
    let res = err.toResult(int)
    echo "Failed to create component instance: ", res.err.msg
    return

  trap.toResult(void).okOr(err):
    echo "Failed to create component instance: ", err.msg
    return

  if instance == nil:
    echo "Failed to create component instance: nil"
    return

  block:
    let name = "hello"
    echo &"get func {name}"
    var f: ptr WasmtimeComponentFunc = nil
    if not wasmtime_component_instance_get_func(instance, context, name[0].addr, name.len.csize_t, f.addr):
      echo &"Failed to get func '{name}'"
      return

    if f == nil:
      echo &"Failed to get func '{name}'"
      return

    echo &"call func {name}"
    var params: array[1, WasmtimeComponentVal]
    var results: array[1, WasmtimeComponentVal]
    wasmtime_component_func_call(f, context, params[0].addr, 0, results[0].addr, 0, trap.addr).toResult(void).okOr(err):
      echo &"Failed to call func '{name}': {err}"
      return

  block:
    let name = "foo"
    echo &"get func {name}"
    var f: ptr WasmtimeComponentFunc = nil
    if not wasmtime_component_instance_get_func(instance, context, name[0].addr, name.len.csize_t, f.addr):
      echo &"Failed to get func '{name}'"
      return

    if f == nil:
      echo &"Failed to get func '{name}'"
      return

    echo &"call func {name}"
    var params: array[2, WasmtimeComponentVal]
    params[0].kind = S32
    params[0].payload.s32 = 123
    params[1].kind = Float32
    params[1].payload.f32 = 789.456
    var results: array[1, WasmtimeComponentVal]
    wasmtime_component_func_call(f, context, params[0].addr, params.len.csize_t, results[0].addr, results.len.csize_t, trap.addr).toResult(void).okOr(err):
      echo &"Failed to call func '{name}': {err}"
      return

    echo results[0].kind

  echo "done"

main3()
# main()



proc main() =
  echo "Start main"
  let config = newConfig()
  let engine = newEngine(config)

  let linker = engine.newLinker()
  defer: linker.delete()

  let store = engine.newStore(nil, nil)
  defer: store.delete()

  let context = store.context()

  let wasiConfig = newWasiConfig()
  wasiConfig.inheritStdin()
  wasiConfig.inheritStderr()
  wasiConfig.inheritStdout()
  context.setWasi(wasiConfig).toResult(void).okOr(err):
    echo "Failed to setup wasi: ", err.msg
    return

  echo "Read wasm file"
  let wasmBytes = readFile("tests/wasm/testm.wasm")
  let module = engine.newModule(wasmBytes).okOr(err):
    echo "Failed to create wasm module: ", err.msg
    return

  let moduleImports = module.imports
  let moduleExports = module.exports

  echo "Imports:"
  for i, e in moduleImports:
    echo &"  {i}: {e}"

  echo "Exports:"
  for i, e in moduleExports:
    echo &"  {i}: {e}"

  linker.defineWasi().okOr(err):
    echo "Failed to create linker: ", err.msg
    return

  echo "Instantiate "
  var trap: ptr WasmTrapT = nil
  let instance = linker.instantiate(context, module, trap.addr).okOr(err):
    echo "Failed to instantiate wasm module: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to instantiate wasm module: ", err.msg
    return

  echo "instance exports"
  for i in 0..<moduleExports.len:
    let mainExport = instance.getExport(context, i)
    if mainExport.isNone:
      echo &"  {i}: none"
      continue
    echo &"  {i}: {mainExport.get.name}"

  let mainExport = instance.getExport(context, "hello")
  assert mainExport.isSome
  assert mainExport.get.kind.WasmExternKind == ExternFunc
  echo mainExport

  echo "Call hello"
  mainExport.get.of_field.func_field.addr.call(context, [], [], trap.addr).toResult(void).okOr(err):
    echo &"Failed to call hello: {err.msg}"
    return

  trap.okOr(err):
    echo "[trap] Failed to call hello: ", err.msg
    return

  echo "Called hello"
