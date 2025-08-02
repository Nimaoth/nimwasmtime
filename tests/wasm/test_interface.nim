
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wit_types, wit_runtime, wit_guest

{.pop.}
import
  test_types

type
  Blob* = object
    handle*: int32
proc testInterfaceBlobDrop(a: int32): void {.
    wasmimport("[resource-drop]blob", "my:host/test-interface").}
proc `=copy`*(a: var Blob; b: Blob) {.error.}
proc `=destroy`*(a: Blob) =
  if a.handle != 0:
    testInterfaceBlobDrop(a.handle - 1)

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
