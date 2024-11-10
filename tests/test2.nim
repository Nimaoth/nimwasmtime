import std/[strformat, options, strutils, macros, genasts, unicode, tables]
import wasmtime, wit_host

type MyContext = ref object
  counter: int

type MyBlob = object
  i: int = 1
  blobName: string
  arr: seq[uint8]

proc `=destroy`*(b: MyBlob) =
  if b.i != 0:
    echo "--------------------------------- delete MyBlob ", b

template typeId*(_: typedesc[MyBlob]): int = 69

when defined(witRebuild):
  static: hint("Rebuilding test.wit")
  importWit "wasm/test.wit", MyContext:
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

proc envTestNoParams2(host: MyContext, store: ptr ComponentContextT) =
  echo "envTestNoParams2"

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

proc call(instance: ptr ComponentInstanceT, context: ptr ComponentContextT, name: string, params: openArray[ComponentValT], nresults: static[int]) =
  var f: ptr ComponentFuncT = nil
  if not instance.getFunc(context, cast[ptr uint8](name[0].addr), name.len.csize_t, f.addr):
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

proc main() =
  echo "[host] Start main"
  let config = newConfig()
  let engine = newEngine(config)
  let linker = engine.newComponentLinker()
  var trap: ptr WasmTrapT = nil

  let store = engine.newComponentStore(nil, nil)
  # defer: store.delete()

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

  echo "[host] read file"
  let wasmBytes = readFile("tests/wasm/testc.wasm")
  let component = engine.newComponent(wasmBytes).okOr(err):
    echo "[host] Failed to create wasm component: ", err.msg
    return

  echo "[host] create instance"
  var instance: ptr ComponentInstanceT = nil
  linker.instantiate(store.context, component, instance.addr, trap.addr).okOr(err):
    echo "[host] Failed to create component instance: ", err.msg
    return

  trap.okOr(err):
    echo "[host][trap] Failed to create component instance: ", err.msg
    return

  assert instance != nil

  instance.call(store.context, "start", [], 0)

  echo "[host] ------------ Finished main"

main()
