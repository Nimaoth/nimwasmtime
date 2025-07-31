
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wit_types, wit_runtime

{.pop.}
type
  Foo* = object
    x*: WitString
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
      possesed: WitString
    else:
      nil
  DescriptorType* = enum
    Unknown = "unknown", BlockDevice = "block-device",
    CharacterDevice = "character-device", Directory = "directory",
    Fifo = "fifo", SymbolicLink = "symbolic-link", RegularFile = "regular-file",
    Socket = "socket"
  Baz* = object
    x*: WitString
    c*: Foo
    d*: (int32, float32)
    e*: Option[int32]
    gbruh*: WitList[Props]
    g*: DescriptorType
    h*: Props
    i*: Result[Foo, void]
  Blob* = object
    handle*: int32
  Callback* = object
    handle*: int32
proc testInterfaceBlobDrop(a: int32): void {.
    wasmimport("[resource-drop]blob", "my:host/test-interface").}
proc `=copy`*(a: var Blob; b: Blob) {.error.}
proc `=destroy`*(a: Blob) =
  if a.handle != 0:
    testInterfaceBlobDrop(a.handle - 1)

proc callbackTypesCallbackDrop(a: int32): void {.
    wasmimport("[resource-drop]callback", "my:host/callback-types").}
proc `=copy`*(a: var Callback; b: Callback) {.error.}
proc `=destroy`*(a: Callback) =
  if a.handle != 0:
    callbackTypesCallbackDrop(a.handle - 1)

proc envTestNoParams2Imported(a0: int32; a1: int32; a2: int32; a3: int32;
                              a4: int32; a5: float32; a6: int32; a7: int32;
                              a8: int32; a9: int32; a10: int8; a11: uint8;
                              a12: int32; a13: int32; a14: int32): void {.
    wasmimport("test-no-params2", "env").}
proc testNoParams2*(b: Baz): void {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
    arg2: int32
    arg3: int32
    arg4: int32
    arg5: float32
    arg6: int32
    arg7: int32
    arg8: int32
    arg9: int32
    arg10: int8
    arg11: uint8
    arg12: int32
    arg13: int32
    arg14: int32
  if b.x.len > 0:
    arg0 = cast[int32](b.x[0].addr)
  else:
    arg0 = 0.int32
  arg1 = cast[int32](b.x.len)
  if b.c.x.len > 0:
    arg2 = cast[int32](b.c.x[0].addr)
  else:
    arg2 = 0.int32
  arg3 = cast[int32](b.c.x.len)
  arg4 = b.d[0]
  arg5 = b.d[1]
  arg6 = b.e.isSome.int32
  if b.e.isSome:
    arg7 = b.e.get
  if b.gbruh.len > 0:
    arg8 = cast[int32](b.gbruh[0].addr)
  else:
    arg8 = 0.int32
  arg9 = cast[int32](b.gbruh.len)
  arg10 = cast[int8](b.g)
  arg11 = cast[uint8](b.h)
  arg12 = b.i.isErr.int32
  if b.i.isOk:
    if b.i.value.x.len > 0:
      arg13 = cast[int32](b.i.value.x[0].addr)
    else:
      arg13 = 0.int32
    arg14 = cast[int32](b.i.value.x.len)
  else:
    discard
  envTestNoParams2Imported(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8,
                           arg9, arg10, arg11, arg12, arg13, arg14)

proc testInterfaceTestNoParamsImported(): void {.
    wasmimport("test-no-params", "my:host/test-interface").}
proc testNoParams*(): void {.nodestroy.} =
  testInterfaceTestNoParamsImported()

proc testInterfaceTestSimpleParamsImported(a0: int8; a1: int16; a2: int32;
    a3: int64; a4: uint8; a5: uint16; a6: uint32; a7: uint64; a8: float32;
    a9: float64; a10: bool; a11: Rune): void {.
    wasmimport("test-simple-params", "my:host/test-interface").}
proc testSimpleParams*(a: int8; b: int16; c: int32; d: int64; e: uint8;
                       f: uint16; g: uint32; h: uint64; i: float32; j: float64;
                       k: bool; l: Rune): void {.nodestroy.} =
  var
    arg0: int8
    arg1: int16
    arg2: int32
    arg3: int64
    arg4: uint8
    arg5: uint16
    arg6: uint32
    arg7: uint64
    arg8: float32
    arg9: float64
    arg10: bool
    arg11: Rune
  arg0 = a
  arg1 = b
  arg2 = c
  arg3 = d
  arg4 = e
  arg5 = f
  arg6 = g
  arg7 = h
  arg8 = i
  arg9 = j
  arg10 = k
  arg11 = l
  testInterfaceTestSimpleParamsImported(arg0, arg1, arg2, arg3, arg4, arg5,
                                        arg6, arg7, arg8, arg9, arg10, arg11)

proc testInterfaceTestSimpleParamsPtrImported(a0: int32): void {.
    wasmimport("test-simple-params-ptr", "my:host/test-interface").}
proc testSimpleParamsPtr*(a: int8; b: int16; c: int32; d: int64; e: uint8;
                          f: uint16; g: uint32; h: uint64; i: float32;
                          j: float64; k: bool; l: Rune; m: int32; n: int32;
                          o: int32; p: int32; q: int32): void {.nodestroy.} =
  var retArea: array[96, uint8]
  cast[ptr int8](retArea[0].addr)[] = a
  cast[ptr int16](retArea[2].addr)[] = b
  cast[ptr int32](retArea[4].addr)[] = c
  cast[ptr int64](retArea[8].addr)[] = d
  cast[ptr uint8](retArea[16].addr)[] = e
  cast[ptr uint16](retArea[18].addr)[] = f
  cast[ptr uint32](retArea[20].addr)[] = g
  cast[ptr uint64](retArea[24].addr)[] = h
  cast[ptr float32](retArea[32].addr)[] = i
  cast[ptr float64](retArea[40].addr)[] = j
  cast[ptr bool](retArea[48].addr)[] = k
  cast[ptr Rune](retArea[52].addr)[] = l
  cast[ptr int32](retArea[56].addr)[] = m
  cast[ptr int32](retArea[60].addr)[] = n
  cast[ptr int32](retArea[64].addr)[] = o
  cast[ptr int32](retArea[68].addr)[] = p
  cast[ptr int32](retArea[72].addr)[] = q
  testInterfaceTestSimpleParamsPtrImported(cast[int32](retArea[0].addr))

proc testInterfaceAddCallbackImported(a0: int32; a1: int32; a2: int32; a3: int32): uint32 {.
    wasmimport("add-callback", "my:host/test-interface").}
proc addCallback*(env: WitString; name: WitString): uint32 {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
    arg2: int32
    arg3: int32
  if env.len > 0:
    arg0 = cast[int32](env[0].addr)
  else:
    arg0 = 0.int32
  arg1 = cast[int32](env.len)
  if name.len > 0:
    arg2 = cast[int32](name[0].addr)
  else:
    arg2 = 0.int32
  arg3 = cast[int32](name.len)
  let res = testInterfaceAddCallbackImported(arg0, arg1, arg2, arg3)
  result = convert(res, uint32)

proc testInterfaceTestSimpleReturnImported(a0: int32): int32 {.
    wasmimport("test-simple-return", "my:host/test-interface").}
proc testSimpleReturn*(x: int32): int32 {.nodestroy.} =
  var arg0: int32
  arg0 = x
  let res = testInterfaceTestSimpleReturnImported(arg0)
  result = convert(res, int32)

proc testInterfaceTestSimpleReturn2Imported(a0: int8): int8 {.
    wasmimport("test-simple-return2", "my:host/test-interface").}
proc testSimpleReturn2*(x: int8): int8 {.nodestroy.} =
  var arg0: int8
  arg0 = x
  let res = testInterfaceTestSimpleReturn2Imported(arg0)
  result = convert(res, int8)

proc testInterfaceTestSimpleReturnPtrImported(a0: int8; a1: int32): void {.
    wasmimport("test-simple-return-ptr", "my:host/test-interface").}
proc testSimpleReturnPtr*(x: int8): Bar {.nodestroy.} =
  var
    retArea: array[16, uint8]
    arg0: int8
  arg0 = x
  testInterfaceTestSimpleReturnPtrImported(arg0,
      cast[int32](retArea[0].addr))
  result.a = convert(cast[ptr int32](retArea[0].addr)[], int32)
  result.b = convert(cast[ptr float32](retArea[4].addr)[], float32)
  result.c = cast[ptr Rune](retArea[8].addr)[].Rune
  result.d = cast[ptr bool](retArea[12].addr)[].bool

proc testInterfaceTestSimpleReturnPtr2Imported(a0: int32): void {.
    wasmimport("test-simple-return-ptr2", "my:host/test-interface").}
proc testSimpleReturnPtr2*(): Baz {.nodestroy.} =
  var retArea: array[60, uint8]
  testInterfaceTestSimpleReturnPtr2Imported(cast[int32](retArea[0].addr))
  result.x = ws(cast[ptr char](cast[ptr int32](retArea[0].addr)[]),
                cast[ptr int32](retArea[4].addr)[])
  result.c.x = ws(cast[ptr char](cast[ptr int32](retArea[8].addr)[]),
                  cast[ptr int32](retArea[12].addr)[])
  result.d[0] = convert(cast[ptr int32](retArea[16].addr)[], int32)
  result.d[1] = convert(cast[ptr float32](retArea[20].addr)[], float32)
  if cast[ptr int32](retArea[24].addr)[] != 0:
    var temp: int32
    temp = convert(cast[ptr int32](retArea[28].addr)[], int32)
    result.e = temp.some
  result.gbruh = wl(cast[ptr typeof(result.gbruh[0])](cast[ptr int32](retArea[32].addr)[]),
                    cast[ptr int32](retArea[36].addr)[])
  result.g = cast[DescriptorType](cast[ptr int8](retArea[40].addr)[])
  result.h = cast[Props](cast[ptr uint8](retArea[41].addr)[])
  if cast[ptr int32](retArea[44].addr)[] == 0:
    var tempOk: Foo
    tempOk.x = ws(cast[ptr char](cast[ptr int32](retArea[48].addr)[]),
                  cast[ptr int32](retArea[52].addr)[])
    result.i = results.Result[Foo, void].ok(tempOk)
  else:
    result.i = results.Result[Foo, void].err()

proc testInterfaceNewBlobImported(a0: int32; a1: int32): int32 {.
    wasmimport("[constructor]blob", "my:host/test-interface").}
proc newBlob*(init: WitList[uint8]): Blob {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
  if init.len > 0:
    arg0 = cast[int32](init[0].addr)
  else:
    arg0 = 0.int32
  arg1 = cast[int32](init.len)
  let res = testInterfaceNewBlobImported(arg0, arg1)
  result.handle = res + 1

proc testInterfaceWriteImported(a0: int32; a1: int32; a2: int32): void {.
    wasmimport("[method]blob.write", "my:host/test-interface").}
proc write*(self: Blob; bytes: WitList[uint8]): void {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
    arg2: int32
  arg0 = cast[int32](self.handle - 1)
  if bytes.len > 0:
    arg1 = cast[int32](bytes[0].addr)
  else:
    arg1 = 0.int32
  arg2 = cast[int32](bytes.len)
  testInterfaceWriteImported(arg0, arg1, arg2)

proc testInterfaceReadImported(a0: int32; a1: int32; a2: int32): void {.
    wasmimport("[method]blob.read", "my:host/test-interface").}
proc read*(self: Blob; n: int32): WitList[uint8] {.nodestroy.} =
  var
    retArea: array[8, uint8]
    arg0: int32
    arg1: int32
  arg0 = cast[int32](self.handle - 1)
  arg1 = n
  testInterfaceReadImported(arg0, arg1, cast[int32](retArea[0].addr))
  result = wl(cast[ptr typeof(result[0])](cast[ptr int32](retArea[0].addr)[]),
              cast[ptr int32](retArea[4].addr)[])

proc testInterfaceMergeImported(a0: int32; a1: int32): int32 {.
    wasmimport("[static]blob.merge", "my:host/test-interface").}
proc merge*(lhs: sink Blob; rhs: sink Blob): Blob {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
  arg0 = cast[int32](lhs.handle - 1)
  arg1 = cast[int32](rhs.handle - 1)
  let res = testInterfaceMergeImported(arg0, arg1)
  result.handle = res + 1

proc testInterfacePrintImported(a0: int32; a1: int32): void {.
    wasmimport("[static]blob.print", "my:host/test-interface").}
proc print*(lhs: Blob; rhs: Blob): void {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
  arg0 = cast[int32](lhs.handle - 1)
  arg1 = cast[int32](rhs.handle - 1)
  testInterfacePrintImported(arg0, arg1)

proc start(): void
proc startExported(): void {.wasmexport("start", "my:test-package/plugin-api").} =
  start()

proc callCallback(fun: uint32; param: Baz): void
proc callCallbackExported(a0: uint32; a1: int32; a2: int32; a3: int32;
                          a4: int32; a5: int32; a6: float32; a7: int32;
                          a8: int32; a9: int32; a10: int32; a11: int8;
                          a12: uint8; a13: int32; a14: int32; a15: int32): void {.
    wasmexport("call-callback", "my:test-package/plugin-api").} =
  var
    fun: uint32
    param: Baz
  fun = convert(a0, uint32)
  param.x = ws(cast[ptr char](a1), a2)
  param.c.x = ws(cast[ptr char](a3), a4)
  param.d[0] = convert(a5, int32)
  param.d[1] = convert(a6, float32)
  if a7 != 0:
    var temp: int32
    temp = convert(a8, int32)
    param.e = temp.some
  param.gbruh = wl(cast[ptr typeof(param.gbruh[0])](a9), a10)
  param.g = cast[DescriptorType](a11)
  param.h = cast[Props](a12)
  if a13 == 0:
    var tempOk: Foo
    tempOk.x = ws(cast[ptr char](a14), a15)
    param.i = results.Result[Foo, void].ok(tempOk)
  else:
    param.i = results.Result[Foo, void].err()
  callCallback(fun, param)

proc callCallback2(fun: uint32; param: Baz; param2: Bar): void
var callCallback2RetArea: array[80, uint8]
proc callCallback2Exported(a0: int32): void {.
    wasmexport("call-callback2", "my:test-package/plugin-api").} =
  var
    fun: uint32
    param: Baz
    param2: Bar
  fun = convert(cast[ptr uint32](a0 + 0)[], uint32)
  param.x = ws(cast[ptr char](cast[ptr int32](a0 + 4)[]),
               cast[ptr int32](a0 + 8)[])
  param.c.x = ws(cast[ptr char](cast[ptr int32](a0 + 12)[]),
                 cast[ptr int32](a0 + 16)[])
  param.d[0] = convert(cast[ptr int32](a0 + 20)[], int32)
  param.d[1] = convert(cast[ptr float32](a0 + 24)[], float32)
  if cast[ptr int32](a0 + 28)[] != 0:
    var temp: int32
    temp = convert(cast[ptr int32](a0 + 32)[], int32)
    param.e = temp.some
  param.gbruh = wl(cast[ptr typeof(param.gbruh[0])](cast[ptr int32](a0 + 36)[]),
                   cast[ptr int32](a0 + 40)[])
  param.g = cast[DescriptorType](cast[ptr int8](a0 + 44)[])
  param.h = cast[Props](cast[ptr uint8](a0 + 45)[])
  if cast[ptr int32](a0 + 48)[] == 0:
    var tempOk: Foo
    tempOk.x = ws(cast[ptr char](cast[ptr int32](a0 + 52)[]),
                  cast[ptr int32](a0 + 56)[])
    param.i = results.Result[Foo, void].ok(tempOk)
  else:
    param.i = results.Result[Foo, void].err()
  param2.a = convert(cast[ptr int32](a0 + 60)[], int32)
  param2.b = convert(cast[ptr float32](a0 + 64)[], float32)
  param2.c = cast[ptr Rune](a0 + 68)[].Rune
  param2.d = cast[ptr bool](a0 + 72)[].bool
  callCallback2(fun, param, param2)

proc callCallback3(fun: uint32; p: WitList[WitString]): void
proc callCallback3Exported(a0: uint32; a1: int32; a2: int32): void {.
    wasmexport("call-callback3", "my:test-package/plugin-api").} =
  var
    fun: uint32
    p: WitList[WitString]
  fun = convert(a0, uint32)
  p = wl(cast[ptr typeof(p[0])](a1), a2)
  callCallback3(fun, p)

proc callCallback4(fun: uint32): int32
proc callCallback4Exported(a0: uint32): int32 {.
    wasmexport("call-callback4", "my:test-package/plugin-api").} =
  var fun: uint32
  fun = convert(a0, uint32)
  cast[int32](callCallback4(fun))

proc callCallback5(fun: uint32): WitString
var callCallback5RetArea: array[8, uint8]
proc callCallback5Exported(a0: uint32): int32 {.
    wasmexport("call-callback5", "my:test-package/plugin-api").} =
  var fun: uint32
  fun = convert(a0, uint32)
  let res = callCallback5(fun)
  if res.len > 0:
    cast[ptr int32](callCallback5RetArea[0].addr)[] = cast[int32](res[0].addr)
  else:
    cast[ptr int32](callCallback5RetArea[0].addr)[] = 0.int32
  cast[ptr int32](callCallback5RetArea[4].addr)[] = cast[int32](res.len)
  cast[int32](callCallback5RetArea[0].addr)

proc callCallback6(fun: uint32): WitList[WitString]
var callCallback6RetArea: array[8, uint8]
proc callCallback6Exported(a0: uint32): int32 {.
    wasmexport("call-callback6", "my:test-package/plugin-api").} =
  var fun: uint32
  fun = convert(a0, uint32)
  let res = callCallback6(fun)
  if res.len > 0:
    cast[ptr int32](callCallback6RetArea[0].addr)[] = cast[int32](res[0].addr)
  else:
    cast[ptr int32](callCallback6RetArea[0].addr)[] = 0.int32
  cast[ptr int32](callCallback6RetArea[4].addr)[] = cast[int32](res.len)
  cast[int32](callCallback6RetArea[0].addr)
