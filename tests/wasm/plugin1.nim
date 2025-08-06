import std/[macros, options, unicode, strutils, strformat]

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

proc addCallback(a: proc(x: int): int) {.importc.}

proc callCallback(fun: uint32; param: Baz): void =
  echo &"[plugin1] callCallback {fun}, {param}"

proc callCallback2(fun: uint32; param: Baz; param2: Bar): void =
  echo &"[plugin1] callCallback2 {fun}, {param}, {param2}"

proc callCallback3(fun: uint32; p: WitList[WitString]): void =
  echo &"[plugin1] callCallback3 {fun}, {p}"

proc callCallback4(fun: uint32): int32 =
  echo &"[plugin1] callCallback4 {fun}"
  return fun.int32

proc callCallback5(fun: uint32): WitString =
  echo &"[plugin1] callCallback5 {fun}"
  return ws"callCallback5 result"

let uiae = [ws"callCallback6 result", ws"aaaaaaaaaah"]
proc callCallback6(fun: uint32): WitList[WitString] =
  echo &"[plugin1] callCallback6 {fun}"

  let a = cast[ptr array[1, int32]](stackAlloc(4, 4))
  let b = cast[ptr array[1, int32]](stackAlloc(4, 4))
  a[][0] = 123
  b[][0] = 456
  echo a[]
  echo b[]

  let b2 = cast[ptr array[2, int32]](stackRealloc(b, 4, 8, 4))
  b2[][1] = 654
  let a2 = cast[ptr array[2, int32]](stackRealloc(a, 4, 8, 4))
  a2[][1] = 789
  echo a2[]
  echo b2[]

  let a3 = cast[ptr array[2, int32]](stackRealloc(a2, 8, 8, 1024))
  echo a3[]

  echo cast[int](a).toHex
  echo cast[int](a2).toHex
  echo cast[int](a3).toHex

  let a4 = cast[ptr array[1, int32]](stackRealloc(a3, 8, 4, 1024))
  let b4 = cast[ptr array[1, int32]](stackRealloc(b2, 8, 4, 4))
  echo a4[]
  echo b4[]
  echo cast[int](a4).toHex

  let a5 = cast[ptr array[2, int32]](stackRealloc(a4, 4, 8, 1024))
  echo a5[]
  echo cast[int](a5).toHex

  return stackWitList([ws"callCallback6 result", ws"aaaaaaaaaah", stackWitString(&"uiae {fun}")])

proc start() =
  emscripten_stack_init()
  NimMain()

  echo "[plugin1] addCallback"
  addCallback proc(x: int): int =
    echo "[plugin1] inside callback 1"
    return x + 1

  addCallback proc(x: int): int =
    echo "[plugin1] inside callback 2"
    return x + 2

  echo "[plugin1] call testNoParams"
  test_interface.testNoParams()
  test_interface2.testNoParams()

  echo "[plugin1] call testNoParams2"
  testNoParams2(Baz(x: ws"uiae", c: Foo(x: ws"xvlc"), d: (111, 222.333), gbruh: @@[{Lame}, {SoLame}, {Cool, SoLame}, {Cool, Lame}, {SoLame, Lame}, {Cool, SoLame, Lame}], g: BlockDevice, h: {Lame, SoLame}, e: 666.int32.some))
  # testNoParams2(Baz(x: ws"uiae", c: Foo(x: ws"xvlc"), f: @@[Foo(x: ws"1"), Foo(x: ws"9"), Foo(x: ws"6")], d: (111, 222.333), gbruh: @@[{Lame}, {SoLame}, {Cool, SoLame}, {Cool, Lame}, {SoLame, Lame}, {Cool, SoLame, Lame}], g: BlockDevice, h: {Lame, SoLame}, e: 666.int32.some, k: @@[Bar(a: 123, b: 456.789, c: "ü".runeAt(0), d: true), Bar(a: 987, b: 654.321, c: "ö".runeAt(0), d: false)]))

  echo "[plugin1] call testSimpleParams"
  testSimpleParams(-123, -456, -789, -1592648, 123, 456, 789, 1592648, 147.258, 369.852, true, "ä".runeAt(0))

  echo "[plugin1] call testSimpleParamsPtr"
  testSimpleParamsPtr(-123, -456, -789, -1592648, 123, 456, 789, 1592648, 147.258, 369.852, true, "ä".runeAt(0), 9, 8, 7, 6, 5)

  echo "[plugin1] create blobs"
  var b1 = newBlob(@@[1.uint8, 2, 3])
  var b2 = newBlob(@@[4.uint8, 5, 6])
  blobPrint(b1, b2)
  echo "[plugin1] b1: ", b1, ", ", b2
  let b3 = blobMerge(b1.ensureMove, b2.ensureMove)
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
