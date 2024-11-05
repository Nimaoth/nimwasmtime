import std/[macros, options, strutils]
import wit

proc getTypeName*(ctx: WitContext, typ: WitType): NimNode =
  if typ.builtin != "":
    return ctx.builtinToNimName(typ.builtin).ident
  case ctx.types[typ.index].kind:

  of Tuple:
    result = nnkTupleConstr.newTree()
    for f in ctx.types[typ.index].fields:
      result.add ctx.getTypeName(f.typ)
  of Option:
    return nnkBracketExpr.newTree(ident"Option", ctx.getTypeName(ctx.types[typ.index].optionTarget))
  of List:
    if ctx.useCustomBuiltinTypes:
      return nnkBracketExpr.newTree(ident"WitList", ctx.getTypeName(ctx.types[typ.index].listTarget))
    else:
      return nnkBracketExpr.newTree(ident"seq", ctx.getTypeName(ctx.types[typ.index].listTarget))
  of Result:
    return nnkBracketExpr.newTree(ident"Result",
      ctx.getTypeName(ctx.types[typ.index].resultOkTarget), ctx.getTypeName(ctx.types[typ.index].resultErrTarget))
  else:
    if ctx.types[typ.index].name == "":
      error("type without name: " & $ctx.types[typ.index])
    return ctx.types[typ.index].name.toCamelCase(true).ident

proc genTypeSection*(ctx: WitContext): NimNode =
  var typeSection = nnkTypeSection.newTree()

  for t in ctx.types:
    if t.refIndex.isSome:
      continue

    case t.kind
    of Record:
      var recList = nnkRecList.newTree()
      for field in t.fields:
        let fieldType = ctx.getTypeName(field.typ)
        recList.add nnkIdentDefs.newTree(nnkPostfix.newTree(ident"*", ident(field.name.toCamelCase(false))), fieldType, newEmptyNode())
      var objType = nnkObjectTy.newTree(newEmptyNode(), newEmptyNode(), recList)
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name.toCamelCase(true))), newEmptyNode(), objType)

    of Enum:
      var enumType = nnkEnumTy.newTree(newEmptyNode())
      for cas in t.cases:
        enumType.add nnkEnumFieldDef.newTree(ident(cas.toCamelCase(true)), newLit(cas))
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name.toCamelCase(true))), newEmptyNode(), enumType)

    of Flags:
      let (enumName, flagsName) = if t.name.endsWith("s"):
        (t.name[0..^2].toCamelCase(true), t.name.toCamelCase(true))
      else:
        (t.name.toCamelCase(true), (t.name & "s").toCamelCase(true))

      var enumType = nnkEnumTy.newTree(newEmptyNode())
      for cas in t.cases:
        enumType.add nnkEnumFieldDef.newTree(ident(cas.toCamelCase(true)), newLit(cas))
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(enumName)), newEmptyNode(), enumType)

      var flagsType = nnkBracketExpr.newTree(ident"set", ident(enumName))
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(flagsName)), newEmptyNode(), flagsType)

    of Variant:
      var enumType = nnkEnumTy.newTree(newEmptyNode())
      for f in t.fields:
        enumType.add nnkEnumFieldDef.newTree(ident(f.name.toCamelCase(true)), newLit(f.name))

      let kindTypeName = ident(t.name.toCamelCase(true) & "Kind")
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
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name.toCamelCase(true))), newEmptyNode(), objectType)

    else:
      discard

  return typeSection
