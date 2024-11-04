import std/[strformat, options, strutils, macros, genasts]
import results
import wasmtime
import wit_host

witBindGen("wasm/test.wit"):
  discard

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

proc main2() =
  echo "Start main2"
  let config = newConfig()
  let engine = newEngine(config)

  let linker = engine.newComponentLinker()
  # defer: linker.delete()

  var trap: ptr WasmTrapT = nil

  linker.linkWasi(trap.addr).okOr(err):
    echo "Failed to link wasi: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to link wasi: ", err.msg
    return

  block:
    proc cb(ctx: pointer, params: openArray[ComponentValT], results: var openArray[ComponentValT]) =
      let a = params[0].to(int32)
      let b = params[1].to(float32)
      results[0] = (a.float32 - b).toVal
      echo &"bar-baz: {a} - {b} = {results[0]}"

    let funcName = "bar-baz"
    linker.funcNew(funcName, cb).okOr(err):
      echo &"[trap] Failed to link func {funcName}: ", err.msg

  block:
    proc cb(ctx: pointer, params: openArray[ComponentValT], results: var openArray[ComponentValT]) =
      # echo &"cb: {params} -> {results.len}"
      let b = params[0].to(Bar)
      echo &"barrrr: {b}"

    let funcName = "call-bar"
    linker.funcNew(funcName, cb).okOr(err):
      echo &"[trap] Failed to link func {funcName}: ", err.msg

  block:
    proc cb(ctx: pointer, params: openArray[ComponentValT], results: var openArray[ComponentValT]) =
      echo "bazzz"
      # echo &"cb: {params} -> {results.len}"
      let b = params[0].to(Baz)
      echo &"bazzz: {b}"

    let funcName = "call-baz"
    linker.funcNew(funcName, cb).okOr(err):
      echo &"[trap] Failed to link func {funcName}: ", err.msg

  echo "read file"
  let wasmBytes = readFile("tests/wasm/testc.wasm")
  let component = engine.newComponent(wasmBytes).okOr(err):
    echo "Failed to create wasm component: ", err.msg
    return

  echo "create instance"

  let store = engine.newComponentStore(nil, nil)
  # defer: store.delete()
  let context = store.context()

  var instance: ptr ComponentInstanceT = nil
  linker.instantiate(context, component, instance.addr, trap.addr).okOr(err):
    echo "Failed to create component instance: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to create component instance: ", err.msg
    return

  assert instance != nil

  block:
    let name = "hello"
    echo &"get func {name}"
    var f: ptr ComponentFuncT = nil
    if not instance.getFunc(context, cast[ptr uint8](name[0].addr), name.len.csize_t, f.addr):
      echo &"Failed to get func '{name}'"
      return

    if f == nil:
      echo &"Failed to get func '{name}'"
      return

    echo &"call func {name}"
    var params: array[1, ComponentValT]
    var results: array[1, ComponentValT]
    f.call(context, params[0].addr, 0, results[0].addr, 0, trap.addr).okOr(err):
      echo &"Failed to call func '{name}': ", err.msg
      return

  block:
    let name = "foo"
    echo &"get func {name}"
    var f: ptr ComponentFuncT = nil
    if not instance.getFunc(context, cast[ptr uint8](name[0].addr), name.len.csize_t, f.addr):
      echo &"Failed to get func '{name}'"
      return

    if f == nil:
      echo &"Failed to get func '{name}'"
      return

    type Foo = object
      a: int32
      b: float32

    var params: array[1, ComponentValT]
    var results: array[1, ComponentValT]
    params[0] = Foo(a: 123, b: 456.789).toVal
    echo &"call func {name}, {params[0]}"
    f.call(context, params[0].addr, params.len.csize_t, results[0].addr, results.len.csize_t, trap.addr).okOr(err):
      echo &"Failed to call func '{name}': ", err == nil
      echo &"Failed to call func '{name}': ", err.msg
      trap.okOr(err2):
        echo "[trap] Failed to call func '{name}': ", err2.msg
        return
      return

    trap.okOr(err):
      echo "[trap] Failed to create component instance: ", err.msg
      return

    echo &"Called {name}: {results[0]}"

main()
echo "------------"
main2()
