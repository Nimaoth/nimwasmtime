
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wit_types, wit_runtime, wit_guest

{.pop.}
import
  test_types

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
