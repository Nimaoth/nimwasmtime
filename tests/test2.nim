import std/[strformat, options, strutils, macros, genasts, unicode]
import wasmtime, wit_host

importWit "wasm/test.wit"

proc call(instance: ptr ComponentInstanceT, context: ptr ComponentContextT, name: string, params: openArray[ComponentValT], nresults: static[int]) =
  var f: ptr ComponentFuncT = nil
  if not instance.getFunc(context, cast[ptr uint8](name[0].addr), name.len.csize_t, f.addr):
    echo &"[host] Failed to get func '{name}'"
    return

  if f == nil:
    echo &"[host] Failed to get func '{name}'"
    return

  var res: array[max(nresults, 1), ComponentValT]
  echo &"[host] ------------------------------- call {name}, {params} -------------------------------------"
  f.call(context, params, res.toOpenArray(0, nresults - 1)).okOr(e):
    echo &"[host] Failed to call func '{name}': ", e.msg
    return

  if nresults > 0:
    echo &"[host] call func {name} -> {res}"

template defineFunc(linker: ptr ComponentLinkerT, env: string, name: string, body: untyped) =
  block:
    proc cb(ctx: pointer, params {.inject.}: openArray[ComponentValT], results {.inject.}: var openArray[ComponentValT]) =
      echo "[host] " & name & &" <- {params}"
      body
      echo "[host] " & name & &" -> {results}"

    let funcName {.inject.} = name
    linker.funcNew(env, funcName, cb).okOr(err):
      echo &"[host][trap] Failed to link func {funcName}: {err.msg}"

proc main() =
  echo "[host] Start main"
  let config = newConfig()
  let engine = newEngine(config)
  let linker = engine.newComponentLinker()
  var trap: ptr WasmTrapT = nil

  let store = engine.newComponentStore(nil, nil)
  # defer: store.delete()

  type MyBlob = object
    blobName: string
    arr: seq[uint8]

  proc deleteBlob(b: pointer) {.cdecl.} =
    let b = cast[ptr MyBlob](b)
    echo "--------------------------------------- deleteBlob ", b[]
    deallocShared(b)

  linker.linkWasi(trap.addr).okOr(err):
    echo "[host] Failed to link wasi: ", err.msg
    return

  trap.okOr(err):
    echo "[host][trap] Failed to link wasi: ", err.msg
    return

  linker.defineResource("my:test-package/test-interface", "blob", 69, deleteBlob).okOr(err):
    echo &"Failed to define resource {err.msg}"
    return

  linker.defineFunc("env", "bar-baz"):
    let a = params[0].to(int32)
    let b = params[1].to(float32)
    results[0] = (a.float32 - b).toVal
    echo &"[host] bar-baz: {a} - {b} = {results[0]}"

  linker.defineFunc("env", "call-bar"):
    results[0] = params[0].to(Bar).toVal

  linker.defineFunc("env", "call-baz"):
    results[0] = params[0].to(Baz).toVal

  linker.defineFunc("env", "test-no-params2"):
    echo "[host] testNoParams()"

  var counter = 0

  linker.defineFunc("my:test-package/test-interface", "[constructor]blob"):
    echo "[host] [constructor]blob()"
    var res: ComponentValT
    var blob = createShared(MyBlob)
    blob.blobName = "constr" & $counter
    blob.arr = params[0].to(seq[uint8])
    counter.inc
    store.context.resourceNew(69, res.addr, blob).okOr(err):
      echo &"[host] Failed to create resource: {err}"
      return

    results[0] = res

  linker.defineFunc("my:test-package/test-interface", "[method]blob.read"):
    echo "[host] [method]blob.read()"

  linker.defineFunc("my:test-package/test-interface", "[method]blob.write"):
    echo "[host] [method]blob.write()"

  linker.defineFunc("my:test-package/test-interface", "[static]blob.merge"):
    echo "[host] [static]blob.merge()"

    var res: ComponentValT
    var blob = createShared(MyBlob)
    blob.blobName = "merge" & $counter
    counter.inc
    store.context.resourceNew(69, res.addr, blob).okOr(err):
      echo &"[host] Failed to create resource: {err}"
      return
    results[0] = res

    store.context.resourceDrop(params[0].addr).okOr(err):
      echo &"[host] Failed to drop resource: {err}"
      return
    store.context.resourceDrop(params[1].addr).okOr(err):
      echo &"[host] Failed to drop resource: {err}"
      return

  linker.defineFunc("my:test-package/test-interface", "[static]blob.print"):
    echo "[host] [static]blob.print()"
    store.context.resourceDrop(params[0].addr).okOr(err):
      echo &"[host] Failed to drop resource: {err}"
      return
    store.context.resourceDrop(params[1].addr).okOr(err):
      echo &"[host] Failed to drop resource: {err}"
      return

  linker.defineFunc("my:test-package/test-interface", "test-no-params"):
    echo "[host] testNoParams()"

  linker.defineFunc("my:test-package/test-interface", "test-simple-params"):
    echo "[host] testSimpleParams()"

  linker.defineFunc("my:test-package/test-interface", "test-simple-params-ptr"):
    echo "[host] testSimpleParamsPtr()"

  echo "[host] read file"
  let wasmBytes = readFile("tests/wasm/testc.wasm")
  let component = engine.newComponent(wasmBytes).okOr(err):
    echo "[host] Failed to create wasm component: ", err.msg
    return

  echo "[host] create instance"

  var instance: ptr ComponentInstanceT = nil
  linker.instantiate(store.context, component, instance.addr, trap.addr).okOr(err):
    echo "[host] Failed to create component instance: ", err.msg
    return

  trap.okOr(err):
    echo "[host][trap] Failed to create component instance: ", err.msg
    return

  assert instance != nil

  instance.call(store.context, "start", [], 0)

  echo "[host] ------------ Finished main"

main()
