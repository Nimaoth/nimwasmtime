{.push hint[DuplicateModuleImport]:off.}
import std/[os, macros, strutils, json, sets, enumerate, tables, options, sequtils]
import results as ress

const nimWasmtimeStatic* {.booldefine.} = true
const nimWasmtimeOverride* {.strdefine.} = ""
const nimWasmtimeBuildDebug* {.booldefine.} = false
const nimWasmtimeBuildMusl* {.booldefine.} = false
const nimWasmtimeBuildCache* {.strdefine.} = "wasmtime-build-cache"

const nimWasmtimeBuildType* = if nimWasmtimeBuildDebug:
  "debug"
else:
  "release"

const nimWasmtimeFeatureProfiling* {.booldefine.} = true
const nimWasmtimeFeatureWat* {.booldefine.} = true
const nimWasmtimeFeatureCache* {.booldefine.} = true
const nimWasmtimeFeatureParallelCompilation* {.booldefine.} = true
const nimWasmtimeFeatureWasi* {.booldefine.} = true
const nimWasmtimeFeatureLogging* {.booldefine.} = true
const nimWasmtimeFeatureDisableLogging* {.booldefine.} = false
const nimWasmtimeFeatureCoredump* {.booldefine.} = true
const nimWasmtimeFeatureAddr2Line* {.booldefine.} = true
const nimWasmtimeFeatureDemangle* {.booldefine.} = true
const nimWasmtimeFeatureThreads* {.booldefine.} = true
const nimWasmtimeFeatureGC* {.booldefine.} = true
const nimWasmtimeFeatureAsync* {.booldefine.} = true
const nimWasmtimeFeatureCranelift* {.booldefine.} = true
const nimWasmtimeFeatureWinch* {.booldefine.} = true
const nimWasmtimeFeatureComponentModel* {.booldefine.} = true

when nimWasmtimeOverride.len > 0:
  const wasmDir* = nimWasmtimeOverride
else:
  const wasmDir* = currentSourcePath().splitPath.head / "wasmtime"
static:
  echo "Using wasmtime repository ", wasmDir

when defined(nimWasmtimeBuild) or defined(nimWasmtimeBuildForce):
  import std/[os]

  const args = join(sep=" ", a=[
    "-d:nimWasmtimeFeatureProfiling=" & $nimWasmtimeFeatureProfiling,
    "-d:nimWasmtimeFeatureWat=" & $nimWasmtimeFeatureWat,
    "-d:nimWasmtimeFeatureCache=" & $nimWasmtimeFeatureCache,
    "-d:nimWasmtimeFeatureParallelCompilation=" & $nimWasmtimeFeatureParallelCompilation,
    "-d:nimWasmtimeFeatureWasi=" & $nimWasmtimeFeatureWasi,
    "-d:nimWasmtimeFeatureLogging=" & $nimWasmtimeFeatureLogging,
    "-d:nimWasmtimeFeatureDisableLogging=" & $nimWasmtimeFeatureDisableLogging,
    "-d:nimWasmtimeFeatureCoredump=" & $nimWasmtimeFeatureCoredump,
    "-d:nimWasmtimeFeatureAddr2Line=" & $nimWasmtimeFeatureAddr2Line,
    "-d:nimWasmtimeFeatureDemangle=" & $nimWasmtimeFeatureDemangle,
    "-d:nimWasmtimeFeatureThreads=" & $nimWasmtimeFeatureThreads,
    "-d:nimWasmtimeFeatureGC=" & $nimWasmtimeFeatureGC,
    "-d:nimWasmtimeFeatureAsync=" & $nimWasmtimeFeatureAsync,
    "-d:nimWasmtimeFeatureCranelift=" & $nimWasmtimeFeatureCranelift,
    "-d:nimWasmtimeFeatureWinch=" & $nimWasmtimeFeatureWinch,
    "-d:nimWasmtimeFeatureComponentModel=" & $nimWasmtimeFeatureComponentModel,
    "-d:nimWasmtimeBuildDebug=" & $nimWasmtimeBuildDebug,
    "-d:nimWasmtimeBuildMusl=" & $nimWasmtimeBuildMusl,
    "-d:nimWasmtimeOverride=" & $nimWasmtimeOverride,
  ])

  static:
    echo "Configure and build wasmtime, this might take a while..."
    echo staticExec("nim " & args & " " & (currentSourcePath().splitPath.head / "build_wasmtime.nims"),
      cache=nimWasmtimeBuildCache)
    echo "Finished building wasmtime."

when defined(musl):
  {.passL: "-L" & wasmDir / "target/x86_64-unknown-linux-musl" / nimWasmtimeBuildType.}
else:
  {.passL: "-L" & wasmDir / "target" / nimWasmtimeBuildType.}

when nimWasmtimeStatic:
  when defined(windows):
    {.passL: "-l:wasmtime.dll.lib -lm".}
  else:
    {.passL: "-l:libwasmtime.a -lm".}
else:
  when defined(windows):
    {.passL: "-lwasmtime.dll -lm".}
  else:
    {.passL: "-lwasmtime -lm -Wl,-rpath,$ORIGIN".}

func processName(str: string): string =
  for p in str.split("_"):
    result.add p.toLowerAscii.capitalizeAscii

func camelName(str: string): string =
  for i, p in enumerate(str.split("_")):
    if i == 0:
      result.add p.toLowerAscii
    else:
      result.add p.toLowerAscii.capitalizeAscii

var enums {.compiletime.} = initHashSet[string]()

proc wrapperRenameCallback*(name: string, kind: string, makeUnique: var bool, partof = ""): string =
  result = name

  var nameMap = toTable {
    "wasi_config_new": "new_wasi_config",

    "wasm_config_new": "new_config",
    "wasm_engine_new": "new_engine",
    "wasm_engine_new_with_config": "new_engine",
    "wasm_exporttype_new": "new_exporttype",
    "wasm_foreign_new": "new_foreign",
    "wasm_func_new": "new_func",
    "wasm_functype_new": "new_functype",
    "wasm_global_new": "new_global",
    "wasm_globaltype_new": "new_globaltype",
    "wasm_importtype_new": "new_importtype",
    "wasm_instance_new": "new_instance",
    "wasm_memory_new": "new_memory",
    "wasm_memorytype_new": "new_memorytype",
    "wasm_module_new": "new_module",
    "wasm_store_new": "new_store",
    "wasm_table_new": "new_table",
    "wasm_tabletype_new": "new_tabletype",
    "wasm_trap_new": "new_trap",
    "wasm_valtype_new": "new_valtype",

    "wasmtime_error_new": "new_error",
    "wasmtime_externref_new": "new_externref",
    "wasmtime_func_new": "new_func",
    "wasmtime_global_new": "new_global",
    "wasmtime_guestprofiler_new": "new_guestprofiler",
    "wasmtime_instance_new": "new_instance",
    "wasmtime_linker_new": "new_linker",
    "wasmtime_memory_new": "new_memory",
    "wasmtime_memorytype_new": "new_memorytype",
    "wasmtime_module_new": "new_module",
    "wasmtime_sharedmemory_new": "new_sharedmemory",
    "wasmtime_store_new": "new_store",
    "wasmtime_table_new": "new_table",
    "wasmtime_trap_new": "new_trap",

    "wasmtime_component_linker_new": "new_component_linker",
    "wasmtime_component_store_new": "new_component_store",
    "wasmtime_component_store_new": "new_component_store",
  }

  nameMap.withValue(name, n):
    result = n[]

  case kind
  of "enumval":
    result.removePrefix("WASM_")
    if not result.endsWith("_NONE"):
      result.removePrefix("WASMTIME_TRAP_CODE_")
      result.removePrefix("WASMTIME_OPT_LEVEL_")
      result.removePrefix("WASMTIME_PROFILING_STRATEGY_")
      result.removePrefix("WASMTIME_STRATEGY_")
      result.removePrefix("WASMTIME_COMPONENT_VAL_KIND_")
      result.removePrefix("WASMTIME_COMPONENT_RESOURCE_KIND_")
      result.removePrefix("WASMTIME_COMPONENT_ITEM_TYPE_")
    result.removePrefix("WASMTIME_")
    result = processName(result)

  of "enum":
    result.removePrefix("enum_")
    result.removeSuffix("_enum")
    result.removePrefix("wasmtime_")
    result = processName(result)
    enums.incl result

  of "union":
    result.removePrefix("union_")
    result.removeSuffix("_union")
    result.removePrefix("wasmtime_")
    result = processName(result)
    enums.incl result

  of "struct", "anon":
    result = processName(result)

  of "typedef":
    result.removePrefix("wasmtime_")
    result = processName(result)

  of "proc":
    makeUnique = false
    result.removePrefix("wasi_config_")

    result.removePrefix("wasm_byte_vec_")
    result.removePrefix("wasm_exporttype_vec_")
    result.removePrefix("wasm_extern_vec_")
    result.removePrefix("wasm_externtype_vec_")
    result.removePrefix("wasm_frame_vec_")
    result.removePrefix("wasm_functype_vec_")
    result.removePrefix("wasm_globaltype_vec_")
    result.removePrefix("wasm_importtype_vec_")
    result.removePrefix("wasm_memorytype_vec_")
    result.removePrefix("wasm_tabletype_vec_")
    result.removePrefix("wasm_val_vec_")
    result.removePrefix("wasm_valtype_vec_")

    result.removePrefix("wasm_config_")
    result.removePrefix("wasm_engine_")
    result.removePrefix("wasm_exporttype_")
    result.removePrefix("wasm_extern_")
    result.removePrefix("wasm_externtype_")
    result.removePrefix("wasm_foreign_")
    result.removePrefix("wasm_frame_")
    result.removePrefix("wasm_func_")
    result.removePrefix("wasm_functype_")
    result.removePrefix("wasm_global_")
    result.removePrefix("wasm_globaltype_")
    result.removePrefix("wasm_importtype_")
    result.removePrefix("wasm_instance_")
    result.removePrefix("wasm_memory_")
    result.removePrefix("wasm_memorytype_")
    result.removePrefix("wasm_module_")
    result.removePrefix("wasm_ref_")
    result.removePrefix("wasm_shared_")
    result.removePrefix("wasm_store_")
    result.removePrefix("wasm_table_")
    result.removePrefix("wasm_tabletype_")
    result.removePrefix("wasm_trap_")
    result.removePrefix("wasm_val_")
    result.removePrefix("wasm_valtype_")

    result.removePrefix("wasmtime_component_val_record_field_vec_")
    result.removePrefix("wasmtime_component_val_vec_")
    result.removePrefix("wasmtime_component_val_flags_vec_")

    result.removePrefix("wasmtime_component_linker_")
    result.removePrefix("wasmtime_component_store_")
    result.removePrefix("wasmtime_component_instance_")
    result.removePrefix("wasmtime_component_func_")
    result.removePrefix("wasmtime_component_val_flags_")

    result.removePrefix("wasmtime_anyref_")
    result.removePrefix("wasmtime_call_")
    result.removePrefix("wasmtime_component_")
    result.removePrefix("wasmtime_config_")
    result.removePrefix("wasmtime_context_")
    result.removePrefix("wasmtime_engine_")
    result.removePrefix("wasmtime_error_")
    result.removePrefix("wasmtime_extern_")
    result.removePrefix("wasmtime_externref_")
    result.removePrefix("wasmtime_func_")
    result.removePrefix("wasmtime_global_")
    result.removePrefix("wasmtime_guestprofiler_")
    result.removePrefix("wasmtime_instance_")
    result.removePrefix("wasmtime_linker_")
    result.removePrefix("wasmtime_memory_")
    result.removePrefix("wasmtime_memorytype_")
    result.removePrefix("wasmtime_module_")
    result.removePrefix("wasmtime_sharedmemory_")
    result.removePrefix("wasmtime_store_")
    result.removePrefix("wasmtime_table_")
    result.removePrefix("wasmtime_trap_")
    result.removePrefix("wasmtime_val_")

    result = camelName(result)

  else:
    discard

proc opirCallback*(data: JsonNode): JsonNode =
  result = newJArray()
  for v in data:
    if v["kind"].getStr == "const" and v["name"].getStr == "wasm_name":
      echo "REMOVING ", v.pretty
      continue
    result.add v

when defined(useFuthark) or defined(useFutharkForWasmtime):
  import futhark

  const outputPath = currentSourcePath().splitPath.head / "wrapper.nim"
  const llvmIncludePath = staticExec("clang -print-resource-dir").strip() / "../../../include"
  static:
    echo "Using LLVM from ", llvmIncludePath

  importc:
    sysPath llvmIncludePath
    path wasmDir / "crates/c-api/include"
    path wasmDir / "crates/c-api/include/wasmtime"
    outputPath outputPath
    renameCallback wrapperRenameCallback
    addOpirCallback opirCallback

    "wasm.h"
    "error.h"
    "config.h"
    "store.h"
    "async.h"
    "component.h"
    "engine.h"
    "extern.h"
    "func.h"
    "global.h"
    "instance.h"
    "linker.h"
    "memory.h"
    "module.h"
    "profiling.h"
    "sharedmemory.h"
    "table.h"
    "trap.h"
    "val.h"

  when defined(futharkRebuild):
    var suffix {.compiletime.}: string = ""

    proc postProcess() =
      echo "========================== Post process wrapper.nim"
      var content = readFile(outputPath)
      content = content.replace("VecT* = ", "VecT* = object of ")
      content = content.replace("Generated based on " & wasmDir, "Generated based on wasmtime")
      content.add "\n"
      content.add suffix
      writeFile(outputPath, content)

    macro suffixWrapper(body: untyped): untyped =
      suffix = body.repr

    suffixWrapper:
      import std/[options]
      from std/unicode import Rune, `$`

      proc `=destroy`*(self: StructWasmtimeComponentValT) {.nodestroy.}

      # todo
      # template owned(T: typed): untyped =
      #   proc `=copy`*(self: var T, src: T) {.error.}

      #   proc clone*(self: T): T =
      #     self.addr.copy(result.addr)

      #   proc `=destroy`*(self: T) =
      #     if self.data != nil:
      #       self.addr.delete()

      template vecType(T: untyped, unchecked: bool = true): untyped =
        type ItemType = typeof(T().data[])

        proc `=copy`*(self: var T; src: T) {.error.}

        proc `=destroy`*(self: T) =
          if self.data != nil:
            self.addr.delete()

      vecType(WasmByteVecT)
      vecType(WasmExporttypeVecT)
      vecType(WasmExternVecT)
      vecType(WasmExterntypeVecT)
      vecType(WasmFrameVecT)
      vecType(WasmFunctypeVecT)
      vecType(WasmGlobaltypeVecT)
      vecType(WasmImporttypeVecT)
      vecType(WasmMemorytypeVecT)
      vecType(WasmTabletypeVecT)
      vecType(WasmValVecT)
      vecType(WasmValtypeVecT)

      vecType(ComponentValFlagsVecT, unchecked = false)
      vecType(ComponentValRecordFieldVecT, unchecked = false)
      vecType(ComponentValVecT, unchecked = false)

      # todo
      # owned(WasmConfigT)
      # owned(WasmEngineT)
      # owned(WasmExporttypeT)
      # owned(WasmExternT)
      # owned(WasmExterntypeT)
      # owned(WasmForeignT)
      # owned(WasmFrameT)
      # owned(WasmFuncT)
      # owned(WasmFunctypeT)
      # owned(WasmGlobalT)
      # owned(WasmGlobaltypeT)
      # owned(WasmImporttypeT)
      # owned(WasmInstanceT)
      # owned(WasmMemoryT)
      # owned(WasmMemorytypeT)
      # owned(WasmModuleT)
      # owned(WasmRefT)
      # owned(WasmStoreT)
      # owned(WasmTableT)
      # owned(WasmTabletypeT)
      # owned(WasmTrapT)
      # owned(WasmValT)
      # owned(WasmValtypeT)

      # owned(WasiConfigT)

      # owned(ErrorT)
      # owned(ExternT)
      # owned(GuestprofilerT)
      # owned(LinkerT)
      # owned(ModuleT)
      # owned(SharedmemoryT)
      # owned(StoreT)

      # owned(ComponentStoreT)
      # owned(ComponentT)

      proc `=destroy`*(self: StructWasmtimeComponentValT) {.nodestroy.} =
        case self.kind.ComponentValKind
        of String: `=destroy`(self.payload.string_field)
        of List: `=destroy`(self.payload.list)
        of Record: `=destroy`(self.payload.record)
        of Tuple: `=destroy`(self.payload.tuple_field)
        # of Variant: `=destroy`(self.payload.variant) # todo
        # of Option: `=destroy`(self.payload.option) # todo
        # of Result: `=destroy`(self.payload.result) # todo
        of Flags: `=destroy`(self.payload.flags)
        else: discard

    static:
      postProcess()

else: # defined(useFuthark) or defined(useFutharkForWasmtime)
  include wrapper

from std/unicode import Rune, `$`
import wit_types
{.pop.}

template vec(T: untyped, unchecked: bool = true): untyped =
  type ItemType = typeof(T().data[])

  proc clone*(self: T): T =
    self.addr.copy(result.addr)

  func toVec*(s: openArray[ItemType]): T =
    if s.len > 0:
      when unchecked:
        result.addr.new(s.len.csize_t, cast[ptr UncheckedArray[ItemType]](s[0].addr))
      else:
        result.addr.new(s.len.csize_t, s[0].addr)
    else:
      result.addr.newEmpty()

  func empty*(_: typedesc[T]): T =
    result.addr.newEmpty()

  func low*(self: T): int =
    0

  func high*(self: T): int =
    self.size.int - 1

  func len*(self: T): int =
    self.size.int

  func uncheckedArray*(self: T): ptr UncheckedArray[ItemType] =
    cast[ptr UncheckedArray[ItemType]](self.data)

  func `[]`*(self: var T; index: int): var ItemType =
    assert index in 0 ..< self.len
    self.uncheckedArray[index]

  func `[]`*(self: T; index: int): lent ItemType =
    assert index in 0 ..< self.len
    self.uncheckedArray[index]

  func `[]=`*(self: T; index: int; value: sink ItemType) =
    assert index in 0 ..< self.len
    self.uncheckedArray[index] = value

  func `$`*(self: T): string =
    var res = "["
    for i in 0 ..< self.len:
      if i > 0:
        res.add ", "
      when compiles($self.uncheckedArray[i]):
        res.add $self.uncheckedArray[i]
      else:
        res.add $cast[uint64](self.uncheckedArray[i])
    res.add "]"

  iterator items*(self: T): lent ItemType =
    for i in 0 ..< self.len:
      yield self.uncheckedArray[i]

  iterator pairs*(self: T): (int, lent ItemType) =
    for i in 0 ..< self.len:
      yield (i, self.uncheckedArray[i])

vec(WasmByteVecT)
vec(WasmExporttypeVecT)
vec(WasmExternVecT)
vec(WasmExterntypeVecT)
vec(WasmFrameVecT)
vec(WasmFunctypeVecT)
vec(WasmGlobaltypeVecT)
vec(WasmImporttypeVecT)
vec(WasmMemorytypeVecT)
vec(WasmTabletypeVecT)
vec(WasmValVecT)
vec(WasmValtypeVecT)

vec(ComponentValFlagsVecT, unchecked = false)
vec(ComponentValRecordFieldVecT, unchecked = false)
vec(ComponentValVecT, unchecked = false)

proc strVal*(name: WasmNameT): string =
  result = newStringOfCap(name.size.int)
  for i in 0..<name.size.int:
    result.add cast[ptr UncheckedArray[char]](name.data)[i]

proc toName*(name: string): WasmNameT =
  if name.len == 0:
    result.addr.newEmpty()
  else:
    result.addr.new(name.len.csize_t, cast[ptr UncheckedArray[WasmByteT]](name[0].addr))

proc `$`*(self: ptr WasmExterntypeT): string =
  if self == nil:
    return "nil"

  result = ""
  case self.kind.WasmExternkind
  of ExternFunc:
    let f = self.asFunctype
    let params = f.params
    let results = f.results

    result.add "("

    for i in 0..<params[].size.int:
      if i > 0:
        result.add ", "
      {.push warning[HoleEnumConv]:off.}
      let kind = params[][i].kind.WasmValkind
      {.pop.}
      result.add $kind

    result.add ") -> ("

    for i in 0..<results[].size.int:
      if i > 0:
        result.add ", "
      {.push warning[HoleEnumConv]:off.}
      let kind = results[][i].kind.WasmValkind
      {.pop.}
      result.add $kind

    result.add ")"

  else:
    discard

proc `$`*(self: ptr WasmExporttypeT): string =
  if self == nil:
    return "nil"

  let name = self.name()
  if name == nil:
    result.add "nil"
  else:
    result.add name[].strVal
  result.add ": "
  result.add $self.type()

proc `$`*(self: ptr WasmImporttypeT): string =
  if self == nil:
    return "nil"

  let name = self.name()
  if name == nil:
    result.add "nil"
  else:
    result.add name[].strVal
  result.add ": "
  result.add $self.type()

proc toCamelCase(str: string, capitalizeFirst: bool): string =
  for i, part in enumerate(str.split("-")):
    if i == 0 and not capitalizeFirst:
      result.add part
    else:
      result.add part.capitalizeAscii

proc toVal*[T](a: T): ComponentValT =
  # echo &"toVal {a}"
  when T is bool:
    result.kind = ComponentValKind.Bool.ComponentValKindT
    result.payload.boolean = a

  elif T is int8:
    result.kind = ComponentValKind.S8.ComponentValKindT
    result.payload.s8 = a

  elif T is int16:
    result.kind = ComponentValKind.S16.ComponentValKindT
    result.payload.s16 = a

  elif T is int32:
    result.kind = ComponentValKind.S32.ComponentValKindT
    result.payload.s32 = a

  elif T is int64:
    result.kind = ComponentValKind.S64.ComponentValKindT
    result.payload.s64 = a

  elif T is uint8:
    result.kind = ComponentValKind.U8.ComponentValKindT
    result.payload.u8 = a

  elif T is uint16:
    result.kind = ComponentValKind.U16.ComponentValKindT
    result.payload.u16 = a

  elif T is uint32:
    result.kind = ComponentValKind.U32.ComponentValKindT
    result.payload.u32 = a

  elif T is uint64:
    result.kind = ComponentValKind.U64.ComponentValKindT
    result.payload.u64 = a

  elif T is float32:
    result.kind = ComponentValKind.Float32.ComponentValKindT
    result.payload.f32 = a

  elif T is float64:
    result.kind = ComponentValKind.Float64.ComponentValKindT
    result.payload.f64 = a

  elif T is Rune:
    result.kind = ComponentValKind.Char.ComponentValKindT
    result.payload.character = a.uint32

  elif T is string:
    result.kind = ComponentValKind.String.ComponentValKindT
    let name = a.toName
    result.payload.string_field = name

  elif T is seq:
    result.kind = ComponentValKind.List.ComponentValKindT
    result.payload.list.addr.newUninitialized(a.len.csize_t)
    for i, v in a:
      result.payload.list[i] = v.toVal

  elif T is system.set:
    result.kind = ComponentValKind.Flags.ComponentValKindT
    result.payload.flags.addr.newUninitialized(a.len.csize_t)
    for i, v in enumerate(a.items):
      let name = ($v).toName
      result.payload.flags[i] = name

  elif T is options.Option:
    result.kind = ComponentValKind.Option.ComponentValKindT
    if a.isSome:
      result.payload.option = valNew()
      result.payload.option[] = a.get.toVal
    else:
      result.payload.option = nil

  elif T is ress.Result:
    result.kind = ComponentValKind.Result.ComponentValKindT
    type OkType = typeof(a.value)
    type ErrType = typeof(a.error)
    result.payload.result.val = nil
    if a.isErr:
      result.payload.result.error = true
      when ErrType isnot void:
        result.payload.result.val = valNew()
        result.payload.result.val[] = a.error.toVal
    else:
      result.payload.result.error = false
      when OkType isnot void:
        result.payload.result.val = valNew()
        result.payload.result.val[] = a.value.toVal

  elif T is enum:
    result.kind = ComponentValKind.Enum.ComponentValKindT
    let name = ($a).toName
    result.payload.enumeration.name = name

  elif T is tuple:
    result.kind = ComponentValKind.Tuple.ComponentValKindT
    var numFields = 0
    for k, v in a.fieldPairs:
      numFields.inc

    result.payload.tuple_field.addr.newUninitialized(numFields.csize_t)

    var i = 0
    for k, v in a.fieldPairs:
      result.payload.tuple_field[i] = v.toVal
      inc i

  elif T is object:
    when not compiles(T().kind):
      result.kind = ComponentValKind.Record.ComponentValKindT
      var numFields = 0
      for k, v in a.fieldPairs:
        numFields.inc

      result.payload.record.addr.newUninitialized(numFields.csize_t)

      var i = 0
      for k, v in a.fieldPairs:
        result.payload.record[i] = ComponentValRecordFieldT(name: k.toName, val: v.toVal)
        inc i

    else:
      result.kind = ComponentValKind.Variant.ComponentValKindT

      type Kind = typeof(a.kind)
      let name = ($a.kind).toName
      result.payload.variant.name = name

      macro convertField(res: untyped, val: typed): untyped =
        var cases = nnkCaseStmt.newTree(nnkDotExpr.newTree(val, ident"kind"))
        var addElse = false
        for v in Kind:
          let kindName = ident(toCamelCase($v, true))
          let fieldName = ident(toCamelCase($v, false))
          var caseCode = genAst(res, val, fieldName):
            # todo: check this `when` in the macro instead of in the returned code
            when compiles(val.fieldName):
              res = valNew()
              res[] = val.fieldName.toVal
          cases.add nnkOfBranch.newTree(kindName, caseCode)

        return nnkStmtList.newTree(cases)

      result.payload.variant.val.convertField(a)

  else:
    {.error: "Can't convert type " & $T & " to ComponentValT".}

macro getSetTargetType(t: typed): untyped =
  ## Given set[T], return T
  return t.getTypeInst[1].getTypeImpl[1]

proc to*(a: ComponentValT, T: typedesc): T =
  # echo a, ", ", a.kind.ComponentValKind, " to ", T
  when T is int8:
    assert a.kind == ComponentValKind.S8.ComponentValKindT
    result = a.payload.s8

  elif T is int16:
    assert a.kind == ComponentValKind.S16.ComponentValKindT
    result = a.payload.s16

  elif T is int32:
    assert a.kind == ComponentValKind.S32.ComponentValKindT
    result = a.payload.s32

  elif T is int64:
    assert a.kind == ComponentValKind.S64.ComponentValKindT
    result = a.payload.s64

  elif T is uint8:
    assert a.kind == ComponentValKind.U8.ComponentValKindT
    result = a.payload.u8

  elif T is uint16:
    assert a.kind == ComponentValKind.U16.ComponentValKindT
    result = a.payload.u16

  elif T is uint32:
    assert a.kind == ComponentValKind.U32.ComponentValKindT
    result = a.payload.u32

  elif T is uint64:
    assert a.kind == ComponentValKind.U64.ComponentValKindT
    result = a.payload.u64

  elif T is float32:
    assert a.kind == ComponentValKind.Float32.ComponentValKindT
    result = a.payload.f32

  elif T is float64:
    assert a.kind == ComponentValKind.Float64.ComponentValKindT
    result = a.payload.f64

  elif T is Rune:
    assert a.kind == ComponentValKind.Char.ComponentValKindT
    result = a.payload.character.Rune

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

  elif T is system.set:
    assert a.kind == ComponentValKind.Flags.ComponentValKindT
    type Item = T.getSetTargetType()
    for v in a.payload.flags:
      let name = v.strVal
      result.incl parseEnum[Item](name)

  elif T is WitFlags:
    assert a.kind == ComponentValKind.Flags.ComponentValKindT
    type Item = T.getFlagsTargetType()
    for v in a.payload.flags:
      let name = v.strVal
      result.incl parseEnum[Item](name)

  elif T is options.Option:
    assert a.kind == ComponentValKind.Option.ComponentValKindT
    if a.payload.option != nil:
      result = a.payload.option[].to(typeof(result.get)).some

  elif T is ress.Result:
    assert a.kind == ComponentValKind.Result.ComponentValKindT
    type OkType = typeof(result.value)
    type ErrType = typeof(result.error)
    if a.payload.result.error:
      when ErrType is void:
        result = ress.Result[OkType, ErrType].err()
      else:
        result = ress.err(a.payload.result.val[].to(ErrType))
    else:
      when OkType is void:
        result = ress.Result[OkType, ErrType].ok()
      else:
        result = ress.ok(a.payload.result.val[].to(OkType))

  elif T is tuple:
    if a.kind == ComponentValKind.Tuple.ComponentValKindT:
      var i = 0
      for k, v in result.fieldPairs:
        v = a.payload.tuple_field[i].to(typeof(v))
        inc i

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
            cases.add nnkOfBranch.newTree(ident(toCamelCase($v, true)), caseCode)

          return nnkStmtList.newTree(cases)

        result.convertField(a.payload.variant.val[])

  elif T is enum:
    assert a.kind == ComponentValKind.Enum.ComponentValKindT
    parseEnum[T](a.payload.enumeration.name.strVal)

  else:
    {.error: "Can't convert ComponentValT to " & $T.}

type
  WasmtimeResultKind* = enum Ok, Err
  WasmtimeResult*[T] = object
    case kind*: WasmtimeResultKind
    of Ok:
      when T isnot void:
        val*: T
    of Err:
      err*: tuple[msg: string, status: int, trace: WasmFrameVecT]

proc msg*(err: ptr ErrorT): string =
  var name: WasmNameT
  if err != nil:
    err.message(name.addr)
    result = name.strVal
  else:
     result = "ERROR: nil wasm error"

proc msg*(err: ptr WasmTrapT): string =
  var name: WasmNameT
  if err != nil:
    err.message(name.addr)
    result = name.strVal
  else:
     result = "ERROR: nil wasm trap"

proc exitStatus*(err: ptr ErrorT): int =
  var exitStatus: cint
  if err.exitStatus(exitStatus.addr):
    return exitStatus.int
  return -1

proc getWasmTrace*(err: ptr ErrorT): WasmFrameVecT =
  wasmTrace(err, result.addr)

proc getWasmTrace*(err: ptr WasmTrapT): WasmFrameVecT =
  trace(err, result.addr)

proc exitStatus*(err: ptr WasmTrapT): int =
  var exitStatus: uint8
  if err.code(exitStatus.addr):
    return exitStatus.int
  return -1

proc ok*[T](val: sink T): WasmtimeResult[T] =
  WasmtimeResult[T](kind: Ok, val: val)

proc ok*(): WasmtimeResult[void] =
  WasmtimeResult[void](kind: Ok)

proc isOk*[T](self: WasmtimeResult[T]): bool =
  self.kind == Ok

proc isErr*[T](self: WasmtimeResult[T]): bool =
  self.kind == Err

proc toResult*(err: ptr ErrorT; T: typedesc): WasmtimeResult[T] =
  if err == nil:
    WasmtimeResult[T](kind: Ok)
  else:
    let msg = err.msg()
    let exitStatus = err.exitStatus()
    let trace = err.getWasmTrace()
    WasmtimeResult[T](kind: Err, err: (msg, exitStatus, trace))

proc toResult*(err: ptr WasmTrapT; T: typedesc): WasmtimeResult[T] =
  if err == nil:
    WasmtimeResult[T](kind: Ok)
  else:
    let msg = err.msg()
    let exitStatus = err.exitStatus()
    let trace = err.getWasmTrace()
    WasmtimeResult[T](kind: Err, err: (msg, exitStatus, trace))

proc toResult*[T](self: sink WasmtimeResult[T], T2: typedesc): WasmtimeResult[T2] =
  if self.isErr:
    WasmtimeResult[T2](kind: Err, err: self.err.ensureMove)
  else:
    WasmtimeResult[T2](kind: Ok)

template okOr*[T](res: WasmtimeResult[T]; body: untyped): T =
  let temp = res
  if temp.isOk:
    when T isnot void:
      temp.val
  else:
    body

template okOr*[T](res: WasmtimeResult[T]; e: untyped; body: untyped): T =
  let temp = res
  if temp.isOk:
    when T isnot void:
      temp.val
  else:
    let e {.cursor.} = temp.err
    body

template okOr*(res: ptr ErrorT; e: untyped; body: untyped): untyped =
  let temp = res.toResult(void)
  if not temp.isOk:
    let e {.cursor.} = temp.err
    body

template okOr*(res: ptr WasmTrapT; e: untyped; body: untyped): untyped =
  let temp = res.toResult(void)
  if not temp.isOk:
    let e {.cursor.} = temp.err
    body

template `?`*[T](self: WasmtimeResult[T]): untyped =
  block:
    var t = self
    if t.isErr:
      return t.toResult(void)
    when T isnot void:
      t.val.ensureMove

template `?`*(self: ptr ErrorT): untyped =
  block:
    var t = self
    if t != nil:
      return t.toResult(void)

template `?`*(self: ptr WasmTrapT): untyped =
  block:
    var t = self
    if t != nil:
      return t.toResult(void)

proc newModule*(engine: ptr WasmEngineT; wasm: openArray[uint8]): WasmtimeResult[ptr ModuleT] =
  var res: ptr ModuleT = nil
  let err = engine.newModule(wasm[0].addr, wasm.len.csize_t, res.addr)
  if err != nil:
    return err.toResult(ptr ModuleT)
  return res.ok

proc newModule*(engine: ptr WasmEngineT; wasm: string): WasmtimeResult[ptr ModuleT] =
  var res: ptr ModuleT = nil
  let err = engine.newModule(cast[ptr uint8](wasm[0].addr), wasm.len.csize_t, res.addr)
  if err != nil:
    return err.toResult(ptr ModuleT)
  return res.ok

proc imports*(module: ptr ModuleT): WasmImporttypeVecT =
  module.imports(result.addr)

proc exports*(module: ptr ModuleT): WasmExporttypeVecT =
  module.exports(result.addr)

proc newComponent*(engine: ptr WasmEngineT, buf: openArray[char]): WasmtimeResult[ptr ComponentT] =
  var c: ptr ComponentT = nil
  let err = engine.fromBinary(cast[ptr uint8](buf[0].addr), buf.len.csize_t, c.addr)
  if err != nil:
    return err.toResult(ptr ComponentT)
  return ok(c)

proc instantiate*(linker: ptr LinkerT, store: ptr ContextT, module: ptr ModuleT, trap: ptr ptr WasmTrapT): WasmtimeResult[InstanceT] =
  var instance: InstanceT
  let err = linker.instantiate(store, module, instance.addr, trap)
  if err != nil:
    return err.toResult(InstanceT)
  return instance.ok

proc getExport*(instance: InstanceT, store: ptr ContextT, index: int):
    Option[tuple[name: string, extern: ExternT]] =
  var name: cstring = ""
  var nameLen: csize_t = 0
  var res: ExternT
  if not store.exportNth(instance.addr, index.csize_t, name.addr, nameLen.addr, res.addr):
    return
  (name.toOpenArray(0, nameLen.int - 1).join(), res).some

proc getExport*(instance: InstanceT, store: ptr ContextT, name: string):
    Option[ExternT] =
  var instance = instance
  var res: ExternT
  if not store.exportGet(instance.addr, name.cstring, name.len.csize_t, res.addr):
    return
  res.some

proc getExport*(caller: ptr CallerT; name: string): Option[ExternT] =
  var res: ExternT
  if caller.wasmtimeCallerExportGet(name.cstring, name.len.csize_t, res.addr):
    return res.some

proc data*[T](arr: openArray[T]): ptr T =
  if arr.len == 0:
    nil
  else:
    arr[0].addr

proc call*(f: ptr FuncT, store: ptr ContextT, args: openArray[ValT],
    results: openArray[ValT], trap: ptr ptr WasmTrapT): ptr ErrorT =
  store.call(f, args.data, args.len.csize_t, results.data, results.len.csize_t, trap)

proc call*(f: ptr ComponentFuncT, context: ptr ComponentContextT, args: openArray[ComponentValT],
    results: openArray[ComponentValT]): WasmtimeResult[void] =
  let argsPtr = if args.len > 0:
    args[0].addr
  else:
    nil

  let resultsPtr = if results.len > 0:
    results[0].addr
  else:
    nil

  var trap: ptr WasmTrapT = nil
  result = f.call(context, argsPtr, args.len.csize_t, resultsPtr, results.len.csize_t, trap.addr).toResult(void)
  if trap != nil:
    result = trap.toResult(void)

type ComponentFuncCallback*[T] = proc(ctx: ptr ComponentContextT, data: ptr T, params: openArray[ComponentValT], results: var openArray[ComponentValT]): ptr WasmTrapT

proc funcNew*[T](linker: ptr ComponentLinkerT, env: string, name: string,
    callback: ComponentFuncCallback[T], data: ptr T = nil,
    finalizer: proc (a0: ptr T): void = nil): WasmtimeResult[void] =

  type Data = object
    callback: ComponentFuncCallback[T]
    data: ptr T
    finalizer: proc (a0: ptr T): void
    env: string
    name: string

  var ctx = createShared(Data)
  ctx.callback = callback
  ctx.data = data
  ctx.finalizer = finalizer
  ctx.env = env
  ctx.name = name

  proc fin(data: pointer) {.cdecl.} =
    let data = cast[ptr Data](data)
    if data.finalizer != nil:
      data.finalizer(data.data)
    deallocShared(data)

  proc cb(ctx: ptr ComponentContextT, data: pointer, parameters: ptr ComponentValT, paramsLen: csize_t, results: ptr ComponentValT, resultsLen: csize_t): ptr WasmTrapT {.cdecl.} =
    let data = cast[ptr Data](data)
    let parameters = cast[ptr UncheckedArray[ComponentValT]](parameters)
    let results = cast[ptr UncheckedArray[ComponentValT]](results)
    try:
      data[].callback(ctx, data[].data, parameters.toOpenArray(0, paramsLen.int - 1), results.toOpenArray(0, resultsLen.int - 1))
    except Exception as e:
      let msg = &"Failed to run func '{data.env}.{data.name}': {e.msg}\n{e.getStackTrace()}"
      newTrap(msg.cstring, msg.len.csize_t)

  return linker.funcNew(env.cstring, env.len.csize_t, name.cstring, name.len.csize_t, cb, ctx, fin).toResult(void)

type FuncCallback*[T] = proc(ctx: ptr ContextT, caller: ptr CallerT, data: ptr T, params: var openArray[ValRawT]): ptr WasmTrapT

proc defineFuncUnchecked*[T](linker: ptr LinkerT, env: string, name: string,
    callback: FuncCallback[T], ty: ptr WasmFunctypeT, data: ptr T = nil,
    finalizer: proc (a0: ptr T): void = nil): WasmtimeResult[void] =

  type Data = object
    callback: FuncCallback[T]
    data: ptr T
    finalizer: proc (a0: ptr T): void
    env: string
    name: string

  var ctx = createShared(Data)
  ctx.callback = callback
  ctx.data = data
  ctx.finalizer = finalizer
  ctx.env = env
  ctx.name = name

  proc fin(data: pointer) {.cdecl.} =
    let data = cast[ptr Data](data)
    if data.finalizer != nil:
      data.finalizer(data.data)
    deallocShared(data)

  proc cb(data: pointer, caller: ptr CallerT, parameters: ptr ValRawT, paramsLen: csize_t): ptr WasmTrapT {.cdecl.} =
    let ctx = caller.wasmtimeCallerContext()
    let data = cast[ptr Data](data)
    let parameters = cast[ptr UncheckedArray[ValRawT]](parameters)
    try:
      data[].callback(ctx, caller, data[].data, parameters.toOpenArray(0, paramsLen.int - 1))
    except Exception as e:
      let msg = &"Failed to run func '{data.env}.{data.name}': {e.msg}\n{e.getStackTrace()}"
      newTrap(msg.cstring, msg.len.csize_t)

  return linker.defineFuncUnchecked(env.cstring, env.len.csize_t, name.cstring, name.len.csize_t, ty, cb, ctx, fin).toResult(void)

template defineFuncUnchecked*(linker: ptr LinkerT, env: string, name: string, ty: ptr WasmFunctypeT, body: untyped): WasmtimeResult[void] =
  block:
    proc cb(s: ptr ContextT, c: ptr CallerT, data: ptr int, p: var openArray[ValRawT]): ptr WasmTrapT =
      proc inner(store {.inject.}: ptr ContextT, caller {.inject.}: ptr CallerT, parameters {.inject.}: var openArray[ValRawT]): WasmtimeResult[void] =
        # echo "[host] " & name & &" <- {parameters.len}"
        # defer:
        #   echo "[host] " & name & &" -> {parameters.len}"
        body

      inner(s, c, p).okOr(e):
        let msg = $e
        return newTrap(msg.cstring, msg.len.csize_t)

      nil

    let funcName {.inject.} = name
    let res = linker.defineFuncUnchecked[:int](env, funcName, cb, ty)
    res

template defineFunc*(linker: ptr ComponentLinkerT, env: string, name: string, body: untyped): untyped =
  block:
    proc cb(s: ptr ComponentContextT, data: ptr int, p: openArray[ComponentValT], r: var openArray[ComponentValT]): ptr WasmTrapT =
      proc inner(store {.inject.}: ptr ComponentContextT, parameters {.inject.}: openArray[ComponentValT], results {.inject.}: var openArray[ComponentValT]): WasmtimeResult[void] =
        # echo "[host] " & name & &" <- {parameters}"
        # defer:
        #   echo "[host] " & name & &" -> {results}"
        body

      inner(s, p, r).okOr(e):
        let msg = $e
        return newTrap(msg.cstring, msg.len.csize_t)

      nil

    let funcName {.inject.} = name
    let res = linker.funcNew[:int](env, funcName, cb)
    res

proc resourceHostData*(ctx: ptr ComponentContextT; val: ptr ComponentValT;
                       T: typedesc): WasmtimeResult[ptr T] =
  let data: pointer = nil
  let err = ctx.resourceHostData(val, data.addr)
  if err != nil:
    return err.toResult(ptr T)
  assert data != nil
  return wasmtime.ok(cast[ptr T](data))

proc `$`*(a: ComponentValT): string =
  case a.kind.ComponentValKind
  of Bool: $a.payload.boolean
  of S8: $a.payload.s8
  of U8: $a.payload.u8
  of S16: $a.payload.s16
  of U16: $a.payload.u16
  of S32: $a.payload.s32
  of U32: $a.payload.u32
  of S64: $a.payload.s64
  of U64: $a.payload.u64
  of Float32: $a.payload.f32
  of Float64: $a.payload.f64
  of Char: $a.payload.character.Rune
  of String: "\"" & $a.payload.string_field.strVal & "\""

  of List:
    var str = "["
    for i, v in a.payload.list:
      if i > 0: str.add ", "
      str.add $v
    str.add "]"
    str

  of Record:
    var str = "{"
    for i, v in a.payload.record:
      if i > 0: str.add ", "
      str.add v.name.strVal
      str.add ": "
      str.add $v.val
    str.add "}"
    str

  of Tuple:
    var str = "("
    for i, v in a.payload.tuple_field:
      if i > 0: str.add ", "
      str.add $v
    str.add ")"
    str

  of Variant:
    if a.payload.variant.val != nil:
      a.payload.variant.name.strVal & "(" & $a.payload.variant.val[] & ")"
    else:
      a.payload.variant.name.strVal

  of Enum: a.payload.enumeration.name.strVal

  of Option:
    if a.payload.option != nil:
      "Some(" & $(a.payload.option[]) & ")"
    else:
      "none"

  of Result:
    if a.payload.result.error:
      if a.payload.result.val == nil:
        "Err()"
      else:
        "Err(" & $(a.payload.result.val[]) & ")"
    else:
      if a.payload.result.val == nil:
        "Ok()"
      else:
        "Ok(" & $(a.payload.result.val[]) & ")"

  of Flags:
    var str = "{"
    for i, v in a.payload.flags:
      if i > 0: str.add ", "
      str.add v.strVal
    str.add "}"
    str

  of Resource:
    let name = a.addr.resourceDump()
    name.strVal
    # var str = "Resource(idx: " & $a.payload.resource.idx & ", owned: " & $a.payload.resource.owned_field & ", ty: "
    # str.add case a.payload.resource.ty.kind
    # of Host: $a.payload.resource.ty.payload.host
    # of Guest: $a.payload.resource.ty.payload.guest
    # of Uninstantiated: $a.payload.resource.ty.payload.uninstantiated
    # str.add ")"
    # str

proc `$`*[S](a: array[S, ComponentValT]): string =
  result = "["
  for i in 0..a.high:
    if i > 0:
      result.add ", "
    result.add $a[i]
  result.add "]"

proc `$`*(a: openArray[ComponentValT]): string =
  result = "["
  for i in 0..a.high:
    if i > 0:
      result.add ", "
    result.add $a[i]
  result.add "]"

proc defineResource*(linker: ptr ComponentLinkerT, env: string, name: string, userId: int, drop: proc(p: pointer) {.cdecl.}): WasmtimeResult[void] =
  return linker.defineResource(env.cstring, env.len.csize_t, name.cstring, name.len.csize_t, userId.csize_t, drop).toResult(void)

proc defineResource*(linker: ptr ComponentLinkerT, env: string, name: string, T: typedesc): WasmtimeResult[void] =
  proc deleteImpl(b: pointer) {.cdecl.} =
    let b = cast[ptr T](b)
    `=destroy`(b[])
    deallocShared(b)
  linker.defineResource(env, name, T.typeId, deleteImpl)

proc resourceNew*[T](context: ptr ComponentContextT, data: sink T): WasmtimeResult[ComponentValT] =
  var res: ComponentValT
  var r = createShared(T)
  r[] = data.ensureMove
  let err = context.resourceNew(T.typeId, res.addr, r)
  if err != nil:
    return err.toResult(ComponentValT)

  return wasmtime.ok(res.ensureMove)

proc getExport*(component: ptr ComponentT, name: string, parentIndex = ComponentExportIndexT.none): Option[ComponentExportIndexT] =
  var index: ComponentExportIndexT
  let parentIndex = parentIndex
  let parentIndexPtr = if parentIndex.isSome: parentIndex.get.addr else: nil
  if component.getExport(name.cstring, name.len.csize_t, parentIndexPtr, index.addr):
    return index.some

type
  ComponentImportsCallback* = proc (path: string, name: string, typ: ComponentItemType)

proc toString(s: cstring, l: csize_t): string =
  result = newStringOfCap(l.int)
  for i in 0..<l.int:
    result.add s[i]

proc iterateImports*(component: ptr ComponentT, cb: ComponentImportsCallback) =
  var data = cb

  proc cbInner(data: pointer, path: cstring, pathLen: csize_t, name: cstring, nameLen: csize_t, typ: ComponentItemTypeT) {.cdecl.} =
    let cb = cast[ptr ComponentImportsCallback](data)[]
    cb(toString(path, pathLen), toString(name, nameLen), typ.ComponentItemType)

  component.iterateImports(cbInner, data.addr)

proc newFuncType*(parameters: openArray[WasmValkind], results: openArray[WasmValkind]): ptr WasmFunctypeT =
  var parameters = parameters.mapIt(newValType(it.WasmValkindT)).toVec
  var results = results.mapIt(newValType(it.WasmValkindT)).toVec
  newFunctype(parameters.addr, results.addr)
