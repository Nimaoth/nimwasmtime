
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wit_types, wit_runtime

{.pop.}
import
  callback_impl

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
    f*: WitList[Foo]
    gbruh*: WitList[Props]
    g*: DescriptorType
    h*: Props
    i*: Result[Foo, void]
    j*: Voodoo
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

proc callbackTypesNewCallbackImported(a0: int32; a1: int32; a2: int32): int32 {.
    wasmimport("[constructor]callback", "my:host/callback-types").}
proc newCallback*(data: uint32; key: uint32; drop: uint32): Callback {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
    arg2: int32
  arg0 = cast[int32](data)
  arg1 = cast[int32](key)
  arg2 = cast[int32](drop)
  let res = callbackTypesNewCallbackImported(arg0, arg1, arg2)
  result.handle = res + 1

proc callbackTypesDataImported(a0: int32): int32 {.
    wasmimport("[method]callback.data", "my:host/callback-types").}
proc data*(self: Callback): uint32 {.nodestroy.} =
  var arg0: int32
  arg0 = cast[int32](self.handle - 1)
  let res = callbackTypesDataImported(arg0)
  result = cast[uint32](res)

proc callbackTypesKeyImported(a0: int32): int32 {.
    wasmimport("[method]callback.key", "my:host/callback-types").}
proc key*(self: Callback): uint32 {.nodestroy.} =
  var arg0: int32
  arg0 = cast[int32](self.handle - 1)
  let res = callbackTypesKeyImported(arg0)
  result = cast[uint32](res)

proc apiFooImported(): void {.wasmimport("foo", "my:plugin1/api").}
proc foo*(): void {.nodestroy.} =
  apiFooImported()

proc apiFindStuffImported(a0: int32; a1: int32; a2: int32; a3: int32; a4: int32): void {.
    wasmimport("find-stuff", "my:plugin1/api").}
proc findStuff*(s: WitList[WitString]; cb: sink Callback; cb2: sink Callback): WitList[
    WitString] {.nodestroy.} =
  var
    retArea: array[16, uint8]
    arg0: int32
    arg1: int32
    arg2: int32
    arg3: int32
  if s.len > 0:
    arg0 = cast[int32](s[0].addr)
  else:
    arg0 = 0
  arg1 = s.len
  arg2 = cast[int32](cb.handle - 1)
  arg3 = cast[int32](cb2.handle - 1)
  apiFindStuffImported(arg0, arg1, arg2, arg3, cast[int32](retArea[0].addr))
  result = wl(cast[ptr typeof(result[0])](cast[ptr int32](retArea[0].addr)[]),
              cast[ptr int32](retArea[4].addr)[])

proc apiCallLaterImported(a0: int32): void {.
    wasmimport("call-later", "my:plugin1/api").}
proc callLater*(cb: sink Callback): void {.nodestroy.} =
  var arg0: int32
  arg0 = cast[int32](cb.handle - 1)
  apiCallLaterImported(arg0)

proc testInterfaceTestNoParamsImported(): void {.
    wasmimport("test-no-params", "my:host/test-interface").}
proc testNoParams*(): void {.nodestroy.} =
  testInterfaceTestNoParamsImported()

proc testInterfaceTestSimpleParamsImported(a0: int32; a1: int32; a2: int32;
    a3: int64; a4: int32; a5: int32; a6: int32; a7: int64; a8: float32;
    a9: float64; a10: int32; a11: int32): void {.
    wasmimport("test-simple-params", "my:host/test-interface").}
proc testSimpleParams*(a: int8; b: int16; c: int32; d: int64; e: uint8;
                       f: uint16; g: uint32; h: uint64; i: float32; j: float64;
                       k: bool; l: Rune): void {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
    arg2: int32
    arg3: int64
    arg4: int32
    arg5: int32
    arg6: int32
    arg7: int64
    arg8: float32
    arg9: float64
    arg10: int32
    arg11: int32
  arg0 = cast[int32](a)
  arg1 = cast[int32](b)
  arg2 = cast[int32](c)
  arg3 = cast[int64](d)
  arg4 = cast[int32](e)
  arg5 = cast[int32](f)
  arg6 = cast[int32](g)
  arg7 = cast[int64](h)
  arg8 = i
  arg9 = j
  arg10 = cast[int32](k)
  arg11 = cast[int32](l)
  testInterfaceTestSimpleParamsImported(arg0, arg1, arg2, arg3, arg4, arg5,
                                        arg6, arg7, arg8, arg9, arg10, arg11)

proc testInterfaceTestSimpleParamsPtrImported(a0: int32): void {.
    wasmimport("test-simple-params-ptr", "my:host/test-interface").}
proc testSimpleParamsPtr*(a: int8; b: int16; c: int32; d: int64; e: uint8;
                          f: uint16; g: uint32; h: uint64; i: float32;
                          j: float64; k: bool; l: Rune; m: int32; n: int32;
                          o: int32; p: int32; q: int32): void {.nodestroy.} =
  var retArea: array[76, uint8]
  cast[ptr int32](retArea[0].addr)[] = cast[int32](a)
  cast[ptr int32](retArea[2].addr)[] = cast[int32](b)
  cast[ptr int32](retArea[4].addr)[] = cast[int32](c)
  cast[ptr int64](retArea[8].addr)[] = cast[int64](d)
  cast[ptr int32](retArea[16].addr)[] = cast[int32](e)
  cast[ptr int32](retArea[18].addr)[] = cast[int32](f)
  cast[ptr int32](retArea[20].addr)[] = cast[int32](g)
  cast[ptr int64](retArea[24].addr)[] = cast[int64](h)
  cast[ptr float32](retArea[32].addr)[] = i
  cast[ptr float64](retArea[40].addr)[] = j
  cast[ptr int32](retArea[48].addr)[] = cast[int32](k)
  cast[ptr int32](retArea[52].addr)[] = cast[int32](l)
  cast[ptr int32](retArea[56].addr)[] = cast[int32](m)
  cast[ptr int32](retArea[60].addr)[] = cast[int32](n)
  cast[ptr int32](retArea[64].addr)[] = cast[int32](o)
  cast[ptr int32](retArea[68].addr)[] = cast[int32](p)
  cast[ptr int32](retArea[72].addr)[] = cast[int32](q)
  testInterfaceTestSimpleParamsPtrImported(cast[int32](retArea[0].addr))

proc testInterfaceAddCallbackImported(a0: int32; a1: int32; a2: int32; a3: int32): int32 {.
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
    arg0 = 0
  arg1 = env.len
  if name.len > 0:
    arg2 = cast[int32](name[0].addr)
  else:
    arg2 = 0
  arg3 = name.len
  let res = testInterfaceAddCallbackImported(arg0, arg1, arg2, arg3)
  result = cast[uint32](res)

proc testInterfaceNewBlobImported(a0: int32; a1: int32): int32 {.
    wasmimport("[constructor]blob", "my:host/test-interface").}
proc newBlob*(init: WitList[uint8]): Blob {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
  if init.len > 0:
    arg0 = cast[int32](init[0].addr)
  else:
    arg0 = 0
  arg1 = init.len
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
    arg1 = 0
  arg2 = bytes.len
  testInterfaceWriteImported(arg0, arg1, arg2)

proc testInterfaceReadImported(a0: int32; a1: int32; a2: int32): void {.
    wasmimport("[method]blob.read", "my:host/test-interface").}
proc read*(self: Blob; n: int32): WitList[uint8] {.nodestroy.} =
  var
    retArea: array[8, uint8]
    arg0: int32
    arg1: int32
  arg0 = cast[int32](self.handle - 1)
  arg1 = cast[int32](n)
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
proc startExported(): void {.wasmexport("start", "").} =
  start()

proc deallocCallback(data: uint32): void
proc deallocCallbackExported(a0: int32): void {.
    wasmexport("dealloc-callback", "my:host/callbacks-impl").} =
  var data: uint32
  data = cast[uint32](a0)
  deallocCallback(data)

proc handleCallback(cb: Callback; s: WitString): bool
proc handleCallbackExported(a0: int32; a1: int32; a2: int32): int32 {.
    wasmexport("handle-callback", "my:test-package/callback-handlers").} =
  var
    cb: Callback
    s: WitString
  cb.handle = a0 + 1
  s = ws(cast[ptr char](a1), a2)
  cast[int32](handleCallback(cb, s))

type
  OnCallback = object
    cb: proc (s: WitString): bool {.gcsafe, raises: [].}
proc handleCallback(cb: Callback; s: WitString): bool =
  cast[ptr CallbackData[OnCallback]](cb.data).data.cb(s)

var handleKeyCallback: uint32 = addCallback(
    ws("my:test-package/callback-handlers"), ws("handle-callback"))
proc handleKey(_: typedesc[OnCallback]): uint32 =
  handleKeyCallback

template sig(_: typedesc[OnCallback]): untyped =
  typeof(OnCallback().cb)

proc handleCallback2(cb: Callback; s: int32): int32
proc handleCallback2Exported(a0: int32; a1: int32): int32 {.
    wasmexport("handle-callback2", "my:test-package/callback-handlers").} =
  var
    cb: Callback
    s: int32
  cb.handle = a0 + 1
  s = cast[int32](a1)
  cast[int32](handleCallback2(cb, s))

type
  OnCallback2 = object
    cb: proc (s: int32): int32 {.gcsafe, raises: [].}
proc handleCallback2(cb: Callback; s: int32): int32 =
  cast[ptr CallbackData[OnCallback2]](cb.data).data.cb(s)

var handleKeyCallback2: uint32 = addCallback(
    ws("my:test-package/callback-handlers"), ws("handle-callback2"))
proc handleKey(_: typedesc[OnCallback2]): uint32 =
  handleKeyCallback2

template sig(_: typedesc[OnCallback2]): untyped =
  typeof(OnCallback2().cb)

proc handleOnLater(cb: Callback; o: Option[WitString]): void
proc handleOnLaterExported(a0: int32; a1: int32; a2: int32; a3: int32): void {.
    wasmexport("handle-on-later", "my:test-package/callback-handlers").} =
  var
    cb: Callback
    o: Option[WitString]
  cb.handle = a0 + 1
  if a1 != 0:
    var temp: WitString
    temp = ws(cast[ptr char](a2), a3)
    o = temp.some
  handleOnLater(cb, o)

type
  OnOnLater = object
    cb: proc (o: Option[WitString]): void {.gcsafe, raises: [].}
proc handleOnLater(cb: Callback; o: Option[WitString]): void =
  cast[ptr CallbackData[OnOnLater]](cb.data).data.cb(o)

var handleKeyOnLater: uint32 = addCallback(
    ws("my:test-package/callback-handlers"), ws("handle-on-later"))
proc handleKey(_: typedesc[OnOnLater]): uint32 =
  handleKeyOnLater

template sig(_: typedesc[OnOnLater]): untyped =
  typeof(OnOnLater().cb)
