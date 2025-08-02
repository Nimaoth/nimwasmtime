import std/[macros, options, strutils, genasts, sugar, tables]
import wit


type
  WitNimTypeNameContext* = enum Field, Parameter, Return
  WitParamTypeKind* = enum Builtin, User, OwnedResource, BorrowedResource

  WitLiftContext* = object
    memoryAccess*: proc(a: NimNode): NimNode = nil
    resourceAccess*: proc(typ: WitType, arg: NimNode, param: NimNode): NimNode = nil

  WitLowerContext* = object
    convertToCoreTypes*: bool = true
    copyMemory*: bool = false
    storeArg*: proc(arg: NimNode, param: NimNode): NimNode = nil
    memoryAccess*: proc(a: NimNode): NimNode = nil
    memoryAlloc*: proc(param: NimNode, typ: WitType, depth: int): tuple[code: NimNode, dataPtr: NimNode] = nil

  WitInterfaceGen* = object
    name*: string
    imports*: NimNode
    types*: NimNode
    functions*: NimNode

proc getParamTypeKind*(ctx: WitContext, typ: WitType): WitParamTypeKind =
  if typ.builtin != "":
    return Builtin

  case ctx.types[typ.index].kind:
  of Handle:
    if ctx.types[typ.index].owned:
      OwnedResource
    else:
      BorrowedResource

  else:
    User

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
    return ctx.getNimName(ctx.types[typ.index].name, true).ident

proc genTypeSection*(ctx: WitContext, host: bool, interfaceName: string = ""): NimNode =
  var typeSection = nnkTypeSection.newTree()
  result = nnkStmtList.newTree(typeSection)

  for t in ctx.types:
    if t.refIndex.isSome:
      continue

    if interfaceName != "" and t.interfaceName != interfaceName:
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
      if not host:
        var recList = nnkRecList.newTree()
        recList.add nnkIdentDefs.newTree(nnkPostfix.newTree(ident"*", ident("handle")), ident"int32", newEmptyNode())
        var objType = nnkObjectTy.newTree(newEmptyNode(), newEmptyNode(), recList)
        typeSection.add nnkTypeDef.newTree(nnkPostfix.newTree(ident"*", ident(t.name.toCamelCase(true))), newEmptyNode(), objType)
      else:
        let typeName = ctx.getNimName(t.name, true)
        let code = genAst(name = ident(typeName), nameStr = typeName):
          when not declared(name):
            {.error: "Missing resource type definition for " & nameStr & ". Define the type before the importWit statement.".}
        result.add code

    else:
      discard

proc lower*(ctx: WitContext, loweredArgs: openArray[NimNode], param: NimNode, typ: WitType, outCode: NimNode, context: WitNimTypeNameContext, lowerContext: WitLowerContext, depth: int = 0, forceDefaultStoreArgs = false) =
  # let typ = ctx.despecialize(typ)
  # echo &"lower {param.repr}: {typ}, {loweredArgs[0].treeRepr}, {typ}"

  proc storeArgDefault(arg: NimNode, param: NimNode): NimNode =
    return genAst(arg, param):
      arg = param

  let storeArg = if not forceDefaultStoreArgs and lowerContext.storeArg != nil:
    lowerContext.storeArg
  else:
    storeArgDefault

  case typ.builtin
  of "void":
    outCode.add nnkDiscardStmt.newTree(newEmptyNode())

  of "bool":
    let p = if lowerContext.convertToCoreTypes:
      genAst(param):
        cast[int32](param)
    else:
      param

    let code = storeArg(loweredArgs[0], p)
    outCode.add code

  of "char":
    let p = if lowerContext.convertToCoreTypes:
      genAst(param):
        cast[int32](param)
    else:
      param

    let code = storeArg(loweredArgs[0], p)
    outCode.add code

  of "s8", "s16", "u8", "u16", "s32", "u32":
    let p = if lowerContext.convertToCoreTypes:
      genAst(param):
        cast[int32](param)
    else:
      param

    let code = storeArg(loweredArgs[0], p)
    outCode.add code

  of "s64", "u64":
    let p = if lowerContext.convertToCoreTypes:
      genAst(param):
        cast[int64](param)
    else:
      param

    let code = storeArg(loweredArgs[0], p)
    outCode.add code

  of "f32", "f64":
    let code = storeArg(loweredArgs[0], param)
    outCode.add code

  of "string":
    var dataPtr = genAst(param):
      param[0].addr

    let reallocCode = if lowerContext.memoryAlloc != nil:
      let (c, d) = lowerContext.memoryAlloc(param, typ, depth)
      dataPtr = d
      c
    else:
      nnkStmtList.newTree()

    let copyCode = if lowerContext.copyMemory:
      let i = ident("i" & $depth)

      # todo: use CopyMem
      genAst(param, i, dataPtr):
        block:
          for i in 0..<param.len:
            # cast[ptr char](memory[dataPtr + i].addr)[] = param[i]
            memory[dataPtr + i] = cast[uint8](param[i])
    else:
      nnkStmtList.newTree()

    let storePtrA = storeArg(loweredArgs[0], genAst(dataPtr, cast[int32](dataPtr)))
    let storePtrB = storeArg(loweredArgs[0], genAst(dataPtr, 0.int32))
    let storeLen = storeArg(loweredArgs[1], genAst(param, cast[int32](param.len)))

    let code = genAst(storePtrA, storePtrB, storeLen, param, reallocCode, copyCode):
      if param.len > 0:
        reallocCode
        storePtrA
        copyCode
      else:
        storePtrB
      storeLen

    outCode.add code

  of "":
    let userType = ctx.types[typ.index]
    case userType.kind
    of List:
      var dataPtr = genAst(param):
        param[0].addr

      let reallocCode = if lowerContext.memoryAlloc != nil:
        let (c, d) = lowerContext.memoryAlloc(param, typ, depth)
        dataPtr = d
        c
      else:
        nnkStmtList.newTree()

      let copyCode = if lowerContext.copyMemory:
        let i = ident("i" & $depth)
        let p = ident("p" & $depth)
        let lowerElem = nnkStmtList.newTree()
        let elem = genAst(param, i):
          param[i]

        let flatTypeSize = ctx.byteSize(userType.listTarget)
        var k = 0
        let elemPtrs = collect:
          for param in ctx.flattenType(userType.listTarget):
            while k mod param.byteAlignment != 0:
              inc k
            let c = genAst(i, k, p, flatTypeSize, dataPtr, nimType = param.nimTypeName.ident):
              cast[ptr nimType](memory[dataPtr + i * flatTypeSize + k].addr)[]
            k += param.byteSize
            c

        ctx.lower(elemPtrs, elem, userType.listTarget, lowerElem, context, lowerContext, depth + 1, true)

        genAst(param, p, i, lowerElem):
          block:
            for i in 0..<param.len:
              lowerElem
      else:
        nnkStmtList.newTree()

      let storePtrA = storeArg(loweredArgs[0], genAst(dataPtr, cast[int32](dataPtr)))
      let storePtrB = storeArg(loweredArgs[0], genAst(dataPtr, 0.int32))
      let storeLen = storeArg(loweredArgs[1], genAst(param, cast[int32](param.len)))

      let code = genAst(storePtrA, storePtrB, storeLen, param, reallocCode, copyCode):
        if param.len > 0:
          reallocCode
          storePtrA
          copyCode
        else:
          storePtrB
        storeLen

      outCode.add code

    of Enum:
      let t = ident(ctx.flattenType(typ)[0].nimTypeName)
      let p = genAst(param = param, t):
        cast[t](param)
      let code = storeArg(loweredArgs[0], p)
      outCode.add code

    of Flags:
      let t = ident(ctx.flattenType(typ)[0].nimTypeName)
      let p = genAst(param = param, t):
        cast[t](param)
      let code = storeArg(loweredArgs[0], p)
      outCode.add code

    of Option:
      let childAccess = nnkDotExpr.newTree(param, ident("get"))
      var lowerChild = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], childAccess, userType.optionTarget, lowerChild, context, lowerContext, depth + 1, forceDefaultStoreArgs)
      let storeTag = storeArg(loweredArgs[0], genAst(param, param.isSome.int32))
      let code = genAst(storeTag, lowerChild, param):
        storeTag
        if param.isSome:
          lowerChild
      outCode.add code

    of Result:
      let childAccess = nnkDotExpr.newTree(param, ident("value"))
      let errAccess = nnkDotExpr.newTree(param, ident("error"))
      var lowerChild = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], childAccess, userType.resultOkTarget, lowerChild, context, lowerContext, depth + 1, forceDefaultStoreArgs)
      var lowerError = nnkStmtList.newTree()
      ctx.lower(loweredArgs[1..^1], errAccess, userType.resultErrTarget, lowerError, context, lowerContext, depth + 1, forceDefaultStoreArgs)
      let storeTag = storeArg(loweredArgs[0], genAst(param, param.isErr.int32))
      let code = genAst(storeTag, param, lowerChild, lowerError):
        storeTag
        if param.isOk:
          lowerChild
        else:
          lowerError
      outCode.add code

    of Record:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        ctx.lower(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context, lowerContext, depth + 1, forceDefaultStoreArgs)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Tuple:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkBracketExpr.newTree(param, newLit(i))
        ctx.lower(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context, lowerContext, depth + 1, forceDefaultStoreArgs)
        loweredI += ctx.flatTypeSize(f.typ)
      return

    of Variant:
      var cases = nnkCaseStmt.newTree(nnkDotExpr.newTree(param, ident"kind"))
      var addElse = false

      for f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        var caseCode = nnkStmtList.newTree()
        ctx.lower(loweredArgs[1..^1], fieldAccess, f.typ, caseCode, context, lowerContext, depth + 1, forceDefaultStoreArgs)
        cases.add nnkOfBranch.newTree(ident(f.name.toCamelCase(true)), caseCode)

      if addElse:
        cases.add nnkElse.newTree(nnkStmtList.newTree(nnkDiscardStmt.newTree(newEmptyNode())))

      let storeTag = storeArg(loweredArgs[0], genAst(param, param.kind.int32))
      let code = genAst(storeTag, param, cases):
        storeTag
        cases
      outCode.add code

    of Handle:
      let p = genAst(param = param):
        cast[int32](param.handle - 1)
      let code = storeArg(loweredArgs[0], p)
      outCode.add code

    else:
      error("Not implemented lower(" & $userType.kind & ")")

  else:
    error("Not implemented lower(" & $typ.builtin & ")")

proc lower*(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode, context: WitNimTypeNameContext, lowerContext: WitLowerContext = WitLowerContext()) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lower {p}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], p.typ, outCode, context, lowerContext)
    loweredI += ctx.flatTypeSize(p.typ)

proc lower*(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], results: openArray[WitType], outCode: NimNode, context: WitNimTypeNameContext, lowerContext: WitLowerContext = WitLowerContext()) =
  var loweredI = 0
  for i, r in results:
    # echo &"{i}, {loweredI}: lower {r}"
    ctx.lower(loweredArgs[loweredI..^1], args[i], r, outCode, context, lowerContext)
    loweredI += ctx.flatTypeSize(r)

proc lift*(ctx: WitContext, loweredArgs: openArray[NimNode], param: NimNode, typ: WitType, outCode: NimNode,
    context: WitNimTypeNameContext,
    liftContext: WitLiftContext,
    depth: int = 0) =
  # let typ = ctx.despecialize(typ)
  # echo &"lift {param.repr}: {typ}, {loweredArgs[0].treeRepr}"
  case typ.builtin
  of "void":
    outCode.add nnkDiscardStmt.newTree(newEmptyNode())

  of "bool":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      param = loweredArg.bool
    outCode.add code

  of "char":
    let code = genAst(loweredArg = loweredArgs[0], param = param):
      param = loweredArg.Rune
    outCode.add code

  of "s8", "s16", "s32", "s64", "u8", "u16", "u32", "u64", "f32", "f64":
    let t = ctx.getTypeName(typ, context)
    let code = genAst(loweredArg = loweredArgs[0], param = param, t):
      param = convert(loweredArg, t)
    outCode.add code

  of "string":
    if ctx.useCustomBuiltinTypes:
      let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
        param = ws(cast[ptr char](loweredPtr), loweredLen)
      outCode.add code
    else:
      let mem = if liftContext.memoryAccess != nil: liftContext.memoryAccess(loweredArgs[0]) else: loweredArgs[0]
      let code = genAst(mem, loweredLen = loweredArgs[1], param = param, p = ident("p" & $depth), i = ident("i" & $depth)):
        block:
          let p = cast[ptr UncheckedArray[char]](mem)
          param = newString(loweredLen)
          for i in 0..<param.len:
            param[i] = p[i]
      outCode.add code

  of "":
    let userType = ctx.types[typ.index]
    case userType.kind
    of List:
      if ctx.useCustomBuiltinTypes:
        let code = genAst(loweredPtr = loweredArgs[0], loweredLen = loweredArgs[1], param = param):
          param = wl(cast[ptr typeof(param[0])](loweredPtr), loweredLen)
        outCode.add code
      else:
        let mem = if liftContext.memoryAccess != nil: liftContext.memoryAccess(loweredArgs[0]) else: loweredArgs[0]

        let i = ident("i" & $depth)
        let p = ident("p" & $depth)
        let liftElem = nnkStmtList.newTree()
        let elem = genAst(param, i):
          param[i]

        let flatTypeSize = ctx.byteSize(userType.listTarget)
        var k = 0
        let elemPtrs = collect:
          for param in ctx.flattenType(userType.listTarget):
            while k mod param.byteAlignment != 0:
              inc k
            let t = param.nimTypeName.ident
            let c = genAst(i, k, p, t, flatTypeSize):
              cast[ptr t](p[i * flatTypeSize + k].addr)[]
            k += param.byteSize
            c

        ctx.lift(elemPtrs, elem, userType.listTarget, liftElem, context, liftContext, depth + 1)

        let code = genAst(mem, loweredLen = loweredArgs[1], param = param, p, i, liftElem):
          block:
            let p = cast[ptr UncheckedArray[uint8]](mem)
            param = newSeq[typeof(param[0])](loweredLen)
            for i in 0..<param.len:
              liftElem
        outCode.add code

    of Enum:
      let t = ctx.getTypeName(typ, context)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        param = cast[t](loweredArg)
      outCode.add code

    of Flags:
      let t = ctx.getTypeName(typ, context)
      let code = genAst(loweredArg = loweredArgs[0], param = param, t):
        param = cast[t](loweredArg)
      outCode.add code

    of Option:
      let t = ctx.getTypeName(userType.optionTarget, context)
      let child = ident"temp"
      let childDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(child, t, newEmptyNode()))
      var lowerChild = nnkStmtList.newTree()
      ctx.lift(loweredArgs[1..^1], child, userType.optionTarget, lowerChild, context, liftContext, depth + 1)
      let code = genAst(loweredTag = loweredArgs[0], param, lowerChild, t, childDecl, child):
        if loweredTag != 0:
          childDecl
          lowerChild
          param = child.some
      outCode.add code

    of Result:
      let okType = ctx.getTypeName(userType.resultOkTarget, context)
      let errType = ctx.getTypeName(userType.resultErrTarget, context)
      let okChild = ident"tempOk"
      let errChild = ident"tempErr"
      let okChildDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(okChild, okType, newEmptyNode()))
      let errChildDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(errChild, errType, newEmptyNode()))
      var lowerChild = nnkStmtList.newTree()
      var lowerError = nnkStmtList.newTree()
      ctx.lift(loweredArgs[1..^1], okChild, userType.resultOkTarget, lowerChild, context, liftContext, depth + 1)
      ctx.lift(loweredArgs[1..^1], errChild, userType.resultErrTarget, lowerError, context, liftContext, depth + 1)

      let okCase = if okType.repr == "void":
        genAst(param, okType, errType):
          param = results.Result[okType, errType].ok()
      else:
        genAst(param, lowerChild, okType, errType, okChild, okChildDecl):
          okChildDecl
          lowerChild
          param = results.Result[okType, errType].ok(okChild)

      let errCase = if errType.repr == "void":
        genAst(param, okType, errType):
          param = results.Result[okType, errType].err()
      else:
        genAst(param, lowerError, okType, errType, errChild, errChildDecl):
          errChildDecl
          lowerError
          param = results.Result[okType, errType].err(errChild)

      let code = genAst(loweredTag = loweredArgs[0], okCase, errCase):
        if loweredTag == 0:
          okCase
        else:
          errCase
      outCode.add code

    of Variant:
      let objectTypeName = ident(userType.name.toCamelCase(true))
      let enumTypeName = ident(objectTypeName.repr & "Kind")
      let kindCode = genAst(t = enumTypeName, a = loweredArgs[0]):
        cast[t](a)

      var cases = nnkCaseStmt.newTree(kindCode)

      for f in userType.fields:
        let kindName = ident(f.name.toCamelCase(true))
        let fieldName = ident(f.name.toCamelCase(false))
        var lowerCode = nnkStmtList.newTree()

        let typ = ctx.getTypeName(f.typ, context)
        let temp = ident"temp"
        let tempDecl = nnkVarSection.newTree(nnkIdentDefs.newTree(temp, typ, newEmptyNode()))
        ctx.lift(loweredArgs[1..^1], temp, f.typ, lowerCode, context, liftContext, depth + 1)
        let caseCode = if typ.repr == "void":
          genAst(param, typ, t = objectTypeName, k = kindName):
            param = t(kind: k)
        else:
          genAst(param, lowerCode, temp, tempDecl, fieldName, t = objectTypeName, k = kindName):
            tempDecl
            lowerCode
            param = t(kind: k, fieldName: temp)

        cases.add nnkOfBranch.newTree(ident(f.name.toCamelCase(true)), caseCode)

      var addElse = false

      if addElse:
        cases.add nnkElse.newTree(nnkStmtList.newTree(nnkDiscardStmt.newTree(newEmptyNode())))

      let code = genAst(loweredTag = loweredArgs[0], param, cases):
        cases
      outCode.add code

    of Record:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkDotExpr.newTree(param, ident(f.name.toCamelCase(false)))
        ctx.lift(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context, liftContext, depth + 1)
        loweredI += ctx.flatTypeSize(f.typ)

    of Tuple:
      var loweredI = 0
      for i, f in userType.fields:
        let fieldAccess = nnkBracketExpr.newTree(param, newLit(i))
        ctx.lift(loweredArgs[loweredI..^1], fieldAccess, f.typ, outCode, context, liftContext, depth + 1)
        loweredI += ctx.flatTypeSize(f.typ)

    of Handle:
      if liftContext.resourceAccess != nil:
        outCode.add liftContext.resourceAccess(typ, loweredArgs[0], param)
      else:
        let code = genAst(arg = loweredArgs[0], param):
          param.handle = arg + 1
        outCode.add code

    else:
      error("Not implemented lift(" & $userType.kind & ")")

  else:
    error("Not implemented lift(" & $typ.builtin & ")")

proc lift*(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], results: openArray[WitType], outCode: NimNode, context: WitNimTypeNameContext, liftContext: WitLiftContext = WitLiftContext()) =
  var loweredI = 0
  for i, r in results:
    # echo &"{i}, {loweredI}: lift {r}"
    ctx.lift(loweredArgs[loweredI..^1], args[i], r, outCode, context, liftContext)
    loweredI += ctx.flatTypeSize(r)

proc lift*(ctx: WitContext, loweredArgs: openArray[NimNode], args: openArray[NimNode], params: openArray[WitFuncParam], outCode: NimNode, context: WitNimTypeNameContext, liftContext: WitLiftContext = WitLiftContext()) =
  var loweredI = 0
  for i, p in params:
    # echo &"{i}, {loweredI}: lift {p}"
    ctx.lift(loweredArgs[loweredI..^1], args[i], p.typ, outCode, context, liftContext)
    loweredI += ctx.flatTypeSize(p.typ)
