import std/[macros, options, strutils]
import wit

type WitNimTypeNameContext* = enum Field, Parameter, Return

proc getTypeName*(ctx: WitContext, typ: WitType, context: WitNimTypeNameContext): NimNode =
  if typ.builtin != "":
    return ctx.builtinToNimName(typ.builtin).ident
  case ctx.types[typ.index].kind:

  of Tuple:
    result = nnkTupleConstr.newTree()
    for f in ctx.types[typ.index].fields:
      result.add ctx.getTypeName(f.typ, context)

  of Option:
    return nnkBracketExpr.newTree(ident"Option", ctx.getTypeName(ctx.types[typ.index].optionTarget, context))

  of List:
    if ctx.useCustomBuiltinTypes:
      return nnkBracketExpr.newTree(ident"WitList", ctx.getTypeName(ctx.types[typ.index].listTarget, context))
    else:
      return nnkBracketExpr.newTree(ident"seq", ctx.getTypeName(ctx.types[typ.index].listTarget, context))

  of Result:
    return nnkBracketExpr.newTree(ident"Result",
      ctx.getTypeName(ctx.types[typ.index].resultOkTarget, context), ctx.getTypeName(ctx.types[typ.index].resultErrTarget, context))

  of Handle:
    let targetType = ctx.types[typ.index].handleTarget
    if ctx.types[typ.index].owned and context == Parameter:
      return nnkCommand.newTree(ident"sink", ctx.getTypeName(targetType, context))
    elif not ctx.types[typ.index].owned and context == Return:
      return nnkCommand.newTree(ident"lent", ctx.getTypeName(targetType, context))
    else:
      # todo: Field context owned vs borrowed
      return ctx.getTypeName(targetType, context)

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
        let fieldType = ctx.getTypeName(field.typ, Field)
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
              ctx.getTypeName(f.typ, Field),
              newEmptyNode())))
        else:
          addElse = true

      if addElse:
        cases.add nnkElse.newTree(nnkRecList.newTree(newNilLit()))

      var objectType = nnkObjectTy.newTree(newEmptyNode(), newEmptyNode(), nnkRecList.newTree(cases))
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name.toCamelCase(true))), newEmptyNode(), objectType)

    of Resource:
      var recList = nnkRecList.newTree()
      recList.add nnkIdentDefs.newTree(nnkPostfix.newTree(ident"*", ident("handle")), ident"int32", newEmptyNode())
      var objType = nnkObjectTy.newTree(newEmptyNode(), newEmptyNode(), recList)
      typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name.toCamelCase(true))), newEmptyNode(), objType)

    else:
      discard

  return typeSection
