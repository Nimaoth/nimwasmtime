import std/[macros, options, unicode]

import wit_guest

when defined(witRebuild):
  static: hint("Rebuilding test.wit")
  importWit "test.wit"
else:
  static: hint("Using cached test.wit (guest.nim)")
  include guest

proc emscripten_notify_memory_growth*(a: int32) {.exportc.} =
  discard

# proc foo(f: Bar): float32 =
#   echo "[guest][foo] wasm foo: ", f
#   echo "[guest][foo] -------- call bar baz"
#   echo "[guest][foo] -> ", barBaz(f.a, f.b)
#   echo "[guest][foo] -------- call bar"
#   echo "[guest][foo] ", callBar(Bar(a: f.a, b: f.b, c: "👌".runeAt(0), d: true))
#   echo "[guest][foo] ", callBar(Bar(a: f.a, b: f.b, c: "ä".runeAt(0), d: false))
#   echo "[guest][foo] -------- call baz"
#   echo "[guest][foo] ", callBaz(Baz(j: Voodoo(kind: Possesed, possesed: ws"uuuuuuuuuu"), i: Result[Foo, void].ok(Foo())))
#   echo "[guest][foo] ", callBaz(Baz(x: ws"uiae", c: Foo(x: ws"xvlc"), f: @@[Foo(x: ws"1"), Foo(x: ws"9"), Foo(x: ws"6")], d: (111, 222.333), gbruh: @@[{Lame}, {SoLame}, {Cool, SoLame}, {Cool, Lame}, {SoLame, Lame}, {Cool, SoLame, Lame}], g: BlockDevice, h: {Lame, SoLame}, e: 666.int32.some))

# proc bar(f: Bar): Bar =
#   echo "[guest][bar] ", f
#   f

# proc baz(f: Baz): Baz =
#   echo "[guest][baz] ", f
#   f

# proc barz(f: Bar; g: Baz): Baz =
#   echo "[guest][barz] ", f, ", ", g
#   g

proc start() =
  echo "[guest] call testNoParams"
  testNoParams()

  echo "[guest] call testNoParams2"
  testNoParams2()

  echo "[guest] call testSimpleParams"
  testSimpleParams(-123, -456, -789, -1592648, 123, 456, 789, 1592648, 147.258, 369.852, true, "ä".runeAt(0))

  echo "[guest] call testSimpleParamsPtr"
  testSimpleParamsPtr(-123, -456, -789, -1592648, 123, 456, 789, 1592648, 147.258, 369.852, true, "ä".runeAt(0), 9, 8, 7, 6, 5)

  var b1 = newBlob(@@[1.uint8, 2, 3])
  var b2 = newBlob(@@[4.uint8, 5, 6])
  print(b1, b2)
  echo "b1: ", b1, ", ", b2
  let b3 = merge(b1.ensureMove, b2.ensureMove)
  echo "b3: ", b3
  b3.write(@@[127.uint8, 63])
