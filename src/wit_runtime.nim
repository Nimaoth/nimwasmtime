import wit_guest

proc cabi_realloc*(originalPtr, originalLen, alignment, byteLen: int32): int32 {.wasmexport("cabi_realloc", "").} =
  if originalPtr == 0:
    return cast[int32](allocShared0(byteLen))
  else:
    return cast[int32](reallocShared0(cast[pointer](originalPtr), originalLen, byteLen))

proc cabi_dealloc*(data, len, alignment: int32) {.wasmexport("cabi_dealloc", "").} =
  deallocShared(cast[pointer](data))
