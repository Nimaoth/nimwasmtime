
type
  DropImpl* = proc(p: pointer) {.cdecl.}
  CallbackData*[T] = object
    drop*: DropImpl
    data*: T
