import std/[strformat, macros, strutils, json, jsonutils, enumerate, options, sequtils, math, tables]

type
  CoreType* = enum
    I32
    I64
    F32
    F64

  SimpleComponentType* = enum
    Bool,
    S8, U8, S16, U16, S32, U32, S64, U64,
    F32, F64,
    Char,

  CoreFuncType* = object
    paramsFlat*: bool # Whether the parameters should be flattened into arguments
    resultsFlat*: bool # Whether the results should be flattened into arguments
    params*: seq[CoreType]
    results*: seq[CoreType]

  ComponentFuncType* = object
    paramsFlat*: bool # Whether the parameters should be flattened into arguments
    resultsFlat*: bool # Whether the results should be flattened into arguments
    params*: seq[SimpleComponentType]
    results*: seq[SimpleComponentType]

  WitFlattenContext* = enum Lower, Lift

  RecordField* = tuple[name: string, typ: WitType]

  WitUserTypeKind* = enum Builtin, Record, Flags, Enum, Variant, Option, List, Result, Tuple, Resource, Handle
  WitUserType* = object
    index*: int
    name*: string
    refIndex*: Option[int]
    interfaceName*: string
    env*: string
    package*: int
    docs*: string
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
    of Handle:
      owned*: bool
      handleTarget*: WitType
    else:
      discard

  WitType* = object
    builtin*: string
    index*: int

  WitFuncParam* = tuple[name: string, typ: WitType]

  WitFuncKind* = enum Freestanding = "freestanding", Constructor = "constructor", Method = "method", Static = "static"
  WitFunc* = object
    name*: string
    env*: string
    interfaceName*: string
    interfac*: Option[int]
    kind*: WitFuncKind
    resource*: WitType
    params*: seq[WitFuncParam]
    results*: seq[WitType]
    docs*: string

  WitInterface* = object
    name*: string
    funcs*: seq[WitFunc]
    types*: seq[int] # index into ctx.types
    imports*: seq[string]
    package*: int

  WitWorld* = object
    name*: string
    package*: int
    funcs*: seq[WitFunc]
    exports*: seq[WitFunc]

  WitPackage* = object
    name*: string
    interfaces*: Table[string, int]
    worlds*: Table[string, int]

  WitContext* = ref object
    packages*: seq[WitPackage]
    worlds*: seq[WitWorld]
    types*: seq[WitUserType]
    flatSizeMap*: Table[int, int]
    interfaces*: seq[WitInterface]
    useCustomBuiltinTypes*: bool
    nameMap*: Table[string, string]

proc getInterface*(ctx: WitContext, name: string): lent WitInterface =
  for i in ctx.interfaces:
    if i.name == name:
      return i
  error("Unknown interface " & name)

proc getWorld*(ctx: WitContext, name: string): lent WitWorld =
  for w in ctx.worlds:
    if w.name == name:
      return w
  error("Unknown world " & name)

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

proc getWitTypeName*(ctx: WitContext, typ: WitType): string =
  if typ.builtin != "":
    return typ.builtin
  case ctx.types[typ.index].kind:

  of Tuple:
    result = "tuple<"
    for i, f in ctx.types[typ.index].fields:
      if i > 0:
        result.add ", "
      result.add ctx.getWitTypeName(f.typ)

  of Option:
    return "option<" & ctx.getWitTypeName(ctx.types[typ.index].optionTarget) & ">"

  of List:
    return "list<" & ctx.getWitTypeName(ctx.types[typ.index].listTarget) & ">"

  of Result:
    if ctx.types[typ.index].resultErrTarget.builtin == "void":
      return "result<" & ctx.getWitTypeName(ctx.types[typ.index].resultOkTarget) & ">"

    return "result<" & ctx.getWitTypeName(ctx.types[typ.index].resultOkTarget) & ", " & ctx.getWitTypeName(ctx.types[typ.index].resultErrTarget) & ">"

  of Handle:
    let targetType = ctx.types[typ.index].handleTarget
    if ctx.types[typ.index].owned:
      return ctx.getWitTypeName(targetType)
    else:
      return "borrow<" & ctx.getWitTypeName(ctx.types[typ.index].handleTarget) & ">"

  else:
    if ctx.types[typ.index].name == "":
      error("type without name: " & $ctx.types[typ.index])
    return ctx.types[typ.index].name

proc getNimName*(ctx: WitContext, str: string, capitalizeFirst: bool): string =
  ctx.nameMap.withValue(str, name):
    return name[].toCamelCase(capitalizeFirst)
  return str.toCamelCase(capitalizeFirst)

proc isHandle*(ctx: WitContext, typ: WitType): bool =
  if typ.builtin == "":
    return ctx.types[typ.index].kind == Handle

proc isOwnedHandle*(ctx: WitContext, typ: WitType): bool =
  if typ.builtin == "":
    let userType = ctx.types[typ.index]
    return userType.kind == Handle and userType.owned

proc isBorrowedHandle*(ctx: WitContext, typ: WitType): bool =
  if typ.builtin == "":
    let userType = ctx.types[typ.index]
    return userType.kind == Handle and not userType.owned

proc parseWitFunc(json: JsonNode, env: string, interfac: Option[int] = int.none): WitFunc =
  # echo &"parseWitFunc {env}, {json}"
  result.name = json["name"].getStr

  let kind = json["kind"]
  if kind.kind == JString:
    result.kind = kind.jsonTo(WitFuncKind)
  elif kind.hasKey("constructor"):
    result.kind = WitFuncKind.Constructor
    result.resource = kind["constructor"].jsonTo(WitType)
  elif kind.hasKey("method"):
    result.kind = WitFuncKind.Method
    result.resource = kind["method"].jsonTo(WitType)
  elif kind.hasKey("static"):
    result.kind = WitFuncKind.Static
    result.resource = kind["static"].jsonTo(WitType)
  else:
    error("Invalid func kind " & $kind)

  if json.hasKey("docs"):
    result.docs = json["docs"]["contents"].getStr

  result.params = json["params"].elems.mapIt((it["name"].getStr, it["type"].jsonTo(WitType)))
  result.results = json["results"].elems.mapIt(it["type"].jsonTo(WitType))
  result.env = env
  result.interfac = interfac

proc collectFuncs(ctx: WitContext, json: JsonNode, packageIdx: int): seq[WitFunc] =
  for name, val in json:
    if val.hasKey("interface"):
      let index = val["interface"]["id"].getInt
      let interfaceName = if ctx.interfaces[index].name == "":
        name
      else:
        ctx.interfaces[index].name
      let env = if ctx.interfaces[index].name == "":
        name
      else:
        ctx.packages[ctx.interfaces[index].package].name & "/" & interfaceName

      for f in ctx.interfaces[index].funcs:
        var f = f
        f.interfaceName = interfaceName
        f.env = env
        result.add f

    elif val.hasKey("function"):
      result.add val["function"].parseWitFunc("")

proc collectFuncsInRoot(ctx: WitContext, json: JsonNode) =
  for world in json["worlds"]:
    var w = WitWorld()
    w.name = world["name"].getStr
    w.package = world["package"].getInt

    if world.hasKey("imports"):
      w.funcs.add ctx.collectFuncs(world["imports"], w.package)

      for name, val in world["imports"]:
        if val.hasKey("interface"):
          let index = val["interface"]["id"].getInt
          if ctx.interfaces[index].name == "":
            ctx.interfaces[index].name = name

    if world.hasKey("exports"):
      w.exports.add ctx.collectFuncs(world["exports"], w.package)

    ctx.worlds.add w

proc collectInterfaces(ctx: WitContext, json: JsonNode) =
  for interfac in json["interfaces"]:
    var res = WitInterface()
    res.name = interfac["name"].getStr
    res.package = interfac["package"].getInt
    if interfac.hasKey("types"):
      for name, index in interfac["types"].fields.pairs:
        res.types.add index.jsonTo(int)

    ctx.interfaces.add res

  for i, interfac in json["interfaces"].elems:
    if interfac.hasKey("functions"):
      for name, val in interfac["functions"]:
        ctx.interfaces[i].funcs.add val.parseWitFunc(ctx.interfaces[i].name, i.some)

proc parsePackage(ctx: WitContext, json: JsonNode): WitPackage =
  return json.jsonTo(WitPackage)

proc collectPackages(ctx: WitContext, json: JsonNode) =
  if not json.hasKey("packages"):
    return

  for p in json["packages"]:
    ctx.packages.add ctx.parsePackage(p)

proc collectTypes(ctx: WitContext, json: JsonNode) =
  if not json.hasKey("types"):
    return

  var res: seq[WitUserType]

  for t in json["types"]:
    assert t.kind == JObject
    let name = t["name"].getStr

    let (interfaceName, package) = if t.hasKey("owner") and t["owner"].kind == JObject and t["owner"].hasKey("interface"):
      let index = t["owner"]["interface"].getInt
      (ctx.interfaces[index].name, ctx.interfaces[index].package)
    else:
      ("", 0)
    let env = if interfaceName == "":
      "env" # todo
    else:
      ctx.packages[package].name & "/" & interfaceName

    var docs = ""
    if t.hasKey("docs"):
      docs = t["docs"]["contents"].getStr

    let kind = t["kind"]
    if kind.kind == JString:
      case kind.getStr
      of "resource":
        res.add(WitUserType(kind: Resource, name: name, interfaceName: interfaceName, env: env, package: package, docs: docs))
      else:
        error(&"Not implemented: collectType({kind})")
      continue

    if kind.hasKey("record"):
      var fields: seq[RecordField]
      for field in kind["record"]["fields"]:
        let name = field["name"].getStr
        fields.add (name, field["type"].jsonTo(WitType))
      res.add(WitUserType(kind: Record, index: res.len, name: name, fields: fields, interfaceName: interfaceName, env: env, package: package, docs: docs))

    elif kind.hasKey("enum"):
      var cases: seq[string]
      for cas in kind["enum"]["cases"]:
        let name = cas["name"].getStr
        cases.add name
      res.add(WitUserType(kind: Enum, index: res.len, name: name, cases: cases, interfaceName: interfaceName, env: env, package: package, docs: docs))

    elif kind.hasKey("flags"):
      var cases: seq[string]
      for field in kind["flags"]["flags"]:
        let name = field["name"].getStr
        cases.add name
      res.add(WitUserType(kind: Flags, index: res.len, name: name, cases: cases, interfaceName: interfaceName, env: env, package: package, docs: docs))

    elif kind.hasKey("option"):
      let typ = kind["option"].jsonTo(WitType)
      res.add(WitUserType(kind: Option, index: res.len, optionTarget: typ, interfaceName: interfaceName, env: env, package: package, docs: docs))

    elif kind.hasKey("list"):
      let typ = kind["list"].jsonTo(WitType)
      res.add(WitUserType(kind: List, index: res.len, listTarget: typ, interfaceName: interfaceName, env: env, package: package, docs: docs))

    elif kind.hasKey("result"):
      let okTyp = kind["result"]["ok"].jsonTo(WitType)
      let errTyp = kind["result"]["err"].jsonTo(WitType)
      res.add(WitUserType(kind: Result, index: res.len, resultOkTarget: okTyp, resultErrTarget: errTyp, interfaceName: interfaceName, env: env, package: package, docs: docs))

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
      res.add(WitUserType(kind: Variant, index: res.len, name: name, fields: fields, interfaceName: interfaceName, env: env, package: package, docs: docs))

    elif kind.hasKey("tuple"):
      var fields: seq[RecordField]
      for i, field in kind["tuple"]["types"].elems:
        fields.add ($i, field.jsonTo(WitType))
      res.add(WitUserType(kind: Tuple, index: res.len, fields: fields, interfaceName: interfaceName, env: env, package: package, docs: docs))

    elif kind.hasKey("handle"):
      if kind["handle"].hasKey("own"):
        res.add(WitUserType(kind: Handle, owned: true, handleTarget: kind["handle"]["own"].jsonTo(WitType), interfaceName: interfaceName, env: env, package: package, docs: docs))
      elif kind["handle"].hasKey("borrow"):
        res.add(WitUserType(kind: Handle, owned: false, handleTarget: kind["handle"]["borrow"].jsonTo(WitType), interfaceName: interfaceName, env: env, package: package, docs: docs))
      else:
        error(&"Not implemented: collectType({t})")

    else:
      error(&"Not implemented: collectType({t})")

  ctx.types = res.ensureMove

proc toCoreType*(typ: SimpleComponentType): CoreType =
  case typ
  of Bool: CoreType.I32
  of S8, U8, S16, U16, S32, U32: CoreType.I32
  of S64, U64: CoreType.I64
  of F32: CoreType.F32
  of F64: CoreType.F64
  of Char: CoreType.I32

proc toCoreTypes*(typ: openArray[SimpleComponentType]): seq[CoreType] =
  typ.mapIt(it.toCoreType)

proc toCoreType*(typ: ComponentFuncType): CoreFuncType =
  result.paramsFlat = typ.paramsFlat
  result.resultsFlat = typ.resultsFlat
  result.params = typ.params.toCoreTypes
  result.results = typ.results.toCoreTypes

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
  of I32: "int32"
  of I64: "int64"
  of F32: "float32"
  of F64: "float64"

proc nimTypeName*(typ: SimpleComponentType): string =
  return case typ
  of Bool: "bool"
  of S8: "int8"
  of S16: "int16"
  of S32: "int32"
  of S64: "int64"
  of U8: "uint8"
  of U16: "uint16"
  of U32: "uint32"
  of U64: "uint64"
  of F32: "float32"
  of F64: "float64"
  of Char: "Rune"

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

proc flattenType*(ctx: WitContext, typ: WitType): seq[SimpleComponentType]

proc flattenList(ctx: WitContext, typ: WitUserType): seq[SimpleComponentType] =
  # todo: static len
  result = @[SimpleComponentType.S32, SimpleComponentType.S32]

proc flattenRecord(ctx: WitContext, typ: WitUserType): seq[SimpleComponentType] =
  for f in typ.fields:
    result.add ctx.flattenType(f.typ)

proc join(a, b: SimpleComponentType): SimpleComponentType =
  let ac = a.toCoreType
  let bc = b.toCoreType
  if ac == bc:
    return a
  if (ac == I32 and bc == F32) or (ac == F32 and bc == I32):
    return S32
  return S64

func byteSize*(self: CoreType): int =
  case self
  of I32, F32: 4
  of I64, F64: 8

func byteAlignment*(self: CoreType): int =
  case self
  of I32, F32: 4
  of I64, F64: 8

func byteSize*(self: SimpleComponentType): int =
  case self
  of S8, U8, Bool: 1
  of S16, U16: 2
  of S32, U32, F32, Char: 4
  of S64, U64, F64: 8

func byteAlignment*(self: SimpleComponentType): int =
  case self
  of S8, U8, Bool: 1
  of S16, U16: 2
  of S32, U32, F32, Char: 4
  of S64, U64, F64: 8

func paramsByteSize*(self: CoreFuncType): int =
  var maxAlignment = 1
  for p in self.params:
    while result mod p.byteAlignment != 0:
      inc result
    maxAlignment = max(maxAlignment, p.byteAlignment)
    result += p.byteSize

  while result mod maxAlignment != 0:
    inc result

func resultsByteSize*(self: CoreFuncType): int =
  var maxAlignment = 1
  for p in self.results:
    while result mod p.byteAlignment != 0:
      inc result
    maxAlignment = max(maxAlignment, p.byteAlignment)
    result += p.byteSize

  while result mod maxAlignment != 0:
    inc result

proc byteSize*(ctx: WitContext, typ: WitType): int =
  let flat = ctx.flattenType(typ)
  var maxAlignment = 1
  for p in flat:
    while result mod p.byteAlignment != 0:
      inc result
    maxAlignment = max(maxAlignment, p.byteAlignment)
    result += p.byteSize

  while result mod maxAlignment != 0:
    inc result

proc flattenVariant(ctx: WitContext, typ: WitUserType): seq[SimpleComponentType] =
  var flat: seq[SimpleComponentType] = @[]
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
  of 1: S8
  of 2: S16
  of 4: S32
  of 8: S64
  else:
    error("Invalid alignment for variant " & $typ)

proc flattenType*(ctx: WitContext, typ: WitType): seq[SimpleComponentType] =
  let typ = ctx.despecialize(typ)
  result = case typ.kind
  of Builtin:
    case typ.name
    of "void": @[]
    of "bool": @[SimpleComponentType.Bool]
    of "char": @[SimpleComponentType.Char]
    of "string": @[SimpleComponentType.S32, SimpleComponentType.S32]
    of "s8": @[SimpleComponentType.S8]
    of "s16": @[SimpleComponentType.S16]
    of "s32": @[SimpleComponentType.S32]
    of "s64": @[SimpleComponentType.S64]
    of "u8": @[SimpleComponentType.U8]
    of "u16": @[SimpleComponentType.U16]
    of "u32": @[SimpleComponentType.U32]
    of "u64": @[SimpleComponentType.U64]
    of "f32": @[SimpleComponentType.F32]
    of "f64": @[SimpleComponentType.F64]
    else:
      assert false
      @[]

  of List: ctx.flattenList(typ)
  of Record: ctx.flattenRecord(typ)
  of Variant: ctx.flattenVariant(typ)
  of Flags: ctx.flattenType(discriminantType(typ.cases.len))
  of Resource, Handle: @[SimpleComponentType.S32]

  else:
    error("Not implemented: flattenType(" & $typ & ")")

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
  of Resource, Handle: 1

  else:
    assert false
    0

proc flattenTypes(ctx: WitContext, types: openArray[WitType]): seq[SimpleComponentType] =
  for t in types:
    result.add ctx.flattenType(t)

proc flattenTypes(ctx: WitContext, params: openArray[WitFuncParam]): seq[SimpleComponentType] =
  for p in params:
    result.add ctx.flattenType(p.typ)

const MAX_FLAT_PARAMS = 16
const MAX_FLAT_RESULTS = 1

proc flattenFuncType*(ctx: WitContext, fun: WitFunc, context: WitFlattenContext): tuple[actual: ComponentFuncType, target: ComponentFuncType] =
  result.target.params = ctx.flattenTypes(fun.params)
  result.target.results = ctx.flattenTypes(fun.results)

  result.target.paramsFlat = true
  result.target.resultsFlat = true

  result.actual = result.target

  if result.actual.params.len > MAX_FLAT_PARAMS:
    result.actual.params = @[SimpleComponentType.S32]
    result.actual.paramsFlat = false

  if result.actual.results.len > MAX_FLAT_RESULTS:
    case context
    of Lower:
      result.actual.params.add @[SimpleComponentType.S32]
      result.actual.results = @[]
      result.actual.resultsFlat = false
    of Lift:
      result.actual.results = @[SimpleComponentType.S32]
      result.actual.resultsFlat = false

proc newWitContext*(witJson: JsonNode): WitContext =
  result = WitContext()
  result.collectPackages(witJson)
  result.collectInterfaces(witJson)
  result.collectTypes(witJson)

  for i in result.interfaces.mitems:
    for t in i.types:
      let typeInterface = result.types[t].interfaceName
      if typeInterface != i.name and i.imports.find(typeInterface) == -1:
        i.imports.add typeInterface

  result.collectFuncsInRoot(witJson)
