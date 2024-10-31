import std/[strformat, options]
import wasmtime

proc main() =
  echo "Start"
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

main()
