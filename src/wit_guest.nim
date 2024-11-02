import std/[strformat, os, macros, strutils, json, jsonutils, genasts, enumerate, options, sequtils, math, sugar, tables]

when not declared(buildOS):
  const buildOS {.magic: "BuildOS".}: string = hostOS
const windowsHost = buildOS == "windows"
const cmdPrefix = when windowsHost: "cmd /E:ON /C " else: ""

func hostQuoteShell(s: string): string =
  ## Quote ``s``, so it can be safely passed to shell.
  when not defined(windows) and windowsHost:
    result = quoteShellWindows(s)
  else:
    result = quoteShell(s)

macro wasmexport*(t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)
  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit"EMSCRIPTEN_KEEPALIVE $# $#$#")
  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree(codeGen)
  else:
    newProc[4].add codeGen
  newProc[4].add ident"exportC"
  result = newStmtList()
  result.add:
    quote do:
      {.emit: "/*INCLUDESECTION*/\n#include <emscripten.h>".}
  result.add:
    newProc

macro wasmimport*(name: static[string], env: static[string], t: typed): untyped =
  if t.kind notin {nnkProcDef, nnkFuncDef}:
    error("Can only export procedures", t)

  let module = env
  let name = name

  let attrib = if module != "":
    &"""__attribute__((__import_module__("{module}"), __import_name__("{name}")))"""
  else:
    &"""__attribute__((__import_name__("{name}")))"""

  let
    newProc = copyNimTree(t)
    codeGen = nnkExprColonExpr.newTree(ident"codegendecl", newLit(attrib & " $# $#$#"))

  if newProc[4].kind == nnkEmpty:
    newProc[4] = nnkPragma.newTree()

  newProc[4] = nnkPragma.newTree(codeGen)
  newProc[4].add ident"importc"

  result = newStmtList()
  result.add:
    newProc

type
  WitUserTypeKind* = enum Builtin, Record, Flags, Enum, Variant, Option, List, Result, Tuple, Owned, Borrowed

  RecordField = tuple[name: string, typ: WitType]
  WitUserType* = object
    index: int
    name: string
    refIndex: Option[int]
    case kind: WitUserTypeKind
    of Record, Variant, Tuple:
      fields: seq[RecordField]
    of Enum:
      enumCases: seq[string]
    of Option:
      optionTarget: WitType
    of List:
      listTarget: WitType
    of Result:
      resultOkTarget: WitType
      resultErrTarget: WitType
    else:
      discard

  WitType* = object
    builtin: string
    index: int

  WitFuncParam* = tuple[name: string, typ: WitType]

  WitFuncKind = enum Freestanding = "freestanding"
  WitFunc* = object
    name: string
    env: string
    kind: WitFuncKind
    params: seq[WitFuncParam]
    results: seq[WitType]

  WitInterface = object
    name: string
    funcs: seq[WitFunc]

  CoreType = enum
    I32
    I64
    F32
    F64

  CoreFuncType = object
    params: seq[CoreType]
    results: seq[CoreType]

  WitContext = ref object
    types: seq[WitUserType]
    flatSizeMap: Table[int, int]
    interfaces: seq[WitInterface]
    funcs: seq[WitFunc]

proc fromJsonHook(self: var WitType, json: JsonNode) =
  case json.kind
  of JString:
    self.builtin = json.getStr

  of JInt:
    self.index = json.getInt

  of JNull:
    self.builtin = "void"

  else:
    assert false

proc toCamelCase(str: string, capitalizeFirst: bool): string =
  for i, part in enumerate(str.split("-")):
    if i == 0 and not capitalizeFirst:
      result.add part
    else:
      result.add part.capitalizeAscii

proc parseWitFunc(json: JsonNode, env: string): WitFunc =
  result.name = json["name"].getStr
  result.kind = json["kind"].jsonTo(WitFuncKind)
  result.params = json["params"].elems.mapIt((it["name"].getStr, it["type"].jsonTo(WitType)))
  result.results = json["results"].elems.mapIt(it["type"].jsonTo(WitType))
  result.env = env

proc collectFuncs(json: JsonNode, interfaces: openArray[WitInterface], env: string): seq[WitFunc] =
  for name, val in json:
    if val.hasKey("interface"):
      let index = val["interface"]["id"].getInt
      for f in interfaces[index].funcs:
        var f = f
        f.env = name
        result.add f

    elif val.hasKey("function"):
      result.add val["function"].parseWitFunc(env)

proc collectFuncsInRoot(json: JsonNode, interfaces: openArray[WitInterface], worldName: string): seq[WitFunc] =
  for world in json["worlds"]:
    if world.hasKey("imports"):
      result.add collectFuncs(world["imports"], interfaces, "")

    # if world.hasKey("exports"):
    #   for name, exp in world["exports"]:
    #     echo &"export {name} -> {exp}"

proc collectInterfaces(json: JsonNode): seq[WitInterface] =
  for interfac in json["interfaces"]:
    var res = WitInterface()
    res.name = interfac["name"].getStr
    result.add res

  for i, interfac in json["interfaces"].elems:
    if interfac.hasKey("functions"):
      for name, val in interfac["functions"]:
        result[i].funcs.add val.parseWitFunc(result[i].name)

proc collectTypes(json: JsonNode): seq[WitUserType] =
  if not json.hasKey("types"):
    return

  for t in json["types"]:
    assert t.kind == JObject
    let name = t["name"].getStr

    let kind = t["kind"]
    if kind.hasKey("record"):
      var fields: seq[RecordField]
      for field in kind["record"]["fields"]:
        let name = field["name"].getStr
        fields.add (name.toCamelCase(false), field["type"].jsonTo(WitType))
      result.add(WitUserType(kind: Record, index: result.len, name: name.toCamelCase(true), fields: fields))

    elif kind.hasKey("enum"):
      var names: seq[string]
      for cas in kind["enum"]["cases"]:
        let name = cas["name"].getStr
        names.add name.toCamelCase(true)
      result.add(WitUserType(kind: Enum, index: result.len, name: name.toCamelCase(true), enumCases: names))

    elif kind.hasKey("option"):
      let typ = kind["option"].jsonTo(WitType)
      result.add(WitUserType(kind: Option, index: result.len, optionTarget: typ))

    elif kind.hasKey("list"):
      let typ = kind["list"].jsonTo(WitType)
      result.add(WitUserType(kind: List, index: result.len, listTarget: typ))

    elif kind.hasKey("result"):
      let okTyp = kind["result"]["ok"].jsonTo(WitType)
      let errTyp = kind["result"]["err"].jsonTo(WitType)
      result.add(WitUserType(kind: Result, index: result.len, resultOkTarget: okTyp, resultErrTarget: errTyp))

    elif kind.hasKey("type"):
      let index = kind["type"].getInt
      var t = result[index]
      t.index = result.len
      t.refIndex = index.some
      result.add(t)

    elif kind.hasKey("variant"):
      var fields: seq[RecordField]
      for field in kind["variant"]["cases"]:
        let name = field["name"].getStr
        fields.add (name.toCamelCase(false), field["type"].jsonTo(WitType))
      result.add(WitUserType(kind: Variant, index: result.len, name: name.toCamelCase(true), fields: fields))

    else:
      error(&"Unknown type {t}")

proc builtinToNimName(builtin: string): string =
  return case builtin
  of "void": "void"
  of "bool": "bool"
  of "char": "char"
  of "string": "string"
  of "s8": "int8"
  of "s16": "int16"
  of "s32": "int32"
  of "s64": "int64"
  of "u8": "uint8"
  of "u16": "uint16"
  of "u32": "uint32"
  of "u64": "uint64"
  of "f32": "float32"
  of "f64": "float64"
  else:
    assert false
    "unknown"

proc coreTypeToNimName(typ: CoreType): string =
  return case typ
  of I32: "int32"
  of I64: "int64"
  of F32: "float32"
  of F64: "float64"

proc getTypeName(ctx: WitContext, typ: WitType): NimNode =
  if typ.builtin != "":
    return builtinToNimName(typ.builtin).ident
  case ctx.types[typ.index].kind:
  # of Tuple:
  #   return nnkBracketExpr.newTree(ident"Option", ctx.getTypeName(ctx.types[typ.index].optionTarget))
  of Option:
    return nnkBracketExpr.newTree(ident"Option", ctx.getTypeName(ctx.types[typ.index].optionTarget))
  of List:
    return nnkBracketExpr.newTree(ident"seq", ctx.getTypeName(ctx.types[typ.index].listTarget))
  of Result:
    return nnkBracketExpr.newTree(ident"Result",
      ctx.getTypeName(ctx.types[typ.index].resultOkTarget), ctx.getTypeName(ctx.types[typ.index].resultErrTarget))
  else:
    return ctx.types[typ.index].name.ident

proc despecialize(ctx: WitContext, typ: WitType): WitUserType =
  case typ.builtin
  of "":
    let userType = ctx.types[typ.index]
    case userType.kind
    of Tuple:
      return WitUserType(kind: Variant, index: userType.index, fields: userType.fields)
    of Enum:
      return WitUserType(kind: Variant, index: userType.index, fields: userType.enumCases.mapIt((name: it, typ: WitType(builtin: "void"))))
    of Option:
      return WitUserType(kind: Variant, index: userType.index, fields: @[(name: "none", typ: WitType(builtin: "void")), (name: "some", typ: userType.optionTarget)])
    of Result:
      return WitUserType(kind: Variant, index: userType.index, fields: @[(name: "ok", typ: userType.resultOkTarget), (name: "error", typ: userType.resultErrTarget)])
    else:
      return userType

  else:
    return WitUserType(kind: Builtin, index: -1, name: typ.builtin)

proc discriminantType(cases: int): WitType =
  let bytes = (cases.float.log2.int / 8).ceil.int
  case bytes
  of 0: return WitType(builtin: "u8")
  of 1: return WitType(builtin: "u8")
  of 2: return WitType(builtin: "u16")
  of 3: return WitType(builtin: "u32")
  else:
    assert false

proc flattenType(ctx: WitContext, typ: WitType): seq[CoreType]

proc flattenList(ctx: WitContext, typ: WitUserType): seq[CoreType] =
  # todo: static len
  result = @[CoreType.I32, CoreType.I32]

proc flattenRecord(ctx: WitContext, typ: WitUserType): seq[CoreType] =
  for f in typ.fields:
    result.add ctx.flattenType(f.typ)

proc join(a, b: CoreType): CoreType =
  if a == b:
    return a
  if (a == I32 and b == F32) or (a == F32 and b == I32):
    return I32
  return I64

proc flattenVariant(ctx: WitContext, typ: WitUserType): seq[CoreType] =
  var flat: seq[CoreType] = @[]
  for c in typ.fields:
    if c.typ.index != 0 or c.typ.builtin != "void":
      for i, ft in ctx.flattenType(c.typ):
        if i < flat.len:
          flat[i] = join(flat[i], ft)
        else:
          flat.add ft

  result = ctx.flattenType(discriminantType(typ.fields.len)) & flat

proc flattenType(ctx: WitContext, typ: WitType): seq[CoreType] =
  let typ = ctx.despecialize(typ)
  result = case typ.kind
  of Builtin:
    case typ.name
    of "void": @[]
    of "bool": @[CoreType.I32]
    of "char": @[CoreType.I32]
    of "string": @[CoreType.I32, CoreType.I32]
    of "s8", "s16", "s32": @[CoreType.I32]
    of "u8", "u16", "u32": @[CoreType.I32]
    of "s64", "u64": @[CoreType.I64]
    of "f32": @[CoreType.F32]
    of "f64": @[CoreType.F32]
    else:
      assert false
      @[]

  of List: ctx.flattenList(typ)
  of Record: ctx.flattenRecord(typ)
  of Variant: ctx.flattenVariant(typ)
  of Flags: @[CoreType.I32]
  of Owned, Borrowed: @[CoreType.I32]

  else:
    assert false
    @[]

  ctx.flatSizeMap[typ.index] = result.len

proc flatTypeSize(ctx: WitContext, typ: WitType): int =
  let typ = ctx.despecialize(typ)
  case typ.kind
  of Builtin:
    case typ.name
    of "void": 0
    of "bool": 1
    of "char": 1
    of "string": 2
    of "s8", "s16", "s32": 1
    of "u8", "u16", "u32": 1
    of "s64", "u64": 1
    of "f32": 1
    of "f64": 1
    else:
      assert false
      0

  of List: ctx.flatSizeMap[typ.index]
  of Record: ctx.flatSizeMap[typ.index]
  of Variant: ctx.flatSizeMap[typ.index]
  of Flags: 1
  of Owned, Borrowed: 1

  else:
    assert false
    0

proc flattenTypes(ctx: WitContext, types: openArray[WitType]): seq[CoreType] =
  for t in types:
    result.add ctx.flattenType(t)

proc flattenTypes(ctx: WitContext, params: openArray[WitFuncParam]): seq[CoreType] =
  for p in params:
    result.add ctx.flattenType(p.typ)

const MAX_FLAT_PARAMS = 16
const MAX_FLAT_RESULTS = 1

proc flattenFuncType(ctx: WitContext, fun: WitFunc): CoreFuncType =
  var flatParams = ctx.flattenTypes(fun.params)
  var flatResults = ctx.flattenTypes(fun.results)

  if flatParams.len > MAX_FLAT_PARAMS:
    flatParams = @[CoreType.I32]
  if flatResults.len > MAX_FLAT_RESULTS:
    # Context == lower??
    flatParams.add @[CoreType.I32]
    flatResults = @[]

  return CoreFuncType(params: flatParams, results: flatResults)

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], param: NimNode, typ: WitType, outCode: NimNode) =
  # let typ = ctx.despecialize(typ)
  # echo &"lower {param.repr}: {typ}, {loweredArgs[0].treeRepr}, {typ}"
  case typ.builtin
  of "void":
    outCode.add nnkDiscardStmt.newTree(newEmptyNode())

  of "bool":
    let code = genAst(arg = loweredArgs[0]):
      # arg = true
      discard
    outCode.add code

  # of "char": 1
  of "string":
    let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
      if param.len > 0:
        loweredPtr = cast[int32](param[0].addr)
      else:
        loweredPtr = 0
      loweredLen = param.len
    outCode.add code

  of "s8", "s16", "s32", "s64", "u8", "u16", "u32", "u64", "f32", "f64":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      loweredArg = param
    outCode.add code

  of "":
    let userType = ctx.types[typ.index]
    case userType.kind
    of List:
      let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
        if param.len > 0:
          loweredPtr = cast[int32](param[0].addr)
        else:
          loweredPtr = 0
        loweredLen = param.len
      outCode.add code

    of Enum:
      let code = genAst(loweredArg = loweredArgs[0], param = param):
        loweredArg = cast[int32](param)
      outCode.add code

    of Option:
      let childAccess = nnkDotExpr.newTree(param, ident("get"))
      var lowerChild = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], childAccess, userType.optionTarget, lowerChild)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild):
        loweredTag = param.isSome.int32
        if param.isSome:
          lowerChild
      outCode.add code

    of Result:
      let childAccess = nnkDotExpr.newTree(param, ident("value"))
      let errAccess = nnkDotExpr.newTree(param, ident("error"))
      var lowerChild = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], childAccess, userType.resultOkTarget, lowerChild)
      var lowerError = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], errAccess, userType.resultErrTarget, lowerError)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild, lowerError):
        loweredTag = param.isErr.int32
        if param.isOk:
          lowerChild
        else:
          lowerError
      outCode.add code

    of Record:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name))
        ctx.lower(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Variant:
      var cases = nnkCaseStmt.newTree(nnkDotExpr.newTree(param, ident"kind"))
      var addElse = false

      for f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        var caseCode = nnkStmtList.newTree()
        ctx.lower(loweredArgs[1..^1], fieldAccess, f.typ, caseCode)
        cases.add nnkOfBranch.newTree(ident(f.name.toCamelCase(true)), caseCode)

      if addElse:
        cases.add nnkElse.newTree(nnkStmtList.newTree(nnkDiscardStmt.newTree(newEmptyNode())))

      let code = genAst(loweredTag = loweredArgs[0], param, cases):
        loweredTag = param.kind.int32
        cases
      outCode.add code

    # of Flags:
    # of Owned, Borrowed:

    else:
      # assert false
      return

  else:
    # assert false
    return

proc lower(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lower {p}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], p.typ, outCode)
    loweredI += ctx.flatTypeSize(p.typ)

macro witBindGenImpl(witPath: static[string], dir: static[string], body: untyped): untyped =
  let path = if witPath.isAbsolute:
    witPath
  else:
    dir / witPath

  let cmd = &"wasm-tools component wit {path.hostQuoteShell} --json"
  hint "Running: " & cmdPrefix & cmd
  let res = gorgeEx(cmdPrefix & cmd)
  if res.exitCode != 0:
    error("Failed to read wit files:\n" & res.output)

  let json = try:
    res.output.parseJson()
  except Exception as e:
    error("Failed to decode json from wit: " & e.msg & "\n" & res.output)

  var ctx: WitContext = WitContext()
  ctx.types = collectTypes(json)
  ctx.interfaces = collectInterfaces(json)
  ctx.funcs = collectFuncsInRoot(json, ctx.interfaces, "test-world")

  # echo res.output
  # echo "=== types"
  # echo ctx.types.join("\n")
  # echo "==="
  # echo "=== interfaces"
  # echo ctx.interfaces.join("\n")
  # echo "==="
  # echo "=== funcs"
  # echo ctx.funcs.join("\n")
  # echo "==="

  var typeSection = nnkTypeSection.newTree()

  for t in ctx.types:
    if t.refIndex.isSome:
      continue

    case t.kind
    of Record:
      var recList = nnkRecList.newTree()
      for field in t.fields:
        let fieldType = ctx.getTypeName(field.typ)
        recList.add nnkIdentDefs.newTree(nnkPostfix.newTree(ident"*", ident(field.name)), fieldType, newEmptyNode())
      var objType = nnkObjectTy.newTree(newEmptyNode(), newEmptyNode(), recList)
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name)), newEmptyNode(), objType)

    of Enum:
      var enumType = nnkEnumTy.newTree(newEmptyNode())
      for cas in t.enumCases:
        enumType.add ident(cas)
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name)), newEmptyNode(), enumType)

    of Variant:
      var enumType = nnkEnumTy.newTree(newEmptyNode())
      for f in t.fields:
        enumType.add nnkEnumFieldDef.newTree(ident(f.name.toCamelCase(true)), newLit(f.name))

      let kindTypeName = ident(t.name & "Kind")
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", kindTypeName), newEmptyNode(), enumType)

      var cases = nnkRecCase.newTree(nnkIdentDefs.newTree(
        nnkPostfix.newTree(ident"*", ident"kind"),
        kindTypeName,
        newEmptyNode()))

      var addElse = false
      for f in t.fields:
        if f.typ.builtin != "void":
          cases.add nnkOfBranch.newTree(
            ident(f.name.toCamelCase(true)),
            nnkRecList.newTree(nnkIdentDefs.newTree(
              ident(f.name.toCamelCase(false)),
              ctx.getTypeName(f.typ),
              newEmptyNode())))
        else:
          addElse = true

      if addElse:
        cases.add nnkElse.newTree(nnkRecList.newTree(newNilLit()))

      var objectType = nnkObjectTy.newTree(newEmptyNode(), newEmptyNode(), nnkRecList.newTree(cases))
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name)), newEmptyNode(), objectType)

    else:
      discard

  var funcList = nnkStmtList.newTree()

  let importTempl = genAst():
    proc foo*(a: int): bool {.wasmimport("", "").}

  let importWrapperTempl = genAst():
    proc foo*(a: int): bool =
      discard

  for f in ctx.funcs:
    let flatFuncType = ctx.flattenFuncType(f)

    let loweredArgs = collect:
      for i in 0..flatFuncType.params.high:
        ident("arg" & $i)

    case f.kind
    of Freestanding:
      let importedName = ident(f.name.toCamelCase(false) & "Imported")
      block:
        var fun = importTempl.copy()
        fun[0][1] = importedName

        fun[4][0][1] = newLit(f.name)
        fun[4][0][2] = newLit(f.env)

        let retType = if f.results.len == 0:
          ident"void"
        elif f.results.len == 1:
          ctx.getTypeName(f.results[0])
        else:
          var tup = nnkTupleConstr.newTree()
          for t in f.results:
            tup.add ctx.getTypeName(t)
          tup

        fun[3] = nnkFormalParams.newTree(retType)

        let args = collect:
          for i in 0..flatFuncType.params.high:
            ident("a" & $i)

        for i, t in flatFuncType.params:
          let n = ident(coreTypeToNimName(t))
          fun[3].add nnkIdentDefs.newTree(args[i], n, newEmptyNode())

        funcList.add fun

      ############################# Flat

      block:
        var fun = importWrapperTempl.copy()
        fun[0][1] = ident(f.name.toCamelCase(false))

        let retType = if f.results.len == 0:
          ident"void"
        elif f.results.len == 1:
          ctx.getTypeName(f.results[0])
        else:
          var tup = nnkTupleConstr.newTree()
          for t in f.results:
            tup.add ctx.getTypeName(t)
          tup

        fun[3] = nnkFormalParams.newTree(retType)

        var call = nnkCall.newTree(importedName)
        var vars = nnkVarSection.newTree()
        for i, arg in loweredArgs:
          let t = ident(coreTypeToNimName(flatFuncType.params[i]))
          vars.add nnkIdentDefs.newTree(arg, t, newEmptyNode())
          call.add arg

        let args = collect:
          for p in f.params:
            ident(p.name.toCamelCase(false))

        fun[6].add vars

        var lowerCode = nnkStmtList.newTree()
        ctx.lower(loweredArgs, args, f.params, lowerCode)

        fun[6].add lowerCode
        fun[6].add call

        for i, p in f.params:
          let t = ctx.getTypeName(p.typ)
          fun[3].add nnkIdentDefs.newTree(args[i], t, newEmptyNode())
        funcList.add fun

  let code = genAst(typeSection, funcList):
    {.push hint[DuplicateModuleImport]:off.}
    import std/[options]
    import results
    {.pop.}

    typeSection

    funcList

  hint "Write api to " & (dir / "witgen.nim")
  writeFile(dir / "witgen.nim", code.repr)
  return code

template witBindGen*(witPath: static[string], body: untyped): untyped =
  witBindGenImpl(witPath, instantiationInfo(-1, true).filename.replace("\\", "/").splitPath.head, body)
