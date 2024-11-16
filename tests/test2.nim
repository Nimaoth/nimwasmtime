import std/[strformat, options, strutils, macros, genasts, unicode, tables]
import wasmtime, wit_host

type MyContext = ref object
  counter: int
  callbacks: Table[uint32, ptr ComponentFuncT]
  instanceToComponent: Table[ptr ComponentInstanceT, ptr ComponentT]
  currentInstance: ptr ComponentInstanceT = nil

type MyBlob = object
  i: int = 1
  blobName: string
  arr: seq[uint8]

type Callback = object
  data: uint32
  key: uint32
  drop: proc()

# proc `=copy`*(a: var Callback, b: Callback) {.error.}
# proc `=copy`*(a: var MyBlob, b: MyBlob) {.error.}

proc `=destroy`*(b: Callback) =
  if b.data != 0:
    echo "--------------------------------- delete Callback ", b.data, b.key
    b.drop()

proc `=destroy`*(b: MyBlob) =
  if b.i != 0:
    echo "--------------------------------- delete MyBlob ", b

# todo: auto generate unique type id for each resource
template typeId*(_: typedesc[MyBlob]): int = 69
template typeId*(_: typedesc[Callback]): int = 420

when defined(witRebuild):
  static: hint("Rebuilding test.wit")
  importWit "wasm/wit", MyContext:
    world = "host"
    mapName "blob", MyBlob
else:
  static: hint("Using cached test.wit (host.nim)")
  include host

proc testInterfaceNewBlob(host: MyContext, store: ptr ComponentContextT, init: seq[uint8]): MyBlob =
  result = MyBlob(blobName: "constr" & $host.counter, arr: init)
  host.counter.inc

proc testInterfaceWrite(host: MyContext, store: ptr ComponentContextT, self: var MyBlob, bytes: seq[uint8]) =
  self.arr.add bytes

proc testInterfaceRead(host: MyContext, store: ptr ComponentContextT, self: var MyBlob, n: int32): seq[uint8] =
  let l = min(self.arr.len, n.int)
  return self.arr[0..<l]

proc testInterfaceMerge(host: MyContext, store: ptr ComponentContextT, lhs: sink MyBlob, rhs: sink MyBlob): MyBlob =
  result = MyBlob(blobName: "merge" & $host.counter, arr: lhs.arr & rhs.arr)
  host.counter.inc

proc testInterfacePrint(host: MyContext, store: ptr ComponentContextT, lhs: var MyBlob, rhs: var MyBlob) =
  echo "================================== ", lhs, ", ", rhs

proc testInterfaceBarBaz(host: MyContext, store: ptr ComponentContextT, a: int32, b: float32): float32 =
  result = a.float32 - b

proc envTestNoParams2(host: MyContext, store: ptr ComponentContextT, b: Baz) =
  echo "envTestNoParams2 ", b

proc testInterfaceTestNoParams(host: MyContext, store: ptr ComponentContextT) =
  echo "testInterfaceTestNoParams"

proc testInterfaceTestSimpleParams(host: MyContext, store: ptr ComponentContextT,
    a: int8, b: int16, c: int32, d: int64, e: uint8, f: uint16, g: uint32, h: uint64, i: float32,
    j: float64, k: bool, l: Rune) =
  echo &"{a}, {b}, {c}, {d}, {e}, {f}, {g}, {h}, {i}, {j}, {k}, {l}"

proc testInterfaceTestSimpleParamsPtr(host: MyContext, store: ptr ComponentContextT,
    a: int8, b: int16, c: int32, d: int64, e: uint8, f: uint16, g: uint32, h: uint64, i: float32,
    j: float64, k: bool, l: Rune, m: int32, n: int32, o: int32, p: int32, q: int32) =
  echo &"{a}, {b}, {c}, {d}, {e}, {f}, {g}, {h}, {i}, {j}, {k}, {l}, {m}, {n}, {o}, {p}, {q}"

proc callbackTypesNewCallback(host: MyContext, store: ptr ComponentContextT, data: uint32, key: uint32, drop: uint32): Callback =
  proc dropImpl() =
    host.callbacks.withValue(drop, fun):
      echo "Call drop for ", data
      fun[].call(store, [data.toVal], []).okOr(err):
        echo "Failed to call dealloc callback for key ", key, ": ", err
    do:
      echo "No dealloc callback registered for key ", key

  Callback(data: data, key: key, drop: dropImpl)

proc callbackTypesData(host: MyContext, store: ptr ComponentContextT, self: var Callback): uint32 =
  self.data

proc callbackTypesKey(host: MyContext, store: ptr ComponentContextT, self: var Callback): uint32 =
  self.key

proc testInterfaceAddCallback(host: MyContext, store: ptr ComponentContextT, env: string, name: string): uint32 =
  echo &"testInterfaceAddCallback {env}, {name}"
  let instance = host.currentInstance
  var component: ptr ComponentT = host.instanceToComponent[instance]
  let instanceIndex = if env != "":
    component.getExport(env)
  else:
    ComponentExportIndexT.none

  echo instanceIndex
  let exportIndex = component.getExport(name, instanceIndex)
  if exportIndex.isNone:
    echo &"Failed to find export ", name, " in ", instanceIndex
    return uint32.high

  var fun: ptr ComponentFuncT = nil
  if not instance.getFuncByIndex(store, exportIndex.get, fun.addr):
    echo "Failed to get func"
    return

  let key = host.callbacks.len.uint32
  host.callbacks[key] = fun
  key

proc call(instance: ptr ComponentInstanceT, context: ptr ComponentContextT, name: string, params: openArray[ComponentValT], nresults: static[int]) =
  var f: ptr ComponentFuncT = nil
  if not instance.getFunc(context, name.cstring, name.len.csize_t, f.addr):
    echo &"[host] Failed to get func '{name}'"
    return

  if f == nil:
    echo &"[host] Failed to get func '{name}'"
    return

  var res: array[max(nresults, 1), ComponentValT]
  echo &"[host] ------------------------------- call {name}, {params} -------------------------------------"
  f.call(context, params, res.toOpenArray(0, nresults - 1)).okOr(e):
    echo &"[host] Failed to call func '{name}': ", e.msg
    return

  if nresults > 0:
    echo &"[host] call func {name} -> {res}"

proc main(): WasmtimeResult[void] =
  echo "[host] Start main"
  let config = newConfig()
  let engine = newEngine(config)
  let linker = engine.newComponentLinker()
  var trap: ptr WasmTrapT = nil

  let store = engine.newComponentStore(nil, nil)
  # defer: store.delete()

  var instance2: ptr ComponentInstanceT = nil

  var ctx = MyContext(counter: 1)
  linker.defineComponent(ctx).okOr(err):
    echo "[host] Failed to define component: ", err.msg
    return

  linker.linkWasi(trap.addr).okOr(err):
    echo "[host] Failed to link wasi: ", err.msg
    return

  trap.okOr(err):
    echo "[host][trap] Failed to link wasi: ", err.msg
    return

  echo "[host] read file 1"
  let component1 = engine.newComponent(readFile("tests/wasm/plugin1.c.wasm")).okOr(err):
    echo "[host] Failed to create wasm component: ", err.msg
    return

  component1.iterateImports proc(path: string, name: string, typ: ComponentItemType) =
    echo "path: ", path, ", name: ", name, ", typ: ", typ
    if (path == "callbacks" or path.endsWith("/callbacks")) and name.startsWith("invoke-"):
      echo "========================== define"
      let e = linker.defineFunc(path, name):
        echo "[host] ----------------- ", path, "#", name, ": ", parameters
        let cb = ?store.resourceHostData(parameters[0].addr, Callback)
        # type Callback = object
        #   data: uint32
        #   key: uint32

        # let cb = parameters[0].to(Callback)
        ctx.callbacks.withValue(cb.key, fun):
          ?fun[].call(store, parameters, results)
        do:
          echo "No callback registered for key ", cb.key
          return
        ?store.resourceDrop(parameters[0].addr)

  echo "[host] read file 2"
  let component2 = engine.newComponent(readFile("tests/wasm/plugin2.c.wasm")).okOr(err):
    echo "[host] Failed to create wasm component: ", err.msg
    return

  echo "[host] create instance"
  var instance: ptr ComponentInstanceT = nil
  linker.instantiate(store.context, component1, instance.addr, trap.addr).okOr(err):
    echo "[host] Failed to create component instance: ", err.msg
    return
  ctx.instanceToComponent[instance] = component1

  linker.defineInstance(store.context, component1, instance).okOr(err):
    echo "[host] Failed to define instance in linker: ", err.msg
    return

  echo "[host] create instance"
  linker.instantiate(store.context, component2, instance2.addr, trap.addr).okOr(err):
    echo "[host] Failed to create component instance 2: ", err.msg
    return
  ctx.instanceToComponent[instance2] = component2

  trap.okOr(err):
    echo "[host][trap] Failed to create component instance: ", err.msg
    return

  assert instance != nil

  ctx.currentInstance = instance
  instance.call(store.context, "start", [], 0)
  ctx.currentInstance = instance2
  instance2.call(store.context, "start", [], 0)

  echo "[host] ------------ Finished main"

echo main()
