import std/[macros, options, unicode, strutils]

import wit_guest

when defined(witRebuild):
  static: hint("Rebuilding wit")
  importWit "wit":
    world = "plugin1"
    cacheFile = "plugin1_guest.nim"
else:
  static: hint("Using cached wit")
  include plugin1_guest

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

proc NimMain() {.importc.}
proc emscripten_stack_init() {.importc.}

# var gcb: Callback

proc start() =
  emscripten_stack_init()
  NimMain()

  echo "[plugin1] call testNoParams"
  testNoParams()

  echo "[plugin1] call testNoParams2"
  testNoParams2(Baz(x: ws"uiae", c: Foo(x: ws"xvlc"), f: @@[Foo(x: ws"1"), Foo(x: ws"9"), Foo(x: ws"6")], d: (111, 222.333), gbruh: @@[{Lame}, {SoLame}, {Cool, SoLame}, {Cool, Lame}, {SoLame, Lame}, {Cool, SoLame, Lame}], g: BlockDevice, h: {Lame, SoLame}, e: 666.int32.some, k: @@[Bar(a: 123, b: 456.789, c: "ü".runeAt(0), d: true), Bar(a: 987, b: 654.321, c: "ö".runeAt(0), d: false)]))

  echo "[plugin1] call testSimpleParams"
  testSimpleParams(-123, -456, -789, -1592648, 123, 456, 789, 1592648, 147.258, 369.852, true, "ä".runeAt(0))

  echo "[plugin1] call testSimpleParamsPtr"
  testSimpleParamsPtr(-123, -456, -789, -1592648, 123, 456, 789, 1592648, 147.258, 369.852, true, "ä".runeAt(0), 9, 8, 7, 6, 5)

  echo "[plugin1] create blobs"
  var b1 = newBlob(@@[1.uint8, 2, 3])
  var b2 = newBlob(@@[4.uint8, 5, 6])
  print(b1, b2)
  echo "[plugin1] b1: ", b1, ", ", b2
  let b3 = merge(b1.ensureMove, b2.ensureMove)
  echo "[plugin1] b3: ", b3
  b3.write(@@[42.uint8, 69])
  b3.write(@@[127.uint8, 63])

  echo "[plugin1] read: ", b3.read(9)

  echo "[plugin1] call later"
  # invokeOnLater(gcb, some(ws"jo"))
  echo "[plugin1] call later done"

  echo "[plugin1] call testSimpleReturn"
  echo "[plugin1] -> ", testSimpleReturn(123)

  echo "[plugin1] call testSimpleReturn2"
  echo "[plugin1] -> ", testSimpleReturn2(42)

  echo "[plugin1] call testSimpleReturnPtr"
  echo "[plugin1] -> ", testSimpleReturnPtr(42)

  echo "[plugin1] call testSimpleReturnPtr2"
  echo "[plugin1] -> ", testSimpleReturnPtr2()

proc foo() =
  echo "[plugin1] foo"

# proc findStuff(s: WitList[WitString], cb: sink Callback, cb2: sink Callback): WitList[WitString] =
#   echo "[plugin1] findStuff ", s, ", ", cb
#   var res: seq[WitString]
#   # for i in 0..<s.len:
#   #   if invokeCallback(cb, s[i]):
#   #     res.add s[i]

#   # echo "[plugin1] ", invokeCallback2(cb2, res.len.int32)
#   @@res

# proc callLater(cb: sink Callback) =
#   gcb = cb.ensureMove
