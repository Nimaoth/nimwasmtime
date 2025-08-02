
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wit_types, wit_runtime, wit_guest

{.pop.}
import
  env

export
  env

import
  test_interface2

export
  test_interface2

import
  test_types

export
  test_types

import
  test_interface

export
  test_interface

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
