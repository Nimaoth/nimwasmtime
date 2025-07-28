import std/[strformat, options, macros, tables, unicode, parseopt, strutils]
import wasmtime, wit_host_module, wasm_builder

type MyContext = ref object
  resources: WasmModuleResources
  counter: int
  callbacks: Table[uint32, ptr ExternT]
  # instanceToComponent: Table[ptr ComponentInstanceT, ptr ComponentT]
  # currentInstance: ptr ComponentInstanceT = nil
  sharedMemory: ptr SharedmemoryT

type MyBlob = object
  i: int = 1
  blobName: string
  arr: seq[uint8]

type Callback = object
  data: uint32
  key: uint32
  drop: proc() {.raises: [].}

proc `=copy`*(a: var Callback, b: Callback) {.error.}
var blobCounter = 0
proc `=copy`*(a: var MyBlob, b: MyBlob) {.error.}

proc `=destroy`*(b: Callback) =
  if b.data != 0:
    echo "[host] --------------------------------- delete Callback ", b.data, b.key
    b.drop()

proc `=destroy`*(b: MyBlob) =
  if b.i != 0:
    dec blobCounter
    echo "[host] --------------------------------- delete MyBlob ", b

proc getMemoryFor(host: MyContext, caller: ptr CallerT): Option[ExternT] =
  # echo &"[host] getMemoryFor"
  var item: ExternT
  item.kind = WASMTIME_EXTERN_SHAREDMEMORY
  item.of_field.sharedmemory = host.sharedMemory
  item.some

# todo: auto generate unique type id for each resource
template typeId*(_: typedesc[MyBlob]): int = 1
template typeId*(_: typedesc[Callback]): int = 2

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
  inc blobCounter
  echo &"[host] testInterfaceNewBlob {init}"
  result = MyBlob(blobName: "constr" & $host.counter, i: host.counter, arr: init)
  host.counter.inc

proc testInterfaceWrite(host: MyContext, store: ptr ContextT, self: var MyBlob, bytes: seq[uint8]) =
  echo &"[host] testInterfaceWrite {self} {bytes}"
  self.arr.add bytes

proc testInterfaceRead(host: MyContext, store: ptr ContextT, self: var MyBlob, n: int32): seq[uint8] =
  defer:
    echo "[host] ############################# read ", self, ", ", n, " -> ", result
  let l = min(self.arr.len, n.int)
  return self.arr[0..<l]

proc testInterfaceMerge(host: MyContext, store: ptr ContextT, lhs: sink MyBlob, rhs: sink MyBlob): MyBlob =
  inc blobCounter
  echo "[host] ================================== merge ", lhs, ", ", rhs
  result = MyBlob(i: host.counter, blobName: "merge" & $host.counter, arr: lhs.arr & rhs.arr)
  host.counter.inc

proc testInterfacePrint(host: MyContext, store: ptr ContextT, lhs: var MyBlob, rhs: var MyBlob) =
  echo "[host] ================================== print ", lhs, ", ", rhs

# proc testInterfaceBarBaz(host: MyContext, store: ptr ContextT, a: int32, b: float32): float32 =
#   result = a.float32 - b

proc envTestNoParams2(host: MyContext, store: ptr ContextT, b: Baz) =
  echo "[host] envTestNoParams2 ", b

proc testInterfaceTestNoParams(host: MyContext, store: ptr ContextT) =
  echo "[host] testInterfaceTestNoParams"

proc testInterfaceTestSimpleParams(host: MyContext, store: ptr ContextT,
    a: int8, b: int16, c: int32, d: int64, e: uint8, f: uint16, g: uint32, h: uint64, i: float32,
    j: float64, k: bool, l: Rune) =
  echo &"[host] {a}, {b}, {c}, {d}, {e}, {f}, {g}, {h}, {i}, {j}, {k}, {l}"

proc testInterfaceTestSimpleParamsPtr(host: MyContext, store: ptr ContextT,
    a: int8, b: int16, c: int32, d: int64, e: uint8, f: uint16, g: uint32, h: uint64, i: float32,
    j: float64, k: bool, l: Rune, m: int32, n: int32, o: int32, p: int32, q: int32) =
  echo &"[host] {a}, {b}, {c}, {d}, {e}, {f}, {g}, {h}, {i}, {j}, {k}, {l}, {m}, {n}, {o}, {p}, {q}"

proc callbackTypesNewCallback(host: MyContext, store: ptr ContextT, data: uint32, key: uint32, drop: uint32): Callback =
  proc dropImpl() =
    host.callbacks.withValue(drop, fun):
      echo "[host] Call drop for ", data
      var trap: ptr WasmTrapT = nil
      fun[].of_field.func_field.addr.call(store, [], [], trap.addr).toResult(void).okOr(err):
        echo "[host] Failed to call dealloc callback for key ", key, ": ", err.msg

      trap.okOr(err):
        echo "[host] Failed to call dealloc callback for key ", key, ": ", err.msg
    do:
      echo "[host] No dealloc callback registered for key ", key

  Callback(data: data, key: key, drop: dropImpl)

proc callbackTypesData(host: MyContext, store: ptr ContextT, self: var Callback): uint32 =
  self.data

proc callbackTypesKey(host: MyContext, store: ptr ContextT, self: var Callback): uint32 =
  self.key

proc testInterfaceAddCallback(host: MyContext, store: ptr ContextT, env: string, name: string): uint32 =
  discard

proc testInterfaceTestSimpleReturn(host: MyContext, store: ptr ContextT, x: int32): int32 =
  echo "[host] testInterfaceTestSimpleReturn ", x
  return x * 2

proc testInterfaceTestSimpleReturn2(host: MyContext, store: ptr ContextT, x: int8): int8 =
  echo "[host] testInterfaceTestSimpleReturn2 ", x
  return x * 2

proc testInterfaceTestSimpleReturnPtr(host: MyContext, store: ptr ContextT, x: int8): Bar =
  echo "[host] testInterfaceTestSimpleReturnPtr ", x
  return Bar(a: 123, b: 456.789, c: "ü".runeAt(0), d: true)

proc testInterfaceTestSimpleReturnPtr2(host: MyContext; store: ptr ContextT): Baz =
  return Baz(x: "uiae", c: Foo(x: "xvlc"), f: @[Foo(x: "1"), Foo(x: "9"), Foo(x: "6")], d: (111, 222.333), gbruh: @[{Lame}, {SoLame}, {Cool, SoLame}, {Cool, Lame}, {SoLame, Lame}, {Cool, SoLame, Lame}], g: BlockDevice, h: {Lame, SoLame}, e: 666.int32.some, k: @[Bar(a: 123, b: 456.789, c: "ü".runeAt(0), d: true), Bar(a: 987, b: 654.321, c: "ö".runeAt(0), d: false)])

const useBuiltinWasi = false

proc getMemory(caller: ptr CallerT, store: ptr ContextT, host: MyContext): WasmMemory =
  var mainMemory = caller.getExport("memory")
  if mainMemory.isNone:
    mainMemory = host.getMemoryFor(caller)
  if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
    return initWasmMemory(mainMemory.get.of_field.sharedmemory)
  elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
    return initWasmMemory(store, mainMemory.get.of_field.memory.addr)
  else:
    assert false

proc main(): WasmtimeResult[void] =
  var ctx = MyContext(counter: 1)

  let config = newConfig()
  let engine = newEngine(config)

  let linker = engine.newLinker()
  defer: linker.delete()

  let store = engine.newStore(nil, nil)
  defer: store.delete()

  let context = store.context()

  if useBuiltinWasi:
    let wasiConfig = newWasiConfig()
    wasiConfig.inheritStdin()
    wasiConfig.inheritStderr()
    wasiConfig.inheritStdout()
    context.setWasi(wasiConfig).toResult(void).okOr(err):
      echo "[host] Failed to setup wasi: ", err.msg
      return

  var path = "tests/wasm/plugin1.m.wasm"
  var optParser = initOptParser("")
  for kind, key, val in optParser.getopt():
    case kind
    of cmdArgument:
      path = key

    of cmdLongOption, cmdShortOption:
      discard

    of cmdEnd: assert(false) # cannot happen

  echo "[host] load wasm file ", path
  let wasmBytes = readFile(path)
  let module = engine.newModule(wasmBytes).okOr(err):
    echo "[host] Failed to load wasm module: ", err.msg
    return

  if useBuiltinWasi:
    linker.defineWasi().okOr(err):
      echo "[host] Failed to create linker: ", err.msg
      return

  else:
    discard linker.defineFuncUnchecked("wasi_snapshot_preview1", "proc_exit", newFunctype([WasmValkind.I32], [])):
      echo "[host] proc_exit"
      assert false
    discard linker.defineFuncUnchecked("wasi_snapshot_preview1", "fd_close", newFunctype([WasmValkind.I32], [WasmValkind.I32])):
      echo "[host] fd_close"
      assert false
    discard linker.defineFuncUnchecked("wasi_snapshot_preview1", "fd_write", newFunctype([WasmValkind.I32, WasmValkind.I32, WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])):
      type Iovec = object
        data: WasmPtr
        len: uint32

      let mem = getMemory(caller, store, ctx)

      let fd = parameters[0].i32
      let iovecsPtr = parameters[1].i32.WasmPtr
      let numIovecs = parameters[2].i32
      let pNumWritten = parameters[3].i32.WasmPtr

      let file = case fd
      of 1: stdout
      of 2: stderr
      else:
        echo &"[host] invalid fd {fd}"
        return

      var bytesWritten: uint32 = 0
      for vec in mem.getOpenArray[:Iovec](iovecsPtr, numIovecs):
        let data = mem.getRawPtr(vec.data)
        bytesWritten += file.writeBytes(data.toOpenArray(0, vec.len.int - 1), 0, vec.len).uint32

      mem.write[:uint32](pNumWritten, bytesWritten)

    discard linker.defineFuncUnchecked("wasi_snapshot_preview1", "fd_seek", newFunctype([WasmValkind.I32, WasmValkind.I64, WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])):
      echo "[host] fd_seek"
      assert false
    discard linker.defineFuncUnchecked("wasi_snapshot_preview1", "clock_time_get", newFunctype([WasmValkind.I32, WasmValkind.I64, WasmValkind.I32], [WasmValkind.I32])):
      echo "[host] clock_time_get"
      assert false

  var callbacks: seq[int32] = @[]

  discard linker.defineFuncUnchecked("env", "addCallback", newFunctype([WasmValkind.I32], [])):
    let mem = getMemory(caller, store, ctx)
    let funcIdxPtr = parameters[0].i32.WasmPtr
    let funcIdx = mem.read[:int32](funcIdxPtr)
    echo &"[host] addCallback {funcIdxPtr.int} -> {funcIdx}"
    callbacks.add(funcIdx)

  linker.defineComponent(ctx).okOr(err):
    echo "[host] Failed to define component: ", err.msg
    return

  var memType: ptr WasmMemorytypeT = newMemorytype(256, true, 65536, false, true)
  ctx.sharedMemory = engine.createSharedMemory(memType).okOr(err):
    echo "[host] Failed to create shared memory: ", err.msg
    return

  linker.defineSharedMemory(context, "env", "memory", ctx.sharedMemory).okOr(err):
    echo "[host] Failed to define shared memory: ", err.msg
    return

  var trap: ptr WasmTrapT = nil
  let instance = linker.instantiate(context, module, trap.addr).okOr(err):
    echo "[host] Failed to instantiate wasm module: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to instantiate wasm module: ", err.msg
    return

  let functionTableExport = instance.getExport(context, "__indirect_function_table")
  var functionTable = functionTableExport.get.of_field.table
  echo &"function table {context.size(functionTable.addr)}"

  echo "[host] ============== call start"
  let mainExport = instance.getExport(context, "start")
  mainExport.get.of_field.func_field.addr.call(context, [], [], trap.addr).toResult(void).okOr(err):
    echo "[host] Failed to call start: ", err.msg
    return

  for cb in callbacks:
    echo &"[host] ============== call callback {cb}"
    let fun = functionTable.get(context, cb)
    if fun.isNone:
      echo &"[host] Failed to find callback {cb}"
      continue

    var results: array[1, ValT]
    fun.get.of_field.funcref.addr.call(context, [38.int32.toWasmVal], results, trap.addr).toResult(void).okOr(err):
      echo &"[host] Failed to call callback {cb}: ", err.msg
      continue

    echo &"[host] callback {cb} -> {results[0].of_field.i32}"

  echo "[host] ------------ Finished main"

echo main()
echo "no crash"

when defined(windows):
  import std/[compilesettings, os]

  static:
    const dllIn = wasmDir / "target/release/wasmtime.dll"
    const dllOut = querySetting(SingleValueSetting.outDir) / "wasmtime.dll"
    echo "[desktop_main.nim] run tools/copy_wasmtime_dll.nims"
    echo staticExec &"powershell -Command cp \"{dllIn}\" \"{dllOut}\""

