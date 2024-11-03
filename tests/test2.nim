import std/[strformat, options, strutils, macros, genasts]
import results
import wasmtime
import wit_host

witBindGen("wasm/test.wit"):
  discard

proc main() =
  echo "Start main"
  let config = newConfig()
  let engine = newEngine(config)

  let linker = engine.newLinker()
  defer: linker.delete()

  let store = engine.newStore(nil, nil)
  defer: store.delete()

  let context = store.context()

  let wasiConfig = newWasiConfig()
  wasiConfig.inheritStdin()
  wasiConfig.inheritStderr()
  wasiConfig.inheritStdout()
  context.setWasi(wasiConfig).toResult(void).okOr(err):
    echo "Failed to setup wasi: ", err.msg
    return

  echo "Read wasm file"
  let wasmBytes = readFile("tests/wasm/testm.wasm")
  let module = engine.newModule(wasmBytes).okOr(err):
    echo "Failed to create wasm module: ", err.msg
    return

  let moduleImports = module.imports
  let moduleExports = module.exports

  echo "Imports:"
  for i, e in moduleImports:
    echo &"  {i}: {e}"

  echo "Exports:"
  for i, e in moduleExports:
    echo &"  {i}: {e}"

  linker.defineWasi().okOr(err):
    echo "Failed to create linker: ", err.msg
    return

  echo "Instantiate "
  var trap: ptr WasmTrapT = nil
  let instance = linker.instantiate(context, module, trap.addr).okOr(err):
    echo "Failed to instantiate wasm module: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to instantiate wasm module: ", err.msg
    return

  echo "instance exports"
  for i in 0..<moduleExports.len:
    let mainExport = instance.getExport(context, i)
    if mainExport.isNone:
      echo &"  {i}: none"
      continue
    echo &"  {i}: {mainExport.get.name}"

  let mainExport = instance.getExport(context, "hello")
  assert mainExport.isSome
  assert mainExport.get.kind.WasmExternKind == ExternFunc
  echo mainExport

  echo "Call hello"
  mainExport.get.of_field.func_field.addr.call(context, [], [], trap.addr).toResult(void).okOr(err):
    echo &"Failed to call hello: {err.msg}"
    return

  trap.okOr(err):
    echo "[trap] Failed to call hello: ", err.msg
    return

  echo "Called hello"

proc toVal*[T](a: T): ComponentValT =
  # echo &"toVal {a}"
  when T is object:
    result.kind = ComponentValKind.Record.ComponentValKindT
    var numFields = 0
    for k, v in a.fieldPairs:
      numFields.inc

    result.payload.record.addr.newUninitialized(numFields.csize_t)

    var i = 0
    for k, v in a.fieldPairs:
      result.payload.record[i] = ComponentValRecordFieldT(name: k.toName, val: v.toVal)
      inc i

    # echo result.payload.record.data.isNil
    # echo result.payload.record.size

  elif T is int32:
    result.kind = ComponentValKind.S32.ComponentValKindT
    result.payload.s32 = a

  elif T is int64:
    result.kind = ComponentValKind.S64.ComponentValKindT
    result.payload.s64 = a

  elif T is float32:
    result.kind = ComponentValKind.Float32.ComponentValKindT
    result.payload.f32 = a

  elif T is float64:
    result.kind = ComponentValKind.Float64.ComponentValKindT
    result.payload.f64 = a

  else:
    {.error: "Can't convert type " & $T & " to ComponentValT".}

proc to*(a: ComponentValT, T: typedesc): T =
  # echo a, ", ", a.kind.ComponentValKind, " to ", T
  when T is int32:
    assert a.kind == ComponentValKind.S32.ComponentValKindT
    result = a.payload.s32

  elif T is int64:
    assert a.kind == ComponentValKind.S64.ComponentValKindT
    result = a.payload.s64

  elif T is float32:
    assert a.kind == ComponentValKind.Float32.ComponentValKindT
    result = a.payload.f32

  elif T is float64:
    assert a.kind == ComponentValKind.Float64.ComponentValKindT
    result = a.payload.f64

  elif T is string:
    assert a.kind == ComponentValKind.String.ComponentValKindT
    result = a.payload.string_field.strVal

  # elif T is WitString:
  #   assert a.kind == ComponentValKind.String.ComponentValKindT
  #   result = ws(cast[ptr char](a.payload.string_field.data), a.payload.string_field.len)

  elif T is bool:
    assert a.kind == ComponentValKind.Bool.ComponentValKindT
    result = a.payload.boolean

  elif T is seq:
    assert a.kind == ComponentValKind.List.ComponentValKindT
    type Item = typeof(result[0])
    for v in a.payload.list:
      result.add v.to(Item)

  # elif T is WitList:
  #   assert a.kind == ComponentValKind.List.ComponentValKindT
  #   type Item = typeof(result[0])
  #   for v in a.payload.list:
  #     result.add v.to(Item)
  #   # var res: seq[Item]
  #   # for v in a.payload.list:
  #   #   res.add v.to(Item)

  elif T is options.Option:
    assert a.kind == ComponentValKind.Option.ComponentValKindT
    if a.payload.option != nil:
      result = a.payload.option[].to(typeof(result.get)).some

  elif T is object:
    if a.kind == ComponentValKind.Record.ComponentValKindT:
      var i = 0
      for k, v in result.fieldPairs:
        v = a.payload.record[i].val.to(typeof(v))
        inc i

    elif a.kind == ComponentValKind.Variant.ComponentValKindT:
      when compiles(result.kind):
        type Kind = typeof(result.kind)
        let tag = parseEnum[Kind](a.payload.variant.name.strVal)
        result = T(kind: tag)

        macro convertField(res: typed, val: untyped): untyped =
          var cases = nnkCaseStmt.newTree(nnkDotExpr.newTree(res, ident"kind"))
          var addElse = false

          for v in Kind:
            var caseCode = genAst(res, val, field = ident($v)):
              # todo: check this `when` in the macro instead of in the returned code
              when compiles(res.field):
                res.field = val.to(typeof(res.field))
            cases.add nnkOfBranch.newTree(ident(capitalizeAscii($v)), caseCode)

          return nnkStmtList.newTree(cases)

        result.convertField(a.payload.variant.val[])

  elif T is enum:
    assert a.kind == ComponentValKind.Enum.ComponentValKindT
    parseEnum[T](a.payload.enumeration.name.strVal)

  else:
    {.error: "Can't convert ComponentValT to " & $T.}

proc main2() =
  echo "Start main2"
  let config = newConfig()
  let engine = newEngine(config)

  let linker = engine.newComponentLinker()
  # defer: linker.delete()

  var trap: ptr WasmTrapT = nil

  linker.linkWasi(trap.addr).okOr(err):
    echo "Failed to link wasi: ", err.msg
    return

  block:
    proc cb(ctx: pointer, params: openArray[ComponentValT], results: var openArray[ComponentValT]) =
      let a = params[0].to(int32)
      let b = params[1].to(float32)
      results[0] = (a.float32 - b).toVal
      echo &"bar-baz: {a} - {b} = {results[0]}"

    let funcName = "bar-baz"
    linker.funcNew(funcName, cb).okOr(err):
      echo &"[trap] Failed to link func {funcName}: ", err.msg

  block:
    proc cb(ctx: pointer, params: openArray[ComponentValT], results: var openArray[ComponentValT]) =
      # echo &"cb: {params} -> {results.len}"
      let b = params[0].to(Bar)
      echo &"barrrr: {b}"

    let funcName = "call-bar"
    linker.funcNew(funcName, cb).okOr(err):
      echo &"[trap] Failed to link func {funcName}: ", err.msg

  block:
    proc cb(ctx: pointer, params: openArray[ComponentValT], results: var openArray[ComponentValT]) =
      echo "bazzz"
      # echo &"cb: {params} -> {results.len}"
      let b = params[0].to(Baz)
      echo &"bazzz: {b}"

    let funcName = "call-baz"
    linker.funcNew(funcName, cb).okOr(err):
      echo &"[trap] Failed to link func {funcName}: ", err.msg

  trap.okOr(err):
    echo "[trap] Failed to link wasi: ", err.msg
    return

  let store = engine.newComponentStore(nil, nil)
  # defer: store.delete()

  let context = store.context()

  echo "read file"
  let wasmBytes = readFile("tests/wasm/testc.wasm")
  var c: ptr ComponentT = nil
  echo "create component"
  engine.fromBinary(cast[ptr uint8](wasmBytes[0].addr), wasmBytes.len.csize_t, c.addr).okOr(err):
    echo "Failed to create wasm component: ", err.msg
    return

  echo "create instance"

  var instance: ptr ComponentInstanceT = nil
  linker.instantiate(context, c, instance.addr, trap.addr).okOr(err):
    echo "Failed to create component instance: ", err.msg
    return

  trap.okOr(err):
    echo "[trap] Failed to create component instance: ", err.msg
    return

  assert instance != nil

  block:
    let name = "hello"
    echo &"get func {name}"
    var f: ptr ComponentFuncT = nil
    if not instance.getFunc(context, cast[ptr uint8](name[0].addr), name.len.csize_t, f.addr):
      echo &"Failed to get func '{name}'"
      return

    if f == nil:
      echo &"Failed to get func '{name}'"
      return

    echo &"call func {name}"
    var params: array[1, ComponentValT]
    var results: array[1, ComponentValT]
    f.call(context, params[0].addr, 0, results[0].addr, 0, trap.addr).okOr(err):
      echo &"Failed to call func '{name}': ", err.msg
      return

  block:
    let name = "foo"
    echo &"get func {name}"
    var f: ptr ComponentFuncT = nil
    if not instance.getFunc(context, cast[ptr uint8](name[0].addr), name.len.csize_t, f.addr):
      echo &"Failed to get func '{name}'"
      return

    if f == nil:
      echo &"Failed to get func '{name}'"
      return

    type Foo = object
      a: int32
      b: float32

    var params: array[1, ComponentValT]
    var results: array[1, ComponentValT]
    params[0] = Foo(a: 123, b: 456.789).toVal
    echo &"call func {name}, {params[0]}"
    f.call(context, params[0].addr, params.len.csize_t, results[0].addr, results.len.csize_t, trap.addr).okOr(err):
      echo &"Failed to call func '{name}': ", err == nil
      echo &"Failed to call func '{name}': ", err.msg
      trap.okOr(err2):
        echo "[trap] Failed to call func '{name}': ", err2.msg
        return
      return

    trap.okOr(err):
      echo "[trap] Failed to create component instance: ", err.msg
      return

    echo &"Called {name}: {results[0]}"

main()
echo "------------"
main2()
