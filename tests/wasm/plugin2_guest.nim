
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wit_types, wit_runtime

{.pop.}
type
  Foo* = object
    x*: WitString
  Prop* = enum
    Cool = "cool", Lame = "lame", SoLame = "so-lame"
  Props* = set[Prop]
  Bar* = object
    a*: int32
    b*: float32
    c*: Rune
    d*: bool
  VoodooKind* = enum
    UnPossesed = "un-possesed", Possesed = "possesed"
  Voodoo* = object
    case kind*: VoodooKind
    of Possesed:
      possesed: WitString
    else:
      nil
  DescriptorType* = enum
    Unknown = "unknown", BlockDevice = "block-device",
    CharacterDevice = "character-device", Directory = "directory",
    Fifo = "fifo", SymbolicLink = "symbolic-link", RegularFile = "regular-file",
    Socket = "socket"
  Baz* = object
    x*: WitString
    c*: Foo
    d*: (int32, float32)
    e*: Option[int32]
    f*: WitList[Foo]
    gbruh*: WitList[Props]
    g*: DescriptorType
    h*: Props
    i*: Result[Foo, void]
    j*: Voodoo
  Blob* = object
    handle*: int32
proc testInterfaceBlobDrop(a: int32): void {.
    wasmimport("[resource-drop]blob", "my:host/test-interface").}
proc `=copy`*(a: var Blob; b: Blob) {.error.}
proc `=destroy`*(a: Blob) =
  if a.handle != 0:
    testInterfaceBlobDrop(a.handle - 1)

proc apiFooImported(): void {.wasmimport("foo", "my:plugin1/api").}
proc foo*(): void {.nodestroy.} =
  apiFooImported()

proc apiFindStuffImported(): void {.wasmimport("find-stuff", "my:plugin1/api").}
proc findStuff*(): void {.nodestroy.} =
  apiFindStuffImported()

proc start(): void
proc startExported(): void {.wasmexport("start", "").} =
  start()
