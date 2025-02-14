# nimwasmtime

Nim wrapper for wasmtime

This wrapper is auto-generated with [Futhark](https://github.com/PMunch/futhark), but also tries to add some nicer wrappers
around some functions.

## Installation

Add this to your nimble file:

```nim
requires "https://github.com/Nimaoth/nimwasmtime >= 0.1.9"
```

## Usage

See [here](tests/test2.nim) for more examples.

```nim
import std/[strformat, options]
import wasmtime

proc main() =
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

  let wasmBytes = readFile("tests/wasm/testm.wasm")
  let module = engine.newModule(wasmBytes).okOr(err):
    echo "Failed to load wasm module: ", err.msg
    return

  linker.defineWasi().okOr(err):
    echo "Failed to create linker: ", err.msg
    return

  var trap: ptr WasmTrapT = nil
  let instance = linker.instantiate(context, module, trap.addr).okOr(err):
    echo "Failed to instantiate wasm module: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to instantiate wasm module: ", err.msg
    return

  let mainExport = instance.getExport(context, "hello")
  mainExport.get.of_field.func_field.addr.call(context, [], [], trap.addr).toResult(void).okOr(err):
    echo "Failed to call hello: ", err.msg
    return

main()
```
