import std/[macros, options, unicode]

import wit_guest

when defined(witRebuild):
  static: hint("Rebuilding test_import.wit")
  importWit "wit":
    world = "plugin2"
    cacheFile = "plugin2_guest.nim"
else:
  static: hint("Using cached test_import.wit (guest2.nim)")
  include plugin2_guest

proc emscripten_notify_memory_growth*(a: int32) {.exportc.} =
  discard

proc start() =
  echo "plugin2: start"
  findStuff()
  echo "plugin2: mid"
  foo()
  # findStuff()
  echo "plugin2: end"
