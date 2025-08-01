
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wasmtime

{.pop.}
type
  Foo* = object
    x*: string
  Prop* = enum
    Cool = "cool", Lame = "lame", SoLame = "so-lame"
  Props* = set[Prop]
  Bar* = object
    a*: int32
    b*: float32
    c*: Rune
    d*: bool
  VoodooKind* = enum
    UnPossesed = "un-possesed", Possesed = "possesed"
  Voodoo* = object
    case kind*: VoodooKind
    of Possesed:
      possesed: string
    else:
      nil
  DescriptorType* = enum
    Unknown = "unknown", BlockDevice = "block-device",
    CharacterDevice = "character-device", Directory = "directory",
    Fifo = "fifo", SymbolicLink = "symbolic-link", RegularFile = "regular-file",
    Socket = "socket"
  Baz* = object
    x*: string
    c*: Foo
    d*: (int32, float32)
    e*: Option[int32]
    gbruh*: seq[Props]
    g*: DescriptorType
    h*: Props
    i*: Result[Foo, void]
when not declared(MyBlob):
  {.error: "Missing resource type definition for " & "MyBlob" &
      ". Define the type before the importWit statement.".}
when not declared(Callback):
  {.error: "Missing resource type definition for " & "Callback" &
      ". Define the type before the importWit statement.".}
type
  ExportedFuncs* = object
    mContext*: ptr ContextT
    mMemory*: Option[ExternT]
    mRealloc*: Option[ExternT]
    mDealloc*: Option[ExternT]
    mStackAlloc*: Option[ExternT]
    mStackSave*: Option[ExternT]
    mStackRestore*: Option[ExternT]
    start*: FuncT
    callCallback*: FuncT
    callCallback2*: FuncT
    callCallback3*: FuncT
    callCallback4*: FuncT
    callCallback5*: FuncT
    callCallback6*: FuncT
proc mem(funcs: ExportedFuncs): WasmMemory =
  if funcs.mMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
    return initWasmMemory(funcs.mMemory.get.of_field.sharedmemory)
  elif funcs.mMemory.get.kind == WASMTIME_EXTERN_MEMORY:
    return initWasmMemory(funcs.mContext, funcs.mMemory.get.of_field.memory.addr)

proc collectExports(funcs: var ExportedFuncs; instance: InstanceT;
                    context: ptr ContextT) =
  funcs.mContext = context
  funcs.mMemory = instance.getExport(context, "memory")
  funcs.mRealloc = instance.getExport(context, "cabi_realloc")
  funcs.mDealloc = instance.getExport(context, "cabi_dealloc")
  funcs.mStackAlloc = instance.getExport(context, "mem_stack_alloc")
  funcs.mStackSave = instance.getExport(context, "mem_stack_save")
  funcs.mStackRestore = instance.getExport(context, "mem_stack_restore")
  let f_570427327 = instance.getExport(context, "start")
  if f_570427327.isSome:
    assert f_570427327.get.kind == WASMTIME_EXTERN_FUNC
    funcs.start = f_570427327.get.of_field.func_field
  else:
    echo "Failed to find exported function \'", "start", "\'"
  let f_570427372 = instance.getExport(context, "call_callback")
  if f_570427372.isSome:
    assert f_570427372.get.kind == WASMTIME_EXTERN_FUNC
    funcs.callCallback = f_570427372.get.of_field.func_field
  else:
    echo "Failed to find exported function \'", "call_callback", "\'"
  let f_570427403 = instance.getExport(context, "call_callback2")
  if f_570427403.isSome:
    assert f_570427403.get.kind == WASMTIME_EXTERN_FUNC
    funcs.callCallback2 = f_570427403.get.of_field.func_field
  else:
    echo "Failed to find exported function \'", "call_callback2", "\'"
  let f_570427422 = instance.getExport(context, "call_callback3")
  if f_570427422.isSome:
    assert f_570427422.get.kind == WASMTIME_EXTERN_FUNC
    funcs.callCallback3 = f_570427422.get.of_field.func_field
  else:
    echo "Failed to find exported function \'", "call_callback3", "\'"
  let f_570427423 = instance.getExport(context, "call_callback4")
  if f_570427423.isSome:
    assert f_570427423.get.kind == WASMTIME_EXTERN_FUNC
    funcs.callCallback4 = f_570427423.get.of_field.func_field
  else:
    echo "Failed to find exported function \'", "call_callback4", "\'"
  let f_570427449 = instance.getExport(context, "call_callback5")
  if f_570427449.isSome:
    assert f_570427449.get.kind == WASMTIME_EXTERN_FUNC
    funcs.callCallback5 = f_570427449.get.of_field.func_field
  else:
    echo "Failed to find exported function \'", "call_callback5", "\'"
  let f_570427450 = instance.getExport(context, "call_callback6")
  if f_570427450.isSome:
    assert f_570427450.get.kind == WASMTIME_EXTERN_FUNC
    funcs.callCallback6 = f_570427450.get.of_field.func_field
  else:
    echo "Failed to find exported function \'", "call_callback6", "\'"

proc start(funcs: ExportedFuncs): WasmtimeResult[void] =
  var args: array[max(1, 0), ValT]
  var results: array[max(1, 0), ValT]
  var trap: ptr WasmTrapT = nil
  var memory = funcs.mem
  let savePoint = stackSave(funcs.mStackSave.get.of_field.func_field,
                            funcs.mContext)
  defer:
    discard stackRestore(funcs.mStackRestore.get.of_field.func_field,
                         funcs.mContext, savePoint.val)
  let res = funcs.start.addr.call(funcs.mContext, args.toOpenArray(0, 0 - 1),
                                  results.toOpenArray(0, 0 - 1), trap.addr).toResult(
      void)
  if res.isErr:
    return res.toResult(void)
  
proc callCallback(funcs: ExportedFuncs; fun: uint32; param: Baz): WasmtimeResult[
    void] =
  var args: array[max(1, 16), ValT]
  var results: array[max(1, 0), ValT]
  var trap: ptr WasmTrapT = nil
  var memory = funcs.mem
  let savePoint = stackSave(funcs.mStackSave.get.of_field.func_field,
                            funcs.mContext)
  defer:
    discard stackRestore(funcs.mStackRestore.get.of_field.func_field,
                         funcs.mContext, savePoint.val)
  var dataPtrWasm0: WasmPtr
  var dataPtrWasm1: WasmPtr
  var dataPtrWasm2: WasmPtr
  var dataPtrWasm3: WasmPtr
  args[0] = toWasmVal(fun)
  if param.x.len > 0:
    dataPtrWasm0 = block:
      let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                            funcs.mContext, (param.x.len * 1).int32, 4)
      if temp.isErr:
        return temp.toResult(void)
      temp.val
    args[1] = toWasmVal(cast[int32](dataPtrWasm0))
    block:
      for i1 in 0 ..< param.x.len:
        memory[dataPtrWasm0 + i1] = cast[uint8](param.x[i1])
  else:
    args[1] = toWasmVal(0.int32)
  args[2] = toWasmVal(cast[int32](param.x.len))
  if param.c.x.len > 0:
    dataPtrWasm1 = block:
      let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                            funcs.mContext, (param.c.x.len * 1).int32, 4)
      if temp.isErr:
        return temp.toResult(void)
      temp.val
    args[3] = toWasmVal(cast[int32](dataPtrWasm1))
    block:
      for i2 in 0 ..< param.c.x.len:
        memory[dataPtrWasm1 + i2] = cast[uint8](param.c.x[i2])
  else:
    args[3] = toWasmVal(0.int32)
  args[4] = toWasmVal(cast[int32](param.c.x.len))
  args[5] = toWasmVal(param.d[0])
  args[6] = toWasmVal(param.d[1])
  args[7] = toWasmVal(param.e.isSome.int32)
  if param.e.isSome:
    args[8] = toWasmVal(param.e.get)
  if param.gbruh.len > 0:
    dataPtrWasm2 = block:
      let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                            funcs.mContext, (param.gbruh.len * 1).int32, 4)
      if temp.isErr:
        return temp.toResult(void)
      temp.val
    args[9] = toWasmVal(cast[int32](dataPtrWasm2))
    block:
      for i1 in 0 ..< param.gbruh.len:
        cast[ptr uint8](memory[dataPtrWasm2 + i1 * 1 + 0].addr)[] = cast[uint8](param.gbruh[
            i1])
  else:
    args[9] = toWasmVal(0.int32)
  args[10] = toWasmVal(cast[int32](param.gbruh.len))
  args[11] = toWasmVal(cast[int8](param.g))
  args[12] = toWasmVal(cast[uint8](param.h))
  args[13] = toWasmVal(param.i.isErr.int32)
  if param.i.isOk:
    if param.i.value.x.len > 0:
      dataPtrWasm3 = block:
        let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                              funcs.mContext, (param.i.value.x.len * 1).int32, 4)
        if temp.isErr:
          return temp.toResult(void)
        temp.val
      args[14] = toWasmVal(cast[int32](dataPtrWasm3))
      block:
        for i3 in 0 ..< param.i.value.x.len:
          memory[dataPtrWasm3 + i3] = cast[uint8](param.i.value.x[i3])
    else:
      args[14] = toWasmVal(0.int32)
    args[15] = toWasmVal(cast[int32](param.i.value.x.len))
  else:
    discard
  let res = funcs.callCallback.addr.call(funcs.mContext,
      args.toOpenArray(0, 16 - 1), results.toOpenArray(0, 0 - 1), trap.addr).toResult(
      void)
  if res.isErr:
    return res.toResult(void)
  
proc callCallback2(funcs: ExportedFuncs; fun: uint32; param: Baz; param2: Bar): WasmtimeResult[
    void] =
  var args: array[max(1, 1), ValT]
  var results: array[max(1, 0), ValT]
  var trap: ptr WasmTrapT = nil
  var memory = funcs.mem
  let savePoint = stackSave(funcs.mStackSave.get.of_field.func_field,
                            funcs.mContext)
  defer:
    discard stackRestore(funcs.mStackRestore.get.of_field.func_field,
                         funcs.mContext, savePoint.val)
  var dataPtrWasm0: WasmPtr
  var dataPtrWasm1: WasmPtr
  var dataPtrWasm2: WasmPtr
  var dataPtrWasm3: WasmPtr
  let paramsMem: WasmPtr = block:
    let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                          funcs.mContext, 80.int32, 4)
    if temp.isErr:
      return temp.toResult(void)
    temp.val
  args[0] = paramsMem.int32.toWasmVal
  cast[ptr uint32](memory[paramsMem + 0].addr)[] = fun
  if param.x.len > 0:
    dataPtrWasm0 = block:
      let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                            funcs.mContext, 1.int32, 4)
      if temp.isErr:
        return temp.toResult(void)
      temp.val
    cast[ptr int32](memory[paramsMem + 4].addr)[] = cast[int32](dataPtrWasm0)
    block:
      for i1 in 0 ..< param.x.len:
        memory[dataPtrWasm0 + i1] = cast[uint8](param.x[i1])
  else:
    cast[ptr int32](memory[paramsMem + 4].addr)[] = 0.int32
  cast[ptr int32](memory[paramsMem + 8].addr)[] = cast[int32](param.x.len)
  if param.c.x.len > 0:
    dataPtrWasm1 = block:
      let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                            funcs.mContext, 1.int32, 4)
      if temp.isErr:
        return temp.toResult(void)
      temp.val
    cast[ptr int32](memory[paramsMem + 12].addr)[] = cast[int32](dataPtrWasm1)
    block:
      for i2 in 0 ..< param.c.x.len:
        memory[dataPtrWasm1 + i2] = cast[uint8](param.c.x[i2])
  else:
    cast[ptr int32](memory[paramsMem + 12].addr)[] = 0.int32
  cast[ptr int32](memory[paramsMem + 16].addr)[] = cast[int32](param.c.x.len)
  cast[ptr int32](memory[paramsMem + 20].addr)[] = param.d[0]
  cast[ptr float32](memory[paramsMem + 24].addr)[] = param.d[1]
  cast[ptr int32](memory[paramsMem + 28].addr)[] = param.e.isSome.int32
  if param.e.isSome:
    cast[ptr int32](memory[paramsMem + 32].addr)[] = param.e.get
  if param.gbruh.len > 0:
    dataPtrWasm2 = block:
      let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                            funcs.mContext, 1.int32, 4)
      if temp.isErr:
        return temp.toResult(void)
      temp.val
    cast[ptr int32](memory[paramsMem + 36].addr)[] = cast[int32](dataPtrWasm2)
    block:
      for i1 in 0 ..< param.gbruh.len:
        cast[ptr uint8](memory[dataPtrWasm2 + i1 * 1 + 0].addr)[] = cast[uint8](param.gbruh[
            i1])
  else:
    cast[ptr int32](memory[paramsMem + 36].addr)[] = 0.int32
  cast[ptr int32](memory[paramsMem + 40].addr)[] = cast[int32](param.gbruh.len)
  cast[ptr int8](memory[paramsMem + 44].addr)[] = cast[int8](param.g)
  cast[ptr uint8](memory[paramsMem + 45].addr)[] = cast[uint8](param.h)
  cast[ptr int32](memory[paramsMem + 48].addr)[] = param.i.isErr.int32
  if param.i.isOk:
    if param.i.value.x.len > 0:
      dataPtrWasm3 = block:
        let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                              funcs.mContext, 1.int32, 4)
        if temp.isErr:
          return temp.toResult(void)
        temp.val
      cast[ptr int32](memory[paramsMem + 52].addr)[] = cast[int32](dataPtrWasm3)
      block:
        for i3 in 0 ..< param.i.value.x.len:
          memory[dataPtrWasm3 + i3] = cast[uint8](param.i.value.x[i3])
    else:
      cast[ptr int32](memory[paramsMem + 52].addr)[] = 0.int32
    cast[ptr int32](memory[paramsMem + 56].addr)[] = cast[int32](param.i.value.x.len)
  else:
    discard
  cast[ptr int32](memory[paramsMem + 60].addr)[] = param2.a
  cast[ptr float32](memory[paramsMem + 64].addr)[] = param2.b
  cast[ptr Rune](memory[paramsMem + 68].addr)[] = param2.c
  cast[ptr bool](memory[paramsMem + 72].addr)[] = param2.d
  let res = funcs.callCallback2.addr.call(funcs.mContext,
      args.toOpenArray(0, 1 - 1), results.toOpenArray(0, 0 - 1), trap.addr).toResult(
      void)
  if res.isErr:
    return res.toResult(void)
  
proc callCallback3(funcs: ExportedFuncs; fun: uint32; p: seq[string]): WasmtimeResult[
    void] =
  var args: array[max(1, 3), ValT]
  var results: array[max(1, 0), ValT]
  var trap: ptr WasmTrapT = nil
  var memory = funcs.mem
  let savePoint = stackSave(funcs.mStackSave.get.of_field.func_field,
                            funcs.mContext)
  defer:
    discard stackRestore(funcs.mStackRestore.get.of_field.func_field,
                         funcs.mContext, savePoint.val)
  var dataPtrWasm0: WasmPtr
  var dataPtrWasm1: WasmPtr
  args[0] = toWasmVal(fun)
  if p.len > 0:
    dataPtrWasm0 = block:
      let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                            funcs.mContext, (p.len * 8).int32, 4)
      if temp.isErr:
        return temp.toResult(void)
      temp.val
    args[1] = toWasmVal(cast[int32](dataPtrWasm0))
    block:
      for i0 in 0 ..< p.len:
        if p[i0].len > 0:
          dataPtrWasm1 = block:
            let temp = stackAlloc(funcs.mStackAlloc.get.of_field.func_field,
                                  funcs.mContext, (p[i0].len * 1).int32, 4)
            if temp.isErr:
              return temp.toResult(void)
            temp.val
          cast[ptr int32](memory[dataPtrWasm0 + i0 * 8 + 0].addr)[] = cast[int32](dataPtrWasm1)
          block:
            for i1 in 0 ..< p[i0].len:
              memory[dataPtrWasm1 + i1] = cast[uint8](p[i0][i1])
        else:
          cast[ptr int32](memory[dataPtrWasm0 + i0 * 8 + 0].addr)[] = 0.int32
        cast[ptr int32](memory[dataPtrWasm0 + i0 * 8 + 4].addr)[] = cast[int32](p[
            i0].len)
  else:
    args[1] = toWasmVal(0.int32)
  args[2] = toWasmVal(cast[int32](p.len))
  let res = funcs.callCallback3.addr.call(funcs.mContext,
      args.toOpenArray(0, 3 - 1), results.toOpenArray(0, 0 - 1), trap.addr).toResult(
      void)
  if res.isErr:
    return res.toResult(void)
  
proc callCallback4(funcs: ExportedFuncs; fun: uint32): WasmtimeResult[int32] =
  var args: array[max(1, 1), ValT]
  var results: array[max(1, 1), ValT]
  var trap: ptr WasmTrapT = nil
  var memory = funcs.mem
  let savePoint = stackSave(funcs.mStackSave.get.of_field.func_field,
                            funcs.mContext)
  defer:
    discard stackRestore(funcs.mStackRestore.get.of_field.func_field,
                         funcs.mContext, savePoint.val)
  args[0] = toWasmVal(fun)
  let res = funcs.callCallback4.addr.call(funcs.mContext,
      args.toOpenArray(0, 1 - 1), results.toOpenArray(0, 1 - 1), trap.addr).toResult(
      int32)
  if res.isErr:
    return res.toResult(int32)
  var retVal: int32
  retVal = convert(results[0], int32)
  return wasmtime.ok(retVal)

proc callCallback5(funcs: ExportedFuncs; fun: uint32): WasmtimeResult[string] =
  var args: array[max(1, 1), ValT]
  var results: array[max(1, 1), ValT]
  var trap: ptr WasmTrapT = nil
  var memory = funcs.mem
  let savePoint = stackSave(funcs.mStackSave.get.of_field.func_field,
                            funcs.mContext)
  defer:
    discard stackRestore(funcs.mStackRestore.get.of_field.func_field,
                         funcs.mContext, savePoint.val)
  args[0] = toWasmVal(fun)
  let res = funcs.callCallback5.addr.call(funcs.mContext,
      args.toOpenArray(0, 1 - 1), results.toOpenArray(0, 1 - 1), trap.addr).toResult(
      string)
  if res.isErr:
    return res.toResult(string)
  var retVal: string
  let retArea: ptr UncheckedArray[uint8] = memory.getRawPtr(
      results[0].to(WasmPtr))
  block:
    let p0 = cast[ptr UncheckedArray[char]](memory.getRawPtr(
        cast[ptr int32](retArea[0].addr)[].WasmPtr))
    retVal = newString(cast[ptr int32](retArea[4].addr)[])
    for i0 in 0 ..< retVal.len:
      retVal[i0] = p0[i0]
  return wasmtime.ok(retVal)

proc callCallback6(funcs: ExportedFuncs; fun: uint32): WasmtimeResult[
    seq[string]] =
  var args: array[max(1, 1), ValT]
  var results: array[max(1, 1), ValT]
  var trap: ptr WasmTrapT = nil
  var memory = funcs.mem
  let savePoint = stackSave(funcs.mStackSave.get.of_field.func_field,
                            funcs.mContext)
  defer:
    discard stackRestore(funcs.mStackRestore.get.of_field.func_field,
                         funcs.mContext, savePoint.val)
  args[0] = toWasmVal(fun)
  let res = funcs.callCallback6.addr.call(funcs.mContext,
      args.toOpenArray(0, 1 - 1), results.toOpenArray(0, 1 - 1), trap.addr).toResult(
      seq[string])
  if res.isErr:
    return res.toResult(seq[string])
  var retVal: seq[string]
  let retArea: ptr UncheckedArray[uint8] = memory.getRawPtr(
      results[0].to(WasmPtr))
  block:
    let p0 = cast[ptr UncheckedArray[uint8]](memory.getRawPtr(
        cast[ptr int32](retArea[0].addr)[].WasmPtr))
    retVal = newSeq[typeof(retVal[0])](cast[ptr int32](retArea[4].addr)[])
    for i0 in 0 ..< retVal.len:
      block:
        let p1 = cast[ptr UncheckedArray[char]](memory.getRawPtr(
            cast[ptr int32](p0[i0 * 8 + 0].addr)[].WasmPtr))
        retVal[i0] = newString(cast[ptr int32](p0[i0 * 8 + 4].addr)[])
        for i1 in 0 ..< retVal[i0].len:
          retVal[i0][i1] = p1[i1]
  return wasmtime.ok(retVal)

proc envTestNoParams2(host: MyContext; store: ptr ContextT; b: sink Baz): void
proc testInterfaceTestNoParams(host: MyContext; store: ptr ContextT): void
proc testInterfaceTestSimpleParams(host: MyContext; store: ptr ContextT;
                                   a: int8; b: int16; c: int32; d: int64;
                                   e: uint8; f: uint16; g: uint32; h: uint64;
                                   i: float32; j: float64; k: bool; l: Rune): void
proc testInterfaceTestSimpleParamsPtr(host: MyContext; store: ptr ContextT;
                                      a: int8; b: int16; c: int32; d: int64;
                                      e: uint8; f: uint16; g: uint32; h: uint64;
                                      i: float32; j: float64; k: bool; l: Rune;
                                      m: int32; n: int32; o: int32; p: int32;
                                      q: int32): void
proc testInterfaceAddCallback(host: MyContext; store: ptr ContextT;
                              env: sink string; name: sink string): uint32
proc testInterfaceTestSimpleReturn(host: MyContext; store: ptr ContextT;
                                   x: int32): int32
proc testInterfaceTestSimpleReturn2(host: MyContext; store: ptr ContextT;
                                    x: int8): int8
proc testInterfaceTestSimpleReturnPtr(host: MyContext; store: ptr ContextT;
                                      x: int8): Bar
proc testInterfaceTestSimpleReturnPtr2(host: MyContext; store: ptr ContextT): Baz
proc testInterfaceNewBlob(host: MyContext; store: ptr ContextT;
                          init: sink seq[uint8]): MyBlob
proc testInterfaceWrite(host: MyContext; store: ptr ContextT; self: var MyBlob;
                        bytes: sink seq[uint8]): void
proc testInterfaceRead(host: MyContext; store: ptr ContextT; self: var MyBlob;
                       n: int32): seq[uint8]
proc testInterfaceMerge(host: MyContext; store: ptr ContextT; lhs: sink MyBlob;
                        rhs: sink MyBlob): MyBlob
proc testInterfacePrint(host: MyContext; store: ptr ContextT; lhs: var MyBlob;
                        rhs: var MyBlob): void
proc callbackTypesNewCallback(host: MyContext; store: ptr ContextT;
                              data: uint32; key: uint32; drop: uint32): Callback
proc callbackTypesData(host: MyContext; store: ptr ContextT; self: var Callback): uint32
proc callbackTypesKey(host: MyContext; store: ptr ContextT; self: var Callback): uint32
proc defineComponent*(linker: ptr LinkerT; host: MyContext): WasmtimeResult[void] =
  block:
    let e = block:
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "[resource-drop]blob",
                                 newFunctype([WasmValkind.I32], [])):
        ?host.resources.resourceDrop(parameters[0].i32, callDestroy = true)
    if e.isErr:
      return e
  block:
    let e = block:
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[resource-drop]callback",
                                 newFunctype([WasmValkind.I32], [])):
        ?host.resources.resourceDrop(parameters[0].i32, callDestroy = true)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32, WasmValkind.I32,
          WasmValkind.I32, WasmValkind.I32, WasmValkind.I32, WasmValkind.F32,
          WasmValkind.I32, WasmValkind.I32, WasmValkind.I32, WasmValkind.I32,
          WasmValkind.I32, WasmValkind.I32, WasmValkind.I32, WasmValkind.I32,
          WasmValkind.I32], [])
      linker.defineFuncUnchecked("env", "test-no-params2", ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        var b: Baz
        block:
          let p1 = cast[ptr UncheckedArray[char]](memory[parameters[0].i32].addr)
          b.x = newString(parameters[1].i32)
          for i1 in 0 ..< b.x.len:
            b.x[i1] = p1[i1]
        block:
          let p2 = cast[ptr UncheckedArray[char]](memory[parameters[2].i32].addr)
          b.c.x = newString(parameters[3].i32)
          for i2 in 0 ..< b.c.x.len:
            b.c.x[i2] = p2[i2]
        b.d[0] = convert(parameters[4].i32, int32)
        b.d[1] = convert(parameters[5].f32, float32)
        if parameters[6].i32 != 0:
          var temp: int32
          temp = convert(parameters[7].i32, int32)
          b.e = temp.some
        block:
          let p1 = cast[ptr UncheckedArray[uint8]](memory[parameters[8].i32].addr)
          b.gbruh = newSeq[typeof(b.gbruh[0])](parameters[9].i32)
          for i1 in 0 ..< b.gbruh.len:
            b.gbruh[i1] = cast[Props](cast[ptr uint8](p1[i1 * 1 + 0].addr)[])
        b.g = cast[DescriptorType](parameters[10].i32)
        b.h = cast[Props](parameters[11].i32)
        if parameters[12].i32 == 0:
          var tempOk: Foo
          block:
            let p3 = cast[ptr UncheckedArray[char]](memory[
                parameters[13].i32].addr)
            tempOk.x = newString(parameters[14].i32)
            for i3 in 0 ..< tempOk.x.len:
              tempOk.x[i3] = p3[i3]
          b.i = results.Result[Foo, void].ok(tempOk)
        else:
          b.i = results.Result[Foo, void].err()
        envTestNoParams2(host, store, b)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([], [])
      linker.defineFuncUnchecked("my:host/test-interface", "test-no-params", ty):
        testInterfaceTestNoParams(host, store)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32, WasmValkind.I32,
          WasmValkind.I32, WasmValkind.I64, WasmValkind.I32, WasmValkind.I32,
          WasmValkind.I32, WasmValkind.I64, WasmValkind.F32, WasmValkind.F64,
          WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "test-simple-params",
                                 ty):
        var a: int8
        var b: int16
        var c: int32
        var d: int64
        var e: uint8
        var f: uint16
        var g: uint32
        var h: uint64
        var i: float32
        var j: float64
        var k: bool
        var l: Rune
        a = convert(parameters[0].i32, int8)
        b = convert(parameters[1].i32, int16)
        c = convert(parameters[2].i32, int32)
        d = convert(parameters[3].i64, int64)
        e = convert(parameters[4].i32, uint8)
        f = convert(parameters[5].i32, uint16)
        g = convert(parameters[6].i32, uint32)
        h = convert(parameters[7].i64, uint64)
        i = convert(parameters[8].f32, float32)
        j = convert(parameters[9].f64, float64)
        k = parameters[10].i32.bool
        l = parameters[11].i32.Rune
        testInterfaceTestSimpleParams(host, store, a, b, c, d, e, f, g, h, i, j,
                                      k, l)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-params-ptr", ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        var a: int8
        var b: int16
        var c: int32
        var d: int64
        var e: uint8
        var f: uint16
        var g: uint32
        var h: uint64
        var i: float32
        var j: float64
        var k: bool
        var l: Rune
        var m: int32
        var n: int32
        var o: int32
        var p: int32
        var q: int32
        a = convert(cast[ptr int8](memory[parameters[0].i32 + 0].addr)[], int8)
        b = convert(cast[ptr int16](memory[parameters[0].i32 + 2].addr)[], int16)
        c = convert(cast[ptr int32](memory[parameters[0].i32 + 4].addr)[], int32)
        d = convert(cast[ptr int64](memory[parameters[0].i32 + 8].addr)[], int64)
        e = convert(cast[ptr uint8](memory[parameters[0].i32 + 16].addr)[],
                    uint8)
        f = convert(cast[ptr uint16](memory[parameters[0].i32 + 18].addr)[],
                    uint16)
        g = convert(cast[ptr uint32](memory[parameters[0].i32 + 20].addr)[],
                    uint32)
        h = convert(cast[ptr uint64](memory[parameters[0].i32 + 24].addr)[],
                    uint64)
        i = convert(cast[ptr float32](memory[parameters[0].i32 + 32].addr)[],
                    float32)
        j = convert(cast[ptr float64](memory[parameters[0].i32 + 40].addr)[],
                    float64)
        k = cast[ptr bool](memory[parameters[0].i32 + 48].addr)[].bool
        l = cast[ptr Rune](memory[parameters[0].i32 + 52].addr)[].Rune
        m = convert(cast[ptr int32](memory[parameters[0].i32 + 56].addr)[],
                    int32)
        n = convert(cast[ptr int32](memory[parameters[0].i32 + 60].addr)[],
                    int32)
        o = convert(cast[ptr int32](memory[parameters[0].i32 + 64].addr)[],
                    int32)
        p = convert(cast[ptr int32](memory[parameters[0].i32 + 68].addr)[],
                    int32)
        q = convert(cast[ptr int32](memory[parameters[0].i32 + 72].addr)[],
                    int32)
        testInterfaceTestSimpleParamsPtr(host, store, a, b, c, d, e, f, g, h, i,
            j, k, l, m, n, o, p, q)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32, WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "add-callback", ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        var env: string
        var name: string
        block:
          let p0 = cast[ptr UncheckedArray[char]](memory[parameters[0].i32].addr)
          env = newString(parameters[1].i32)
          for i0 in 0 ..< env.len:
            env[i0] = p0[i0]
        block:
          let p0 = cast[ptr UncheckedArray[char]](memory[parameters[2].i32].addr)
          name = newString(parameters[3].i32)
          for i0 in 0 ..< name.len:
            name[i0] = p0[i0]
        let res = testInterfaceAddCallback(host, store, env, name)
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "test-simple-return",
                                 ty):
        var x: int32
        x = convert(parameters[0].i32, int32)
        let res = testInterfaceTestSimpleReturn(host, store, x)
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-return2", ty):
        var x: int8
        x = convert(parameters[0].i32, int8)
        let res = testInterfaceTestSimpleReturn2(host, store, x)
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-return-ptr", ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        var x: int8
        x = convert(parameters[0].i32, int8)
        let res = testInterfaceTestSimpleReturnPtr(host, store, x)
        let retArea = parameters[^1].i32
        cast[ptr int32](memory[retArea + 0].addr)[] = res.a
        cast[ptr float32](memory[retArea + 4].addr)[] = res.b
        cast[ptr Rune](memory[retArea + 8].addr)[] = res.c
        cast[ptr bool](memory[retArea + 12].addr)[] = res.d
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-return-ptr2", ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        let reallocImpl = caller.getExport("cabi_realloc").get.of_field.func_field
        let res = testInterfaceTestSimpleReturnPtr2(host, store)
        let retArea = parameters[^1].i32
        if res.x.len > 0:
          let dataPtrWasm1 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.x.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 0].addr)[] = cast[int32](dataPtrWasm1)
          block:
            for i1 in 0 ..< res.x.len:
              memory[dataPtrWasm1 + i1] = cast[uint8](res.x[i1])
        else:
          cast[ptr int32](memory[retArea + 0].addr)[] = 0.int32
        cast[ptr int32](memory[retArea + 4].addr)[] = cast[int32](res.x.len)
        if res.c.x.len > 0:
          let dataPtrWasm2 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.c.x.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 8].addr)[] = cast[int32](dataPtrWasm2)
          block:
            for i2 in 0 ..< res.c.x.len:
              memory[dataPtrWasm2 + i2] = cast[uint8](res.c.x[i2])
        else:
          cast[ptr int32](memory[retArea + 8].addr)[] = 0.int32
        cast[ptr int32](memory[retArea + 12].addr)[] = cast[int32](res.c.x.len)
        cast[ptr int32](memory[retArea + 16].addr)[] = res.d[0]
        cast[ptr float32](memory[retArea + 20].addr)[] = res.d[1]
        cast[ptr int32](memory[retArea + 24].addr)[] = res.e.isSome.int32
        if res.e.isSome:
          cast[ptr int32](memory[retArea + 28].addr)[] = res.e.get
        if res.gbruh.len > 0:
          let dataPtrWasm1 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.gbruh.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 32].addr)[] = cast[int32](dataPtrWasm1)
          block:
            for i1 in 0 ..< res.gbruh.len:
              cast[ptr uint8](memory[dataPtrWasm1 + i1 * 1 + 0].addr)[] = cast[uint8](res.gbruh[
                  i1])
        else:
          cast[ptr int32](memory[retArea + 32].addr)[] = 0.int32
        cast[ptr int32](memory[retArea + 36].addr)[] = cast[int32](res.gbruh.len)
        cast[ptr int8](memory[retArea + 40].addr)[] = cast[int8](res.g)
        cast[ptr uint8](memory[retArea + 41].addr)[] = cast[uint8](res.h)
        cast[ptr int32](memory[retArea + 44].addr)[] = res.i.isErr.int32
        if res.i.isOk:
          if res.i.value.x.len > 0:
            let dataPtrWasm3 = block:
              var t: ptr WasmTrapT = nil
              var args: array[4, ValT]
              args[0].kind = WasmValkind.I32.ValkindT
              args[0].of_field.i32 = 0
              args[1].kind = WasmValkind.I32.ValkindT
              args[1].of_field.i32 = 0
              args[2].kind = WasmValkind.I32.ValkindT
              args[2].of_field.i32 = 4
              args[3].kind = WasmValkind.I32.ValkindT
              args[3].of_field.i32 = (res.i.value.x.len * 1).int32
              var results: array[1, ValT]
              ?reallocImpl.addr.call(store, args, results, t.addr)
              assert results[0].kind == WasmValkind.I32.ValkindT
              results[0].of_field.i32
            cast[ptr int32](memory[retArea + 48].addr)[] = cast[int32](dataPtrWasm3)
            block:
              for i3 in 0 ..< res.i.value.x.len:
                memory[dataPtrWasm3 + i3] = cast[uint8](res.i.value.x[i3])
          else:
            cast[ptr int32](memory[retArea + 48].addr)[] = 0.int32
          cast[ptr int32](memory[retArea + 52].addr)[] = cast[int32](res.i.value.x.len)
        else:
          discard
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "[constructor]blob",
                                 ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        var init: seq[uint8]
        block:
          let p0 = cast[ptr UncheckedArray[uint8]](memory[parameters[0].i32].addr)
          init = newSeq[typeof(init[0])](parameters[1].i32)
          for i0 in 0 ..< init.len:
            init[i0] = convert(cast[ptr uint8](p0[i0 * 1 + 0].addr)[], uint8)
        let res = testInterfaceNewBlob(host, store, init)
        parameters[0].i32 = ?host.resources.resourceNew(res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "[method]blob.write",
                                 ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        var self: ptr MyBlob
        var bytes: seq[uint8]
        self = ?host.resources.resourceHostData(parameters[0].i32, MyBlob)
        block:
          let p0 = cast[ptr UncheckedArray[uint8]](memory[parameters[1].i32].addr)
          bytes = newSeq[typeof(bytes[0])](parameters[2].i32)
          for i0 in 0 ..< bytes.len:
            bytes[i0] = convert(cast[ptr uint8](p0[i0 * 1 + 0].addr)[], uint8)
        testInterfaceWrite(host, store, self[], bytes)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "[method]blob.read",
                                 ty):
        var mainMemory = caller.getExport("memory")
        if mainMemory.isNone:
          mainMemory = host.getMemoryFor(caller)
        var memory: ptr UncheckedArray[uint8] = nil
        if mainMemory.get.kind == WASMTIME_EXTERN_SHAREDMEMORY:
          memory = cast[ptr UncheckedArray[uint8]](data(
              mainMemory.get.of_field.sharedmemory))
        elif mainMemory.get.kind == WASMTIME_EXTERN_MEMORY:
          memory = cast[ptr UncheckedArray[uint8]](store.data(
              mainMemory.get.of_field.memory.addr))
        else:
          assert false
        let reallocImpl = caller.getExport("cabi_realloc").get.of_field.func_field
        var self: ptr MyBlob
        var n: int32
        self = ?host.resources.resourceHostData(parameters[0].i32, MyBlob)
        n = convert(parameters[1].i32, int32)
        let res = testInterfaceRead(host, store, self[], n)
        let retArea = parameters[^1].i32
        if res.len > 0:
          let dataPtrWasm0 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 0].addr)[] = cast[int32](dataPtrWasm0)
          block:
            for i0 in 0 ..< res.len:
              cast[ptr uint8](memory[dataPtrWasm0 + i0 * 1 + 0].addr)[] = res[i0]
        else:
          cast[ptr int32](memory[retArea + 0].addr)[] = 0.int32
        cast[ptr int32](memory[retArea + 4].addr)[] = cast[int32](res.len)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "[static]blob.merge",
                                 ty):
        var lhs: MyBlob
        var rhs: MyBlob
        block:
          let resPtr = ?host.resources.resourceHostData(parameters[0].i32,
              MyBlob)
          copyMem(lhs.addr, resPtr, sizeof(typeof(lhs)))
          ?host.resources.resourceDrop(parameters[0].i32, callDestroy = false)
        block:
          let resPtr = ?host.resources.resourceHostData(parameters[1].i32,
              MyBlob)
          copyMem(rhs.addr, resPtr, sizeof(typeof(rhs)))
          ?host.resources.resourceDrop(parameters[1].i32, callDestroy = false)
        let res = testInterfaceMerge(host, store, lhs, rhs)
        parameters[0].i32 = ?host.resources.resourceNew(res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "[static]blob.print",
                                 ty):
        var lhs: ptr MyBlob
        var rhs: ptr MyBlob
        lhs = ?host.resources.resourceHostData(parameters[0].i32, MyBlob)
        rhs = ?host.resources.resourceHostData(parameters[1].i32, MyBlob)
        testInterfacePrint(host, store, lhs[], rhs[])
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[constructor]callback", ty):
        var data: uint32
        var key: uint32
        var drop: uint32
        data = convert(parameters[0].i32, uint32)
        key = convert(parameters[1].i32, uint32)
        drop = convert(parameters[2].i32, uint32)
        let res = callbackTypesNewCallback(host, store, data, key, drop)
        parameters[0].i32 = ?host.resources.resourceNew(res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[method]callback.data", ty):
        var self: ptr Callback
        self = ?host.resources.resourceHostData(parameters[0].i32, Callback)
        let res = callbackTypesData(host, store, self[])
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[method]callback.key", ty):
        var self: ptr Callback
        self = ?host.resources.resourceHostData(parameters[0].i32, Callback)
        let res = callbackTypesKey(host, store, self[])
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
