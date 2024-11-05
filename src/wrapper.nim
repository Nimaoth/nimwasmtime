
type
  WasmMutability* {.size: sizeof(cuint).} = enum
    Const = 0, Var = 1
type
  WasmValkind* {.size: sizeof(cuint).} = enum
    I32 = 0, I64 = 1, F32 = 2, F64 = 3, Externref = 128, Funcref = 129
type
  WasmExternkind* {.size: sizeof(cuint).} = enum
    ExternFunc = 0, ExternGlobal = 1, ExternTable = 2, ExternMemory = 3
type
  Strategy* {.size: sizeof(cuint).} = enum
    Auto = 0, Cranelift = 1
type
  OptLevel* {.size: sizeof(cuint).} = enum
    OptLevelNone = 0, Speed = 1, SpeedAndSize = 2
type
  ProfilingStrategy* {.size: sizeof(cuint).} = enum
    ProfilingStrategyNone = 0, Jitdump = 1, Vtune = 2, Perfmap = 3
type
  ComponentValKind* {.size: sizeof(cuint).} = enum
    Bool = 0, S8 = 1, U8 = 2, S16 = 3, U16 = 4, S32 = 5, U32 = 6, S64 = 7,
    U64 = 8, Float32 = 9, Float64 = 10, Char = 11, String = 12, List = 13,
    Record = 14, Tuple = 15, Variant = 16, Enum = 17, Option = 18, Result = 19,
    Flags = 20
type
  TrapCode* {.size: sizeof(cuint).} = enum
    StackOverflow = 0, MemoryOutOfBounds = 1, HeapMisaligned = 2,
    TableOutOfBounds = 3, IndirectCallToNull = 4, BadSignature = 5,
    IntegerOverflow = 6, IntegerDivisionByZero = 7, BadConversionToInteger = 8,
    UnreachableCodeReached = 9, Interrupt = 10, OutOfFuel = 11
type
  StructWasmtimeContext* = object
type
  StructWasmFunctypeT* = object
type
  StructWasmValtypeT* = object
type
  StructWasmStoreT* = object
type
  StructWasmtimeComponentStore* = object
type
  StructWasmTabletypeT* = object
type
  StructWasmtimeLinker* = object
type
  StructWasmModuleT* = object
type
  StructWasmtimeComponentT* = object
type
  StructWasmtimeCallFuture* = object
type
  StructWasmInstanceT* = object
type
  StructWasmtimeCaller* = object
type
  StructWasmEngineT* = object
type
  StructWasmtimeComponentContext* = object
type
  StructWasmtimeModule* = object
type
  StructWasmFrameT* = object
type
  StructWasmSharedModuleT* = object
type
  StructWasmTrapT* = object
type
  StructWasmFuncT* = object
type
  StructWasmMemoryT* = object
type
  StructWasmtimeInstancePre* = object
type
  StructWasmExporttypeT* = object
type
  StructWasmRefT* = object
type
  StructWasmTableT* = object
type
  StructWasmExternT* = object
type
  StructWasmtimeError* = object
type
  StructWasiConfigT* = object
type
  StructWasmExterntypeT* = object
type
  StructWasmtimeComponentLinkerT* = object
type
  StructWasmImporttypeT* = object
type
  StructWasmtimeComponentInstanceT* = object
type
  StructWasmMemorytypeT* = object
type
  StructWasmtimeComponentFuncT* = object
type
  StructWasmtimeStore* = object
type
  StructWasmConfigT* = object
type
  StructWasmGlobaltypeT* = object
type
  StructWasmtimeGuestprofiler* = object
type
  StructWasmtimeSharedmemory* = object
type
  StructWasmForeignT* = object
type
  StructWasmGlobalT* = object
type
  ByteT* = cschar            ## Generated based on wasmtime/crates/c-api/include/wasm.h:43:14
  Float32T* = cfloat         ## Generated based on wasmtime/crates/c-api/include/wasm.h:44:15
  Float64T* = cdouble        ## Generated based on wasmtime/crates/c-api/include/wasm.h:45:16
  WasmByteT* = ByteT         ## Generated based on wasmtime/crates/c-api/include/wasm.h:101:16
  StructWasmByteVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:102:1
    data*: ptr WasmByteT
  WasmByteVecT* = object of StructWasmByteVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:102:1
  WasmNameT* = WasmByteVecT  ## Generated based on wasmtime/crates/c-api/include/wasm.h:104:25
  WasmConfigT* = StructWasmConfigT ## Generated based on wasmtime/crates/c-api/include/wasm.h:131:1
  WasmEngineT* = StructWasmEngineT ## Generated based on wasmtime/crates/c-api/include/wasm.h:140:1
  WasmStoreT* = StructWasmStoreT ## Generated based on wasmtime/crates/c-api/include/wasm.h:148:1
  WasmMutabilityT* = uint8   ## Generated based on wasmtime/crates/c-api/include/wasm.h:158:17
  StructWasmLimitsT* {.pure, inheritable, bycopy.} = object
    min*: uint32             ## Generated based on wasmtime/crates/c-api/include/wasm.h:164:16
    max*: uint32
  WasmLimitsT* = StructWasmLimitsT ## Generated based on wasmtime/crates/c-api/include/wasm.h:167:3
  WasmValtypeT* = StructWasmValtypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:183:1
  StructWasmValtypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:183:1
    data*: ptr ptr WasmValtypeT
  WasmValtypeVecT* = object of StructWasmValtypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:183:1
  WasmValkindT* = uint8      ## Generated based on wasmtime/crates/c-api/include/wasm.h:185:17
  WasmFunctypeT* = StructWasmFunctypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:216:1
  StructWasmFunctypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:216:1
    data*: ptr ptr WasmFunctypeT
  WasmFunctypeVecT* = object of StructWasmFunctypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:216:1
  WasmGlobaltypeT* = StructWasmGlobaltypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:227:1
  StructWasmGlobaltypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:227:1
    data*: ptr ptr WasmGlobaltypeT
  WasmGlobaltypeVecT* = object of StructWasmGlobaltypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:227:1
  WasmTabletypeT* = StructWasmTabletypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:238:1
  StructWasmTabletypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:238:1
    data*: ptr ptr WasmTabletypeT
  WasmTabletypeVecT* = object of StructWasmTabletypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:238:1
  WasmMemorytypeT* = StructWasmMemorytypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:249:1
  StructWasmMemorytypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:249:1
    data*: ptr ptr WasmMemorytypeT
  WasmMemorytypeVecT* = object of StructWasmMemorytypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:249:1
  WasmExterntypeT* = StructWasmExterntypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:258:1
  StructWasmExterntypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:258:1
    data*: ptr ptr WasmExterntypeT
  WasmExterntypeVecT* = object of StructWasmExterntypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:258:1
  WasmExternkindT* = uint8   ## Generated based on wasmtime/crates/c-api/include/wasm.h:260:17
  WasmImporttypeT* = StructWasmImporttypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:293:1
  StructWasmImporttypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:293:1
    data*: ptr ptr WasmImporttypeT
  WasmImporttypeVecT* = object of StructWasmImporttypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:293:1
  WasmExporttypeT* = StructWasmExporttypeT ## Generated based on wasmtime/crates/c-api/include/wasm.h:305:1
  StructWasmExporttypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:305:1
    data*: ptr ptr WasmExporttypeT
  WasmExporttypeVecT* = object of StructWasmExporttypeVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:305:1
  StructWasmValT_of_field_t* {.union, bycopy.} = object
    i32*: int32
    i64*: int64
    f32*: Float32T
    f64*: Float64T
    ref_field*: ptr StructWasmRefT
  StructWasmValT* {.pure, inheritable, bycopy.} = object
    kind*: WasmValkindT      ## Generated based on wasmtime/crates/c-api/include/wasm.h:321:16
    of_field*: StructWasmValT_of_field_t
  WasmValT* = StructWasmValT ## Generated based on wasmtime/crates/c-api/include/wasm.h:330:3
  StructWasmValVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:335:1
    data*: ptr WasmValT
  WasmValVecT* = object of StructWasmValVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:335:1
  WasmRefT* = StructWasmRefT ## Generated based on wasmtime/crates/c-api/include/wasm.h:367:1
  WasmFrameT* = StructWasmFrameT ## Generated based on wasmtime/crates/c-api/include/wasm.h:372:1
  StructWasmFrameVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:373:1
    data*: ptr ptr WasmFrameT
  WasmFrameVecT* = object of StructWasmFrameVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:373:1
  WasmMessageT* = WasmNameT  ## Generated based on wasmtime/crates/c-api/include/wasm.h:384:21
  WasmTrapT* = StructWasmTrapT ## Generated based on wasmtime/crates/c-api/include/wasm.h:386:1
  WasmForeignT* = StructWasmForeignT ## Generated based on wasmtime/crates/c-api/include/wasm.h:397:1
  WasmModuleT* = StructWasmModuleT ## Generated based on wasmtime/crates/c-api/include/wasm.h:404:1
  WasmSharedModuleT* = StructWasmSharedModuleT ## Generated based on wasmtime/crates/c-api/include/wasm.h:404:1
  WasmFuncT* = StructWasmFuncT ## Generated based on wasmtime/crates/c-api/include/wasm.h:420:1
  WasmFuncCallbackT* = proc (a0: ptr WasmValVecT; a1: ptr WasmValVecT): ptr WasmTrapT {.
      cdecl.}                ## Generated based on wasmtime/crates/c-api/include/wasm.h:422:28
  WasmFuncCallbackWithEnvT* = proc (a0: pointer; a1: ptr WasmValVecT;
                                    a2: ptr WasmValVecT): ptr WasmTrapT {.cdecl.} ## Generated based on wasmtime/crates/c-api/include/wasm.h:424:28
  WasmGlobalT* = StructWasmGlobalT ## Generated based on wasmtime/crates/c-api/include/wasm.h:443:1
  WasmTableT* = StructWasmTableT ## Generated based on wasmtime/crates/c-api/include/wasm.h:456:1
  WasmTableSizeT* = uint32   ## Generated based on wasmtime/crates/c-api/include/wasm.h:458:18
  WasmMemoryT* = StructWasmMemoryT ## Generated based on wasmtime/crates/c-api/include/wasm.h:474:1
  WasmMemoryPagesT* = uint32 ## Generated based on wasmtime/crates/c-api/include/wasm.h:476:18
  WasmExternT* = StructWasmExternT ## Generated based on wasmtime/crates/c-api/include/wasm.h:493:1
  StructWasmExternVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasm.h:494:1
    data*: ptr ptr WasmExternT
  WasmExternVecT* = object of StructWasmExternVecT ## Generated based on wasmtime/crates/c-api/include/wasm.h:494:1
  WasmInstanceT* = StructWasmInstanceT ## Generated based on wasmtime/crates/c-api/include/wasm.h:522:1
  ErrorT* = StructWasmtimeError ## Generated based on wasmtime/crates/c-api/include/wasmtime/error.h:31:31
  StrategyT* = uint8         ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:22:17
  OptLevelT* = uint8         ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:44:17
  ProfilingStrategyT* = uint8 ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:66:17
  MemoryGetCallbackT* = proc (a0: pointer; a1: ptr csize_t; a2: ptr csize_t): ptr uint8 {.
      cdecl.}                ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:446:20
  MemoryGrowCallbackT* = proc (a0: pointer; a1: csize_t): ptr ErrorT {.cdecl.} ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:455:29
  StructWasmtimeLinearMemory* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:464:16
    get_memory*: MemoryGetCallbackT
    grow_memory*: MemoryGrowCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  LinearMemoryT* = StructWasmtimeLinearMemory ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:473:3
  NewMemoryCallbackT* = proc (a0: pointer; a1: ptr WasmMemorytypeT; a2: csize_t;
                              a3: csize_t; a4: csize_t; a5: csize_t;
                              a6: ptr LinearMemoryT): ptr ErrorT {.cdecl.} ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:486:29
  StructWasmtimeMemoryCreator* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:498:16
    new_memory*: NewMemoryCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  MemoryCreatorT* = StructWasmtimeMemoryCreator ## Generated based on wasmtime/crates/c-api/include/wasmtime/config.h:505:3
  WasiConfigT* = StructWasiConfigT ## Generated based on wasmtime/crates/c-api/include/wasi.h:44:1
  StoreT* = StructWasmtimeStore ## Generated based on wasmtime/crates/c-api/include/wasmtime/store.h:37:31
  ContextT* = StructWasmtimeContext ## Generated based on wasmtime/crates/c-api/include/wasmtime/store.h:58:33
  UpdateDeadlineKindT* = uint8 ## Generated based on wasmtime/crates/c-api/include/wasmtime/store.h:212:17
  ModuleT* = StructWasmtimeModule ## Generated based on wasmtime/crates/c-api/include/wasmtime/module.h:28:32
  SharedmemoryT* = StructWasmtimeSharedmemory ## Generated based on wasmtime/crates/c-api/include/wasmtime/sharedmemory.h:24:38
  StructWasmtimeFunc* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:25:16
    compiler_private*: csize_t
  FuncT* = StructWasmtimeFunc ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:34:3
  StructWasmtimeTable* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:43:16
    compiler_private*: csize_t
  TableT* = StructWasmtimeTable ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:48:3
  StructWasmtimeMemory* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:57:16
    compiler_private*: csize_t
  MemoryT* = StructWasmtimeMemory ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:62:3
  StructWasmtimeGlobal* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:71:16
    compiler_private*: csize_t
  GlobalT* = StructWasmtimeGlobal ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:76:3
  ExternKindT* = uint8       ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:79:17
  Extern* {.union, bycopy.} = object
    func_field*: FuncT       ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:107:15
    global*: GlobalT
    table*: TableT
    memory*: MemoryT
    sharedmemory*: ptr StructWasmtimeSharedmemory
  ExternUnionT* = Extern     ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:118:3
  StructWasmtimeExtern* {.pure, inheritable, bycopy.} = object
    kind*: ExternKindT       ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:133:16
    of_field*: ExternUnionT
  ExternT* = StructWasmtimeExtern ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:138:3
  StructWasmtimeAnyref* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:39:16
    compiler_private1*: uint32
    compiler_private2*: uint32
  AnyrefT* = StructWasmtimeAnyref ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:47:3
  StructWasmtimeExternref* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:174:16
    compiler_private1*: uint32
    compiler_private2*: uint32
  ExternrefT* = StructWasmtimeExternref ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:182:3
  ValkindT* = uint8          ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:284:17
  V128* = array[16'i64, uint8] ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:307:17
  Valunion* {.union, bycopy.} = object
    i32*: int32              ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:319:15
    i64*: int64
    f32*: Float32T
    f64*: Float64T
    anyref*: AnyrefT
    externref*: ExternrefT
    funcref*: FuncT
    v128*: V128
  ValunionT* = Valunion      ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:339:3
  ValRaw* {.union, bycopy.} = object
    i32*: int32              ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:372:15
    i64*: int64
    f32*: Float32T
    f64*: Float64T
    v128*: V128
    anyref*: uint32
    externref*: uint32
    funcref*: pointer
  ValRawT* = ValRaw          ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:416:3
  StructWasmtimeVal* {.pure, inheritable, bycopy.} = object
    kind*: ValkindT          ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:441:16
    of_field*: ValunionT
  ValT* = StructWasmtimeVal  ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:446:3
  CallerT* = StructWasmtimeCaller ## Generated based on wasmtime/crates/c-api/include/wasmtime/func.h:33:32
  FuncCallbackT* = proc (a0: pointer; a1: ptr CallerT; a2: ptr ValT;
                         a3: csize_t; a4: ptr ValT; a5: csize_t): ptr WasmTrapT {.
      cdecl.}                ## Generated based on wasmtime/crates/c-api/include/wasmtime/func.h:57:24
  FuncUncheckedCallbackT* = proc (a0: pointer; a1: ptr CallerT; a2: ptr ValRawT;
                                  a3: csize_t): ptr WasmTrapT {.cdecl.} ## Generated based on wasmtime/crates/c-api/include/wasmtime/func.h:116:24
  StructWasmtimeInstance* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime/crates/c-api/include/wasmtime/instance.h:26:16
    index*: csize_t
  InstanceT* = StructWasmtimeInstance ## Generated based on wasmtime/crates/c-api/include/wasmtime/instance.h:31:3
  InstancePreT* = StructWasmtimeInstancePre ## Generated based on wasmtime/crates/c-api/include/wasmtime/instance.h:121:38
  LinkerT* = StructWasmtimeLinker ## Generated based on wasmtime/crates/c-api/include/wasmtime/linker.h:38:32
  FuncAsyncContinuationCallbackT* = proc (a0: pointer): bool {.cdecl.} ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:124:16
  StructWasmtimeAsyncContinuationT* {.pure, inheritable, bycopy.} = object
    callback*: FuncAsyncContinuationCallbackT ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:129:16
    env*: pointer
    finalizer*: proc (a0: pointer): void {.cdecl.}
  AsyncContinuationT* = StructWasmtimeAsyncContinuationT ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:136:3
  FuncAsyncCallbackT* = proc (a0: pointer; a1: ptr CallerT; a2: ptr ValT;
                              a3: csize_t; a4: ptr ValT; a5: csize_t;
                              a6: ptr ptr WasmTrapT; a7: ptr AsyncContinuationT): void {.
      cdecl.}                ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:164:16
  CallFutureT* = StructWasmtimeCallFuture ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:178:37
  StackMemoryGetCallbackT* = proc (a0: pointer; a1: ptr csize_t): ptr uint8 {.
      cdecl.}                ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:305:20
  StructWasmtimeStackMemoryT* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:314:9
    get_stack_memory*: StackMemoryGetCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  StackMemoryT* = StructWasmtimeStackMemoryT ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:321:3
  NewStackMemoryCallbackT* = proc (a0: pointer; a1: csize_t;
                                   a2: ptr StackMemoryT): ptr ErrorT {.cdecl.} ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:334:29
  StructWasmtimeStackCreatorT* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:343:9
    new_stack*: NewStackMemoryCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  StackCreatorT* = StructWasmtimeStackCreatorT ## Generated based on wasmtime/crates/c-api/include/wasmtime/async.h:350:3
  ComponentStoreT* = StructWasmtimeComponentStore ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:30:41
  ComponentContextT* = StructWasmtimeComponentContext ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:31:43
  ComponentValKindT* = uint8 ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:35:17
  ComponentValT* = StructWasmtimeComponentValT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:158:3
  StructWasmtimeComponentValT* {.pure, inheritable, bycopy.} = object
    kind*: ComponentValKindT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:155:16
    payload*: ComponentValPayloadT_typedef
  ComponentValRecordFieldT* = StructWasmtimeComponentValRecordFieldT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:164:3
  StructWasmtimeComponentValRecordFieldT* {.pure, inheritable, bycopy.} = object
    name*: WasmNameT         ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:161:16
    val*: ComponentValT
  StructWasmtimeComponentValVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:102:1
    data*: ptr ComponentValT
  ComponentValVecT* = object of StructWasmtimeComponentValVecT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:102:1
  StructWasmtimeComponentValRecordFieldVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:105:1
    data*: ptr ComponentValRecordFieldT
  ComponentValRecordFieldVecT* = object of StructWasmtimeComponentValRecordFieldVecT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:105:1
  StructWasmtimeComponentValFlagsVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:108:1
    data*: ptr WasmNameT
  ComponentValFlagsVecT* = object of StructWasmtimeComponentValFlagsVecT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:108:1
  StructWasmtimeComponentValVariantT* {.pure, inheritable, bycopy.} = object
    name*: WasmNameT         ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:113:16
    val*: ptr ComponentValT
  ComponentValVariantT* = StructWasmtimeComponentValVariantT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:116:3
  StructWasmtimeComponentValResultT* {.pure, inheritable, bycopy.} = object
    val*: ptr ComponentValT  ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:120:16
    error*: bool
  ComponentValResultT* = StructWasmtimeComponentValResultT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:123:3
  StructWasmtimeComponentValEnumT* {.pure, inheritable, bycopy.} = object
    name*: WasmNameT         ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:126:16
  ComponentValEnumT* = StructWasmtimeComponentValEnumT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:128:3
  ComponentValPayloadT* {.union, bycopy.} = object
    boolean*: bool           ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:130:15
    s8*: int8
    u8*: uint8
    s16*: int16
    u16*: uint16
    s32*: int32
    u32*: uint32
    s64*: int64
    u64*: uint64
    f32*: cfloat
    f64*: cdouble
    character*: uint32
    string_field*: WasmNameT
    list*: ComponentValVecT
    record*: ComponentValRecordFieldVecT
    tuple_field*: ComponentValVecT
    variant*: ComponentValVariantT
    enumeration*: ComponentValEnumT
    option*: ptr ComponentValT
    result*: ComponentValResultT
    flags*: ComponentValFlagsVecT
  ComponentValPayloadT_typedef* = ComponentValPayloadT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:152:3
  ComponentT* = StructWasmtimeComponentT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:178:37
  ComponentLinkerT* = StructWasmtimeComponentLinkerT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:188:44
  ComponentFuncCallbackT* = proc (a0: pointer; a1: ptr ComponentValT;
                                  a2: csize_t; a3: ptr ComponentValT;
                                  a4: csize_t): ptr WasmTrapT {.cdecl.} ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:197:24
  ComponentInstanceT* = StructWasmtimeComponentInstanceT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:209:46
  ComponentFuncT* = StructWasmtimeComponentFuncT ## Generated based on wasmtime/crates/c-api/include/wasmtime/component.h:217:42
  GuestprofilerT* = StructWasmtimeGuestprofiler ## Generated based on wasmtime/crates/c-api/include/wasmtime/profiling.h:31:39
  StructWasmtimeGuestprofilerModules* {.pure, inheritable, bycopy.} = object
    name*: ptr WasmNameT     ## Generated based on wasmtime/crates/c-api/include/wasmtime/profiling.h:48:16
    mod_field*: ptr ModuleT
  GuestprofilerModulesT* = StructWasmtimeGuestprofilerModules ## Generated based on wasmtime/crates/c-api/include/wasmtime/profiling.h:52:3
  TrapCodeT* = uint8         ## Generated based on wasmtime/crates/c-api/include/wasmtime/trap.h:21:17
proc new*(out_arg: ptr WasmByteVecT; a1: csize_t;
          a2: ptr UncheckedArray[WasmByteT]): void {.cdecl,
    importc: "wasm_byte_vec_new".}
proc newEmpty*(out_arg: ptr WasmByteVecT): void {.cdecl,
    importc: "wasm_byte_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmByteVecT; a1: csize_t): void {.cdecl,
    importc: "wasm_byte_vec_new_uninitialized".}
proc copy*(out_arg: ptr WasmByteVecT; a1: ptr WasmByteVecT): void {.cdecl,
    importc: "wasm_byte_vec_copy".}
proc delete*(a0: ptr WasmByteVecT): void {.cdecl,
    importc: "wasm_byte_vec_delete".}
when 0 is static:
  const
    WASMTIME_UPDATE_DEADLINE_CONTINUE* = 0 ## Generated based on wasmtime/crates/c-api/include/wasmtime/store.h:214:9
else:
  let WASMTIME_UPDATE_DEADLINE_CONTINUE* = 0 ## Generated based on wasmtime/crates/c-api/include/wasmtime/store.h:214:9
when 1 is static:
  const
    WASMTIME_UPDATE_DEADLINE_YIELD* = 1 ## Generated based on wasmtime/crates/c-api/include/wasmtime/store.h:216:9
else:
  let WASMTIME_UPDATE_DEADLINE_YIELD* = 1 ## Generated based on wasmtime/crates/c-api/include/wasmtime/store.h:216:9
when 0 is static:
  const
    WASMTIME_EXTERN_FUNC* = 0 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:83:9
else:
  let WASMTIME_EXTERN_FUNC* = 0 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:83:9
when 1 is static:
  const
    WASMTIME_EXTERN_GLOBAL* = 1 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:86:9
else:
  let WASMTIME_EXTERN_GLOBAL* = 1 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:86:9
when 2 is static:
  const
    WASMTIME_EXTERN_TABLE* = 2 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:89:9
else:
  let WASMTIME_EXTERN_TABLE* = 2 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:89:9
when 3 is static:
  const
    WASMTIME_EXTERN_MEMORY* = 3 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:92:9
else:
  let WASMTIME_EXTERN_MEMORY* = 3 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:92:9
when 4 is static:
  const
    WASMTIME_EXTERN_SHAREDMEMORY* = 4 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:95:9
else:
  let WASMTIME_EXTERN_SHAREDMEMORY* = 4 ## Generated based on wasmtime/crates/c-api/include/wasmtime/extern.h:95:9
when 0 is static:
  const
    WASMTIME_I32* = 0        ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:286:9
else:
  let WASMTIME_I32* = 0      ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:286:9
when 1 is static:
  const
    WASMTIME_I64* = 1        ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:288:9
else:
  let WASMTIME_I64* = 1      ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:288:9
when 2 is static:
  const
    WASMTIME_F32* = 2        ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:290:9
else:
  let WASMTIME_F32* = 2      ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:290:9
when 3 is static:
  const
    WASMTIME_F64* = 3        ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:292:9
else:
  let WASMTIME_F64* = 3      ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:292:9
when 4 is static:
  const
    WASMTIME_V128* = 4       ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:294:9
else:
  let WASMTIME_V128* = 4     ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:294:9
when 5 is static:
  const
    WASMTIME_FUNCREF* = 5    ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:297:9
else:
  let WASMTIME_FUNCREF* = 5  ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:297:9
when 6 is static:
  const
    WASMTIME_EXTERNREF* = 6  ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:300:9
else:
  let WASMTIME_EXTERNREF* = 6 ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:300:9
when 7 is static:
  const
    WASMTIME_ANYREF* = 7     ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:303:9
else:
  let WASMTIME_ANYREF* = 7   ## Generated based on wasmtime/crates/c-api/include/wasmtime/val.h:303:9
proc delete*(a0: ptr WasmConfigT): void {.cdecl, importc: "wasm_config_delete".}
proc newConfig*(): ptr WasmConfigT {.cdecl, importc: "wasm_config_new".}
proc delete*(a0: ptr WasmEngineT): void {.cdecl, importc: "wasm_engine_delete".}
proc newEngine*(): ptr WasmEngineT {.cdecl, importc: "wasm_engine_new".}
proc newEngine*(a0: ptr WasmConfigT): ptr WasmEngineT {.cdecl,
    importc: "wasm_engine_new_with_config".}
proc delete*(a0: ptr WasmStoreT): void {.cdecl, importc: "wasm_store_delete".}
proc newStore*(a0: ptr WasmEngineT): ptr WasmStoreT {.cdecl,
    importc: "wasm_store_new".}
var wasm_limits_max_default*: uint32
proc delete*(a0: ptr WasmValtypeT): void {.cdecl, importc: "wasm_valtype_delete".}
proc newEmpty*(out_arg: ptr WasmValtypeVecT): void {.cdecl,
    importc: "wasm_valtype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmValtypeVecT; a1: csize_t): void {.cdecl,
    importc: "wasm_valtype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmValtypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmValtypeT]): void {.cdecl,
    importc: "wasm_valtype_vec_new".}
proc copy*(out_arg: ptr WasmValtypeVecT; a1: ptr WasmValtypeVecT): void {.cdecl,
    importc: "wasm_valtype_vec_copy".}
proc delete*(a0: ptr WasmValtypeVecT): void {.cdecl,
    importc: "wasm_valtype_vec_delete".}
proc copy*(a0: ptr WasmValtypeT): ptr WasmValtypeT {.cdecl,
    importc: "wasm_valtype_copy".}
proc newValtype*(a0: WasmValkindT): ptr WasmValtypeT {.cdecl,
    importc: "wasm_valtype_new".}
proc kind*(a0: ptr WasmValtypeT): WasmValkindT {.cdecl,
    importc: "wasm_valtype_kind".}
proc delete*(a0: ptr WasmFunctypeT): void {.cdecl,
    importc: "wasm_functype_delete".}
proc newEmpty*(out_arg: ptr WasmFunctypeVecT): void {.cdecl,
    importc: "wasm_functype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmFunctypeVecT; a1: csize_t): void {.
    cdecl, importc: "wasm_functype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmFunctypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmFunctypeT]): void {.cdecl,
    importc: "wasm_functype_vec_new".}
proc copy*(out_arg: ptr WasmFunctypeVecT; a1: ptr WasmFunctypeVecT): void {.
    cdecl, importc: "wasm_functype_vec_copy".}
proc delete*(a0: ptr WasmFunctypeVecT): void {.cdecl,
    importc: "wasm_functype_vec_delete".}
proc copy*(a0: ptr WasmFunctypeT): ptr WasmFunctypeT {.cdecl,
    importc: "wasm_functype_copy".}
proc newFunctype*(params: ptr WasmValtypeVecT; results: ptr WasmValtypeVecT): ptr WasmFunctypeT {.
    cdecl, importc: "wasm_functype_new".}
proc params*(a0: ptr WasmFunctypeT): ptr WasmValtypeVecT {.cdecl,
    importc: "wasm_functype_params".}
proc results*(a0: ptr WasmFunctypeT): ptr WasmValtypeVecT {.cdecl,
    importc: "wasm_functype_results".}
proc delete*(a0: ptr WasmGlobaltypeT): void {.cdecl,
    importc: "wasm_globaltype_delete".}
proc newEmpty*(out_arg: ptr WasmGlobaltypeVecT): void {.cdecl,
    importc: "wasm_globaltype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmGlobaltypeVecT; a1: csize_t): void {.
    cdecl, importc: "wasm_globaltype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmGlobaltypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmGlobaltypeT]): void {.cdecl,
    importc: "wasm_globaltype_vec_new".}
proc copy*(out_arg: ptr WasmGlobaltypeVecT; a1: ptr WasmGlobaltypeVecT): void {.
    cdecl, importc: "wasm_globaltype_vec_copy".}
proc delete*(a0: ptr WasmGlobaltypeVecT): void {.cdecl,
    importc: "wasm_globaltype_vec_delete".}
proc copy*(a0: ptr WasmGlobaltypeT): ptr WasmGlobaltypeT {.cdecl,
    importc: "wasm_globaltype_copy".}
proc newGlobaltype*(a0: ptr WasmValtypeT; a1: WasmMutabilityT): ptr WasmGlobaltypeT {.
    cdecl, importc: "wasm_globaltype_new".}
proc content*(a0: ptr WasmGlobaltypeT): ptr WasmValtypeT {.cdecl,
    importc: "wasm_globaltype_content".}
proc mutability*(a0: ptr WasmGlobaltypeT): WasmMutabilityT {.cdecl,
    importc: "wasm_globaltype_mutability".}
proc delete*(a0: ptr WasmTabletypeT): void {.cdecl,
    importc: "wasm_tabletype_delete".}
proc newEmpty*(out_arg: ptr WasmTabletypeVecT): void {.cdecl,
    importc: "wasm_tabletype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmTabletypeVecT; a1: csize_t): void {.
    cdecl, importc: "wasm_tabletype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmTabletypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmTabletypeT]): void {.cdecl,
    importc: "wasm_tabletype_vec_new".}
proc copy*(out_arg: ptr WasmTabletypeVecT; a1: ptr WasmTabletypeVecT): void {.
    cdecl, importc: "wasm_tabletype_vec_copy".}
proc delete*(a0: ptr WasmTabletypeVecT): void {.cdecl,
    importc: "wasm_tabletype_vec_delete".}
proc copy*(a0: ptr WasmTabletypeT): ptr WasmTabletypeT {.cdecl,
    importc: "wasm_tabletype_copy".}
proc newTabletype*(a0: ptr WasmValtypeT; a1: ptr WasmLimitsT): ptr WasmTabletypeT {.
    cdecl, importc: "wasm_tabletype_new".}
proc element*(a0: ptr WasmTabletypeT): ptr WasmValtypeT {.cdecl,
    importc: "wasm_tabletype_element".}
proc limits*(a0: ptr WasmTabletypeT): ptr WasmLimitsT {.cdecl,
    importc: "wasm_tabletype_limits".}
proc delete*(a0: ptr WasmMemorytypeT): void {.cdecl,
    importc: "wasm_memorytype_delete".}
proc newEmpty*(out_arg: ptr WasmMemorytypeVecT): void {.cdecl,
    importc: "wasm_memorytype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmMemorytypeVecT; a1: csize_t): void {.
    cdecl, importc: "wasm_memorytype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmMemorytypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmMemorytypeT]): void {.cdecl,
    importc: "wasm_memorytype_vec_new".}
proc copy*(out_arg: ptr WasmMemorytypeVecT; a1: ptr WasmMemorytypeVecT): void {.
    cdecl, importc: "wasm_memorytype_vec_copy".}
proc delete*(a0: ptr WasmMemorytypeVecT): void {.cdecl,
    importc: "wasm_memorytype_vec_delete".}
proc copy*(a0: ptr WasmMemorytypeT): ptr WasmMemorytypeT {.cdecl,
    importc: "wasm_memorytype_copy".}
proc newMemorytype*(a0: ptr WasmLimitsT): ptr WasmMemorytypeT {.cdecl,
    importc: "wasm_memorytype_new".}
proc limits*(a0: ptr WasmMemorytypeT): ptr WasmLimitsT {.cdecl,
    importc: "wasm_memorytype_limits".}
proc delete*(a0: ptr WasmExterntypeT): void {.cdecl,
    importc: "wasm_externtype_delete".}
proc newEmpty*(out_arg: ptr WasmExterntypeVecT): void {.cdecl,
    importc: "wasm_externtype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmExterntypeVecT; a1: csize_t): void {.
    cdecl, importc: "wasm_externtype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmExterntypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmExterntypeT]): void {.cdecl,
    importc: "wasm_externtype_vec_new".}
proc copy*(out_arg: ptr WasmExterntypeVecT; a1: ptr WasmExterntypeVecT): void {.
    cdecl, importc: "wasm_externtype_vec_copy".}
proc delete*(a0: ptr WasmExterntypeVecT): void {.cdecl,
    importc: "wasm_externtype_vec_delete".}
proc copy*(a0: ptr WasmExterntypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_externtype_copy".}
proc kind*(a0: ptr WasmExterntypeT): WasmExternkindT {.cdecl,
    importc: "wasm_externtype_kind".}
proc asExterntype*(a0: ptr WasmFunctypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_functype_as_externtype".}
proc asExterntype*(a0: ptr WasmGlobaltypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_globaltype_as_externtype".}
proc asExterntype*(a0: ptr WasmTabletypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_tabletype_as_externtype".}
proc asExterntype*(a0: ptr WasmMemorytypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_memorytype_as_externtype".}
proc asFunctype*(a0: ptr WasmExterntypeT): ptr WasmFunctypeT {.cdecl,
    importc: "wasm_externtype_as_functype".}
proc asGlobaltype*(a0: ptr WasmExterntypeT): ptr WasmGlobaltypeT {.cdecl,
    importc: "wasm_externtype_as_globaltype".}
proc asTabletype*(a0: ptr WasmExterntypeT): ptr WasmTabletypeT {.cdecl,
    importc: "wasm_externtype_as_tabletype".}
proc asMemorytype*(a0: ptr WasmExterntypeT): ptr WasmMemorytypeT {.cdecl,
    importc: "wasm_externtype_as_memorytype".}
proc asExterntypeConst*(a0: ptr WasmFunctypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_functype_as_externtype_const".}
proc asExterntypeConst*(a0: ptr WasmGlobaltypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_globaltype_as_externtype_const".}
proc asExterntypeConst*(a0: ptr WasmTabletypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_tabletype_as_externtype_const".}
proc asExterntypeConst*(a0: ptr WasmMemorytypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_memorytype_as_externtype_const".}
proc asFunctypeConst*(a0: ptr WasmExterntypeT): ptr WasmFunctypeT {.cdecl,
    importc: "wasm_externtype_as_functype_const".}
proc asGlobaltypeConst*(a0: ptr WasmExterntypeT): ptr WasmGlobaltypeT {.cdecl,
    importc: "wasm_externtype_as_globaltype_const".}
proc asTabletypeConst*(a0: ptr WasmExterntypeT): ptr WasmTabletypeT {.cdecl,
    importc: "wasm_externtype_as_tabletype_const".}
proc asMemorytypeConst*(a0: ptr WasmExterntypeT): ptr WasmMemorytypeT {.cdecl,
    importc: "wasm_externtype_as_memorytype_const".}
proc delete*(a0: ptr WasmImporttypeT): void {.cdecl,
    importc: "wasm_importtype_delete".}
proc newEmpty*(out_arg: ptr WasmImporttypeVecT): void {.cdecl,
    importc: "wasm_importtype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmImporttypeVecT; a1: csize_t): void {.
    cdecl, importc: "wasm_importtype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmImporttypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmImporttypeT]): void {.cdecl,
    importc: "wasm_importtype_vec_new".}
proc copy*(out_arg: ptr WasmImporttypeVecT; a1: ptr WasmImporttypeVecT): void {.
    cdecl, importc: "wasm_importtype_vec_copy".}
proc delete*(a0: ptr WasmImporttypeVecT): void {.cdecl,
    importc: "wasm_importtype_vec_delete".}
proc copy*(a0: ptr WasmImporttypeT): ptr WasmImporttypeT {.cdecl,
    importc: "wasm_importtype_copy".}
proc newImporttype*(module: ptr WasmNameT; name: ptr WasmNameT;
                    a2: ptr WasmExterntypeT): ptr WasmImporttypeT {.cdecl,
    importc: "wasm_importtype_new".}
proc module*(a0: ptr WasmImporttypeT): ptr WasmNameT {.cdecl,
    importc: "wasm_importtype_module".}
proc name*(a0: ptr WasmImporttypeT): ptr WasmNameT {.cdecl,
    importc: "wasm_importtype_name".}
proc type*(a0: ptr WasmImporttypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_importtype_type".}
proc delete*(a0: ptr WasmExporttypeT): void {.cdecl,
    importc: "wasm_exporttype_delete".}
proc newEmpty*(out_arg: ptr WasmExporttypeVecT): void {.cdecl,
    importc: "wasm_exporttype_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmExporttypeVecT; a1: csize_t): void {.
    cdecl, importc: "wasm_exporttype_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmExporttypeVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmExporttypeT]): void {.cdecl,
    importc: "wasm_exporttype_vec_new".}
proc copy*(out_arg: ptr WasmExporttypeVecT; a1: ptr WasmExporttypeVecT): void {.
    cdecl, importc: "wasm_exporttype_vec_copy".}
proc delete*(a0: ptr WasmExporttypeVecT): void {.cdecl,
    importc: "wasm_exporttype_vec_delete".}
proc copy*(a0: ptr WasmExporttypeT): ptr WasmExporttypeT {.cdecl,
    importc: "wasm_exporttype_copy".}
proc newExporttype*(a0: ptr WasmNameT; a1: ptr WasmExterntypeT): ptr WasmExporttypeT {.
    cdecl, importc: "wasm_exporttype_new".}
proc name*(a0: ptr WasmExporttypeT): ptr WasmNameT {.cdecl,
    importc: "wasm_exporttype_name".}
proc type*(a0: ptr WasmExporttypeT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_exporttype_type".}
proc delete*(v: ptr WasmValT): void {.cdecl, importc: "wasm_val_delete".}
proc copy*(out_arg: ptr WasmValT; a1: ptr WasmValT): void {.cdecl,
    importc: "wasm_val_copy".}
proc newEmpty*(out_arg: ptr WasmValVecT): void {.cdecl,
    importc: "wasm_val_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmValVecT; a1: csize_t): void {.cdecl,
    importc: "wasm_val_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmValVecT; a1: csize_t;
          a2: ptr UncheckedArray[WasmValT]): void {.cdecl,
    importc: "wasm_val_vec_new".}
proc copy*(out_arg: ptr WasmValVecT; a1: ptr WasmValVecT): void {.cdecl,
    importc: "wasm_val_vec_copy".}
proc delete*(a0: ptr WasmValVecT): void {.cdecl, importc: "wasm_val_vec_delete".}
proc delete*(a0: ptr WasmRefT): void {.cdecl, importc: "wasm_ref_delete".}
proc copy*(a0: ptr WasmRefT): ptr WasmRefT {.cdecl, importc: "wasm_ref_copy".}
proc same*(a0: ptr WasmRefT; a1: ptr WasmRefT): bool {.cdecl,
    importc: "wasm_ref_same".}
proc getHostInfo*(a0: ptr WasmRefT): pointer {.cdecl,
    importc: "wasm_ref_get_host_info".}
proc setHostInfo*(a0: ptr WasmRefT; a1: pointer): void {.cdecl,
    importc: "wasm_ref_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmRefT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_ref_set_host_info_with_finalizer".}
proc delete*(a0: ptr WasmFrameT): void {.cdecl, importc: "wasm_frame_delete".}
proc newEmpty*(out_arg: ptr WasmFrameVecT): void {.cdecl,
    importc: "wasm_frame_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmFrameVecT; a1: csize_t): void {.cdecl,
    importc: "wasm_frame_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmFrameVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmFrameT]): void {.cdecl,
    importc: "wasm_frame_vec_new".}
proc copy*(out_arg: ptr WasmFrameVecT; a1: ptr WasmFrameVecT): void {.cdecl,
    importc: "wasm_frame_vec_copy".}
proc delete*(a0: ptr WasmFrameVecT): void {.cdecl,
    importc: "wasm_frame_vec_delete".}
proc copy*(a0: ptr WasmFrameT): ptr WasmFrameT {.cdecl,
    importc: "wasm_frame_copy".}
proc instance*(a0: ptr WasmFrameT): ptr StructWasmInstanceT {.cdecl,
    importc: "wasm_frame_instance".}
proc funcIndex*(a0: ptr WasmFrameT): uint32 {.cdecl,
    importc: "wasm_frame_func_index".}
proc funcOffset*(a0: ptr WasmFrameT): csize_t {.cdecl,
    importc: "wasm_frame_func_offset".}
proc moduleOffset*(a0: ptr WasmFrameT): csize_t {.cdecl,
    importc: "wasm_frame_module_offset".}
proc delete*(a0: ptr WasmTrapT): void {.cdecl, importc: "wasm_trap_delete".}
proc copy*(a0: ptr WasmTrapT): ptr WasmTrapT {.cdecl, importc: "wasm_trap_copy".}
proc same*(a0: ptr WasmTrapT; a1: ptr WasmTrapT): bool {.cdecl,
    importc: "wasm_trap_same".}
proc getHostInfo*(a0: ptr WasmTrapT): pointer {.cdecl,
    importc: "wasm_trap_get_host_info".}
proc setHostInfo*(a0: ptr WasmTrapT; a1: pointer): void {.cdecl,
    importc: "wasm_trap_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmTrapT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_trap_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmTrapT): ptr WasmRefT {.cdecl,
    importc: "wasm_trap_as_ref".}
proc asTrap*(a0: ptr WasmRefT): ptr WasmTrapT {.cdecl,
    importc: "wasm_ref_as_trap".}
proc asRefConst*(a0: ptr WasmTrapT): ptr WasmRefT {.cdecl,
    importc: "wasm_trap_as_ref_const".}
proc asTrapConst*(a0: ptr WasmRefT): ptr WasmTrapT {.cdecl,
    importc: "wasm_ref_as_trap_const".}
proc newTrap*(store: ptr WasmStoreT; a1: ptr WasmMessageT): ptr WasmTrapT {.
    cdecl, importc: "wasm_trap_new".}
proc message*(a0: ptr WasmTrapT; out_arg: ptr WasmMessageT): void {.cdecl,
    importc: "wasm_trap_message".}
proc origin*(a0: ptr WasmTrapT): ptr WasmFrameT {.cdecl,
    importc: "wasm_trap_origin".}
proc trace*(a0: ptr WasmTrapT; out_arg: ptr WasmFrameVecT): void {.cdecl,
    importc: "wasm_trap_trace".}
proc delete*(a0: ptr WasmForeignT): void {.cdecl, importc: "wasm_foreign_delete".}
proc copy*(a0: ptr WasmForeignT): ptr WasmForeignT {.cdecl,
    importc: "wasm_foreign_copy".}
proc same*(a0: ptr WasmForeignT; a1: ptr WasmForeignT): bool {.cdecl,
    importc: "wasm_foreign_same".}
proc getHostInfo*(a0: ptr WasmForeignT): pointer {.cdecl,
    importc: "wasm_foreign_get_host_info".}
proc setHostInfo*(a0: ptr WasmForeignT; a1: pointer): void {.cdecl,
    importc: "wasm_foreign_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmForeignT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_foreign_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmForeignT): ptr WasmRefT {.cdecl,
    importc: "wasm_foreign_as_ref".}
proc asForeign*(a0: ptr WasmRefT): ptr WasmForeignT {.cdecl,
    importc: "wasm_ref_as_foreign".}
proc asRefConst*(a0: ptr WasmForeignT): ptr WasmRefT {.cdecl,
    importc: "wasm_foreign_as_ref_const".}
proc asForeignConst*(a0: ptr WasmRefT): ptr WasmForeignT {.cdecl,
    importc: "wasm_ref_as_foreign_const".}
proc newForeign*(a0: ptr WasmStoreT): ptr WasmForeignT {.cdecl,
    importc: "wasm_foreign_new".}
proc delete*(a0: ptr WasmModuleT): void {.cdecl, importc: "wasm_module_delete".}
proc copy*(a0: ptr WasmModuleT): ptr WasmModuleT {.cdecl,
    importc: "wasm_module_copy".}
proc same*(a0: ptr WasmModuleT; a1: ptr WasmModuleT): bool {.cdecl,
    importc: "wasm_module_same".}
proc getHostInfo*(a0: ptr WasmModuleT): pointer {.cdecl,
    importc: "wasm_module_get_host_info".}
proc setHostInfo*(a0: ptr WasmModuleT; a1: pointer): void {.cdecl,
    importc: "wasm_module_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmModuleT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_module_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmModuleT): ptr WasmRefT {.cdecl,
    importc: "wasm_module_as_ref".}
proc asModule*(a0: ptr WasmRefT): ptr WasmModuleT {.cdecl,
    importc: "wasm_ref_as_module".}
proc asRefConst*(a0: ptr WasmModuleT): ptr WasmRefT {.cdecl,
    importc: "wasm_module_as_ref_const".}
proc asModuleConst*(a0: ptr WasmRefT): ptr WasmModuleT {.cdecl,
    importc: "wasm_ref_as_module_const".}
proc moduleDelete*(a0: ptr WasmSharedModuleT): void {.cdecl,
    importc: "wasm_shared_module_delete".}
proc share*(a0: ptr WasmModuleT): ptr WasmSharedModuleT {.cdecl,
    importc: "wasm_module_share".}
proc obtain*(a0: ptr WasmStoreT; a1: ptr WasmSharedModuleT): ptr WasmModuleT {.
    cdecl, importc: "wasm_module_obtain".}
proc newModule*(a0: ptr WasmStoreT; binary: ptr WasmByteVecT): ptr WasmModuleT {.
    cdecl, importc: "wasm_module_new".}
proc validate*(a0: ptr WasmStoreT; binary: ptr WasmByteVecT): bool {.cdecl,
    importc: "wasm_module_validate".}
proc imports*(a0: ptr WasmModuleT; out_arg: ptr WasmImporttypeVecT): void {.
    cdecl, importc: "wasm_module_imports".}
proc exports*(a0: ptr WasmModuleT; out_arg: ptr WasmExporttypeVecT): void {.
    cdecl, importc: "wasm_module_exports".}
proc serialize*(a0: ptr WasmModuleT; out_arg: ptr WasmByteVecT): void {.cdecl,
    importc: "wasm_module_serialize".}
proc deserialize*(a0: ptr WasmStoreT; a1: ptr WasmByteVecT): ptr WasmModuleT {.
    cdecl, importc: "wasm_module_deserialize".}
proc delete*(a0: ptr WasmFuncT): void {.cdecl, importc: "wasm_func_delete".}
proc copy*(a0: ptr WasmFuncT): ptr WasmFuncT {.cdecl, importc: "wasm_func_copy".}
proc same*(a0: ptr WasmFuncT; a1: ptr WasmFuncT): bool {.cdecl,
    importc: "wasm_func_same".}
proc getHostInfo*(a0: ptr WasmFuncT): pointer {.cdecl,
    importc: "wasm_func_get_host_info".}
proc setHostInfo*(a0: ptr WasmFuncT; a1: pointer): void {.cdecl,
    importc: "wasm_func_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmFuncT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_func_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmFuncT): ptr WasmRefT {.cdecl,
    importc: "wasm_func_as_ref".}
proc asFunc*(a0: ptr WasmRefT): ptr WasmFuncT {.cdecl,
    importc: "wasm_ref_as_func".}
proc asRefConst*(a0: ptr WasmFuncT): ptr WasmRefT {.cdecl,
    importc: "wasm_func_as_ref_const".}
proc asFuncConst*(a0: ptr WasmRefT): ptr WasmFuncT {.cdecl,
    importc: "wasm_ref_as_func_const".}
proc newFunc*(a0: ptr WasmStoreT; a1: ptr WasmFunctypeT; a2: WasmFuncCallbackT): ptr WasmFuncT {.
    cdecl, importc: "wasm_func_new".}
proc newWithEnv*(a0: ptr WasmStoreT; type_arg: ptr WasmFunctypeT;
                 a2: WasmFuncCallbackWithEnvT; env: pointer;
                 finalizer: proc (a0: pointer): void {.cdecl.}): ptr WasmFuncT {.
    cdecl, importc: "wasm_func_new_with_env".}
proc type*(a0: ptr WasmFuncT): ptr WasmFunctypeT {.cdecl,
    importc: "wasm_func_type".}
proc paramArity*(a0: ptr WasmFuncT): csize_t {.cdecl,
    importc: "wasm_func_param_arity".}
proc resultArity*(a0: ptr WasmFuncT): csize_t {.cdecl,
    importc: "wasm_func_result_arity".}
proc call*(a0: ptr WasmFuncT; args: ptr WasmValVecT; results: ptr WasmValVecT): ptr WasmTrapT {.
    cdecl, importc: "wasm_func_call".}
proc delete*(a0: ptr WasmGlobalT): void {.cdecl, importc: "wasm_global_delete".}
proc copy*(a0: ptr WasmGlobalT): ptr WasmGlobalT {.cdecl,
    importc: "wasm_global_copy".}
proc same*(a0: ptr WasmGlobalT; a1: ptr WasmGlobalT): bool {.cdecl,
    importc: "wasm_global_same".}
proc getHostInfo*(a0: ptr WasmGlobalT): pointer {.cdecl,
    importc: "wasm_global_get_host_info".}
proc setHostInfo*(a0: ptr WasmGlobalT; a1: pointer): void {.cdecl,
    importc: "wasm_global_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmGlobalT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_global_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmGlobalT): ptr WasmRefT {.cdecl,
    importc: "wasm_global_as_ref".}
proc asGlobal*(a0: ptr WasmRefT): ptr WasmGlobalT {.cdecl,
    importc: "wasm_ref_as_global".}
proc asRefConst*(a0: ptr WasmGlobalT): ptr WasmRefT {.cdecl,
    importc: "wasm_global_as_ref_const".}
proc asGlobalConst*(a0: ptr WasmRefT): ptr WasmGlobalT {.cdecl,
    importc: "wasm_ref_as_global_const".}
proc newGlobal*(a0: ptr WasmStoreT; a1: ptr WasmGlobaltypeT; a2: ptr WasmValT): ptr WasmGlobalT {.
    cdecl, importc: "wasm_global_new".}
proc type*(a0: ptr WasmGlobalT): ptr WasmGlobaltypeT {.cdecl,
    importc: "wasm_global_type".}
proc get*(a0: ptr WasmGlobalT; out_arg: ptr WasmValT): void {.cdecl,
    importc: "wasm_global_get".}
proc set*(a0: ptr WasmGlobalT; a1: ptr WasmValT): void {.cdecl,
    importc: "wasm_global_set".}
proc delete*(a0: ptr WasmTableT): void {.cdecl, importc: "wasm_table_delete".}
proc copy*(a0: ptr WasmTableT): ptr WasmTableT {.cdecl,
    importc: "wasm_table_copy".}
proc same*(a0: ptr WasmTableT; a1: ptr WasmTableT): bool {.cdecl,
    importc: "wasm_table_same".}
proc getHostInfo*(a0: ptr WasmTableT): pointer {.cdecl,
    importc: "wasm_table_get_host_info".}
proc setHostInfo*(a0: ptr WasmTableT; a1: pointer): void {.cdecl,
    importc: "wasm_table_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmTableT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_table_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmTableT): ptr WasmRefT {.cdecl,
    importc: "wasm_table_as_ref".}
proc asTable*(a0: ptr WasmRefT): ptr WasmTableT {.cdecl,
    importc: "wasm_ref_as_table".}
proc asRefConst*(a0: ptr WasmTableT): ptr WasmRefT {.cdecl,
    importc: "wasm_table_as_ref_const".}
proc asTableConst*(a0: ptr WasmRefT): ptr WasmTableT {.cdecl,
    importc: "wasm_ref_as_table_const".}
proc newTable*(a0: ptr WasmStoreT; a1: ptr WasmTabletypeT; init: ptr WasmRefT): ptr WasmTableT {.
    cdecl, importc: "wasm_table_new".}
proc type*(a0: ptr WasmTableT): ptr WasmTabletypeT {.cdecl,
    importc: "wasm_table_type".}
proc get*(a0: ptr WasmTableT; index: WasmTableSizeT): ptr WasmRefT {.cdecl,
    importc: "wasm_table_get".}
proc set*(a0: ptr WasmTableT; index: WasmTableSizeT; a2: ptr WasmRefT): bool {.
    cdecl, importc: "wasm_table_set".}
proc size*(a0: ptr WasmTableT): WasmTableSizeT {.cdecl,
    importc: "wasm_table_size".}
proc grow*(a0: ptr WasmTableT; delta: WasmTableSizeT; init: ptr WasmRefT): bool {.
    cdecl, importc: "wasm_table_grow".}
proc delete*(a0: ptr WasmMemoryT): void {.cdecl, importc: "wasm_memory_delete".}
proc copy*(a0: ptr WasmMemoryT): ptr WasmMemoryT {.cdecl,
    importc: "wasm_memory_copy".}
proc same*(a0: ptr WasmMemoryT; a1: ptr WasmMemoryT): bool {.cdecl,
    importc: "wasm_memory_same".}
proc getHostInfo*(a0: ptr WasmMemoryT): pointer {.cdecl,
    importc: "wasm_memory_get_host_info".}
proc setHostInfo*(a0: ptr WasmMemoryT; a1: pointer): void {.cdecl,
    importc: "wasm_memory_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmMemoryT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_memory_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmMemoryT): ptr WasmRefT {.cdecl,
    importc: "wasm_memory_as_ref".}
proc asMemory*(a0: ptr WasmRefT): ptr WasmMemoryT {.cdecl,
    importc: "wasm_ref_as_memory".}
proc asRefConst*(a0: ptr WasmMemoryT): ptr WasmRefT {.cdecl,
    importc: "wasm_memory_as_ref_const".}
proc asMemoryConst*(a0: ptr WasmRefT): ptr WasmMemoryT {.cdecl,
    importc: "wasm_ref_as_memory_const".}
var MEMORY_PAGE_SIZE*: csize_t
proc newMemory*(a0: ptr WasmStoreT; a1: ptr WasmMemorytypeT): ptr WasmMemoryT {.
    cdecl, importc: "wasm_memory_new".}
proc type*(a0: ptr WasmMemoryT): ptr WasmMemorytypeT {.cdecl,
    importc: "wasm_memory_type".}
proc data*(a0: ptr WasmMemoryT): cstring {.cdecl, importc: "wasm_memory_data".}
proc dataSize*(a0: ptr WasmMemoryT): csize_t {.cdecl,
    importc: "wasm_memory_data_size".}
proc size*(a0: ptr WasmMemoryT): WasmMemoryPagesT {.cdecl,
    importc: "wasm_memory_size".}
proc grow*(a0: ptr WasmMemoryT; delta: WasmMemoryPagesT): bool {.cdecl,
    importc: "wasm_memory_grow".}
proc delete*(a0: ptr WasmExternT): void {.cdecl, importc: "wasm_extern_delete".}
proc copy*(a0: ptr WasmExternT): ptr WasmExternT {.cdecl,
    importc: "wasm_extern_copy".}
proc same*(a0: ptr WasmExternT; a1: ptr WasmExternT): bool {.cdecl,
    importc: "wasm_extern_same".}
proc getHostInfo*(a0: ptr WasmExternT): pointer {.cdecl,
    importc: "wasm_extern_get_host_info".}
proc setHostInfo*(a0: ptr WasmExternT; a1: pointer): void {.cdecl,
    importc: "wasm_extern_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmExternT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_extern_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmExternT): ptr WasmRefT {.cdecl,
    importc: "wasm_extern_as_ref".}
proc asExtern*(a0: ptr WasmRefT): ptr WasmExternT {.cdecl,
    importc: "wasm_ref_as_extern".}
proc asRefConst*(a0: ptr WasmExternT): ptr WasmRefT {.cdecl,
    importc: "wasm_extern_as_ref_const".}
proc asExternConst*(a0: ptr WasmRefT): ptr WasmExternT {.cdecl,
    importc: "wasm_ref_as_extern_const".}
proc newEmpty*(out_arg: ptr WasmExternVecT): void {.cdecl,
    importc: "wasm_extern_vec_new_empty".}
proc newUninitialized*(out_arg: ptr WasmExternVecT; a1: csize_t): void {.cdecl,
    importc: "wasm_extern_vec_new_uninitialized".}
proc new*(out_arg: ptr WasmExternVecT; a1: csize_t;
          a2: ptr UncheckedArray[ptr WasmExternT]): void {.cdecl,
    importc: "wasm_extern_vec_new".}
proc copy*(out_arg: ptr WasmExternVecT; a1: ptr WasmExternVecT): void {.cdecl,
    importc: "wasm_extern_vec_copy".}
proc delete*(a0: ptr WasmExternVecT): void {.cdecl,
    importc: "wasm_extern_vec_delete".}
proc kind*(a0: ptr WasmExternT): WasmExternkindT {.cdecl,
    importc: "wasm_extern_kind".}
proc type*(a0: ptr WasmExternT): ptr WasmExterntypeT {.cdecl,
    importc: "wasm_extern_type".}
proc asExtern*(a0: ptr WasmFuncT): ptr WasmExternT {.cdecl,
    importc: "wasm_func_as_extern".}
proc asExtern*(a0: ptr WasmGlobalT): ptr WasmExternT {.cdecl,
    importc: "wasm_global_as_extern".}
proc asExtern*(a0: ptr WasmTableT): ptr WasmExternT {.cdecl,
    importc: "wasm_table_as_extern".}
proc asExtern*(a0: ptr WasmMemoryT): ptr WasmExternT {.cdecl,
    importc: "wasm_memory_as_extern".}
proc asFunc*(a0: ptr WasmExternT): ptr WasmFuncT {.cdecl,
    importc: "wasm_extern_as_func".}
proc asGlobal*(a0: ptr WasmExternT): ptr WasmGlobalT {.cdecl,
    importc: "wasm_extern_as_global".}
proc asTable*(a0: ptr WasmExternT): ptr WasmTableT {.cdecl,
    importc: "wasm_extern_as_table".}
proc asMemory*(a0: ptr WasmExternT): ptr WasmMemoryT {.cdecl,
    importc: "wasm_extern_as_memory".}
proc asExternConst*(a0: ptr WasmFuncT): ptr WasmExternT {.cdecl,
    importc: "wasm_func_as_extern_const".}
proc asExternConst*(a0: ptr WasmGlobalT): ptr WasmExternT {.cdecl,
    importc: "wasm_global_as_extern_const".}
proc asExternConst*(a0: ptr WasmTableT): ptr WasmExternT {.cdecl,
    importc: "wasm_table_as_extern_const".}
proc asExternConst*(a0: ptr WasmMemoryT): ptr WasmExternT {.cdecl,
    importc: "wasm_memory_as_extern_const".}
proc asFuncConst*(a0: ptr WasmExternT): ptr WasmFuncT {.cdecl,
    importc: "wasm_extern_as_func_const".}
proc asGlobalConst*(a0: ptr WasmExternT): ptr WasmGlobalT {.cdecl,
    importc: "wasm_extern_as_global_const".}
proc asTableConst*(a0: ptr WasmExternT): ptr WasmTableT {.cdecl,
    importc: "wasm_extern_as_table_const".}
proc asMemoryConst*(a0: ptr WasmExternT): ptr WasmMemoryT {.cdecl,
    importc: "wasm_extern_as_memory_const".}
proc delete*(a0: ptr WasmInstanceT): void {.cdecl,
    importc: "wasm_instance_delete".}
proc copy*(a0: ptr WasmInstanceT): ptr WasmInstanceT {.cdecl,
    importc: "wasm_instance_copy".}
proc same*(a0: ptr WasmInstanceT; a1: ptr WasmInstanceT): bool {.cdecl,
    importc: "wasm_instance_same".}
proc getHostInfo*(a0: ptr WasmInstanceT): pointer {.cdecl,
    importc: "wasm_instance_get_host_info".}
proc setHostInfo*(a0: ptr WasmInstanceT; a1: pointer): void {.cdecl,
    importc: "wasm_instance_set_host_info".}
proc setHostInfoWithFinalizer*(a0: ptr WasmInstanceT; a1: pointer;
                               a2: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasm_instance_set_host_info_with_finalizer".}
proc asRef*(a0: ptr WasmInstanceT): ptr WasmRefT {.cdecl,
    importc: "wasm_instance_as_ref".}
proc asInstance*(a0: ptr WasmRefT): ptr WasmInstanceT {.cdecl,
    importc: "wasm_ref_as_instance".}
proc asRefConst*(a0: ptr WasmInstanceT): ptr WasmRefT {.cdecl,
    importc: "wasm_instance_as_ref_const".}
proc asInstanceConst*(a0: ptr WasmRefT): ptr WasmInstanceT {.cdecl,
    importc: "wasm_ref_as_instance_const".}
proc newInstance*(a0: ptr WasmStoreT; a1: ptr WasmModuleT;
                  imports: ptr WasmExternVecT; a3: ptr ptr WasmTrapT): ptr WasmInstanceT {.
    cdecl, importc: "wasm_instance_new".}
proc exports*(a0: ptr WasmInstanceT; out_arg: ptr WasmExternVecT): void {.cdecl,
    importc: "wasm_instance_exports".}
proc newError*(a0: cstring): ptr ErrorT {.cdecl, importc: "wasmtime_error_new".}
proc delete*(error: ptr ErrorT): void {.cdecl, importc: "wasmtime_error_delete".}
proc message*(error: ptr ErrorT; message: ptr WasmNameT): void {.cdecl,
    importc: "wasmtime_error_message".}
proc exitStatus*(a0: ptr ErrorT; status: ptr cint): bool {.cdecl,
    importc: "wasmtime_error_exit_status".}
proc wasmTrace*(a0: ptr ErrorT; out_arg: ptr WasmFrameVecT): void {.cdecl,
    importc: "wasmtime_error_wasm_trace".}
proc debugInfoSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_debug_info_set".}
proc consumeFuelSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_consume_fuel_set".}
proc epochInterruptionSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_epoch_interruption_set".}
proc maxWasmStackSet*(a0: ptr WasmConfigT; a1: csize_t): void {.cdecl,
    importc: "wasmtime_config_max_wasm_stack_set".}
proc wasmThreadsSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_threads_set".}
proc wasmTailCallSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_tail_call_set".}
proc wasmReferenceTypesSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_reference_types_set".}
proc wasmFunctionReferencesSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_function_references_set".}
proc wasmGcSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_gc_set".}
proc wasmSimdSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_simd_set".}
proc wasmRelaxedSimdSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_relaxed_simd_set".}
proc wasmRelaxedSimdDeterministicSet*(a0: ptr WasmConfigT; a1: bool): void {.
    cdecl, importc: "wasmtime_config_wasm_relaxed_simd_deterministic_set".}
proc wasmBulkMemorySet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_bulk_memory_set".}
proc wasmMultiValueSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_multi_value_set".}
proc wasmMultiMemorySet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_multi_memory_set".}
proc wasmMemory64Set*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_memory64_set".}
proc strategySet*(a0: ptr WasmConfigT; a1: StrategyT): void {.cdecl,
    importc: "wasmtime_config_strategy_set".}
proc parallelCompilationSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_parallel_compilation_set".}
proc craneliftDebugVerifierSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_cranelift_debug_verifier_set".}
proc craneliftNanCanonicalizationSet*(a0: ptr WasmConfigT; a1: bool): void {.
    cdecl, importc: "wasmtime_config_cranelift_nan_canonicalization_set".}
proc craneliftOptLevelSet*(a0: ptr WasmConfigT; a1: OptLevelT): void {.cdecl,
    importc: "wasmtime_config_cranelift_opt_level_set".}
proc profilerSet*(a0: ptr WasmConfigT; a1: ProfilingStrategyT): void {.cdecl,
    importc: "wasmtime_config_profiler_set".}
proc staticMemoryForcedSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_static_memory_forced_set".}
proc staticMemoryMaximumSizeSet*(a0: ptr WasmConfigT; a1: uint64): void {.cdecl,
    importc: "wasmtime_config_static_memory_maximum_size_set".}
proc staticMemoryGuardSizeSet*(a0: ptr WasmConfigT; a1: uint64): void {.cdecl,
    importc: "wasmtime_config_static_memory_guard_size_set".}
proc dynamicMemoryGuardSizeSet*(a0: ptr WasmConfigT; a1: uint64): void {.cdecl,
    importc: "wasmtime_config_dynamic_memory_guard_size_set".}
proc dynamicMemoryReservedForGrowthSet*(a0: ptr WasmConfigT; a1: uint64): void {.
    cdecl, importc: "wasmtime_config_dynamic_memory_reserved_for_growth_set".}
proc nativeUnwindInfoSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_native_unwind_info_set".}
proc cacheConfigLoad*(a0: ptr WasmConfigT; a1: cstring): ptr ErrorT {.cdecl,
    importc: "wasmtime_config_cache_config_load".}
proc targetSet*(a0: ptr WasmConfigT; a1: cstring): ptr ErrorT {.cdecl,
    importc: "wasmtime_config_target_set".}
proc craneliftFlagEnable*(a0: ptr WasmConfigT; a1: cstring): void {.cdecl,
    importc: "wasmtime_config_cranelift_flag_enable".}
proc craneliftFlagSet*(a0: ptr WasmConfigT; key: cstring; value: cstring): void {.
    cdecl, importc: "wasmtime_config_cranelift_flag_set".}
proc macosUseMachPortsSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_macos_use_mach_ports_set".}
proc hostMemoryCreatorSet*(a0: ptr WasmConfigT; a1: ptr MemoryCreatorT): void {.
    cdecl, importc: "wasmtime_config_host_memory_creator_set".}
proc memoryInitCowSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_memory_init_cow_set".}
proc delete*(a0: ptr WasiConfigT): void {.cdecl, importc: "wasi_config_delete".}
proc newWasiConfig*(): ptr WasiConfigT {.cdecl, importc: "wasi_config_new".}
proc setArgv*(config: ptr WasiConfigT; argc: csize_t;
              argv: ptr UncheckedArray[cstring]): bool {.cdecl,
    importc: "wasi_config_set_argv".}
proc inheritArgv*(config: ptr WasiConfigT): void {.cdecl,
    importc: "wasi_config_inherit_argv".}
proc setEnv*(config: ptr WasiConfigT; envc: csize_t;
             names: ptr UncheckedArray[cstring];
             values: ptr UncheckedArray[cstring]): bool {.cdecl,
    importc: "wasi_config_set_env".}
proc inheritEnv*(config: ptr WasiConfigT): void {.cdecl,
    importc: "wasi_config_inherit_env".}
proc setStdinFile*(config: ptr WasiConfigT; path: cstring): bool {.cdecl,
    importc: "wasi_config_set_stdin_file".}
proc setStdinBytes*(config: ptr WasiConfigT; binary: ptr WasmByteVecT): void {.
    cdecl, importc: "wasi_config_set_stdin_bytes".}
proc inheritStdin*(config: ptr WasiConfigT): void {.cdecl,
    importc: "wasi_config_inherit_stdin".}
proc setStdoutFile*(config: ptr WasiConfigT; path: cstring): bool {.cdecl,
    importc: "wasi_config_set_stdout_file".}
proc inheritStdout*(config: ptr WasiConfigT): void {.cdecl,
    importc: "wasi_config_inherit_stdout".}
proc setStderrFile*(config: ptr WasiConfigT; path: cstring): bool {.cdecl,
    importc: "wasi_config_set_stderr_file".}
proc inheritStderr*(config: ptr WasiConfigT): void {.cdecl,
    importc: "wasi_config_inherit_stderr".}
proc preopenDir*(config: ptr WasiConfigT; path: cstring; guest_path: cstring): bool {.
    cdecl, importc: "wasi_config_preopen_dir".}
proc newStore*(engine: ptr WasmEngineT; data: pointer;
               finalizer: proc (a0: pointer): void {.cdecl.}): ptr StoreT {.
    cdecl, importc: "wasmtime_store_new".}
proc context*(store: ptr StoreT): ptr ContextT {.cdecl,
    importc: "wasmtime_store_context".}
proc limiter*(store: ptr StoreT; memory_size: int64; table_elements: int64;
              instances: int64; tables: int64; memories: int64): void {.cdecl,
    importc: "wasmtime_store_limiter".}
proc delete*(store: ptr StoreT): void {.cdecl, importc: "wasmtime_store_delete".}
proc getData*(context: ptr ContextT): pointer {.cdecl,
    importc: "wasmtime_context_get_data".}
proc setData*(context: ptr ContextT; data: pointer): void {.cdecl,
    importc: "wasmtime_context_set_data".}
proc gc*(context: ptr ContextT): void {.cdecl, importc: "wasmtime_context_gc".}
proc setFuel*(store: ptr ContextT; fuel: uint64): ptr ErrorT {.cdecl,
    importc: "wasmtime_context_set_fuel".}
proc getFuel*(context: ptr ContextT; fuel: ptr uint64): ptr ErrorT {.cdecl,
    importc: "wasmtime_context_get_fuel".}
proc setWasi*(context: ptr ContextT; wasi: ptr WasiConfigT): ptr ErrorT {.cdecl,
    importc: "wasmtime_context_set_wasi".}
proc setEpochDeadline*(context: ptr ContextT; ticks_beyond_current: uint64): void {.
    cdecl, importc: "wasmtime_context_set_epoch_deadline".}
proc epochDeadlineCallback*(store: ptr StoreT; func_arg: proc (a0: ptr ContextT;
    a1: pointer; a2: ptr uint64; a3: ptr UpdateDeadlineKindT): ptr ErrorT {.
    cdecl.}; data: pointer; finalizer: proc (a0: pointer): void {.cdecl.}): void {.
    cdecl, importc: "wasmtime_store_epoch_deadline_callback".}
proc newModule*(engine: ptr WasmEngineT; wasm: ptr uint8; wasm_len: csize_t;
                ret: ptr ptr ModuleT): ptr ErrorT {.cdecl,
    importc: "wasmtime_module_new".}
proc delete*(m: ptr ModuleT): void {.cdecl, importc: "wasmtime_module_delete".}
proc clone*(m: ptr ModuleT): ptr ModuleT {.cdecl,
    importc: "wasmtime_module_clone".}
proc imports*(module: ptr ModuleT; out_arg: ptr WasmImporttypeVecT): void {.
    cdecl, importc: "wasmtime_module_imports".}
proc exports*(module: ptr ModuleT; out_arg: ptr WasmExporttypeVecT): void {.
    cdecl, importc: "wasmtime_module_exports".}
proc validate*(engine: ptr WasmEngineT; wasm: ptr uint8; wasm_len: csize_t): ptr ErrorT {.
    cdecl, importc: "wasmtime_module_validate".}
proc serialize*(module: ptr ModuleT; ret: ptr WasmByteVecT): ptr ErrorT {.cdecl,
    importc: "wasmtime_module_serialize".}
proc deserialize*(engine: ptr WasmEngineT; bytes: ptr uint8; bytes_len: csize_t;
                  ret: ptr ptr ModuleT): ptr ErrorT {.cdecl,
    importc: "wasmtime_module_deserialize".}
proc deserializeFile*(engine: ptr WasmEngineT; path: cstring;
                      ret: ptr ptr ModuleT): ptr ErrorT {.cdecl,
    importc: "wasmtime_module_deserialize_file".}
proc imageRange*(module: ptr ModuleT; start: ptr pointer; end_arg: ptr pointer): void {.
    cdecl, importc: "wasmtime_module_image_range".}
proc newSharedmemory*(engine: ptr WasmEngineT; ty: ptr WasmMemorytypeT;
                      ret: ptr ptr SharedmemoryT): ptr ErrorT {.cdecl,
    importc: "wasmtime_sharedmemory_new".}
proc delete*(memory: ptr SharedmemoryT): void {.cdecl,
    importc: "wasmtime_sharedmemory_delete".}
proc clone*(memory: ptr SharedmemoryT): ptr SharedmemoryT {.cdecl,
    importc: "wasmtime_sharedmemory_clone".}
proc type*(memory: ptr SharedmemoryT): ptr WasmMemorytypeT {.cdecl,
    importc: "wasmtime_sharedmemory_type".}
proc data*(memory: ptr SharedmemoryT): ptr uint8 {.cdecl,
    importc: "wasmtime_sharedmemory_data".}
proc dataSize*(memory: ptr SharedmemoryT): csize_t {.cdecl,
    importc: "wasmtime_sharedmemory_data_size".}
proc size*(memory: ptr SharedmemoryT): uint64 {.cdecl,
    importc: "wasmtime_sharedmemory_size".}
proc grow*(memory: ptr SharedmemoryT; delta: uint64; prev_size: ptr uint64): ptr ErrorT {.
    cdecl, importc: "wasmtime_sharedmemory_grow".}
proc delete*(val: ptr ExternT): void {.cdecl, importc: "wasmtime_extern_delete".}
proc type*(context: ptr ContextT; val: ptr ExternT): ptr WasmExterntypeT {.
    cdecl, importc: "wasmtime_extern_type".}
proc clone*(context: ptr ContextT; anyref: ptr AnyrefT; out_arg: ptr AnyrefT): void {.
    cdecl, importc: "wasmtime_anyref_clone".}
proc unroot*(context: ptr ContextT; ref_arg: ptr AnyrefT): void {.cdecl,
    importc: "wasmtime_anyref_unroot".}
proc fromRaw*(context: ptr ContextT; raw: uint32; out_arg: ptr AnyrefT): void {.
    cdecl, importc: "wasmtime_anyref_from_raw".}
proc toRaw*(context: ptr ContextT; ref_arg: ptr AnyrefT): uint32 {.cdecl,
    importc: "wasmtime_anyref_to_raw".}
proc fromI31*(context: ptr ContextT; i31val: uint32; out_arg: ptr AnyrefT): void {.
    cdecl, importc: "wasmtime_anyref_from_i31".}
proc i31GetU*(context: ptr ContextT; anyref: ptr AnyrefT; dst: ptr uint32): bool {.
    cdecl, importc: "wasmtime_anyref_i31_get_u".}
proc i31GetS*(context: ptr ContextT; anyref: ptr AnyrefT; dst: ptr int32): bool {.
    cdecl, importc: "wasmtime_anyref_i31_get_s".}
proc newExternref*(context: ptr ContextT; data: pointer;
                   finalizer: proc (a0: pointer): void {.cdecl.};
                   out_arg: ptr ExternrefT): bool {.cdecl,
    importc: "wasmtime_externref_new".}
proc data*(context: ptr ContextT; data: ptr ExternrefT): pointer {.cdecl,
    importc: "wasmtime_externref_data".}
proc clone*(context: ptr ContextT; ref_arg: ptr ExternrefT;
            out_arg: ptr ExternrefT): void {.cdecl,
    importc: "wasmtime_externref_clone".}
proc unroot*(context: ptr ContextT; ref_arg: ptr ExternrefT): void {.cdecl,
    importc: "wasmtime_externref_unroot".}
proc fromRaw*(context: ptr ContextT; raw: uint32; out_arg: ptr ExternrefT): void {.
    cdecl, importc: "wasmtime_externref_from_raw".}
proc toRaw*(context: ptr ContextT; ref_arg: ptr ExternrefT): uint32 {.cdecl,
    importc: "wasmtime_externref_to_raw".}
proc unroot*(context: ptr ContextT; val: ptr ValT): void {.cdecl,
    importc: "wasmtime_val_unroot".}
proc clone*(context: ptr ContextT; src: ptr ValT; dst: ptr ValT): void {.cdecl,
    importc: "wasmtime_val_clone".}
proc newFunc*(store: ptr ContextT; type_arg: ptr WasmFunctypeT;
              callback: FuncCallbackT; env: pointer;
              finalizer: proc (a0: pointer): void {.cdecl.}; ret: ptr FuncT): void {.
    cdecl, importc: "wasmtime_func_new".}
proc newUnchecked*(store: ptr ContextT; type_arg: ptr WasmFunctypeT;
                   callback: FuncUncheckedCallbackT; env: pointer;
                   finalizer: proc (a0: pointer): void {.cdecl.}; ret: ptr FuncT): void {.
    cdecl, importc: "wasmtime_func_new_unchecked".}
proc type*(store: ptr ContextT; func_arg: ptr FuncT): ptr WasmFunctypeT {.cdecl,
    importc: "wasmtime_func_type".}
proc call*(store: ptr ContextT; func_arg: ptr FuncT; args: ptr ValT;
           nargs: csize_t; results: ptr ValT; nresults: csize_t;
           trap: ptr ptr WasmTrapT): ptr ErrorT {.cdecl,
    importc: "wasmtime_func_call".}
proc callUnchecked*(store: ptr ContextT; func_arg: ptr FuncT;
                    args_and_results: ptr ValRawT;
                    args_and_results_len: csize_t; trap: ptr ptr WasmTrapT): ptr ErrorT {.
    cdecl, importc: "wasmtime_func_call_unchecked".}
proc wasmtimeCallerExportGet*(caller: ptr CallerT; name: cstring;
                              name_len: csize_t; item: ptr ExternT): bool {.
    cdecl, importc: "wasmtime_caller_export_get".}
proc wasmtimeCallerContext*(caller: ptr CallerT): ptr ContextT {.cdecl,
    importc: "wasmtime_caller_context".}
proc fromRaw*(context: ptr ContextT; raw: pointer; ret: ptr FuncT): void {.
    cdecl, importc: "wasmtime_func_from_raw".}
proc toRaw*(context: ptr ContextT; func_arg: ptr FuncT): pointer {.cdecl,
    importc: "wasmtime_func_to_raw".}
proc newInstance*(store: ptr ContextT; module: ptr ModuleT;
                  imports: ptr ExternT; nimports: csize_t;
                  instance: ptr InstanceT; trap: ptr ptr WasmTrapT): ptr ErrorT {.
    cdecl, importc: "wasmtime_instance_new".}
proc exportGet*(store: ptr ContextT; instance: ptr InstanceT; name: cstring;
                name_len: csize_t; item: ptr ExternT): bool {.cdecl,
    importc: "wasmtime_instance_export_get".}
proc exportNth*(store: ptr ContextT; instance: ptr InstanceT; index: csize_t;
                name: ptr cstring; name_len: ptr csize_t; item: ptr ExternT): bool {.
    cdecl, importc: "wasmtime_instance_export_nth".}
proc preDelete*(instance_pre: ptr InstancePreT): void {.cdecl,
    importc: "wasmtime_instance_pre_delete".}
proc preInstantiate*(instance_pre: ptr InstancePreT; store: ptr StoreT;
                     instance: ptr InstanceT; trap_ptr: ptr ptr WasmTrapT): ptr ErrorT {.
    cdecl, importc: "wasmtime_instance_pre_instantiate".}
proc preModule*(instance_pre: ptr InstancePreT): ptr ModuleT {.cdecl,
    importc: "wasmtime_instance_pre_module".}
proc newLinker*(engine: ptr WasmEngineT): ptr LinkerT {.cdecl,
    importc: "wasmtime_linker_new".}
proc clone*(linker: ptr LinkerT): ptr LinkerT {.cdecl,
    importc: "wasmtime_linker_clone".}
proc delete*(linker: ptr LinkerT): void {.cdecl,
    importc: "wasmtime_linker_delete".}
proc allowShadowing*(linker: ptr LinkerT; allow_shadowing: bool): void {.cdecl,
    importc: "wasmtime_linker_allow_shadowing".}
proc define*(linker: ptr LinkerT; store: ptr ContextT; module: cstring;
             module_len: csize_t; name: cstring; name_len: csize_t;
             item: ptr ExternT): ptr ErrorT {.cdecl,
    importc: "wasmtime_linker_define".}
proc defineFunc*(linker: ptr LinkerT; module: cstring; module_len: csize_t;
                 name: cstring; name_len: csize_t; ty: ptr WasmFunctypeT;
                 cb: FuncCallbackT; data: pointer;
                 finalizer: proc (a0: pointer): void {.cdecl.}): ptr ErrorT {.
    cdecl, importc: "wasmtime_linker_define_func".}
proc defineFuncUnchecked*(linker: ptr LinkerT; module: cstring;
                          module_len: csize_t; name: cstring; name_len: csize_t;
                          ty: ptr WasmFunctypeT; cb: FuncUncheckedCallbackT;
                          data: pointer;
                          finalizer: proc (a0: pointer): void {.cdecl.}): ptr ErrorT {.
    cdecl, importc: "wasmtime_linker_define_func_unchecked".}
proc defineWasi*(linker: ptr LinkerT): ptr ErrorT {.cdecl,
    importc: "wasmtime_linker_define_wasi".}
proc defineInstance*(linker: ptr LinkerT; store: ptr ContextT; name: cstring;
                     name_len: csize_t; instance: ptr InstanceT): ptr ErrorT {.
    cdecl, importc: "wasmtime_linker_define_instance".}
proc instantiate*(linker: ptr LinkerT; store: ptr ContextT; module: ptr ModuleT;
                  instance: ptr InstanceT; trap: ptr ptr WasmTrapT): ptr ErrorT {.
    cdecl, importc: "wasmtime_linker_instantiate".}
proc module*(linker: ptr LinkerT; store: ptr ContextT; name: cstring;
             name_len: csize_t; module: ptr ModuleT): ptr ErrorT {.cdecl,
    importc: "wasmtime_linker_module".}
proc getDefault*(linker: ptr LinkerT; store: ptr ContextT; name: cstring;
                 name_len: csize_t; func_arg: ptr FuncT): ptr ErrorT {.cdecl,
    importc: "wasmtime_linker_get_default".}
proc get*(linker: ptr LinkerT; store: ptr ContextT; module: cstring;
          module_len: csize_t; name: cstring; name_len: csize_t;
          item: ptr ExternT): bool {.cdecl, importc: "wasmtime_linker_get".}
proc instantiatePre*(linker: ptr LinkerT; module: ptr ModuleT;
                     instance_pre: ptr ptr InstancePreT): ptr ErrorT {.cdecl,
    importc: "wasmtime_linker_instantiate_pre".}
proc asyncSupportSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_async_support_set".}
proc asyncStackSizeSet*(a0: ptr WasmConfigT; a1: uint64): void {.cdecl,
    importc: "wasmtime_config_async_stack_size_set".}
proc fuelAsyncYieldInterval*(context: ptr ContextT; interval: uint64): ptr ErrorT {.
    cdecl, importc: "wasmtime_context_fuel_async_yield_interval".}
proc epochDeadlineAsyncYieldAndUpdate*(context: ptr ContextT; delta: uint64): ptr ErrorT {.
    cdecl, importc: "wasmtime_context_epoch_deadline_async_yield_and_update".}
proc futurePoll*(future: ptr CallFutureT): bool {.cdecl,
    importc: "wasmtime_call_future_poll".}
proc futureDelete*(future: ptr CallFutureT): void {.cdecl,
    importc: "wasmtime_call_future_delete".}
proc callAsync*(context: ptr ContextT; func_arg: ptr FuncT; args: ptr ValT;
                nargs: csize_t; results: ptr ValT; nresults: csize_t;
                trap_ret: ptr ptr WasmTrapT; error_ret: ptr ptr ErrorT): ptr CallFutureT {.
    cdecl, importc: "wasmtime_func_call_async".}
proc defineAsyncFunc*(linker: ptr LinkerT; module: cstring; module_len: csize_t;
                      name: cstring; name_len: csize_t; ty: ptr WasmFunctypeT;
                      cb: FuncAsyncCallbackT; data: pointer;
                      finalizer: proc (a0: pointer): void {.cdecl.}): ptr ErrorT {.
    cdecl, importc: "wasmtime_linker_define_async_func".}
proc instantiateAsync*(linker: ptr LinkerT; store: ptr ContextT;
                       module: ptr ModuleT; instance: ptr InstanceT;
                       trap_ret: ptr ptr WasmTrapT; error_ret: ptr ptr ErrorT): ptr CallFutureT {.
    cdecl, importc: "wasmtime_linker_instantiate_async".}
proc preInstantiateAsync*(instance_pre: ptr InstancePreT; store: ptr ContextT;
                          instance: ptr InstanceT; trap_ret: ptr ptr WasmTrapT;
                          error_ret: ptr ptr ErrorT): ptr CallFutureT {.cdecl,
    importc: "wasmtime_instance_pre_instantiate_async".}
proc hostStackCreatorSet*(a0: ptr WasmConfigT; a1: ptr StackCreatorT): void {.
    cdecl, importc: "wasmtime_config_host_stack_creator_set".}
proc componentModelSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_component_model_set".}
proc newComponentStore*(engine: ptr WasmEngineT; data: pointer;
                        finalizer: proc (a0: pointer): void {.cdecl.}): ptr ComponentStoreT {.
    cdecl, importc: "wasmtime_component_store_new".}
proc context*(store: ptr ComponentStoreT): ptr ComponentContextT {.cdecl,
    importc: "wasmtime_component_store_context".}
proc delete*(store: ptr ComponentStoreT): void {.cdecl,
    importc: "wasmtime_component_store_delete".}
proc limiter*(store: ptr ComponentStoreT; memory_size: int64;
              table_elements: int64; instances: int64; tables: int64;
              memories: int64): void {.cdecl, importc: "wasmtime_component_store_limiter".}
proc newEmpty*(out_arg: ptr ComponentValVecT): void {.cdecl,
    importc: "wasmtime_component_val_vec_new_empty".}
proc newUninitialized*(out_arg: ptr ComponentValVecT; a1: csize_t): void {.
    cdecl, importc: "wasmtime_component_val_vec_new_uninitialized".}
proc new*(out_arg: ptr ComponentValVecT; a1: csize_t; a2: ptr ComponentValT): void {.
    cdecl, importc: "wasmtime_component_val_vec_new".}
proc copy*(out_arg: ptr ComponentValVecT; a1: ptr ComponentValVecT): void {.
    cdecl, importc: "wasmtime_component_val_vec_copy".}
proc delete*(a0: ptr ComponentValVecT): void {.cdecl,
    importc: "wasmtime_component_val_vec_delete".}
proc newEmpty*(out_arg: ptr ComponentValRecordFieldVecT): void {.cdecl,
    importc: "wasmtime_component_val_record_field_vec_new_empty".}
proc newUninitialized*(out_arg: ptr ComponentValRecordFieldVecT; a1: csize_t): void {.
    cdecl, importc: "wasmtime_component_val_record_field_vec_new_uninitialized".}
proc new*(out_arg: ptr ComponentValRecordFieldVecT; a1: csize_t;
          a2: ptr ComponentValRecordFieldT): void {.cdecl,
    importc: "wasmtime_component_val_record_field_vec_new".}
proc copy*(out_arg: ptr ComponentValRecordFieldVecT;
           a1: ptr ComponentValRecordFieldVecT): void {.cdecl,
    importc: "wasmtime_component_val_record_field_vec_copy".}
proc delete*(a0: ptr ComponentValRecordFieldVecT): void {.cdecl,
    importc: "wasmtime_component_val_record_field_vec_delete".}
proc newEmpty*(out_arg: ptr ComponentValFlagsVecT): void {.cdecl,
    importc: "wasmtime_component_val_flags_vec_new_empty".}
proc newUninitialized*(out_arg: ptr ComponentValFlagsVecT; a1: csize_t): void {.
    cdecl, importc: "wasmtime_component_val_flags_vec_new_uninitialized".}
proc new*(out_arg: ptr ComponentValFlagsVecT; a1: csize_t; a2: ptr WasmNameT): void {.
    cdecl, importc: "wasmtime_component_val_flags_vec_new".}
proc copy*(out_arg: ptr ComponentValFlagsVecT; a1: ptr ComponentValFlagsVecT): void {.
    cdecl, importc: "wasmtime_component_val_flags_vec_copy".}
proc delete*(a0: ptr ComponentValFlagsVecT): void {.cdecl,
    importc: "wasmtime_component_val_flags_vec_delete".}
proc set*(flags: ptr ComponentValFlagsVecT; index: uint32; enabled: bool): void {.
    cdecl, importc: "wasmtime_component_val_flags_set".}
proc test*(flags: ptr ComponentValFlagsVecT; index: uint32): bool {.cdecl,
    importc: "wasmtime_component_val_flags_test".}
proc fromBinary*(engine: ptr WasmEngineT; buf: ptr uint8; len: csize_t;
                 component_out: ptr ptr ComponentT): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_from_binary".}
proc delete*(a0: ptr ComponentT): void {.cdecl,
    importc: "wasmtime_component_delete".}
proc newComponentLinker*(engine: ptr WasmEngineT): ptr ComponentLinkerT {.cdecl,
    importc: "wasmtime_component_linker_new".}
proc linkWasi*(linker: ptr ComponentLinkerT; trap_out: ptr ptr WasmTrapT): ptr ErrorT {.
    cdecl, importc: "wasmtime_component_linker_link_wasi".}
proc funcNew*(linker: ptr ComponentLinkerT; name: cstring; len: csize_t;
              callback: ComponentFuncCallbackT; data: pointer;
              finalizer: proc (a0: pointer): void {.cdecl.}): ptr ErrorT {.
    cdecl, importc: "wasmtime_component_linker_func_new".}
proc instantiate*(linker: ptr ComponentLinkerT; context: ptr ComponentContextT;
                  component: ptr ComponentT;
                  instance_out: ptr ptr ComponentInstanceT;
                  trap_out: ptr ptr WasmTrapT): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_linker_instantiate".}
proc getFunc*(instance: ptr ComponentInstanceT; context: ptr ComponentContextT;
              name: ptr uint8; name_len: csize_t;
              item_out: ptr ptr ComponentFuncT): bool {.cdecl,
    importc: "wasmtime_component_instance_get_func".}
proc call*(func_arg: ptr ComponentFuncT; context: ptr ComponentContextT;
           params: ptr ComponentValT; params_len: csize_t;
           results: ptr ComponentValT; results_len: csize_t;
           trap_out: ptr ptr WasmTrapT): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_func_call".}
proc clone*(engine: ptr WasmEngineT): ptr WasmEngineT {.cdecl,
    importc: "wasmtime_engine_clone".}
proc incrementEpoch*(engine: ptr WasmEngineT): void {.cdecl,
    importc: "wasmtime_engine_increment_epoch".}
proc newGlobal*(store: ptr ContextT; type_arg: ptr WasmGlobaltypeT;
                val: ptr ValT; ret: ptr GlobalT): ptr ErrorT {.cdecl,
    importc: "wasmtime_global_new".}
proc type*(store: ptr ContextT; global: ptr GlobalT): ptr WasmGlobaltypeT {.
    cdecl, importc: "wasmtime_global_type".}
proc get*(store: ptr ContextT; global: ptr GlobalT; out_arg: ptr ValT): void {.
    cdecl, importc: "wasmtime_global_get".}
proc set*(store: ptr ContextT; global: ptr GlobalT; val: ptr ValT): ptr ErrorT {.
    cdecl, importc: "wasmtime_global_set".}
proc newMemorytype*(min: uint64; max_present: bool; max: uint64; is_64: bool): ptr WasmMemorytypeT {.
    cdecl, importc: "wasmtime_memorytype_new".}
proc minimum*(ty: ptr WasmMemorytypeT): uint64 {.cdecl,
    importc: "wasmtime_memorytype_minimum".}
proc maximum*(ty: ptr WasmMemorytypeT; max: ptr uint64): bool {.cdecl,
    importc: "wasmtime_memorytype_maximum".}
proc is64*(ty: ptr WasmMemorytypeT): bool {.cdecl,
    importc: "wasmtime_memorytype_is64".}
proc isshared*(ty: ptr WasmMemorytypeT): bool {.cdecl,
    importc: "wasmtime_memorytype_isshared".}
proc newMemory*(store: ptr ContextT; ty: ptr WasmMemorytypeT; ret: ptr MemoryT): ptr ErrorT {.
    cdecl, importc: "wasmtime_memory_new".}
proc type*(store: ptr ContextT; memory: ptr MemoryT): ptr WasmMemorytypeT {.
    cdecl, importc: "wasmtime_memory_type".}
proc data*(store: ptr ContextT; memory: ptr MemoryT): ptr uint8 {.cdecl,
    importc: "wasmtime_memory_data".}
proc dataSize*(store: ptr ContextT; memory: ptr MemoryT): csize_t {.cdecl,
    importc: "wasmtime_memory_data_size".}
proc size*(store: ptr ContextT; memory: ptr MemoryT): uint64 {.cdecl,
    importc: "wasmtime_memory_size".}
proc grow*(store: ptr ContextT; memory: ptr MemoryT; delta: uint64;
           prev_size: ptr uint64): ptr ErrorT {.cdecl,
    importc: "wasmtime_memory_grow".}
proc delete*(guestprofiler: ptr GuestprofilerT): void {.cdecl,
    importc: "wasmtime_guestprofiler_delete".}
proc newGuestprofiler*(module_name: ptr WasmNameT; interval_nanos: uint64;
                       modules: ptr GuestprofilerModulesT; modules_len: csize_t): ptr GuestprofilerT {.
    cdecl, importc: "wasmtime_guestprofiler_new".}
proc sample*(guestprofiler: ptr GuestprofilerT; store: ptr StoreT;
             delta_nanos: uint64): void {.cdecl,
    importc: "wasmtime_guestprofiler_sample".}
proc finish*(guestprofiler: ptr GuestprofilerT; out_arg: ptr WasmByteVecT): ptr ErrorT {.
    cdecl, importc: "wasmtime_guestprofiler_finish".}
proc newTable*(store: ptr ContextT; ty: ptr WasmTabletypeT; init: ptr ValT;
               table: ptr TableT): ptr ErrorT {.cdecl,
    importc: "wasmtime_table_new".}
proc type*(store: ptr ContextT; table: ptr TableT): ptr WasmTabletypeT {.cdecl,
    importc: "wasmtime_table_type".}
proc get*(store: ptr ContextT; table: ptr TableT; index: uint64; val: ptr ValT): bool {.
    cdecl, importc: "wasmtime_table_get".}
proc set*(store: ptr ContextT; table: ptr TableT; index: uint64; value: ptr ValT): ptr ErrorT {.
    cdecl, importc: "wasmtime_table_set".}
proc size*(store: ptr ContextT; table: ptr TableT): uint64 {.cdecl,
    importc: "wasmtime_table_size".}
proc grow*(store: ptr ContextT; table: ptr TableT; delta: uint64;
           init: ptr ValT; prev_size: ptr uint64): ptr ErrorT {.cdecl,
    importc: "wasmtime_table_grow".}
proc newTrap*(msg: cstring; msg_len: csize_t): ptr WasmTrapT {.cdecl,
    importc: "wasmtime_trap_new".}
proc code*(a0: ptr WasmTrapT; code: ptr TrapCodeT): bool {.cdecl,
    importc: "wasmtime_trap_code".}
proc wasmtimeFrameFuncName*(a0: ptr WasmFrameT): ptr WasmNameT {.cdecl,
    importc: "wasmtime_frame_func_name".}
proc wasmtimeFrameModuleName*(a0: ptr WasmFrameT): ptr WasmNameT {.cdecl,
    importc: "wasmtime_frame_module_name".}

import
  std / [options]

proc `=destroy`*(self: StructWasmtimeComponentValT) {.nodestroy.}
template vec(T: untyped; unchecked: bool = true): untyped =
  type
    ItemType = typeof(T().data[])
  proc `=copy`*(self: var T; src: T) {.error.}
  proc clone*(self: T): T =
    self.addr.copy(result.addr)

  proc `=destroy`*(self: T) =
    if self.data != nil:
      self.addr.delete()

  func toVec*(s: openArray[ItemType]): T =
    if s.len > 0:
      when unchecked:
        result.addr.new(s.len.csize_t,
                        cast[ptr UncheckedArray[ItemType]](s[0].addr))
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
proc `=destroy`*(self: StructWasmtimeComponentValT) {.nodestroy.} =
  case self.kind.ComponentValKind
  of String:
    `=destroy`(self.payload.string_field)
  of List:
    `=destroy`(self.payload.list)
  of Record:
    `=destroy`(self.payload.record)
  of Tuple:
    `=destroy`(self.payload.tuple_field)
  of Flags:
    `=destroy`(self.payload.flags)
  else:
    discard

type
  WasmByte* = WasmByteT
type
  WasmByteVec* = WasmByteVecT
type
  WasmExporttypeVec* = WasmExporttypeVecT
type
  WasmExternVec* = WasmExternVecT
type
  WasmExterntypeVec* = WasmExterntypeVecT
type
  WasmFrameVec* = WasmFrameVecT
type
  WasmFunctypeVec* = WasmFunctypeVecT
type
  WasmGlobaltypeVec* = WasmGlobaltypeVecT
type
  WasmImporttypeVec* = WasmImporttypeVecT
type
  WasmMemorytypeVec* = WasmMemorytypeVecT
type
  WasmTabletypeVec* = WasmTabletypeVecT
type
  WasmValVec* = WasmValVecT
type
  WasmValtypeVec* = WasmValtypeVecT
type
  ComponentValFlagsVec* = ComponentValFlagsVecT
type
  ComponentValRecordFieldVec* = ComponentValRecordFieldVecT
type
  ComponentValVec* = ComponentValVecT
proc strVal*(name: WasmNameT): string =
  result = newStringOfCap(name.size.int)
  for i in 0 ..< name.size.int:
    result.add cast[ptr UncheckedArray[char]](name.data)[i]

proc toName*(name: string): WasmNameT =
  result.addr.new(name.len.csize_t,
                  cast[ptr UncheckedArray[WasmByteT]](name[0].addr))

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
    for i in 0 ..< params[].size.int:
      if i > 0:
        result.add ", "
      {.push, warning[HoleEnumConv]: off.}
      let kind = params[][i].kind.WasmValkind
      {.pop.}
      result.add $kind
    result.add ") -> ("
    for i in 0 ..< results[].size.int:
      if i > 0:
        result.add ", "
      {.push, warning[HoleEnumConv]: off.}
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
  WasmtimeResultKind* = enum
    Ok, Err
  WasmtimeResult*[T] = object
    case kind*: WasmtimeResultKind
    of Ok:
      when T isnot void:
        val*: T
    of Err:
      err*: tuple[msg: string, status: int, trace: WasmFrameVecT]
proc msg*(err: ptr ErrorT): string =
  var name: WasmNameT
  err.message(name.addr)
  result = name.strVal

proc msg*(err: ptr WasmTrapT): string =
  var name: WasmNameT
  err.message(name.addr)
  result = name.strVal

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

template okOr*[T](res: WasmtimeResult[T]; body: untyped): T =
  let temp = res
  if temp.isOk:
    when T isnot void:
      temp.val
  else:
    body

template okOr*[T](res: WasmtimeResult[T]; err: untyped; body: untyped): T =
  let temp = res
  if temp.isOk:
    when T isnot void:
      temp.val
  else:
    let err {.cursor.} = res.err
    body

template okOr*(res: ptr ErrorT; err: untyped; body: untyped): untyped =
  let temp = res.toResult(void)
  if not temp.isOk:
    let err {.cursor.} = res
    body

template okOr*(res: ptr WasmTrapT; err: untyped; body: untyped): untyped =
  let temp = res.toResult(void)
  if not temp.isOk:
    let err {.cursor.} = res
    body

proc newModule*(engine: ptr WasmEngineT; wasm: openArray[uint8]): WasmtimeResult[
    ptr ModuleT] =
  var res: ptr ModuleT = nil
  let err = engine.newModule(wasm[0].addr, wasm.len.csize_t, res.addr)
  if err != nil:
    return err.toResult(ptr ModuleT)
  return res.ok

proc newModule*(engine: ptr WasmEngineT; wasm: string): WasmtimeResult[
    ptr ModuleT] =
  var res: ptr ModuleT = nil
  let err = engine.newModule(cast[ptr uint8](wasm[0].addr), wasm.len.csize_t,
                             res.addr)
  if err != nil:
    return err.toResult(ptr ModuleT)
  return res.ok

proc imports*(module: ptr ModuleT): WasmImporttypeVecT =
  module.imports(result.addr)

proc exports*(module: ptr ModuleT): WasmExporttypeVecT =
  module.exports(result.addr)

proc newComponent*(engine: ptr WasmEngineT; buf: openArray[char]): WasmtimeResult[
    ptr ComponentT] =
  var c: ptr ComponentT = nil
  let err = engine.fromBinary(cast[ptr uint8](buf[0].addr), buf.len.csize_t,
                              c.addr)
  if err != nil:
    return err.toResult(ptr ComponentT)
  return ok(c)

proc instantiate*(linker: ptr LinkerT; store: ptr ContextT; module: ptr ModuleT;
                  trap: ptr ptr WasmTrapT): WasmtimeResult[InstanceT] =
  var instance: InstanceT
  let err = linker.instantiate(store, module, instance.addr, trap)
  if err != nil:
    return err.toResult(InstanceT)
  return instance.ok

proc getExport*(instance: InstanceT; store: ptr ContextT; index: int): Option[
    tuple[name: string, extern: ExternT]] =
  var name: cstring = ""
  var nameLen: csize_t = 0
  var res: ExternT
  if not store.exportNth(instance.addr, index.csize_t, name.addr, nameLen.addr,
                         res.addr):
    return
  (name.toOpenArray(0, nameLen.int - 1).join(), res).some

proc getExport*(instance: InstanceT; store: ptr ContextT; name: string): Option[
    ExternT] =
  var instance = instance
  var res: ExternT
  if not store.exportGet(instance.addr, name.cstring, name.len.csize_t, res.addr):
    return
  res.some

proc data*[T](arr: openArray[T]): ptr T =
  if arr.len == 0:
    nil
  else:
    arr[0].addr

proc call*(f: ptr FuncT; store: ptr ContextT; args: openArray[ValT];
           results: openArray[ValT]; trap: ptr ptr WasmTrapT): ptr ErrorT =
  store.call(f, args.data, args.len.csize_t, results.data, results.len.csize_t,
             trap)

type
  ComponentFuncCallback* = proc (ctx: pointer; params: openArray[ComponentValT];
                                 results: var openArray[ComponentValT])
proc funcNew*(linker: ptr ComponentLinkerT; name: string;
              callback: ComponentFuncCallback; data: pointer = nil;
              finalizer: proc (a0: pointer): void {.cdecl.} = nil): WasmtimeResult[
    void] =
  type
    Ctx = object
      callback: ComponentFuncCallback
      data: pointer
      finalizer: proc (a0: pointer): void {.cdecl.}
  var ctx = createShared(Ctx)
  ctx.callback = callback
  ctx.data = data
  ctx.finalizer = finalizer
  proc fin(data: pointer) {.cdecl.} =
    let ctx = cast[ptr Ctx](data)
    if ctx.finalizer != nil:
      ctx.finalizer(ctx.data)
    deallocShared(ctx)

  proc cb(data: pointer; params: ptr ComponentValT; paramsLen: csize_t;
          results: ptr ComponentValT; resultsLen: csize_t): ptr WasmTrapT {.
      cdecl.} =
    let ctx = cast[ptr Ctx](data)
    let params = cast[ptr UncheckedArray[ComponentValT]](params)
    let results = cast[ptr UncheckedArray[ComponentValT]](results)
    ctx[].callback(ctx[].data, params.toOpenArray(0, paramsLen.int - 1),
                   results.toOpenArray(0, resultsLen.int - 1))
    nil

  return linker.funcNew(name.cstring, name.len.csize_t, cb, ctx, fin).toResult(
      void)

proc `$`*(a: ComponentValT): string =
  case a.kind.ComponentValKind
  of Bool:
    $a.payload.boolean
  of S8:
    $a.payload.s8
  of U8:
    $a.payload.u8
  of S16:
    $a.payload.s16
  of U16:
    $a.payload.u16
  of S32:
    $a.payload.s32
  of U32:
    $a.payload.u32
  of S64:
    $a.payload.s64
  of U64:
    $a.payload.u64
  of Float32:
    $a.payload.f32
  of Float64:
    $a.payload.f64
  of Char:
    $a.payload.character
  of String:
    "\"" & $a.payload.string_field.strVal & "\""
  of List:
    var str = "["
    for i, v in a.payload.list:
      if i > 0:
        str.add ", "
      str.add $v
    str.add "]"
    str
  of Record:
    var str = "{"
    for i, v in a.payload.record:
      if i > 0:
        str.add ", "
      str.add v.name.strVal
      str.add ": "
      str.add $v.val
    str.add "}"
    str
  of Tuple:
    var str = "("
    for i, v in a.payload.tuple_field:
      if i > 0:
        str.add ", "
      str.add $v
    str.add ")"
    str
  of Variant:
    if a.payload.variant.val != nil:
      a.payload.variant.name.strVal & "(" & $a.payload.variant.val[] & ")"
    else:
      a.payload.variant.name.strVal
  of Enum:
    $a.payload.enumeration
  of Option:
    if a.payload.option != nil:
      "Some(" & $(a.payload.option[]) & ")"
    else:
      "none"
  of Result:
    if a.payload.result.error:
      "Err(" & $(a.payload.option[]) & ")"
    else:
      "Ok(" & $(a.payload.option[]) & ")"
  else:
    "Unknown " & $a.kind.ComponentValKind
