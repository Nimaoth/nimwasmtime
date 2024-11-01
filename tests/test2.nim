import std/[strformat, options]
import wasmtime

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

proc toVal*[T](a: T): ComponentValT =
  when T is object:
    result.kind = ComponentValKind.Record.ComponentValKindT
    var numFields = 0
    for k, v in a.fieldPairs:
      numFields.inc

    result.payload.record.addr.newUninitialized(numFields.csize_t)

    var i = 0
    for k, v in a.fieldPairs:
      result.payload.record[i] = ComponentValRecordFieldT(name: k.toName, val: v.toVal)
      inc i

  elif T is int32:
    result.kind = ComponentValKind.S32.ComponentValKindT
    result.payload.s32 = a

  elif T is int64:
    result.kind = ComponentValKind.S64.ComponentValKindT
    result.payload.s64 = a

  elif T is float32:
    result.kind = ComponentValKind.Float32.ComponentValKindT
    result.payload.f32 = a

  elif T is float64:
    result.kind = ComponentValKind.Float64.ComponentValKindT
    result.payload.f64 = a

  else:
    {.error: "Can't convert type " & $T & " to ComponentValT".}

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

  let store = engine.newComponentStore(nil, nil)
  # defer: store.delete()

  let context = store.context()

  echo "read file"
  let wasmBytes = readFile("tests/wasm/testc.wasm")
  var c: ptr ComponentT = nil
  echo "create component"
  engine.fromBinary(cast[ptr uint8](wasmBytes[0].addr), wasmBytes.len.csize_t, c.addr).okOr(err):
    echo "Failed to create wasm component: ", err.msg
    return

  echo "create instance"

  var instance: ptr ComponentInstanceT = nil
  linker.instantiate(context, c, instance.addr, trap.addr).okOr(err):
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
      echo &"Failed to call func '{name}': ", err.msg
      return

    echo &"Called {name}: {results[0]}"

main()
echo "------------"
main2()
