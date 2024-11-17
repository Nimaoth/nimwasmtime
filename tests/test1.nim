import std/[strformat, options, macros, tables, unicode]
import wasmtime, wit_host_module

type MyContext = ref object
  resources: WasmModuleResources
  counter: int
  callbacks: Table[uint32, ptr ExternT]
  # instanceToComponent: Table[ptr ComponentInstanceT, ptr ComponentT]
  # currentInstance: ptr ComponentInstanceT = nil

type MyBlob = object
  i: int = 1
  blobName: string
  arr: seq[uint8]

type Callback = object
  data: uint32
  key: uint32
  drop: proc() {.raises: [].}

# proc `=copy`*(a: var Callback, b: Callback) {.error.}
# proc `=copy`*(a: var MyBlob, b: MyBlob) {.error.}

proc `=destroy`*(b: Callback) =
  if b.data != 0:
    echo "[host] --------------------------------- delete Callback ", b.data, b.key
    b.drop()

proc `=destroy`*(b: MyBlob) =
  if b.i != 0:
    echo "[host] --------------------------------- delete MyBlob ", b

# todo: auto generate unique type id for each resource
template typeId*(_: typedesc[MyBlob]): int = 69
template typeId*(_: typedesc[Callback]): int = 420

when defined(witRebuild):
  static: hint("Rebuilding test.wit")
  importWit "wasm/wit", MyContext:
    cacheFile = "host_module.nim"
    world = "host"
    mapName "blob", MyBlob
else:
  static: hint("Using cached test.wit (host.nim)")
  include host_module

proc testInterfaceNewBlob(host: MyContext, store: ptr ContextT, init: seq[uint8]): MyBlob =
  result = MyBlob(blobName: "constr" & $host.counter, arr: init)
  host.counter.inc

proc testInterfaceWrite(host: MyContext, store: ptr ContextT, self: var MyBlob, bytes: seq[uint8]) =
  self.arr.add bytes

proc testInterfaceRead(host: MyContext, store: ptr ContextT, self: var MyBlob, n: int32): seq[uint8] =
  defer:
    echo "[host] ############################# read ", self, ", ", n, " -> ", result
  let l = min(self.arr.len, n.int)
  return self.arr[0..<l]

proc testInterfaceMerge(host: MyContext, store: ptr ContextT, lhs: sink MyBlob, rhs: sink MyBlob): MyBlob =
  echo "[host] ================================== merge ", lhs, ", ", rhs
  result = MyBlob(blobName: "merge" & $host.counter, arr: lhs.arr & rhs.arr)
  host.counter.inc

proc testInterfacePrint(host: MyContext, store: ptr ContextT, lhs: var MyBlob, rhs: var MyBlob) =
  echo "[host] ================================== print ", lhs, ", ", rhs

# proc testInterfaceBarBaz(host: MyContext, store: ptr ContextT, a: int32, b: float32): float32 =
#   result = a.float32 - b

proc envTestNoParams2(host: MyContext, store: ptr ContextT, b: Baz) =
  echo "envTestNoParams2 ", b

proc testInterfaceTestNoParams(host: MyContext, store: ptr ContextT) =
  echo "testInterfaceTestNoParams"

proc testInterfaceTestSimpleParams(host: MyContext, store: ptr ContextT,
    a: int8, b: int16, c: int32, d: int64, e: uint8, f: uint16, g: uint32, h: uint64, i: float32,
    j: float64, k: bool, l: Rune) =
  echo &"{a}, {b}, {c}, {d}, {e}, {f}, {g}, {h}, {i}, {j}, {k}, {l}"

proc testInterfaceTestSimpleParamsPtr(host: MyContext, store: ptr ContextT,
    a: int8, b: int16, c: int32, d: int64, e: uint8, f: uint16, g: uint32, h: uint64, i: float32,
    j: float64, k: bool, l: Rune, m: int32, n: int32, o: int32, p: int32, q: int32) =
  echo &"{a}, {b}, {c}, {d}, {e}, {f}, {g}, {h}, {i}, {j}, {k}, {l}, {m}, {n}, {o}, {p}, {q}"

proc callbackTypesNewCallback(host: MyContext, store: ptr ContextT, data: uint32, key: uint32, drop: uint32): Callback =
  proc dropImpl() =
    host.callbacks.withValue(drop, fun):
      echo "Call drop for ", data
      var trap: ptr WasmTrapT = nil
      fun[].of_field.func_field.addr.call(store, [], [], trap.addr).toResult(void).okOr(err):
        echo "Failed to call dealloc callback for key ", key, ": ", err.msg

      trap.okOr(err):
        echo "Failed to call dealloc callback for key ", key, ": ", err.msg
    do:
      echo "No dealloc callback registered for key ", key

  Callback(data: data, key: key, drop: dropImpl)

proc callbackTypesData(host: MyContext, store: ptr ContextT, self: var Callback): uint32 =
  self.data

proc callbackTypesKey(host: MyContext, store: ptr ContextT, self: var Callback): uint32 =
  self.key

proc testInterfaceAddCallback(host: MyContext, store: ptr ContextT, env: string, name: string): uint32 =
  discard

proc main(): WasmtimeResult[void] =
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

  let wasmBytes = readFile("tests/wasm/plugin1.m.wasm")
  let module = engine.newModule(wasmBytes).okOr(err):
    echo "Failed to load wasm module: ", err.msg
    return

  linker.defineWasi().okOr(err):
    echo "Failed to create linker: ", err.msg
    return

  var ctx = MyContext(counter: 1)
  linker.defineComponent(ctx).okOr(err):
    echo "[host] Failed to define component: ", err.msg
    return

  var trap: ptr WasmTrapT = nil
  let instance = linker.instantiate(context, module, trap.addr).okOr(err):
    echo "Failed to instantiate wasm module: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to instantiate wasm module: ", err.msg
    return

  let mainExport = instance.getExport(context, "start")
  mainExport.get.of_field.func_field.addr.call(context, [], [], trap.addr).toResult(void).okOr(err):
    echo "Failed to call hello: ", err.msg
    return

  echo "[host] ------------ Finished main"

echo main()
echo "no crash"
