# Package

version       = "0.2.1"
author        = "Nimaoth"
description   = "Nim wrapper for wasmtime"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.8"
requires "https://github.com/Nimaoth/nimgen >= 0.5.4"

var
  cmd = when defined(Windows): "cmd /c " else: ""

let wasmtimeFeatures = [
  ("WASMTIME_FEATURE_PROFILING", true),
  ("WASMTIME_FEATURE_WAT", true),
  ("WASMTIME_FEATURE_CACHE", true),
  ("WASMTIME_FEATURE_PARALLEL_COMPILATION", true),
  ("WASMTIME_FEATURE_WASI", true),
  ("WASMTIME_FEATURE_LOGGING", true),
  ("WASMTIME_FEATURE_DISABLE_LOGGING", false),
  ("WASMTIME_FEATURE_COREDUMP", true),
  ("WASMTIME_FEATURE_ADDR2LINE", true),
  ("WASMTIME_FEATURE_DEMANGLE", true),
  ("WASMTIME_FEATURE_THREADS", true),
  ("WASMTIME_FEATURE_GC", true),
  ("WASMTIME_FEATURE_ASYNC", true),
  ("WASMTIME_FEATURE_CRANELIFT", true),
  ("WASMTIME_FEATURE_WINCH", true),
]

task nimgen, "Nimgen":
  if gorgeEx(cmd & "nimgen").exitCode != 0:
    withDir(".."):
      exec "nimble install nimgen -y"

  exec cmd & "nimgen nimwasmtime.cfg"

task wasmtime, "Build wasmtime":
  withDir "src/wasmtime":
    withDir "crates/c-api":
      try:
        exec "cmake -S . -B build"
        cpFile "build/include/wasmtime/conf.h", "include/wasmtime/conf.h"
      except:
        echo "CMake failed, generate conf.h manually"

        var conf = readFile("include/wasmtime/conf.h.in")

        for (name, enabled) in wasmtimeFeatures:
          echo conf
          if enabled:
            conf = conf.replace("#cmakedefine " & name, "#define " & name)
          else:
            conf = conf.replace("#cmakedefine " & name, "/* #undef " & name & " */")

        writeFile("include/wasmtime/conf.h", conf)

    exec "cargo build --release -p wasmtime-c-api"

    when defined(linux):
      exec "cargo build --release --target=x86_64-unknown-linux-musl -p wasmtime-c-api"

before install:
  nimgenTask()
