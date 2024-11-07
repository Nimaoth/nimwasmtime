import std/macros

type
  WitList*[T] = object
    data: ptr UncheckedArray[T]
    len: int

  WitString* = object
    data: ptr UncheckedArray[char]
    len: int

  WitFlags*[T] = distinct int8

# proc `=copy`*(self: var T; src: T) {.error.}
# proc clone*(self: T): T =
#   self.addr.copy(result.addr)

# proc `=destroy`*(self: T) =
#   if self.data != nil:
#     self.addr.delete()

template `@@`*[T, S](arr: array[S, T]): WitList[T] =
  let a = arr
  WitList[T](data: cast[ptr UncheckedArray[T]](a[0].addr), len: arr.len)

func wl*[T](data: ptr T, len: int): WitList[T] =
  WitList[T](data: cast[ptr UncheckedArray[T]](data), len: len)

# func `@@`*[TS](arr: seq[T]): WitList[T] =
#   let a = arr
#   WitList[T](data: cast[ptr UncheckedArray[T]](a[0].addr), len: arr.len)

  # let a = str
  # if a.len > 0:
  #   WitList[T](data: cast[ptr UncheckedArray[T]](a[0].addr), len: arr.len)
  # else:
  #   WitList[T]()

func low*[T](self: WitList[T]): int = 0
func high*[T](self: WitList[T]): int = self.len - 1
func len*[T](self: WitList[T]): int = self.len
func data*[T](self: WitList[T]): ptr UncheckedArray[WitList[T]] = self.data

func uncheckedArray*[T](self: WitList[T]): ptr UncheckedArray[T] =
  cast[ptr UncheckedArray[T]](self.data)

func `[]`*[T](self: var WitList[T]; index: int): var T =
  assert index in 0 ..< self.len
  self.uncheckedArray[index]

func `[]`*[T](self: WitList[T]; index: int): lent T =
  assert index in 0 ..< self.len
  self.uncheckedArray[index]

func `[]=`*[T](self: WitList[T]; index: int; value: sink T) =
  assert index in 0 ..< self.len
  self.uncheckedArray[index] = value

func `$`*[T](self: WitList[T]): string =
  result = "["
  for i in 0 ..< self.len:
    if i > 0:
      result.add ", "
    when compiles($self.uncheckedArray[i]):
      result.add $self.uncheckedArray[i]
    else:
      result.add $cast[uint64](self.uncheckedArray[i])
  result.add "]"

iterator items*[T](self: WitList[T]): lent T =
  for i in 0 ..< self.len:
    yield self.uncheckedArray[i]

iterator pairs*[T](self: WitList[T]): (int, lent T) =
  for i in 0 ..< self.len:
    yield (i, self.uncheckedArray[i])

template toOpenArray*[T](self: WitList[T]): openArray[T] = self.data.toOpenArray(0, self.high)
template toOpenArray*[T](self: WitList[T], first: int, last: int): openArray[T] = self.data.toOpenArray(first, last)

template `ws`*(str: string): WitString =
  let a = str
  if a.len > 0:
    WitString(data: cast[ptr UncheckedArray[char]](a[0].addr), len: a.len)
  else:
    WitString()

func ws*(data: ptr char, len: int): WitString =
  WitString(data: cast[ptr UncheckedArray[char]](data), len: len)

func low*(self: WitString): int = 0
func high*(self: WitString): int = self.len - 1
func len*(self: WitString): int = self.len
func data*(self: WitString): ptr UncheckedArray[char] = self.data

func `[]`*(self: WitString; index: int): lent char =
  assert index in 0..<self.len
  self.data[index]

func `$`*(self: WitString): string =
  result.setLen(self.len)
  if self.len > 0:
    copyMem(result[0].addr, self.data, self.len)

iterator items*(self: WitString): lent char =
  for i in 0..<self.len:
    yield self.data[i]

iterator pairs*(self: WitString): (int, lent char) =
  for i in 0..<self.len:
    yield (i, self.data[i])

template toOpenArray*(self: WitString): openArray[char] = self.data.toOpenArray(0, self.high)
template toOpenArray*(self: WitString, first: int, last: int): openArray[char] = self.data.toOpenArray(first, last)

converter toSet*[T](flags: WitFlags[T]): set[T] = cast[set[T]](flags)
converter toFlags*[T](flags: set[T]): WitFlags[T] =
  defer:
    debugEcho "toFlags ", flags, " -> ", cast[int32](result)
  cast[WitFlags[T]](cast[int32](flags))
converter empty*(T: typedesc[WitFlags]): T = cast[T](0)

func `in`*[T](flag: T, flags: WitFlags[T]): bool = flag in flags.toSet
func incl*[T](flags: var WitFlags[T], flag: T) = flags = cast[WitFlags[T]](cast[int32](flags) or (1 shl flag.int))

func defaultFlagValue[T](x: WitFlags[T]): T = T.default
template getFlagsTargetType*[T](_: typedesc[WitFlags[T]]): untyped = typeof(WitFlags[T].default.defaultFlagValue)
