{.push hint[DuplicateModuleImport]:off.}
import std/[os, macros, strutils, json, sets, enumerate, tables, options, sequtils]

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
const nimWasmtimeFeatureDebugBuiltins* {.booldefine.} = false
const nimWasmtimeFeaturePoolingAllocator* {.booldefine.} = false

when nimWasmtimeOverride.len > 0:
  const wasmDir* = nimWasmtimeOverride
else:
  const wasmDir* = currentSourcePath().splitPath.head / "wasmtime"
static:
  echo "Using wasmtime repository ", wasmDir, ", build type ", nimWasmtimeBuildType

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
    "-d:nimWasmtimeFeatureDebugBuiltins=" & $nimWasmtimeFeatureDebugBuiltins,
    "-d:nimWasmtimeFeaturePoolingAllocator=" & $nimWasmtimeFeaturePoolingAllocator,
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
    # todo: this is still missing some libraries (like  -lws2_32 -luserenv, but also something else)
    when defined(clang):
      {.passL: "-lwasmtime.lib".}
    else:
      {.passL: "-l:wasmtime.lib -lm".}
  else:
    {.passL: "-l:libwasmtime.a -lm".}
else:
  when defined(windows):
    when defined(clang):
      # no -lm because the required functions are in a different library on windows which should be linked by default.
      {.passL: "-lwasmtime.dll".}
    else:
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

when defined(useFuthark) or defined(useFutharkForWasmtime):
  import futhark

  proc wrapperRenameCallback*(name: string, kind: SymbolKind, partof: string, overloading: var bool): string =
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
    of EnumVal:
      result.removePrefix("WASM_")
      if not result.endsWith("_NONE"):
        result.removePrefix("WASMTIME_TRAP_CODE_")
        result.removePrefix("WASMTIME_OPT_LEVEL_")
        result.removePrefix("WASMTIME_PROFILING_STRATEGY_")
        result.removePrefix("WASMTIME_STRATEGY_")
      result.removePrefix("WASMTIME_")
      result = processName(result)

    of Enum:
      result.removePrefix("enum_")
      result.removeSuffix("_enum")
      result.removePrefix("wasmtime_")
      result = processName(result)
      enums.incl result

    of Union:
      result.removePrefix("union_")
      # result.removeSuffix("_union")
      result.removePrefix("wasmtime_")
      result = processName(result)
      enums.incl result

    of Struct, Anon:
      # if result == "struct_wasm_config_t":
      #   result = "wasm_config_type"
      result.removePrefix("wasmtime_")
      result = processName(result)

    of Typedef:
      result.removePrefix("wasmtime_")
      result = processName(result)

    of Proc:
      overloading = true
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
      result.removePrefix("wasmtime_component_val_record_vec_")
      result.removePrefix("wasmtime_component_val_vec_")
      result.removePrefix("wasmtime_component_val_flags_vec_")

      result.removePrefix("wasmtime_component_linker_")
      result.removePrefix("wasmtime_component_store_")
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

  const outputPath = currentSourcePath().splitPath.head / "bindings/wrapper.nim"
  const llvmIncludePath = staticExec("clang -print-resource-dir").strip() / "../../../include"
  static:
    echo "Using LLVM from ", llvmIncludePath

  static:
    createDir(currentSourcePath().splitPath.head / "bindings")
  importc:
    sysPath llvmIncludePath
    path wasmDir / "crates/c-api/include"
    path wasmDir / "crates/c-api/include/wasmtime"
    outputPath outputPath
    # outputPath currentSourcePath().splitPath.head / "bindings"
    renameCallback wrapperRenameCallback

    # proc opirCallback*(data: JsonNode): JsonNode {.gcsafe, raises: [], closure.} =
    #   result = newJArray()
    #   for v in data:
    #     try:
    #       if v["kind"].getStr == "const" and v["name"].getStr == "wasm_name":
    #         echo "REMOVING ", v.pretty
    #         # continue
    #     except:
    #       echo getCurrentExceptionMsg()
    #     result.add v

    # addOpirCallback opirCallback

    "wasm.h"
    "error.h"
    "config.h"
    "store.h"
    "async.h"
    # "component.h"
    "component/component.h"
    "component/func.h"
    "component/instance.h"
    "component/linker.h"
    "component/val.h"
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

      # todo
      # template owned(T: typed): untyped =
      #   proc `=copy`*(self: var T, src: T) {.error.}

      #   proc clone*(self: T): T =
      #     self.addr.copy(result.addr)

      #   proc `=destroy`*(self: T) =
      #     if self.data != nil:
      #       self.addr.delete()

      template vecType(T: untyped, unchecked: bool = true): untyped =
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

    static:
      postProcess()

else: # defined(useFuthark) or defined(useFutharkForWasmtime)
  include bindings/wrapper

from std/unicode import Rune, `$`
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

proc newFuncType*(parameters: openArray[WasmValkind], results: openArray[WasmValkind]): ptr WasmFunctypeT =
  var parameters = parameters.mapIt(newValType(it.WasmValkindT)).toVec
  var results = results.mapIt(newValType(it.WasmValkindT)).toVec
  newFunctype(parameters.addr, results.addr)
