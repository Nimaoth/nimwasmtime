import std/strformat
import wit_guest, wit_types

proc convert*(a: SomeInteger, T: typedesc): T {.inline.} =
  cast[T](a)

proc convert*(a: SomeFloat, T: typedesc): T {.inline.} =
  cast[T](a)

proc cabi_realloc*(originalPtr, originalLen, alignment, byteLen: int32): int32 {.wasmexport("cabi_realloc", "").} =
  if originalPtr == 0:
    return cast[int32](allocShared0(byteLen))
  else:
    return cast[int32](reallocShared0(cast[pointer](originalPtr), originalLen, byteLen))

proc cabi_dealloc*(data, len, alignment: int32) {.wasmexport("cabi_dealloc", "").} =
  deallocShared(cast[pointer](data))

# This is a stack memory allocator which uses a segmented stack / arena / buckets
# Small allocations reuse the same memory over and over, big allocations
# are allocated in new buckets, and freed when restoring the stack size to a save point.
type Bucket = object
  # data: seq[uint8]
  data: ptr UncheckedArray[uint8]
  capacity: int
  len: int

const defaultBucketSize = 4 * 1024
var buckets: seq[Bucket] = @[]

proc align(address, alignment: int): int =
  if alignment == 0: # Actually, this is illegal. This branch exists to actively
                     # hide problems.
    result = address
  else:
    result = (address + (alignment - 1)) and not (alignment - 1)

# var staticBuffer: array[4 * 1024, uint8]
proc addBucket*(bucketSize: int32) =
  buckets.add Bucket(
    # data: newSeq[uint8](bucketSize),
    data: cast[ptr UncheckedArray[uint8]](allocShared0(bucketSize)),
    # data: cast[ptr UncheckedArray[uint8]](staticBuffer[0].addr),
    capacity: bucketSize,
    len: 0,
  )
  # echo "allocate bucket ", buckets.len, " with size ", bucketSize, " -> ", cast[int](buckets[buckets.high].data)

addBucket(defaultBucketSize)

proc stackAlloc*(size: int32, alignment: int32): pointer {.wasmexport("mem_stack_alloc", "").} =
  ## Allocate memory on top of the stack.

  # The size check is a bit pessimistic, can be improved to save a bit of memory.
  if buckets.len == 0 or buckets[buckets.high].len + size + alignment >= buckets[buckets.high].capacity:
    let bucketSize = max(defaultBucketSize, size + alignment)
    addBucket(bucketSize)

  let bucket = buckets[buckets.high].addr
  let address = cast[uint32](bucket[].data[bucket[].len].addr)
  let alignedAddress = align(address.int, alignment.int).uint32
  # echo &"mem_stack_alloc {size}, {alignment} -> {address} -> {alignedAddress} ({bucket[].len})"

  bucket[].len += (alignedAddress - address).int + size.int
  return cast[pointer](alignedAddress)

proc stackRealloc*(address: pointer, oldSize: int32, size: int32, alignment: int32): pointer {.wasmexport("mem_stack_realloc", "").} =
  ## Allocate memory on top of the stack.

  # echo &"stackRealloc {cast[int](address)}, {oldSize} -> {size}, align: {alignment}"
  # defer:
  #   echo &"-> {cast[int](result)}"

  if address == nil or buckets.len == 0:
    return stackAlloc(size, alignment)

  let addressInt = cast[int](address)

  var bucket: ptr Bucket = nil
  for i in countdown(buckets.high, 0):
    # echo &"{addressInt} in {cast[int](buckets[i].data)}..{cast[int](buckets[i].data) + buckets[i].len}"
    if addressInt >= cast[int](buckets[i].data) and addressInt < cast[int](buckets[i].data) + buckets[i].len:
      bucket = buckets[i].addr
      break

  if bucket == nil:
    echo "Trying to realloc address " & $addressInt & " in stack allocator but it wasn't allocated with the stack allocator"
    assert bucket != nil, "Trying to realloc address " & $addressInt & " in stack allocator but it wasn't allocated with the stack allocator"
    return nil

  let offsetInBucket = addressInt - cast[int](bucket[].data)
  assert offsetInBucket >= 0
  assert offsetInBucket < bucket[].len

  let isLastAllocation = offsetInBucket + oldSize == bucket[].len

  if size < oldSize:
    if isLastAllocation:
      bucket[].len = offsetInBucket + size
    return address

  var inPlace = true
  if align(addressInt, alignment) != addressInt:
    # Alignment changed
    inPlace = false

  elif not isLastAllocation:
    # Not the last allocation in the current bucket
    inPlace = false

  elif offsetInBucket + size >= bucket[].capacity:
    # No space in current bucket
    inPlace = false

  if inPlace:
    bucket[].len = offsetInBucket + size
    return address
  else:
    let newMem = stackAlloc(size, alignment)
    copyMem(newMem, address, oldSize)
    return newMem

proc stackSave*(): uint64 {.wasmexport("mem_stack_save", "").} =
  ## Save the current stack size, to be restored with stackRestore
  if buckets.len == 0:
    return 0
  let len = buckets[buckets.high].len
  # echo &"mem_stack_save {buckets.len}, {len}"
  return (buckets.len.uint64 shl 32) or len.uint64

proc stackRestore*(p: uint64) {.wasmexport("mem_stack_restore", "").} =
  ## Restore the stack allocator to the saved position. Frees overallocated memory.
  # if buckets.len > 0:
    # echo "mem_stack_restore 1: ", cast[ptr (array[4, int32], array[12, char])](buckets[0].data)[]
  let oldLen = if buckets.len > 0: buckets[buckets.high].len else: 0
  let oldBucketsLen = buckets.len

  let bucketsLen = (p shr 32).int
  let len = (p and 0xFFFFFFFF.uint64).int
  while buckets.len > bucketsLen and buckets.len > 1:
    # echo "free bucket ", buckets.len - 1, " with size ", buckets[buckets.high].capacity
    deallocShared(buckets[buckets.high].data)
    discard buckets.pop()

  # echo &"mem_stack_restore {oldBucketsLen}, {oldLen} -> {bucketsLen}, {len}"
  if buckets.len > 0:
    buckets[buckets.high].len = len

proc stackWitString*(arr: openArray[char]): WitString =
  if arr.len == 0:
    return WitString()
  let p = cast[ptr UncheckedArray[char]](stackAlloc(arr.len, 1))
  for i in 0..<arr.len:
    p[i] = arr[i]
  result = ws(p, arr.len)

proc stackWitString*(str: string): WitString =
  stackWitString(str.toOpenArray(0, str.high))

proc stackWitList*[T](arr: openArray[T]): WitList[T] =
  if arr.len == 0:
    return WitList[T]()
  let p = cast[ptr UncheckedArray[T]](stackAlloc(sizeof(T) * arr.len, sizeof(T)))
  for i in 0..<arr.len:
    p[i] = arr[i]
  result = wl[T](p, arr.len)
