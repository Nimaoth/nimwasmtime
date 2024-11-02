import std/[macros, strformat, options]
import results

import "../../src/wit_guest"

witBindGen("../test.wit"):
  discard

macro wasmexport*(t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)
  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit"EMSCRIPTEN_KEEPALIVE $# $#$#")
  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree(codeGen)
  else:
    newProc[4].add codeGen
  newProc[4].add ident"exportC"
  result = newStmtList()
  result.add:
    quote do:
      {.emit: "/*INCLUDESECTION*/\n#include <emscripten.h>".}
  result.add:
    newProc

macro wasmimport*(name: static[string], env: static[string], t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)

  let module = env
  let name = name

  let attrib = &"""__attribute__((__import_module__("{module}"), __import_name__("{name}")))"""

  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit(attrib & " $# $#$#"))

  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree()

  newProc[4] = nnkPragma.newTree(codeGen)
  newProc[4].add ident"importc"

  defer:
    echo result.repr

  result = newStmtList()
  result.add:
    newProc

proc emscripten_notify_memory_growth*(a: int32) {.exportc.} =
  discard

# proc bar_baz*(a: int, b: float32): float32 {.wasmimport("bar-baz", "env").}

proc hello() {.wasmexport.} =
  echo "wasm: ", "hello world"

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

