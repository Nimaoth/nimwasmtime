import std/[macros, strformat, options]
import results

import "../../src/wit_guest"

witBindGen("test.wit"):
  discard

proc emscripten_notify_memory_growth*(a: int32) {.exportc.} =
  discard

proc hello() {.wasmexport.} =
  echo "wasm: ", "hellope"

proc foo(a: int, b: float32): float32 {.wasmexport.} =
  echo "wasm foo: ", a, ", ", b
  echo "-------- call bar baz"
  echo "-> ", barBaz(a, b)
  echo "-------- call bar"
  callBar(Bar(a: a, b: b))
  echo "-------- call baz"
  callBaz(Baz())
  callBaz(Baz(x: ws"uiae", c: Foo(x: ws"xvlc"), d: (ws"dtrn", 147, Foo(x: ws"inside tuple")), e: Voodoo(kind: Possesed, possesed: ws"ooooooooo").some))
  # callBaz(Baz(x: ws"uiae", c: Foo(x: ws"xvlc"), d: ws"dtrn".some, e: Voodoo(kind: Unpossesed).some, f: @@[ws"1", ws"9", ws"6"]))
  callBaz(Baz(x: ws"uiae", c: Foo(x: ws"xvlc"), e: Voodoo(kind: Unpossesed).some, f: @@[Foo(x: ws"1"), Foo(x: ws"9"), Foo(x: ws"6")]))
  echo "--------"
  return a.float32 + b

