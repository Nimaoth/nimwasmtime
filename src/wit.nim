import std/[strformat, macros, strutils, json, jsonutils, enumerate, options, sequtils, math, tables]

type
  WitUserTypeKind* = enum Builtin, Record, Flags, Enum, Variant, Option, List, Result, Tuple, Owned, Borrowed

  RecordField* = tuple[name: string, typ: WitType]
  WitUserType* = object
    index*: int
    name*: string
    refIndex*: Option[int]
    case kind*: WitUserTypeKind
    of Record, Variant, Tuple:
      fields*: seq[RecordField]
    of Enum, Flags:
      cases*: seq[string]
    of Option:
      optionTarget*: WitType
    of List:
      listTarget*: WitType
    of Result:
      resultOkTarget*: WitType
      resultErrTarget*: WitType
    else:
      discard

  WitType* = object
    builtin*: string
    index*: int

  WitFuncParam* = tuple[name: string, typ: WitType]

  WitFuncKind* = enum Freestanding = "freestanding"
  WitFunc* = object
    name*: string
    env*: string
    kind*: WitFuncKind
    params*: seq[WitFuncParam]
    results*: seq[WitType]

  WitInterface* = object
    name*: string
    funcs*: seq[WitFunc]

  CoreType* = enum
    I8
    I16
    I32
    I64
    F32
    F64

  CoreFuncType* = object
    paramsFlat*: bool # Whether the parameters should be flattened into arguments
    resultsFlat*: bool # Whether the results should be flattened into arguments
    params*: seq[CoreType]
    results*: seq[CoreType]

  WitContext* = ref object
    types*: seq[WitUserType]
    flatSizeMap*: Table[int, int]
    interfaces*: seq[WitInterface]
    funcs*: seq[WitFunc]
    useCustomBuiltinTypes*: bool

proc fromJsonHook*(self: var WitType, json: JsonNode) =
  case json.kind
  of JString:
    self.builtin = json.getStr

  of JInt:
    self.index = json.getInt

  of JNull:
    self.builtin = "void"

  else:
    assert false

proc toCamelCase*(str: string, capitalizeFirst: bool): string =
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

proc collectFuncs(ctx: WitContext, json: JsonNode, env: string): seq[WitFunc] =
  for name, val in json:
    if val.hasKey("interface"):
      let index = val["interface"]["id"].getInt
      for f in ctx.interfaces[index].funcs:
        var f = f
        f.env = name
        ctx.funcs.add f

    elif val.hasKey("function"):
      ctx.funcs.add val["function"].parseWitFunc(env)

proc collectFuncsInRoot(ctx: WitContext, json: JsonNode, worldName: string) =
  for world in json["worlds"]:
    if world.hasKey("imports"):
      ctx.funcs.add ctx.collectFuncs(world["imports"], "")

    # if world.hasKey("exports"):
    #   for name, exp in world["exports"]:
    #     echo &"export {name} -> {exp}"

proc collectInterfaces(ctx: WitContext, json: JsonNode) =
  for interfac in json["interfaces"]:
    var res = WitInterface()
    res.name = interfac["name"].getStr
    ctx.interfaces.add res

  for i, interfac in json["interfaces"].elems:
    if interfac.hasKey("functions"):
      for name, val in interfac["functions"]:
        ctx.interfaces[i].funcs.add val.parseWitFunc(ctx.interfaces[i].name)

proc collectTypes(ctx: WitContext, json: JsonNode) =
  if not json.hasKey("types"):
    return

  var res: seq[WitUserType]

  for t in json["types"]:
    assert t.kind == JObject
    let name = t["name"].getStr

    let kind = t["kind"]
    if kind.hasKey("record"):
      var fields: seq[RecordField]
      for field in kind["record"]["fields"]:
        let name = field["name"].getStr
        fields.add (name, field["type"].jsonTo(WitType))
      res.add(WitUserType(kind: Record, index: res.len, name: name, fields: fields))

    elif kind.hasKey("enum"):
      var cases: seq[string]
      for cas in kind["enum"]["cases"]:
        let name = cas["name"].getStr
        cases.add name
      res.add(WitUserType(kind: Enum, index: res.len, name: name, cases: cases))

    elif kind.hasKey("flags"):
      var cases: seq[string]
      for field in kind["flags"]["flags"]:
        let name = field["name"].getStr
        cases.add name
      res.add(WitUserType(kind: Flags, index: res.len, name: name, cases: cases))

    elif kind.hasKey("option"):
      let typ = kind["option"].jsonTo(WitType)
      res.add(WitUserType(kind: Option, index: res.len, optionTarget: typ))

    elif kind.hasKey("list"):
      let typ = kind["list"].jsonTo(WitType)
      res.add(WitUserType(kind: List, index: res.len, listTarget: typ))

    elif kind.hasKey("result"):
      let okTyp = kind["result"]["ok"].jsonTo(WitType)
      let errTyp = kind["result"]["err"].jsonTo(WitType)
      res.add(WitUserType(kind: Result, index: res.len, resultOkTarget: okTyp, resultErrTarget: errTyp))

    elif kind.hasKey("type"):
      let index = kind["type"].getInt
      var t = res[index]
      t.index = res.len
      t.refIndex = index.some
      res.add(t)

    elif kind.hasKey("variant"):
      var fields: seq[RecordField]
      for field in kind["variant"]["cases"]:
        let name = field["name"].getStr
        fields.add (name, field["type"].jsonTo(WitType))
      res.add(WitUserType(kind: Variant, index: res.len, name: name, fields: fields))

    elif kind.hasKey("tuple"):
      var fields: seq[RecordField]
      for i, field in kind["tuple"]["types"].elems:
        fields.add ($i, field.jsonTo(WitType))
      res.add(WitUserType(kind: Tuple, index: res.len, fields: fields))

    else:
      error(&"Not implemented: collectType({t})")

  ctx.types = res.ensureMove

proc builtinToNimName*(ctx: WitContext, builtin: string): string =
  return case builtin
  of "void": "void"
  of "bool": "bool"
  of "char": "Rune"
  of "string":
    if ctx.useCustomBuiltinTypes:
      "WitString"
    else:
      "string"
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

proc nimTypeName*(typ: CoreType): string =
  return case typ
  of I8: "int8"
  of I16: "int16"
  of I32: "int32"
  of I64: "int64"
  of F32: "float32"
  of F64: "float64"

proc despecialize(ctx: WitContext, typ: WitType): WitUserType =
  case typ.builtin
  of "":
    let userType = ctx.types[typ.index]
    case userType.kind
    of Tuple:
      return WitUserType(kind: Record, index: userType.index, fields: userType.fields)
    of Enum:
      return WitUserType(kind: Variant, index: userType.index, fields: userType.cases.mapIt((name: it, typ: WitType(builtin: "void"))))
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

proc flattenType*(ctx: WitContext, typ: WitType): seq[CoreType]

proc flattenList(ctx: WitContext, typ: WitUserType): seq[CoreType] =
  # todo: static len
  result = @[CoreType.I32, CoreType.I32]

proc flattenRecord(ctx: WitContext, typ: WitUserType): seq[CoreType] =
  for f in typ.fields:
    result.add ctx.flattenType(f.typ)

proc normalize*(a: CoreType): CoreType =
  case a
  of I8, I16: I32
  else: a

proc join(a, b: CoreType): CoreType =
  let a = a.normalize
  let b = b.normalize
  if a == b:
    return a
  if (a == I32 and b == F32) or (a == F32 and b == I32):
    return I32
  return I64

func byteSize*(self: CoreType): int =
  case self
  of I8: 1
  of I16: 2
  of I32, F32: 4
  of I64, F64: 8

func byteAlignment*(self: CoreType): int =
  case self
  of I8: 1
  of I16: 2
  of I32, F32: 4
  of I64, F64: 8

func paramsByteSize*(self: CoreFuncType): int =
  for p in self.params:
    while result mod p.byteAlignment != 0:
      inc result
    result += p.byteSize

func resultsByteSize*(self: CoreFuncType): int =
  for p in self.results:
    while result mod p.byteAlignment != 0:
      inc result
    result += p.byteSize

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

  var valueAlignment = 1
  for i in 1..result.high:
    valueAlignment = max(valueAlignment, result[i].byteAlignment)

  result[0] = case valueAlignment
  of 1: I8
  of 2: I16
  of 4: I32
  of 8: I64
  else:
    error("Invalid alignment for variant " & $typ)

proc flattenType*(ctx: WitContext, typ: WitType): seq[CoreType] =
  let typ = ctx.despecialize(typ)
  result = case typ.kind
  of Builtin:
    case typ.name
    of "void": @[]
    of "bool": @[CoreType.I32]
    of "char": @[CoreType.I32]
    of "string": @[CoreType.I32, CoreType.I32]
    of "s8", "u8": @[CoreType.I8]
    of "s16", "u16": @[CoreType.I16]
    of "s32", "u32": @[CoreType.I32]
    of "s64", "u64": @[CoreType.I64]
    of "f32": @[CoreType.F32]
    of "f64": @[CoreType.F32]
    else:
      assert false
      @[]

  of List: ctx.flattenList(typ)
  of Record: ctx.flattenRecord(typ)
  of Variant: ctx.flattenVariant(typ)
  of Flags: ctx.flattenType(discriminantType(typ.cases.len))
  of Owned, Borrowed: @[CoreType.I32]

  else:
    error("Not implemented: flattenType(" & $typ & ")")
    @[]

  ctx.flatSizeMap[typ.index] = result.len

proc flatTypeSize*(ctx: WitContext, typ: WitType): int =
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

proc flattenFuncType*(ctx: WitContext, fun: WitFunc): tuple[actual: CoreFuncType, target: CoreFuncType] =
  result.target.params = ctx.flattenTypes(fun.params)
  result.target.results = ctx.flattenTypes(fun.results)

  result.target.paramsFlat = true
  result.target.resultsFlat = true

  result.actual = result.target

  if result.actual.params.len > MAX_FLAT_PARAMS:
    result.actual.params = @[CoreType.I32]
    result.actual.paramsFlat = false

  if result.actual.results.len > MAX_FLAT_RESULTS:
    # Context == lower??
    result.actual.params.add @[CoreType.I32]
    result.actual.results = @[]
    result.actual.resultsFlat = false

proc newWitContext*(witJson: JsonNode): WitContext =
  result = WitContext()
  result.collectTypes(witJson)
  result.collectInterfaces(witJson)
  result.collectFuncsInRoot(witJson, "test-world")
