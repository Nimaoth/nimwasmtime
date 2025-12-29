
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wit_types, wit_runtime, wit_guest

{.pop.}
proc testInterface2TestNoParamsImported(): void {.
    wasmimport("test-no-params", "my:host/test-interface2").}
proc testNoParams*(): void {.nodestroy.} =
  testInterface2TestNoParamsImported()
