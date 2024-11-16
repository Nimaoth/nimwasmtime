
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

proc envTestNoParams2Imported(a0: int32): void {.
    wasmimport("test-no-params2", "env").}
proc testNoParams2*(b: Baz): void {.nodestroy.} =
  var retArea: array[76, uint8]
  if b.x.len > 0:
    cast[ptr int32](retArea[0].addr)[] = cast[int32](b.x[0].addr)
  else:
    cast[ptr int32](retArea[0].addr)[] = 0
  cast[ptr int32](retArea[4].addr)[] = b.x.len
  if b.c.x.len > 0:
    cast[ptr int32](retArea[8].addr)[] = cast[int32](b.c.x[0].addr)
  else:
    cast[ptr int32](retArea[8].addr)[] = 0
  cast[ptr int32](retArea[12].addr)[] = b.c.x.len
  cast[ptr int32](retArea[16].addr)[] = cast[int32](b.d[0])
  cast[ptr float32](retArea[20].addr)[] = b.d[1]
  cast[ptr int32](retArea[24].addr)[] = b.e.isSome.int32
  if b.e.isSome:
    cast[ptr int32](retArea[28].addr)[] = cast[int32](b.e.get)
  if b.f.len > 0:
    cast[ptr int32](retArea[32].addr)[] = cast[int32](b.f[0].addr)
  else:
    cast[ptr int32](retArea[32].addr)[] = 0
  cast[ptr int32](retArea[36].addr)[] = b.f.len
  if b.gbruh.len > 0:
    cast[ptr int32](retArea[40].addr)[] = cast[int32](b.gbruh[0].addr)
  else:
    cast[ptr int32](retArea[40].addr)[] = 0
  cast[ptr int32](retArea[44].addr)[] = b.gbruh.len
  cast[ptr int32](retArea[48].addr)[] = cast[int8](b.g)
  cast[ptr int32](retArea[49].addr)[] = cast[int8](b.h)
  cast[ptr int32](retArea[52].addr)[] = b.i.isErr.int32
  if b.i.isOk:
    if b.i.value.x.len > 0:
      cast[ptr int32](retArea[56].addr)[] = cast[int32](b.i.value.x[0].addr)
    else:
      cast[ptr int32](retArea[56].addr)[] = 0
    cast[ptr int32](retArea[60].addr)[] = b.i.value.x.len
  else:
    discard
  cast[ptr int32](retArea[64].addr)[] = b.j.kind.int32
  case b.j.kind
  of UnPossesed:
    discard
  of Possesed:
    if b.j.possesed.len > 0:
      cast[ptr int32](retArea[68].addr)[] = cast[int32](b.j.possesed[0].addr)
    else:
      cast[ptr int32](retArea[68].addr)[] = 0
    cast[ptr int32](retArea[72].addr)[] = b.j.possesed.len
  envTestNoParams2Imported(cast[int32](retArea[0].addr))

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

proc callbacksInvokeCallbackImported(a0: int32; a1: int32; a2: int32): int32 {.
    wasmimport("invoke-callback", "my:plugin1/callbacks").}
proc invokeCallback*(cb: Callback; s: WitString): bool {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
    arg2: int32
  arg0 = cast[int32](cb.handle - 1)
  if s.len > 0:
    arg1 = cast[int32](s[0].addr)
  else:
    arg1 = 0
  arg2 = s.len
  let res = callbacksInvokeCallbackImported(arg0, arg1, arg2)
  result = res != 0

proc callbacksInvokeCallback2Imported(a0: int32; a1: int32): int32 {.
    wasmimport("invoke-callback2", "my:plugin1/callbacks").}
proc invokeCallback2*(cb: Callback; s: int32): int32 {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
  arg0 = cast[int32](cb.handle - 1)
  arg1 = cast[int32](s)
  let res = callbacksInvokeCallback2Imported(arg0, arg1)
  result = cast[int32](res)

proc callbacksInvokeOnLaterImported(a0: int32; a1: int32; a2: int32; a3: int32): void {.
    wasmimport("invoke-on-later", "my:plugin1/callbacks").}
proc invokeOnLater*(cb: Callback; o: Option[WitString]): void {.nodestroy.} =
  var
    arg0: int32
    arg1: int32
    arg2: int32
    arg3: int32
  arg0 = cast[int32](cb.handle - 1)
  arg1 = o.isSome.int32
  if o.isSome:
    if o.get.len > 0:
      arg2 = cast[int32](o.get[0].addr)
    else:
      arg2 = 0
    arg3 = o.get.len
  callbacksInvokeOnLaterImported(arg0, arg1, arg2, arg3)

proc start(): void
proc startExported(): void {.wasmexport("start", "").} =
  start()

proc foo(): void
proc fooExported(): void {.wasmexport("foo", "my:plugin1/api").} =
  foo()

proc findStuff(s: WitList[WitString]; cb: sink Callback; cb2: sink Callback): WitList[
    WitString]
var findStuffRetArea: array[16, uint8]
proc findStuffExported(a0: int32; a1: int32; a2: int32; a3: int32): int32 {.
    wasmexport("find-stuff", "my:plugin1/api").} =
  var
    s: WitList[WitString]
    cb: Callback
    cb2: Callback
  s = wl(cast[ptr typeof(s[0])](a0), a1)
  cb.handle = a2 + 1
  cb2.handle = a3 + 1
  let res = findStuff(s, cb, cb2)
  if res.len > 0:
    cast[ptr int32](findStuffRetArea[0].addr)[] = cast[int32](res[0].addr)
  else:
    cast[ptr int32](findStuffRetArea[0].addr)[] = 0
  cast[ptr int32](findStuffRetArea[4].addr)[] = res.len
  cast[int32](findStuffRetArea[0].addr)

proc callLater(cb: sink Callback): void
proc callLaterExported(a0: int32): void {.
    wasmexport("call-later", "my:plugin1/api").} =
  var cb: Callback
  cb.handle = a0 + 1
  callLater(cb)
