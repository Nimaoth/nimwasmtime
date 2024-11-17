import std/[macros, options, unicode, sugar, tables, strutils, genasts, strformat, os, typetraits]

import wit_guest, wit, wit_gen

proc genCallbackGlue(ctx: WitContext, world: WitWorld, importSection: var NimNode, typeSection: var NimNode, funcList: var NimNode) =
  importSection.add nnkImportStmt.newTree(ident"callback_impl")

  var availableCallbacks: Table[string, WitFunc]

  for i in ctx.interfaces:
    for f in i.funcs:
      if f.env == "callbacks" and f.name.startsWith("invoke-"):
        availableCallbacks[f.name] = f

  let callbackHandlersInterface = "my:test-package/callback-handlers"

  var callbacksWit = "interface callback-handlers {\n  use my:host/callback-types.{callback};"

  for cb in availableCallbacks.values:
    let name = cb.name["invoke-".len..^1]

    var exportFun = cb
    exportFun.name = "handle-" & name
    exportFun.env = callbackHandlersInterface
    ctx.genExport(funcList, exportFun)

    let typeName = ident("On" & name.toCamelCase(true))
    let handleName = "handle-" & name
    let handleIdent = ("handle" & name.toCamelCase(true)).ident
    let handleKeyIdent = ("handleKey" & name.toCamelCase(true)).ident
    let (returnType, witReturnType) = if cb.results.len > 0:
      (ctx.getTypeName(cb.results[0], Return), " -> " & ctx.getWitTypeName(cb.results[0]))
    else:
      (ident"void", "")

    let code = genAst(typeName, handleIdent, handleKeyIdent, handleName, returnType, callbackHandlersInterface,
        parameters = ident"parameters", args = ident"args", cb = ident"cb"):
      type typeName = object
        cb: proc(parameters): returnType {.gcsafe, raises: [].}
      proc handleIdent(cb: Callback, parameters): returnType =
        cast[ptr CallbackData[typeName]](cb.data).data.cb(args)
      var handleKeyIdent: uint32 = addCallback(ws(callbackHandlersInterface), ws(handleName))
      proc handleKey(_: typedesc[typeName]): uint32 = handleKeyIdent
      template sig(_: typedesc[typeName]): untyped = typeof(typeName().cb)

    var parameters: seq[NimNode]
    var args: seq[NimNode]
    var witSig = ""
    for i in 1..cb.params.high:
      parameters.add nnkIdentDefs.newTree(ident(cb.params[i].name), ctx.getTypeName(cb.params[i].typ, Parameter), newEmptyNode())
      witSig.add ", " & cb.params[i].name & ": " & ctx.getWitTypeName(cb.params[i].typ)
      args.add ident(cb.params[i].name)
    code.replace(nnkIdentDefs.newTree(ident"parameters", newEmptyNode(), newEmptyNode()), parameters)
    code.replace(ident"args", args)

    callbacksWit.add &"\n  @unstable(feature = callbacks-impl)\n  {handleName}: func(cb: borrow<callback>{witSig}){witReturnType};"

    funcList.add code

  for f in world.funcs:
    # echo "------------------------- docs ", f.name, ": ", f.docs

    var startIndex = 0
    while startIndex < f.docs.len:
      let cbIndex = f.docs.find("@callback", startIndex)
      if cbIndex == -1:
        break

      let nlIndex = f.docs.find("\n", cbIndex)
      let endIndex = if nlIndex == -1: f.docs.len else: nlIndex
      startIndex = endIndex

      let parts = f.docs[cbIndex..<endIndex].split(" ")
      if parts.len == 3:
        let paramName = parts[1]
        let invokeName = parts[2]
        # f.callbackParams[paramName] = invokeName

  callbacksWit.add "\n}"
  let path = currentSourcePath.replace("\\", "/").splitPath.head
  let callbacksWitPath = path / "wit/callbacks.gen.wit"
  hint("Save generated callback handlers to " & callbacksWitPath)
  writeFile(callbacksWitPath, callbacksWit)

when defined(witRebuild):
  static: hint("Rebuilding test_import.wit")
  importWit "wit":
    world = "plugin2"
    cacheFile = "plugin2_guest.nim"
    customCodeGen:
      ctx.genCallbackGlue(world, importSection, typeSection, funcList)

else:
  static: hint("Using cached test_import.wit (guest2.nim)")
  include plugin2_guest

proc emscripten_notify_memory_growth*(a: int32) {.exportc.} =
  discard

# var deallocCallbackKey: uint32 = addCallback(ws"my:host/callbacks-impl", ws"dealloc-callback")
# proc deallocCallback(data: uint32) =
#   echo "plugin2: dealloc callback ", data
#   if data != 0:
#     let drop = cast[ptr DropImpl](data)
#     drop[](cast[pointer](data))

# proc wrapCallback[K](T: typedesc, cb: K): Callback =
#   let cc = create(CallbackData[T])
#   proc drop(p: pointer) {.cdecl.} =
#     echo "plugin2: drop ", cast[int](p)
#     let p = cast[ptr CallbackData[T]](p)
#     `=destroy`(p[])
#     dealloc(p)

#   cc[] = CallbackData[T](drop: drop, data: T(cb: cb))
#   newCallback(cast[uint32](cc), T.handleKey, deallocCallbackKey)

# proc findStuff(l: WitList[WitString], cb: OnCallback.sig): WitList[WitString] =
#   let cb = OnCallback.wrapCallback(cb)
#   let cb2 = OnCallback2.wrapCallback proc(a: int32): int32 = a * a
#   findStuff(@@[ws"hello, world", ws"a", ws"ab", ws"abc", ws"abcd", ws"abcde"], cb, cb2)

proc NimMain() {.importc.}
proc emscripten_stack_init() {.importc.}

proc start() =
  emscripten_stack_init()
  NimMain()

  echo "plugin2: start"
  foo()
  echo "plugin2: mid"
  # echo "plugin2: -> ", findStuff(@@[ws"hello, world", ws"a", ws"ab", ws"abc", ws"abcd", ws"abcde"], (s) {.closure, gcsafe, raises: [].} => s.len mod 2 == 1)
  echo "===================================="
  # echo "plugin2: -> ", findStuff(@@[ws"hello, world", ws"a", ws"ab", ws"abc", ws"abcd", ws"abcde"], (s) {.closure, gcsafe, raises: [].} => s.len mod 2 == 0)
  echo "plugin2: end"

  # let cb = OnOnLater.wrapCallback proc(a: Option[WitString]): void =
  #   echo "plugin2: later ", a

  # callLater(cb)
