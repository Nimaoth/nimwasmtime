import std/[os, strutils]

echo "build wasmtime"

const nimWasmtimeBuildMusl* {.booldefine.} = false
const nimWasmtimeBuildDebug* {.booldefine.} = true

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

const wasmtimeFeatures = [
  ("WASMTIME_FEATURE_PROFILING", "profiling", nimWasmtimeFeatureProfiling),
  ("WASMTIME_FEATURE_WAT", "wat", nimWasmtimeFeatureWat),
  ("WASMTIME_FEATURE_CACHE", "cache", nimWasmtimeFeatureCache),
  ("WASMTIME_FEATURE_PARALLEL_COMPILATION", "parallel-compilation", nimWasmtimeFeatureParallelCompilation),
  ("WASMTIME_FEATURE_WASI", "wasi", nimWasmtimeFeatureWasi),
  ("WASMTIME_FEATURE_LOGGING", "logging", nimWasmtimeFeatureLogging),
  ("WASMTIME_FEATURE_DISABLE_LOGGING", "disable-logging", nimWasmtimeFeatureDisableLogging),
  ("WASMTIME_FEATURE_COREDUMP", "coredump", nimWasmtimeFeatureCoredump),
  ("WASMTIME_FEATURE_ADDR2LINE", "addr2line", nimWasmtimeFeatureAddr2Line),
  ("WASMTIME_FEATURE_DEMANGLE", "demangle", nimWasmtimeFeatureDemangle),
  ("WASMTIME_FEATURE_THREADS", "threads", nimWasmtimeFeatureThreads),
  ("WASMTIME_FEATURE_GC", "gc", nimWasmtimeFeatureGC),
  ("WASMTIME_FEATURE_ASYNC", "async", nimWasmtimeFeatureAsync),
  ("WASMTIME_FEATURE_CRANELIFT", "cranelift", nimWasmtimeFeatureCranelift),
  ("WASMTIME_FEATURE_WINCH", "winch", nimWasmtimeFeatureWinch),
  ("WASMTIME_FEATURE_COMPONENT_MODEL", "component-model", nimWasmtimeFeatureComponentModel),
]

proc buildWasmtime() =
  withDir("wasmtime"):
    var features: seq[string] = @[]
    var conf = readFile("crates/c-api/include/wasmtime/conf.h.in")

    for (name, featureName, enabled) in wasmtimeFeatures:
      if enabled:
        features.add featureName
        conf = conf.replace("#cmakedefine " & name, "#define " & name)
      else:
        conf = conf.replace("#cmakedefine " & name, "/* #undef " & name & " */")

    writeFile("crates/c-api/include/wasmtime/conf.h", conf)

    var cargoArgs = @["cargo", "build", "-p", "wasmtime-c-api", "--no-default-features"]

    when not nimWasmtimeBuildDebug:
      cargoArgs.add "--release"

    when nimWasmtimeBuildMusl:
      cargoArgs.add "--target=x86_64-unknown-linux-musl"

    if features.len > 0:
      cargoArgs.add "--features"
      cargoArgs.add features.join(",")

    let command = cargoArgs.join(" ")
    echo command
    exec command

buildWasmtime()

