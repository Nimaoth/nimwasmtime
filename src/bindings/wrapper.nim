
type
  WasmMutability* {.size: sizeof(cint).} = enum
    Const = 0, Var = 1
type
  WasmValkind* {.size: sizeof(cint).} = enum
    I32 = 0, I64 = 1, F32 = 2, F64 = 3, Externref = 128, Funcref = 129
type
  WasmExternkind* {.size: sizeof(cint).} = enum
    ExternFunc = 0, ExternGlobal = 1, ExternTable = 2, ExternMemory = 3
type
  Strategy* {.size: sizeof(cint).} = enum
    Auto = 0, Cranelift = 1
type
  OptLevel* {.size: sizeof(cint).} = enum
    OptLevelNone = 0, Speed = 1, SpeedAndSize = 2
type
  ProfilingStrategy* {.size: sizeof(cint).} = enum
    ProfilingStrategyNone = 0, Jitdump = 1, Vtune = 2, Perfmap = 3
type
  WasiDirPermsFlags* {.size: sizeof(cint).} = enum
    WasiDirPermsRead = 1, WasiDirPermsWrite = 2
type
  WasiFilePermsFlags* {.size: sizeof(cint).} = enum
    WasiFilePermsRead = 1, WasiFilePermsWrite = 2
type
  TrapCode* {.size: sizeof(cint).} = enum
    StackOverflow = 0, MemoryOutOfBounds = 1, HeapMisaligned = 2,
    TableOutOfBounds = 3, IndirectCallToNull = 4, BadSignature = 5,
    IntegerOverflow = 6, IntegerDivisionByZero = 7, BadConversionToInteger = 8,
    UnreachableCodeReached = 9, Interrupt = 10, AlwaysTrapAdapter = 11,
    OutOfFuel = 12, AtomicWaitNonSharedMemory = 13, NullReference = 14,
    ArrayOutOfBounds = 15, AllocationTooLarge = 16, CastFailure = 17,
    CannotEnterComponent = 18, NoAsyncResult = 19, DisabledOpcode = 20
type
  StructWasmtimeContext* = object
type
  StructWasmFunctypeT* = object
type
  StructWasmValtypeT* = object
type
  StructWasmStoreT* = object
type
  StructWasmTabletypeT* = object
type
  StructWasmtimeComponentLinkerInstanceT* = object
type
  StructCrtMultibyteData* = object
type
  WasmByteVec* = object
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
  StructCrtLocaleData* = object
type
  StructWasmtimeCaller* = object
type
  StructWasmEngineT* = object
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
  StructWasmMemorytypeT* = object
type
  StructWasmtimeStore* = object
type
  StructWasmConfigT* = object
type
  StructWasmGlobaltypeT* = object
type
  StructWasmtimeComponentExportIndexT* = object
type
  StructWasmtimeGuestprofiler* = object
type
  StructWasmtimeSharedmemory* = object
type
  StructWasmForeignT* = object
type
  StructWasmGlobalT* = object
type
  LocaleT* = ptr CrtLocalePointers ## Generated based on C:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\ucrt\corecrt.h:623:32
  ByteT* = cschar            ## Generated based on wasmtime\crates\c-api\include\wasm.h:43:14
  Float32T* = cfloat         ## Generated based on wasmtime\crates\c-api\include\wasm.h:44:15
  Float64T* = cdouble        ## Generated based on wasmtime\crates\c-api\include\wasm.h:45:16
  WasmByteT* = ByteT         ## Generated based on wasmtime\crates\c-api\include\wasm.h:101:16
  StructWasmByteVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:102:1
    data*: ptr WasmByteT
  WasmByteVecT* = object of StructWasmByteVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:102:1
  WasmNameT* = WasmByteVecT  ## Generated based on wasmtime\crates\c-api\include\wasm.h:104:25
  WasmConfigT* = StructWasmConfigT ## Generated based on wasmtime\crates\c-api\include\wasm.h:131:1
  WasmEngineT* = StructWasmEngineT ## Generated based on wasmtime\crates\c-api\include\wasm.h:140:1
  WasmStoreT* = StructWasmStoreT ## Generated based on wasmtime\crates\c-api\include\wasm.h:148:1
  WasmMutabilityT* = uint8   ## Generated based on wasmtime\crates\c-api\include\wasm.h:158:17
  StructWasmLimitsT* {.pure, inheritable, bycopy.} = object
    min*: uint32             ## Generated based on wasmtime\crates\c-api\include\wasm.h:164:16
    max*: uint32
  WasmLimitsT* = StructWasmLimitsT ## Generated based on wasmtime\crates\c-api\include\wasm.h:167:3
  WasmValtypeT* = StructWasmValtypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:183:1
  StructWasmValtypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:183:1
    data*: ptr ptr WasmValtypeT
  WasmValtypeVecT* = object of StructWasmValtypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:183:1
  WasmValkindT* = uint8      ## Generated based on wasmtime\crates\c-api\include\wasm.h:185:17
  WasmFunctypeT* = StructWasmFunctypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:216:1
  StructWasmFunctypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:216:1
    data*: ptr ptr WasmFunctypeT
  WasmFunctypeVecT* = object of StructWasmFunctypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:216:1
  WasmGlobaltypeT* = StructWasmGlobaltypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:227:1
  StructWasmGlobaltypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:227:1
    data*: ptr ptr WasmGlobaltypeT
  WasmGlobaltypeVecT* = object of StructWasmGlobaltypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:227:1
  WasmTabletypeT* = StructWasmTabletypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:238:1
  StructWasmTabletypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:238:1
    data*: ptr ptr WasmTabletypeT
  WasmTabletypeVecT* = object of StructWasmTabletypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:238:1
  WasmMemorytypeT* = StructWasmMemorytypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:249:1
  StructWasmMemorytypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:249:1
    data*: ptr ptr WasmMemorytypeT
  WasmMemorytypeVecT* = object of StructWasmMemorytypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:249:1
  WasmExterntypeT* = StructWasmExterntypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:258:1
  StructWasmExterntypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:258:1
    data*: ptr ptr WasmExterntypeT
  WasmExterntypeVecT* = object of StructWasmExterntypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:258:1
  WasmExternkindT* = uint8   ## Generated based on wasmtime\crates\c-api\include\wasm.h:260:17
  WasmImporttypeT* = StructWasmImporttypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:293:1
  StructWasmImporttypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:293:1
    data*: ptr ptr WasmImporttypeT
  WasmImporttypeVecT* = object of StructWasmImporttypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:293:1
  WasmExporttypeT* = StructWasmExporttypeT ## Generated based on wasmtime\crates\c-api\include\wasm.h:305:1
  StructWasmExporttypeVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:305:1
    data*: ptr ptr WasmExporttypeT
  WasmExporttypeVecT* = object of StructWasmExporttypeVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:305:1
  StructWasmValT_of_field_t* {.union, bycopy.} = object
    i32*: int32
    i64*: int64
    f32*: Float32T
    f64*: Float64T
    ref_field*: ptr StructWasmRefT
  StructWasmValT* {.pure, inheritable, bycopy.} = object
    kind*: WasmValkindT      ## Generated based on wasmtime\crates\c-api\include\wasm.h:321:16
    of_field*: StructWasmValT_of_field_t
  WasmValT* = StructWasmValT ## Generated based on wasmtime\crates\c-api\include\wasm.h:330:3
  StructWasmValVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:335:1
    data*: ptr WasmValT
  WasmValVecT* = object of StructWasmValVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:335:1
  WasmRefT* = StructWasmRefT ## Generated based on wasmtime\crates\c-api\include\wasm.h:367:1
  WasmFrameT* = StructWasmFrameT ## Generated based on wasmtime\crates\c-api\include\wasm.h:372:1
  StructWasmFrameVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:373:1
    data*: ptr ptr WasmFrameT
  WasmFrameVecT* = object of StructWasmFrameVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:373:1
  WasmMessageT* = WasmNameT  ## Generated based on wasmtime\crates\c-api\include\wasm.h:384:21
  WasmTrapT* = StructWasmTrapT ## Generated based on wasmtime\crates\c-api\include\wasm.h:386:1
  WasmForeignT* = StructWasmForeignT ## Generated based on wasmtime\crates\c-api\include\wasm.h:397:1
  WasmModuleT* = StructWasmModuleT ## Generated based on wasmtime\crates\c-api\include\wasm.h:404:1
  WasmSharedModuleT* = StructWasmSharedModuleT ## Generated based on wasmtime\crates\c-api\include\wasm.h:404:1
  WasmFuncT* = StructWasmFuncT ## Generated based on wasmtime\crates\c-api\include\wasm.h:420:1
  WasmFuncCallbackT* = proc (a0: ptr WasmValVecT; a1: ptr WasmValVecT): ptr WasmTrapT {.
      cdecl.}                ## Generated based on wasmtime\crates\c-api\include\wasm.h:422:28
  WasmFuncCallbackWithEnvT* = proc (a0: pointer; a1: ptr WasmValVecT;
                                    a2: ptr WasmValVecT): ptr WasmTrapT {.cdecl.} ## Generated based on wasmtime\crates\c-api\include\wasm.h:424:28
  WasmGlobalT* = StructWasmGlobalT ## Generated based on wasmtime\crates\c-api\include\wasm.h:443:1
  WasmTableT* = StructWasmTableT ## Generated based on wasmtime\crates\c-api\include\wasm.h:456:1
  WasmTableSizeT* = uint32   ## Generated based on wasmtime\crates\c-api\include\wasm.h:458:18
  WasmMemoryT* = StructWasmMemoryT ## Generated based on wasmtime\crates\c-api\include\wasm.h:474:1
  WasmMemoryPagesT* = uint32 ## Generated based on wasmtime\crates\c-api\include\wasm.h:476:18
  WasmExternT* = StructWasmExternT ## Generated based on wasmtime\crates\c-api\include\wasm.h:493:1
  StructWasmExternVecT* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasm.h:494:1
    data*: ptr ptr WasmExternT
  WasmExternVecT* = object of StructWasmExternVecT ## Generated based on wasmtime\crates\c-api\include\wasm.h:494:1
  WasmInstanceT* = StructWasmInstanceT ## Generated based on wasmtime\crates\c-api\include\wasm.h:522:1
  ErrorT* = StructWasmtimeError ## Generated based on wasmtime\crates\c-api\include\wasmtime\error.h:31:31
  StrategyT* = uint8         ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:22:17
  OptLevelT* = uint8         ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:44:17
  ProfilingStrategyT* = uint8 ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:66:17
  MemoryGetCallbackT* = proc (a0: pointer; a1: ptr csize_t; a2: ptr csize_t): ptr uint8 {.
      cdecl.}                ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:448:20
  MemoryGrowCallbackT* = proc (a0: pointer; a1: csize_t): ptr ErrorT {.cdecl.} ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:457:29
  StructWasmtimeLinearMemory* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:466:16
    get_memory*: MemoryGetCallbackT
    grow_memory*: MemoryGrowCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  LinearMemoryT* = StructWasmtimeLinearMemory ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:475:3
  NewMemoryCallbackT* = proc (a0: pointer; a1: ptr WasmMemorytypeT; a2: csize_t;
                              a3: csize_t; a4: csize_t; a5: csize_t;
                              a6: ptr LinearMemoryT): ptr ErrorT {.cdecl.} ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:488:29
  StructWasmtimeMemoryCreator* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:500:16
    new_memory*: NewMemoryCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  MemoryCreatorT* = StructWasmtimeMemoryCreator ## Generated based on wasmtime\crates\c-api\include\wasmtime\config.h:507:3
  WasiConfigT* = StructWasiConfigT ## Generated based on wasmtime\crates\c-api\include\wasi.h:44:1
  WasiDirPerms* = csize_t    ## Generated based on wasmtime\crates\c-api\include\wasi.h:186:16
  WasiFilePerms* = csize_t   ## Generated based on wasmtime\crates\c-api\include\wasi.h:207:16
  StoreT* = StructWasmtimeStore ## Generated based on wasmtime\crates\c-api\include\wasmtime\store.h:37:31
  ContextT* = StructWasmtimeContext ## Generated based on wasmtime\crates\c-api\include\wasmtime\store.h:58:33
  UpdateDeadlineKindT* = uint8 ## Generated based on wasmtime\crates\c-api\include\wasmtime\store.h:212:17
  ModuleT* = StructWasmtimeModule ## Generated based on wasmtime\crates\c-api\include\wasmtime/module.h:29:32
  SharedmemoryT* = StructWasmtimeSharedmemory ## Generated based on wasmtime\crates\c-api\include\wasmtime/sharedmemory.h:24:38
  StructWasmtimeFunc* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:25:16
    compiler_private*: pointer
  FuncT* = StructWasmtimeFunc ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:34:3
  StructWasmtimeTable_anon0_t* {.pure, inheritable, bycopy.} = object
    store_id*: uint64
    compiler_private1*: uint32
  StructWasmtimeTable* {.pure, inheritable, bycopy.} = object
    anon0*: StructWasmtimeTable_anon0_t ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:43:16
    compiler_private2*: uint32
  TableT* = StructWasmtimeTable ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:52:3
  StructWasmtimeMemory_anon0_t* {.pure, inheritable, bycopy.} = object
    store_id*: uint64
    compiler_private1*: uint32
  StructWasmtimeMemory* {.pure, inheritable, bycopy.} = object
    anon0*: StructWasmtimeMemory_anon0_t ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:61:16
    compiler_private2*: uint32
  MemoryT* = StructWasmtimeMemory ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:70:3
  StructWasmtimeGlobal* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:79:16
    compiler_private1*: uint32
    compiler_private2*: uint32
    compiler_private3*: uint32
  GlobalT* = StructWasmtimeGlobal ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:88:3
  ExternKindT* = uint8       ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:91:17
  ExternUnion* {.union, bycopy.} = object
    func_field*: FuncT       ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:119:15
    global*: GlobalT
    table*: TableT
    memory*: MemoryT
    sharedmemory*: ptr StructWasmtimeSharedmemory
  ExternUnionT* = ExternUnion ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:130:3
  StructWasmtimeExtern* {.pure, inheritable, bycopy.} = object
    kind*: ExternKindT       ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:145:16
    of_field*: ExternUnionT
  ExternT* = StructWasmtimeExtern ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:150:3
  StructWasmtimeAnyref* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:39:16
    compiler_private1*: uint32
    compiler_private2*: uint32
  AnyrefT* = StructWasmtimeAnyref ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:47:3
  StructWasmtimeExternref* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:174:16
    compiler_private1*: uint32
    compiler_private2*: uint32
  ExternrefT* = StructWasmtimeExternref ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:182:3
  ValkindT* = uint8          ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:284:17
  V128* = array[16'i64, uint8] ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:307:17
  Valunion* {.union, bycopy.} = object
    i32*: int32              ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:319:15
    i64*: int64
    f32*: Float32T
    f64*: Float64T
    anyref*: AnyrefT
    externref*: ExternrefT
    funcref*: FuncT
    v128*: V128
  ValunionT* = Valunion      ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:339:3
  ValRaw* {.union, bycopy.} = object
    i32*: int32              ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:372:15
    i64*: int64
    f32*: Float32T
    f64*: Float64T
    v128*: V128
    anyref*: uint32
    externref*: uint32
    funcref*: pointer
  ValRawT* = ValRaw          ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:416:3
  StructWasmtimeVal* {.pure, inheritable, bycopy.} = object
    kind*: ValkindT          ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:441:16
    of_field*: ValunionT
  ValT* = StructWasmtimeVal  ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:446:3
  CallerT* = StructWasmtimeCaller ## Generated based on wasmtime\crates\c-api\include\wasmtime/func.h:33:32
  FuncCallbackT* = proc (a0: pointer; a1: ptr CallerT; a2: ptr ValT;
                         a3: csize_t; a4: ptr ValT; a5: csize_t): ptr WasmTrapT {.
      cdecl.}                ## Generated based on wasmtime\crates\c-api\include\wasmtime/func.h:57:24
  FuncUncheckedCallbackT* = proc (a0: pointer; a1: ptr CallerT; a2: ptr ValRawT;
                                  a3: csize_t): ptr WasmTrapT {.cdecl.} ## Generated based on wasmtime\crates\c-api\include\wasmtime/func.h:116:24
  StructWasmtimeInstance* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime\crates\c-api\include\wasmtime/instance.h:26:16
    compiler_private*: csize_t
  InstanceT* = StructWasmtimeInstance ## Generated based on wasmtime\crates\c-api\include\wasmtime/instance.h:31:3
  InstancePreT* = StructWasmtimeInstancePre ## Generated based on wasmtime\crates\c-api\include\wasmtime/instance.h:121:38
  LinkerT* = StructWasmtimeLinker ## Generated based on wasmtime\crates\c-api\include\wasmtime/linker.h:38:32
  FuncAsyncContinuationCallbackT* = proc (a0: pointer): bool {.cdecl.} ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:124:16
  StructWasmtimeAsyncContinuationT* {.pure, inheritable, bycopy.} = object
    callback*: FuncAsyncContinuationCallbackT ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:129:16
    env*: pointer
    finalizer*: proc (a0: pointer): void {.cdecl.}
  AsyncContinuationT* = StructWasmtimeAsyncContinuationT ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:136:3
  FuncAsyncCallbackT* = proc (a0: pointer; a1: ptr CallerT; a2: ptr ValT;
                              a3: csize_t; a4: ptr ValT; a5: csize_t;
                              a6: ptr ptr WasmTrapT; a7: ptr AsyncContinuationT): void {.
      cdecl.}                ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:164:16
  CallFutureT* = StructWasmtimeCallFuture ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:178:37
  StackMemoryGetCallbackT* = proc (a0: pointer; a1: ptr csize_t): ptr uint8 {.
      cdecl.}                ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:305:20
  StructWasmtimeStackMemoryT* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:314:9
    get_stack_memory*: StackMemoryGetCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  StackMemoryT* = StructWasmtimeStackMemoryT ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:321:3
  NewStackMemoryCallbackT* = proc (a0: pointer; a1: csize_t; a2: bool;
                                   a3: ptr StackMemoryT): ptr ErrorT {.cdecl.} ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:334:29
  StructWasmtimeStackCreatorT* {.pure, inheritable, bycopy.} = object
    env*: pointer            ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:343:9
    new_stack*: NewStackMemoryCallbackT
    finalizer*: proc (a0: pointer): void {.cdecl.}
  StackCreatorT* = StructWasmtimeStackCreatorT ## Generated based on wasmtime\crates\c-api\include\wasmtime\async.h:350:3
  ComponentT* = StructWasmtimeComponentT ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/component.h:17:37
  ComponentExportIndexT* = StructWasmtimeComponentExportIndexT ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/component.h:114:5
  ComponentValkindT* = uint8 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:15:17
  StructWasmtimeComponentVallist* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:104:1
    data*: ptr StructWasmtimeComponentVal
  StructWasmtimeComponentVal* {.pure, inheritable, bycopy.} = object
    kind*: ComponentValkindT ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:183:16
    of_field*: ComponentValunionT_typedef
  ComponentVallistT* = StructWasmtimeComponentVallist ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:104:1
  StructWasmtimeComponentValrecord* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:105:1
    data*: ptr StructWasmtimeComponentValrecordEntry
  StructWasmtimeComponentValrecordEntry* {.pure, inheritable, bycopy.} = object
    name*: WasmNameT         ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:192:16
    val*: ComponentValT
  ComponentValrecordT* = StructWasmtimeComponentValrecord ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:105:1
  StructWasmtimeComponentValtuple* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:107:1
    data*: ptr StructWasmtimeComponentVal
  ComponentValtupleT* = StructWasmtimeComponentValtuple ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:107:1
  StructWasmtimeComponentValflags* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:108:1
    data*: ptr WasmNameT
  ComponentValflagsT* = StructWasmtimeComponentValflags ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:108:1
  StructWasmtimeComponentValvariantT* {.pure, inheritable, bycopy.} = object
    discriminant*: WasmNameT ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:113:9
    val*: ptr StructWasmtimeComponentVal
  ComponentValvariantT* = StructWasmtimeComponentValvariantT ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:118:3
  StructWasmtimeComponentValresultT* {.pure, inheritable, bycopy.} = object
    is_ok*: bool             ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:121:9
    val*: ptr StructWasmtimeComponentVal
  ComponentValresultT* = StructWasmtimeComponentValresultT ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:127:3
  ComponentValunionT* {.union, bycopy.} = object
    boolean*: bool           ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:131:9
    s8*: int8
    u8*: uint8
    s16*: int16
    u16*: uint16
    s32*: int32
    u32*: uint32
    s64*: int64
    u64*: uint64
    f32*: Float32T
    f64*: Float64T
    character*: uint32
    string*: WasmNameT
    list*: ComponentVallistT
    record*: ComponentValrecordT
    tuple_field*: ComponentValtupleT
    variant*: ComponentValvariantT
    enumeration*: WasmNameT
    option*: ptr StructWasmtimeComponentVal
    result*: ComponentValresultT
    flags*: ComponentValflagsT
  ComponentValunionT_typedef* = ComponentValunionT ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:179:3
  ComponentValT* = StructWasmtimeComponentVal ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:188:3
  ComponentValrecordEntryT* = StructWasmtimeComponentValrecordEntry ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:197:3
  StructWasmtimeComponentFunc_anon0_t* {.pure, inheritable, bycopy.} = object
    store_id*: uint64
    compiler_private1*: uint32
  StructWasmtimeComponentFunc* {.pure, inheritable, bycopy.} = object
    anon0*: StructWasmtimeComponentFunc_anon0_t ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/func.h:24:16
    compiler_private2*: uint32
  ComponentFuncT* = StructWasmtimeComponentFunc ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/func.h:34:3
  StructWasmtimeComponentInstance* {.pure, inheritable, bycopy.} = object
    store_id*: uint64        ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/instance.h:24:16
    compiler_private*: uint32
  ComponentInstanceT* = StructWasmtimeComponentInstance ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/instance.h:29:3
  ComponentLinkerT* = StructWasmtimeComponentLinkerT ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/linker.h:20:44
  ComponentLinkerInstanceT* = StructWasmtimeComponentLinkerInstanceT ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/linker.h:24:5
  ComponentFuncCallbackT* = proc (a0: pointer; a1: ptr ContextT;
                                  a2: ptr ComponentValT; a3: csize_t;
                                  a4: ptr ComponentValT; a5: csize_t): ptr ErrorT {.
      cdecl.}                ## Generated based on wasmtime\crates\c-api\include\wasmtime\component/linker.h:118:29
  GuestprofilerT* = StructWasmtimeGuestprofiler ## Generated based on wasmtime\crates\c-api\include\wasmtime\profiling.h:33:39
  StructWasmtimeGuestprofilerModules* {.pure, inheritable, bycopy.} = object
    name*: ptr WasmNameT     ## Generated based on wasmtime\crates\c-api\include\wasmtime\profiling.h:50:16
    mod_field*: ptr ModuleT
  GuestprofilerModulesT* = StructWasmtimeGuestprofilerModules ## Generated based on wasmtime\crates\c-api\include\wasmtime\profiling.h:54:3
  TrapCodeT* = uint8         ## Generated based on wasmtime\crates\c-api\include\wasmtime\trap.h:21:17
  CrtLocalePointers* = StructCrtLocalePointers ## Generated based on C:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\ucrt\corecrt.h:621:3
  StructCrtLocalePointers* {.pure, inheritable, bycopy.} = object
    locinfo*: ptr StructCrtLocaleData ## Generated based on C:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\ucrt\corecrt.h:617:16
    mbcinfo*: ptr StructCrtMultibyteData
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
    WASMTIME_UPDATE_DEADLINE_CONTINUE* = 0 ## Generated based on wasmtime\crates\c-api\include\wasmtime\store.h:214:9
else:
  let WASMTIME_UPDATE_DEADLINE_CONTINUE* = 0 ## Generated based on wasmtime\crates\c-api\include\wasmtime\store.h:214:9
when 1 is static:
  const
    WASMTIME_UPDATE_DEADLINE_YIELD* = 1 ## Generated based on wasmtime\crates\c-api\include\wasmtime\store.h:216:9
else:
  let WASMTIME_UPDATE_DEADLINE_YIELD* = 1 ## Generated based on wasmtime\crates\c-api\include\wasmtime\store.h:216:9
when 0 is static:
  const
    WASMTIME_EXTERN_FUNC* = 0 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:95:9
else:
  let WASMTIME_EXTERN_FUNC* = 0 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:95:9
when 1 is static:
  const
    WASMTIME_EXTERN_GLOBAL* = 1 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:98:9
else:
  let WASMTIME_EXTERN_GLOBAL* = 1 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:98:9
when 2 is static:
  const
    WASMTIME_EXTERN_TABLE* = 2 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:101:9
else:
  let WASMTIME_EXTERN_TABLE* = 2 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:101:9
when 3 is static:
  const
    WASMTIME_EXTERN_MEMORY* = 3 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:104:9
else:
  let WASMTIME_EXTERN_MEMORY* = 3 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:104:9
when 4 is static:
  const
    WASMTIME_EXTERN_SHAREDMEMORY* = 4 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:107:9
else:
  let WASMTIME_EXTERN_SHAREDMEMORY* = 4 ## Generated based on wasmtime\crates\c-api\include\wasmtime/extern.h:107:9
when 0 is static:
  const
    WASMTIME_I32* = 0        ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:286:9
else:
  let WASMTIME_I32* = 0      ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:286:9
when 1 is static:
  const
    WASMTIME_I64* = 1        ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:288:9
else:
  let WASMTIME_I64* = 1      ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:288:9
when 2 is static:
  const
    WASMTIME_F32* = 2        ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:290:9
else:
  let WASMTIME_F32* = 2      ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:290:9
when 3 is static:
  const
    WASMTIME_F64* = 3        ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:292:9
else:
  let WASMTIME_F64* = 3      ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:292:9
when 4 is static:
  const
    WASMTIME_V128* = 4       ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:294:9
else:
  let WASMTIME_V128* = 4     ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:294:9
when 5 is static:
  const
    WASMTIME_FUNCREF* = 5    ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:297:9
else:
  let WASMTIME_FUNCREF* = 5  ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:297:9
when 6 is static:
  const
    WASMTIME_EXTERNREF* = 6  ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:300:9
else:
  let WASMTIME_EXTERNREF* = 6 ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:300:9
when 7 is static:
  const
    WASMTIME_ANYREF* = 7     ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:303:9
else:
  let WASMTIME_ANYREF* = 7   ## Generated based on wasmtime\crates\c-api\include\wasmtime/val.h:303:9
when 0 is static:
  const
    WASMTIME_COMPONENT_BOOL* = 0 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:19:9
else:
  let WASMTIME_COMPONENT_BOOL* = 0 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:19:9
when 1 is static:
  const
    WASMTIME_COMPONENT_S8* = 1 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:22:9
else:
  let WASMTIME_COMPONENT_S8* = 1 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:22:9
when 2 is static:
  const
    WASMTIME_COMPONENT_U8* = 2 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:25:9
else:
  let WASMTIME_COMPONENT_U8* = 2 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:25:9
when 3 is static:
  const
    WASMTIME_COMPONENT_S16* = 3 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:28:9
else:
  let WASMTIME_COMPONENT_S16* = 3 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:28:9
when 4 is static:
  const
    WASMTIME_COMPONENT_U16* = 4 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:31:9
else:
  let WASMTIME_COMPONENT_U16* = 4 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:31:9
when 5 is static:
  const
    WASMTIME_COMPONENT_S32* = 5 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:34:9
else:
  let WASMTIME_COMPONENT_S32* = 5 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:34:9
when 6 is static:
  const
    WASMTIME_COMPONENT_U32* = 6 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:37:9
else:
  let WASMTIME_COMPONENT_U32* = 6 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:37:9
when 7 is static:
  const
    WASMTIME_COMPONENT_S64* = 7 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:40:9
else:
  let WASMTIME_COMPONENT_S64* = 7 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:40:9
when 8 is static:
  const
    WASMTIME_COMPONENT_U64* = 8 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:43:9
else:
  let WASMTIME_COMPONENT_U64* = 8 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:43:9
when 9 is static:
  const
    WASMTIME_COMPONENT_F32* = 9 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:46:9
else:
  let WASMTIME_COMPONENT_F32* = 9 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:46:9
when 10 is static:
  const
    WASMTIME_COMPONENT_F64* = 10 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:49:9
else:
  let WASMTIME_COMPONENT_F64* = 10 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:49:9
when 11 is static:
  const
    WASMTIME_COMPONENT_CHAR* = 11 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:52:9
else:
  let WASMTIME_COMPONENT_CHAR* = 11 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:52:9
when 12 is static:
  const
    WASMTIME_COMPONENT_STRING* = 12 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:55:9
else:
  let WASMTIME_COMPONENT_STRING* = 12 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:55:9
when 13 is static:
  const
    WASMTIME_COMPONENT_LIST* = 13 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:58:9
else:
  let WASMTIME_COMPONENT_LIST* = 13 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:58:9
when 14 is static:
  const
    WASMTIME_COMPONENT_RECORD* = 14 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:61:9
else:
  let WASMTIME_COMPONENT_RECORD* = 14 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:61:9
when 15 is static:
  const
    WASMTIME_COMPONENT_TUPLE* = 15 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:64:9
else:
  let WASMTIME_COMPONENT_TUPLE* = 15 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:64:9
when 16 is static:
  const
    WASMTIME_COMPONENT_VARIANT* = 16 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:67:9
else:
  let WASMTIME_COMPONENT_VARIANT* = 16 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:67:9
when 17 is static:
  const
    WASMTIME_COMPONENT_ENUM* = 17 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:70:9
else:
  let WASMTIME_COMPONENT_ENUM* = 17 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:70:9
when 18 is static:
  const
    WASMTIME_COMPONENT_OPTION* = 18 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:73:9
else:
  let WASMTIME_COMPONENT_OPTION* = 18 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:73:9
when 19 is static:
  const
    WASMTIME_COMPONENT_RESULT* = 19 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:76:9
else:
  let WASMTIME_COMPONENT_RESULT* = 19 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:76:9
when 20 is static:
  const
    WASMTIME_COMPONENT_FLAGS* = 20 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:79:9
else:
  let WASMTIME_COMPONENT_FLAGS* = 20 ## Generated based on wasmtime\crates\c-api\include\wasmtime/component/val.h:79:9
proc Memicmp*(internal_Buf1: pointer; internal_Buf2: pointer;
              internal_Size: csize_t): cint {.cdecl, importc: "_memicmp".}
proc MemicmpL*(internal_Buf1: pointer; internal_Buf2: pointer;
               internal_Size: csize_t; internal_Locale: LocaleT): cint {.cdecl,
    importc: "_memicmp_l".}
proc memccpy*(internal_Dst: pointer; internal_Src: pointer; internal_Val: cint;
              internal_Size: culonglong): pointer {.cdecl, importc: "memccpy".}
proc memicmp*(internal_Buf1: pointer; internal_Buf2: pointer;
              internal_Size: csize_t): cint {.cdecl, importc: "memicmp".}
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
proc type_proc*(a0: ptr WasmImporttypeT): ptr WasmExterntypeT {.cdecl,
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
proc type_proc*(a0: ptr WasmExporttypeT): ptr WasmExterntypeT {.cdecl,
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
proc type_proc*(a0: ptr WasmFuncT): ptr WasmFunctypeT {.cdecl,
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
proc type_proc*(a0: ptr WasmGlobalT): ptr WasmGlobaltypeT {.cdecl,
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
proc type_proc*(a0: ptr WasmTableT): ptr WasmTabletypeT {.cdecl,
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
proc type_proc*(a0: ptr WasmMemoryT): ptr WasmMemorytypeT {.cdecl,
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
proc type_proc*(a0: ptr WasmExternT): ptr WasmExterntypeT {.cdecl,
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
proc wasmWideArithmeticSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_wide_arithmetic_set".}
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
proc memoryMayMoveSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_memory_may_move_set".}
proc memoryReservationSet*(a0: ptr WasmConfigT; a1: uint64): void {.cdecl,
    importc: "wasmtime_config_memory_reservation_set".}
proc memoryGuardSizeSet*(a0: ptr WasmConfigT; a1: uint64): void {.cdecl,
    importc: "wasmtime_config_memory_guard_size_set".}
proc memoryReservationForGrowthSet*(a0: ptr WasmConfigT; a1: uint64): void {.
    cdecl, importc: "wasmtime_config_memory_reservation_for_growth_set".}
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
proc wasmComponentModelSet*(a0: ptr WasmConfigT; a1: bool): void {.cdecl,
    importc: "wasmtime_config_wasm_component_model_set".}
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
proc preopenDir*(config: ptr WasiConfigT; host_path: cstring;
                 guest_path: cstring; dir_perms: WasiDirPerms;
                 file_perms: WasiFilePerms): bool {.cdecl,
    importc: "wasi_config_preopen_dir".}
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
proc type_proc*(memory: ptr SharedmemoryT): ptr WasmMemorytypeT {.cdecl,
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
proc type_proc*(context: ptr ContextT; val: ptr ExternT): ptr WasmExterntypeT {.
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
proc type_proc*(store: ptr ContextT; func_arg: ptr FuncT): ptr WasmFunctypeT {.
    cdecl, importc: "wasmtime_func_type".}
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
proc preInstantiate*(instance_pre: ptr InstancePreT; store: ptr ContextT;
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
proc new*(engine: ptr WasmEngineT; buf: ptr uint8; len: csize_t;
          component_out: ptr ptr ComponentT): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_new".}
proc serialize*(component: ptr ComponentT; ret: ptr WasmByteVecT): ptr ErrorT {.
    cdecl, importc: "wasmtime_component_serialize".}
proc deserialize*(engine: ptr WasmEngineT; buf: ptr uint8; len: csize_t;
                  component_out: ptr ptr ComponentT): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_deserialize".}
proc deserializeFile*(engine: ptr WasmEngineT; path: cstring;
                      component_out: ptr ptr ComponentT): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_deserialize_file".}
proc clone*(component: ptr ComponentT): ptr ComponentT {.cdecl,
    importc: "wasmtime_component_clone".}
proc delete*(component: ptr ComponentT): void {.cdecl,
    importc: "wasmtime_component_delete".}
proc getExportIndex*(component: ptr ComponentT;
                     instance_export_index: ptr ComponentExportIndexT;
                     name: cstring; name_len: csize_t): ptr ComponentExportIndexT {.
    cdecl, importc: "wasmtime_component_get_export_index".}
proc exportIndexDelete*(export_index: ptr ComponentExportIndexT): void {.cdecl,
    importc: "wasmtime_component_export_index_delete".}
proc new*(out_arg: ptr ComponentVallistT; size: csize_t;
          ptr_arg: ptr StructWasmtimeComponentVal): void {.cdecl,
    importc: "wasmtime_component_vallist_new".}
proc newEmpty*(out_arg: ptr ComponentVallistT): void {.cdecl,
    importc: "wasmtime_component_vallist_new_empty".}
proc newUninit*(out_arg: ptr ComponentVallistT; size: csize_t): void {.cdecl,
    importc: "wasmtime_component_vallist_new_uninit".}
proc copy*(dst: ptr ComponentVallistT; src: ptr ComponentVallistT): void {.
    cdecl, importc: "wasmtime_component_vallist_copy".}
proc delete*(value: ptr ComponentVallistT): void {.cdecl,
    importc: "wasmtime_component_vallist_delete".}
proc new*(out_arg: ptr ComponentValrecordT; size: csize_t;
          ptr_arg: ptr StructWasmtimeComponentValrecordEntry): void {.cdecl,
    importc: "wasmtime_component_valrecord_new".}
proc newEmpty*(out_arg: ptr ComponentValrecordT): void {.cdecl,
    importc: "wasmtime_component_valrecord_new_empty".}
proc newUninit*(out_arg: ptr ComponentValrecordT; size: csize_t): void {.cdecl,
    importc: "wasmtime_component_valrecord_new_uninit".}
proc copy*(dst: ptr ComponentValrecordT; src: ptr ComponentValrecordT): void {.
    cdecl, importc: "wasmtime_component_valrecord_copy".}
proc delete*(value: ptr ComponentValrecordT): void {.cdecl,
    importc: "wasmtime_component_valrecord_delete".}
proc new*(out_arg: ptr ComponentValtupleT; size: csize_t;
          ptr_arg: ptr StructWasmtimeComponentVal): void {.cdecl,
    importc: "wasmtime_component_valtuple_new".}
proc newEmpty*(out_arg: ptr ComponentValtupleT): void {.cdecl,
    importc: "wasmtime_component_valtuple_new_empty".}
proc newUninit*(out_arg: ptr ComponentValtupleT; size: csize_t): void {.cdecl,
    importc: "wasmtime_component_valtuple_new_uninit".}
proc copy*(dst: ptr ComponentValtupleT; src: ptr ComponentValtupleT): void {.
    cdecl, importc: "wasmtime_component_valtuple_copy".}
proc delete*(value: ptr ComponentValtupleT): void {.cdecl,
    importc: "wasmtime_component_valtuple_delete".}
proc new*(out_arg: ptr ComponentValflagsT; size: csize_t; ptr_arg: ptr WasmNameT): void {.
    cdecl, importc: "wasmtime_component_valflags_new".}
proc newEmpty*(out_arg: ptr ComponentValflagsT): void {.cdecl,
    importc: "wasmtime_component_valflags_new_empty".}
proc newUninit*(out_arg: ptr ComponentValflagsT; size: csize_t): void {.cdecl,
    importc: "wasmtime_component_valflags_new_uninit".}
proc copy*(dst: ptr ComponentValflagsT; src: ptr ComponentValflagsT): void {.
    cdecl, importc: "wasmtime_component_valflags_copy".}
proc delete*(value: ptr ComponentValflagsT): void {.cdecl,
    importc: "wasmtime_component_valflags_delete".}
proc valNew*(): ptr ComponentValT {.cdecl, importc: "wasmtime_component_val_new".}
proc valDelete*(value: ptr ComponentValT): void {.cdecl,
    importc: "wasmtime_component_val_delete".}
proc funcCall*(func_arg: ptr ComponentFuncT; context: ptr ContextT;
               args: ptr ComponentValT; args_size: csize_t;
               results: ptr ComponentValT; results_size: csize_t): ptr ErrorT {.
    cdecl, importc: "wasmtime_component_func_call".}
proc funcPostReturn*(func_arg: ptr ComponentFuncT; context: ptr ContextT): ptr ErrorT {.
    cdecl, importc: "wasmtime_component_func_post_return".}
proc instanceGetExportIndex*(instance: ptr ComponentInstanceT;
                             context: ptr ContextT;
                             instance_export_index: ptr ComponentExportIndexT;
                             name: cstring; name_len: csize_t): ptr ComponentExportIndexT {.
    cdecl, importc: "wasmtime_component_instance_get_export_index".}
proc instanceGetFunc*(instance: ptr ComponentInstanceT; context: ptr ContextT;
                      export_index: ptr ComponentExportIndexT;
                      func_out: ptr ComponentFuncT): bool {.cdecl,
    importc: "wasmtime_component_instance_get_func".}
proc newComponentLinker*(engine: ptr WasmEngineT): ptr ComponentLinkerT {.cdecl,
    importc: "wasmtime_component_linker_new".}
proc root*(linker: ptr ComponentLinkerT): ptr ComponentLinkerInstanceT {.cdecl,
    importc: "wasmtime_component_linker_root".}
proc instantiate*(linker: ptr ComponentLinkerT; context: ptr ContextT;
                  component: ptr ComponentT;
                  instance_out: ptr ComponentInstanceT): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_linker_instantiate".}
proc delete*(linker: ptr ComponentLinkerT): void {.cdecl,
    importc: "wasmtime_component_linker_delete".}
proc instanceAddInstance*(linker_instance: ptr ComponentLinkerInstanceT;
                          name: cstring; name_len: csize_t;
                          linker_instance_out: ptr ptr ComponentLinkerInstanceT): ptr ErrorT {.
    cdecl, importc: "wasmtime_component_linker_instance_add_instance".}
proc instanceAddModule*(linker_instance: ptr ComponentLinkerInstanceT;
                        name: cstring; name_len: csize_t; module: ptr ModuleT): ptr ErrorT {.
    cdecl, importc: "wasmtime_component_linker_instance_add_module".}
proc instanceAddFunc*(linker_instance: ptr ComponentLinkerInstanceT;
                      name: cstring; name_len: csize_t;
                      callback: ComponentFuncCallbackT; data: pointer;
                      finalizer: proc (): void {.cdecl.}): ptr ErrorT {.cdecl,
    importc: "wasmtime_component_linker_instance_add_func".}
proc instanceDelete*(linker_instance: ptr ComponentLinkerInstanceT): void {.
    cdecl, importc: "wasmtime_component_linker_instance_delete".}
proc clone*(engine: ptr WasmEngineT): ptr WasmEngineT {.cdecl,
    importc: "wasmtime_engine_clone".}
proc incrementEpoch*(engine: ptr WasmEngineT): void {.cdecl,
    importc: "wasmtime_engine_increment_epoch".}
proc isPulley*(engine: ptr WasmEngineT): bool {.cdecl,
    importc: "wasmtime_engine_is_pulley".}
proc newGlobal*(store: ptr ContextT; type_arg: ptr WasmGlobaltypeT;
                val: ptr ValT; ret: ptr GlobalT): ptr ErrorT {.cdecl,
    importc: "wasmtime_global_new".}
proc type_proc*(store: ptr ContextT; global: ptr GlobalT): ptr WasmGlobaltypeT {.
    cdecl, importc: "wasmtime_global_type".}
proc get*(store: ptr ContextT; global: ptr GlobalT; out_arg: ptr ValT): void {.
    cdecl, importc: "wasmtime_global_get".}
proc set*(store: ptr ContextT; global: ptr GlobalT; val: ptr ValT): ptr ErrorT {.
    cdecl, importc: "wasmtime_global_set".}
proc newMemorytype*(min: uint64; max_present: bool; max: uint64; is_64: bool;
                    shared: bool): ptr WasmMemorytypeT {.cdecl,
    importc: "wasmtime_memorytype_new".}
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
proc type_proc*(store: ptr ContextT; memory: ptr MemoryT): ptr WasmMemorytypeT {.
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
proc type_proc*(store: ptr ContextT; table: ptr TableT): ptr WasmTabletypeT {.
    cdecl, importc: "wasmtime_table_type".}
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
proc newCode*(code: TrapCodeT): ptr WasmTrapT {.cdecl,
    importc: "wasmtime_trap_new_code".}
proc code*(a0: ptr WasmTrapT; code: ptr TrapCodeT): bool {.cdecl,
    importc: "wasmtime_trap_code".}
proc wasmtimeFrameFuncName*(a0: ptr WasmFrameT): ptr WasmNameT {.cdecl,
    importc: "wasmtime_frame_func_name".}
proc wasmtimeFrameModuleName*(a0: ptr WasmFrameT): ptr WasmNameT {.cdecl,
    importc: "wasmtime_frame_module_name".}

import
  std / [options]

from std / unicode import Rune, `$`

proc `=destroy`*(self: StructWasmtimeComponentVal) {.nodestroy.}
template vecType(T: untyped; unchecked: bool = true): untyped =
  type
    ItemType = typeof(T().data[])
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
proc `=destroy`*(self: StructWasmtimeComponentVallist) {.nodestroy.} =
  self.addr.delete()

proc `=destroy`*(self: StructWasmtimeComponentValrecord) {.nodestroy.} =
  self.addr.delete()

proc `=destroy`*(self: StructWasmtimeComponentValtuple) {.nodestroy.} =
  self.addr.delete()

proc `=destroy`*(self: StructWasmtimeComponentValflags) {.nodestroy.} =
  self.addr.delete()

proc `=destroy`*(self: StructWasmtimeComponentVal) {.nodestroy.} =
  case self.kind
  of WASMTIME_COMPONENT_STRING:
    `=destroy`(self.of_field.string)
  of WASMTIME_COMPONENT_LIST:
    `=destroy`(self.of_field.list)
  of WASMTIME_COMPONENT_RECORD:
    `=destroy`(self.of_field.record)
  of WASMTIME_COMPONENT_TUPLE:
    `=destroy`(self.of_field.tuple_field)
  of WASMTIME_COMPONENT_FLAGS:
    `=destroy`(self.of_field.flags)
  else:
    discard
