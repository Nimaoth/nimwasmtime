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
  echo barBaz(a, b)
  echo "-------- call bar"
  callBar(Bar(a: a, b: b))
  echo "-------- call baz"
  callBaz(Baz())
  callBaz(Baz(x: "uiae", c: Foo(x: "xvlc"), d: "dtrn".some, e: Voodoo(kind: Possesed, possesed: "ooooooooo").some))
  callBaz(Baz(x: "uiae", c: Foo(x: "xvlc"), d: "dtrn".some, e: Voodoo(kind: Unpossesed).some, f: @[1, 9, 6]))
  echo "--------"
  return a.float32 + b

