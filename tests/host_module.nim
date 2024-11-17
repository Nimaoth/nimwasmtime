
{.push, hint[DuplicateModuleImport]: off.}
import
  std / [options]

from std / unicode import Rune

import
  results, wasmtime

{.pop.}
type
  Foo* = object
    x*: string
  Prop* = enum
    Cool = "cool", Lame = "lame", SoLame = "so-lame"
  Props* = set[Prop]
  Bar* = object
    a*: int32
    b*: float32
    c*: Rune
    d*: bool
  VoodooKind* = enum
    UnPossesed = "un-possesed", Possesed = "possesed"
  Voodoo* = object
    case kind*: VoodooKind
    of Possesed:
      possesed: string
    else:
      nil
  DescriptorType* = enum
    Unknown = "unknown", BlockDevice = "block-device",
    CharacterDevice = "character-device", Directory = "directory",
    Fifo = "fifo", SymbolicLink = "symbolic-link", RegularFile = "regular-file",
    Socket = "socket"
  Baz* = object
    x*: string
    c*: Foo
    d*: (int32, float32)
    e*: Option[int32]
    f*: seq[Foo]
    gbruh*: seq[Props]
    g*: DescriptorType
    h*: Props
    i*: Result[Foo, void]
    j*: Voodoo
    k*: seq[Bar]
when not declared(MyBlob):
  {.error: "Missing resource type definition for " & "MyBlob" &
      ". Define the type before the importWit statement.".}
when not declared(Callback):
  {.error: "Missing resource type definition for " & "Callback" &
      ". Define the type before the importWit statement.".}
proc envTestNoParams2(host: MyContext; store: ptr ContextT; b: Baz): void
proc testInterfaceTestNoParams(host: MyContext; store: ptr ContextT): void
proc testInterfaceTestSimpleParams(host: MyContext; store: ptr ContextT;
                                   a: int8; b: int16; c: int32; d: int64;
                                   e: uint8; f: uint16; g: uint32; h: uint64;
                                   i: float32; j: float64; k: bool; l: Rune): void
proc testInterfaceTestSimpleParamsPtr(host: MyContext; store: ptr ContextT;
                                      a: int8; b: int16; c: int32; d: int64;
                                      e: uint8; f: uint16; g: uint32; h: uint64;
                                      i: float32; j: float64; k: bool; l: Rune;
                                      m: int32; n: int32; o: int32; p: int32;
                                      q: int32): void
proc testInterfaceAddCallback(host: MyContext; store: ptr ContextT; env: string;
                              name: string): uint32
proc testInterfaceTestSimpleReturn(host: MyContext; store: ptr ContextT;
                                   x: int32): int32
proc testInterfaceTestSimpleReturn2(host: MyContext; store: ptr ContextT;
                                    x: int8): int8
proc testInterfaceTestSimpleReturnPtr(host: MyContext; store: ptr ContextT;
                                      x: int8): Bar
proc testInterfaceTestSimpleReturnPtr2(host: MyContext; store: ptr ContextT): Baz
proc testInterfaceNewBlob(host: MyContext; store: ptr ContextT; init: seq[uint8]): MyBlob
proc testInterfaceWrite(host: MyContext; store: ptr ContextT; self: var MyBlob;
                        bytes: seq[uint8]): void
proc testInterfaceRead(host: MyContext; store: ptr ContextT; self: var MyBlob;
                       n: int32): seq[uint8]
proc testInterfaceMerge(host: MyContext; store: ptr ContextT; lhs: sink MyBlob;
                        rhs: sink MyBlob): MyBlob
proc testInterfacePrint(host: MyContext; store: ptr ContextT; lhs: var MyBlob;
                        rhs: var MyBlob): void
proc callbackTypesNewCallback(host: MyContext; store: ptr ContextT;
                              data: uint32; key: uint32; drop: uint32): Callback
proc callbackTypesData(host: MyContext; store: ptr ContextT; self: var Callback): uint32
proc callbackTypesKey(host: MyContext; store: ptr ContextT; self: var Callback): uint32
proc defineComponent*(linker: ptr LinkerT; host: MyContext): WasmtimeResult[void] =
  block:
    let e = block:
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "[resource-drop]blob",
                                 newFunctype([WasmValkind.I32], [])):
        ?host.resources.resourceDrop(parameters[0].i32, callDestroy = true)
    if e.isErr:
      return e
  block:
    let e = block:
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[resource-drop]callback",
                                 newFunctype([WasmValkind.I32], [])):
        ?host.resources.resourceDrop(parameters[0].i32, callDestroy = true)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32], [])
      linker.defineFuncUnchecked("env", "test-no-params2", ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        var b: Baz
        block:
          let p1 = cast[ptr UncheckedArray[char]](memory[
              cast[ptr int32](memory[parameters[0].i32 + 0].addr)[]].addr)
          b.x = newString(cast[ptr int32](memory[parameters[0].i32 + 4].addr)[])
          for i1 in 0 ..< b.x.len:
            b.x[i1] = p1[i1]
        block:
          let p2 = cast[ptr UncheckedArray[char]](memory[
              cast[ptr int32](memory[parameters[0].i32 + 8].addr)[]].addr)
          b.c.x = newString(cast[ptr int32](memory[parameters[0].i32 + 12].addr)[])
          for i2 in 0 ..< b.c.x.len:
            b.c.x[i2] = p2[i2]
        b.d[0] = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 16].addr)[])
        b.d[1] = cast[float32](cast[ptr float32](memory[
            parameters[0].i32 + 20].addr)[])
        if cast[ptr int32](memory[parameters[0].i32 + 24].addr)[] != 0:
          var temp: int32
          temp = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 28].addr)[])
          b.e = temp.some
        block:
          let p1 = cast[ptr UncheckedArray[uint8]](memory[
              cast[ptr int32](memory[parameters[0].i32 + 32].addr)[]].addr)
          b.f = newSeq[typeof(b.f[0])](cast[ptr int32](memory[
              parameters[0].i32 + 36].addr)[])
          for i1 in 0 ..< b.f.len:
            block:
              let p3 = cast[ptr UncheckedArray[char]](memory[
                  cast[ptr int32](p1[i1 * 8 + 0].addr)[]].addr)
              b.f[i1].x = newString(cast[ptr int32](p1[i1 * 8 + 4].addr)[])
              for i3 in 0 ..< b.f[i1].x.len:
                b.f[i1].x[i3] = p3[i3]
        block:
          let p1 = cast[ptr UncheckedArray[uint8]](memory[
              cast[ptr int32](memory[parameters[0].i32 + 40].addr)[]].addr)
          b.gbruh = newSeq[typeof(b.gbruh[0])](
              cast[ptr int32](memory[parameters[0].i32 + 44].addr)[])
          for i1 in 0 ..< b.gbruh.len:
            b.gbruh[i1] = cast[Props](cast[ptr uint8](p1[i1 * 1 + 0].addr)[])
        b.g = cast[DescriptorType](cast[ptr int8](memory[
            parameters[0].i32 + 48].addr)[])
        b.h = cast[Props](cast[ptr uint8](memory[parameters[0].i32 + 49].addr)[])
        if cast[ptr int32](memory[parameters[0].i32 + 52].addr)[] == 0:
          var tempOk: Foo
          block:
            let p3 = cast[ptr UncheckedArray[char]](memory[cast[ptr int32](memory[
                parameters[0].i32 + 56].addr)[]].addr)
            tempOk.x = newString(cast[ptr int32](memory[
                parameters[0].i32 + 60].addr)[])
            for i3 in 0 ..< tempOk.x.len:
              tempOk.x[i3] = p3[i3]
          b.i = results.Result[Foo, void].ok(tempOk)
        else:
          b.i = results.Result[Foo, void].err()
        case cast[VoodooKind](cast[ptr int32](memory[parameters[0].i32 + 64].addr)[])
        of UnPossesed:
          b.j = Voodoo(kind: UnPossesed)
        of Possesed:
          var temp: string
          block:
            let p2 = cast[ptr UncheckedArray[char]](memory[cast[ptr int32](memory[
                parameters[0].i32 + 68].addr)[]].addr)
            temp = newString(cast[ptr int32](memory[parameters[0].i32 + 72].addr)[])
            for i2 in 0 ..< temp.len:
              temp[i2] = p2[i2]
          b.j = Voodoo(kind: Possesed, possesed: temp)
        block:
          let p1 = cast[ptr UncheckedArray[uint8]](memory[
              cast[ptr int32](memory[parameters[0].i32 + 76].addr)[]].addr)
          b.k = newSeq[typeof(b.k[0])](cast[ptr int32](memory[
              parameters[0].i32 + 80].addr)[])
          for i1 in 0 ..< b.k.len:
            b.k[i1].a = cast[int32](cast[ptr int32](p1[i1 * 16 + 0].addr)[])
            b.k[i1].b = cast[float32](cast[ptr float32](p1[i1 * 16 + 4].addr)[])
            b.k[i1].c = cast[ptr Rune](p1[i1 * 16 + 8].addr)[].Rune
            b.k[i1].d = cast[ptr bool](p1[i1 * 16 + 12].addr)[].bool
        envTestNoParams2(host, store, b)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([], [])
      linker.defineFuncUnchecked("my:host/test-interface", "test-no-params", ty):
        testInterfaceTestNoParams(host, store)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32, WasmValkind.I32,
          WasmValkind.I32, WasmValkind.I64, WasmValkind.I32, WasmValkind.I32,
          WasmValkind.I32, WasmValkind.I64, WasmValkind.F32, WasmValkind.F64,
          WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "test-simple-params",
                                 ty):
        var a: int8
        var b: int16
        var c: int32
        var d: int64
        var e: uint8
        var f: uint16
        var g: uint32
        var h: uint64
        var i: float32
        var j: float64
        var k: bool
        var l: Rune
        a = cast[int8](parameters[0].i32)
        b = cast[int16](parameters[1].i32)
        c = cast[int32](parameters[2].i32)
        d = cast[int64](parameters[3].i64)
        e = cast[uint8](parameters[4].i32)
        f = cast[uint16](parameters[5].i32)
        g = cast[uint32](parameters[6].i32)
        h = cast[uint64](parameters[7].i64)
        i = cast[float32](parameters[8].f32)
        j = cast[float64](parameters[9].f64)
        k = parameters[10].i32.bool
        l = parameters[11].i32.Rune
        testInterfaceTestSimpleParams(host, store, a, b, c, d, e, f, g, h, i, j,
                                      k, l)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-params-ptr", ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        var a: int8
        var b: int16
        var c: int32
        var d: int64
        var e: uint8
        var f: uint16
        var g: uint32
        var h: uint64
        var i: float32
        var j: float64
        var k: bool
        var l: Rune
        var m: int32
        var n: int32
        var o: int32
        var p: int32
        var q: int32
        a = cast[int8](cast[ptr int8](memory[parameters[0].i32 + 0].addr)[])
        b = cast[int16](cast[ptr int16](memory[parameters[0].i32 + 2].addr)[])
        c = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 4].addr)[])
        d = cast[int64](cast[ptr int64](memory[parameters[0].i32 + 8].addr)[])
        e = cast[uint8](cast[ptr uint8](memory[parameters[0].i32 + 16].addr)[])
        f = cast[uint16](cast[ptr uint16](memory[parameters[0].i32 + 18].addr)[])
        g = cast[uint32](cast[ptr uint32](memory[parameters[0].i32 + 20].addr)[])
        h = cast[uint64](cast[ptr uint64](memory[parameters[0].i32 + 24].addr)[])
        i = cast[float32](cast[ptr float32](memory[parameters[0].i32 + 32].addr)[])
        j = cast[float64](cast[ptr float64](memory[parameters[0].i32 + 40].addr)[])
        k = cast[ptr bool](memory[parameters[0].i32 + 48].addr)[].bool
        l = cast[ptr Rune](memory[parameters[0].i32 + 52].addr)[].Rune
        m = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 56].addr)[])
        n = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 60].addr)[])
        o = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 64].addr)[])
        p = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 68].addr)[])
        q = cast[int32](cast[ptr int32](memory[parameters[0].i32 + 72].addr)[])
        testInterfaceTestSimpleParamsPtr(host, store, a, b, c, d, e, f, g, h, i,
            j, k, l, m, n, o, p, q)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32, WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "add-callback", ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        var env: string
        var name: string
        block:
          let p0 = cast[ptr UncheckedArray[char]](memory[parameters[0].i32].addr)
          env = newString(parameters[1].i32)
          for i0 in 0 ..< env.len:
            env[i0] = p0[i0]
        block:
          let p0 = cast[ptr UncheckedArray[char]](memory[parameters[2].i32].addr)
          name = newString(parameters[3].i32)
          for i0 in 0 ..< name.len:
            name[i0] = p0[i0]
        let res = testInterfaceAddCallback(host, store, env, name)
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "test-simple-return",
                                 ty):
        var x: int32
        x = cast[int32](parameters[0].i32)
        let res = testInterfaceTestSimpleReturn(host, store, x)
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-return2", ty):
        var x: int8
        x = cast[int8](parameters[0].i32)
        let res = testInterfaceTestSimpleReturn2(host, store, x)
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-return-ptr", ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        var x: int8
        x = cast[int8](parameters[0].i32)
        let res = testInterfaceTestSimpleReturnPtr(host, store, x)
        let retArea = parameters[^1].i32
        cast[ptr int32](memory[retArea + 0].addr)[] = res.a
        cast[ptr float32](memory[retArea + 4].addr)[] = res.b
        cast[ptr Rune](memory[retArea + 8].addr)[] = res.c
        cast[ptr bool](memory[retArea + 12].addr)[] = res.d
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface",
                                 "test-simple-return-ptr2", ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        let reallocImpl = caller.getExport("cabi_realloc").get.of_field.func_field
        let res = testInterfaceTestSimpleReturnPtr2(host, store)
        let retArea = parameters[^1].i32
        if res.x.len > 0:
          let dataPtrWasm1 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.x.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 0].addr)[] = cast[int32](dataPtrWasm1)
          block:
            for i1 in 0 ..< res.x.len:
              cast[ptr char](memory[dataPtrWasm1 + i1].addr)[] = res.x[i1]
        else:
          cast[ptr int32](memory[retArea + 0].addr)[] = 0
        cast[ptr int32](memory[retArea + 4].addr)[] = cast[int32](res.x.len)
        if res.c.x.len > 0:
          let dataPtrWasm2 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.c.x.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 8].addr)[] = cast[int32](dataPtrWasm2)
          block:
            for i2 in 0 ..< res.c.x.len:
              cast[ptr char](memory[dataPtrWasm2 + i2].addr)[] = res.c.x[i2]
        else:
          cast[ptr int32](memory[retArea + 8].addr)[] = 0
        cast[ptr int32](memory[retArea + 12].addr)[] = cast[int32](res.c.x.len)
        cast[ptr int32](memory[retArea + 16].addr)[] = res.d[0]
        cast[ptr float32](memory[retArea + 20].addr)[] = res.d[1]
        cast[ptr int32](memory[retArea + 24].addr)[] = res.e.isSome.int32
        if res.e.isSome:
          cast[ptr int32](memory[retArea + 28].addr)[] = res.e.get
        if res.f.len > 0:
          let dataPtrWasm1 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.f.len * 8).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 32].addr)[] = cast[int32](dataPtrWasm1)
          block:
            for i1 in 0 ..< res.f.len:
              if res.f[i1].x.len > 0:
                let dataPtrWasm3 = block:
                  var t: ptr WasmTrapT = nil
                  var args: array[4, ValT]
                  args[0].kind = WasmValkind.I32.ValkindT
                  args[0].of_field.i32 = 0
                  args[1].kind = WasmValkind.I32.ValkindT
                  args[1].of_field.i32 = 0
                  args[2].kind = WasmValkind.I32.ValkindT
                  args[2].of_field.i32 = 4
                  args[3].kind = WasmValkind.I32.ValkindT
                  args[3].of_field.i32 = (res.f[i1].x.len * 1).int32
                  var results: array[1, ValT]
                  ?reallocImpl.addr.call(store, args, results, t.addr)
                  assert results[0].kind == WasmValkind.I32.ValkindT
                  results[0].of_field.i32
                cast[ptr int32](memory[dataPtrWasm1 + i1 * 8 + 0].addr)[] = cast[int32](dataPtrWasm3)
                block:
                  for i3 in 0 ..< res.f[i1].x.len:
                    cast[ptr char](memory[dataPtrWasm3 + i3].addr)[] = res.f[i1].x[
                        i3]
              else:
                cast[ptr int32](memory[dataPtrWasm1 + i1 * 8 + 0].addr)[] = 0
              cast[ptr int32](memory[dataPtrWasm1 + i1 * 8 + 4].addr)[] = cast[int32](res.f[
                  i1].x.len)
        else:
          cast[ptr int32](memory[retArea + 32].addr)[] = 0
        cast[ptr int32](memory[retArea + 36].addr)[] = cast[int32](res.f.len)
        if res.gbruh.len > 0:
          let dataPtrWasm1 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.gbruh.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 40].addr)[] = cast[int32](dataPtrWasm1)
          block:
            for i1 in 0 ..< res.gbruh.len:
              cast[ptr uint8](memory[dataPtrWasm1 + i1 * 1 + 0].addr)[] = cast[uint8](res.gbruh[
                  i1])
        else:
          cast[ptr int32](memory[retArea + 40].addr)[] = 0
        cast[ptr int32](memory[retArea + 44].addr)[] = cast[int32](res.gbruh.len)
        cast[ptr int8](memory[retArea + 48].addr)[] = cast[int8](res.g)
        cast[ptr uint8](memory[retArea + 49].addr)[] = cast[uint8](res.h)
        cast[ptr int32](memory[retArea + 52].addr)[] = res.i.isErr.int32
        if res.i.isOk:
          if res.i.value.x.len > 0:
            let dataPtrWasm3 = block:
              var t: ptr WasmTrapT = nil
              var args: array[4, ValT]
              args[0].kind = WasmValkind.I32.ValkindT
              args[0].of_field.i32 = 0
              args[1].kind = WasmValkind.I32.ValkindT
              args[1].of_field.i32 = 0
              args[2].kind = WasmValkind.I32.ValkindT
              args[2].of_field.i32 = 4
              args[3].kind = WasmValkind.I32.ValkindT
              args[3].of_field.i32 = (res.i.value.x.len * 1).int32
              var results: array[1, ValT]
              ?reallocImpl.addr.call(store, args, results, t.addr)
              assert results[0].kind == WasmValkind.I32.ValkindT
              results[0].of_field.i32
            cast[ptr int32](memory[retArea + 56].addr)[] = cast[int32](dataPtrWasm3)
            block:
              for i3 in 0 ..< res.i.value.x.len:
                cast[ptr char](memory[dataPtrWasm3 + i3].addr)[] = res.i.value.x[
                    i3]
          else:
            cast[ptr int32](memory[retArea + 56].addr)[] = 0
          cast[ptr int32](memory[retArea + 60].addr)[] = cast[int32](res.i.value.x.len)
        else:
          discard
        cast[ptr int32](memory[retArea + 64].addr)[] = res.j.kind.int32
        case res.j.kind
        of UnPossesed:
          discard
        of Possesed:
          if res.j.possesed.len > 0:
            let dataPtrWasm2 = block:
              var t: ptr WasmTrapT = nil
              var args: array[4, ValT]
              args[0].kind = WasmValkind.I32.ValkindT
              args[0].of_field.i32 = 0
              args[1].kind = WasmValkind.I32.ValkindT
              args[1].of_field.i32 = 0
              args[2].kind = WasmValkind.I32.ValkindT
              args[2].of_field.i32 = 4
              args[3].kind = WasmValkind.I32.ValkindT
              args[3].of_field.i32 = (res.j.possesed.len * 1).int32
              var results: array[1, ValT]
              ?reallocImpl.addr.call(store, args, results, t.addr)
              assert results[0].kind == WasmValkind.I32.ValkindT
              results[0].of_field.i32
            cast[ptr int32](memory[retArea + 68].addr)[] = cast[int32](dataPtrWasm2)
            block:
              for i2 in 0 ..< res.j.possesed.len:
                cast[ptr char](memory[dataPtrWasm2 + i2].addr)[] = res.j.possesed[
                    i2]
          else:
            cast[ptr int32](memory[retArea + 68].addr)[] = 0
          cast[ptr int32](memory[retArea + 72].addr)[] = cast[int32](res.j.possesed.len)
        if res.k.len > 0:
          let dataPtrWasm1 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.k.len * 16).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 76].addr)[] = cast[int32](dataPtrWasm1)
          block:
            for i1 in 0 ..< res.k.len:
              cast[ptr int32](memory[dataPtrWasm1 + i1 * 16 + 0].addr)[] = res.k[
                  i1].a
              cast[ptr float32](memory[dataPtrWasm1 + i1 * 16 + 4].addr)[] = res.k[
                  i1].b
              cast[ptr Rune](memory[dataPtrWasm1 + i1 * 16 + 8].addr)[] = res.k[
                  i1].c
              cast[ptr bool](memory[dataPtrWasm1 + i1 * 16 + 12].addr)[] = res.k[
                  i1].d
        else:
          cast[ptr int32](memory[retArea + 76].addr)[] = 0
        cast[ptr int32](memory[retArea + 80].addr)[] = cast[int32](res.k.len)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "[constructor]blob",
                                 ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        var init: seq[uint8]
        block:
          let p0 = cast[ptr UncheckedArray[uint8]](memory[parameters[0].i32].addr)
          init = newSeq[typeof(init[0])](parameters[1].i32)
          for i0 in 0 ..< init.len:
            init[i0] = cast[uint8](cast[ptr uint8](p0[i0 * 1 + 0].addr)[])
        let res = testInterfaceNewBlob(host, store, init)
        parameters[0].i32 = ?host.resources.resourceNew(res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "[method]blob.write",
                                 ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        var self: ptr MyBlob
        var bytes: seq[uint8]
        self = ?host.resources.resourceHostData(parameters[0].i32, MyBlob)
        block:
          let p0 = cast[ptr UncheckedArray[uint8]](memory[parameters[1].i32].addr)
          bytes = newSeq[typeof(bytes[0])](parameters[2].i32)
          for i0 in 0 ..< bytes.len:
            bytes[i0] = cast[uint8](cast[ptr uint8](p0[i0 * 1 + 0].addr)[])
        testInterfaceWrite(host, store, self[], bytes)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "[method]blob.read",
                                 ty):
        let mainMemory = caller.getExport("memory")
        let memory = cast[ptr UncheckedArray[uint8]](store.data(
            mainMemory.get.of_field.memory.addr))
        let reallocImpl = caller.getExport("cabi_realloc").get.of_field.func_field
        var self: ptr MyBlob
        var n: int32
        self = ?host.resources.resourceHostData(parameters[0].i32, MyBlob)
        n = cast[int32](parameters[1].i32)
        let res = testInterfaceRead(host, store, self[], n)
        let retArea = parameters[^1].i32
        if res.len > 0:
          let dataPtrWasm0 = block:
            var t: ptr WasmTrapT = nil
            var args: array[4, ValT]
            args[0].kind = WasmValkind.I32.ValkindT
            args[0].of_field.i32 = 0
            args[1].kind = WasmValkind.I32.ValkindT
            args[1].of_field.i32 = 0
            args[2].kind = WasmValkind.I32.ValkindT
            args[2].of_field.i32 = 4
            args[3].kind = WasmValkind.I32.ValkindT
            args[3].of_field.i32 = (res.len * 1).int32
            var results: array[1, ValT]
            ?reallocImpl.addr.call(store, args, results, t.addr)
            assert results[0].kind == WasmValkind.I32.ValkindT
            results[0].of_field.i32
          cast[ptr int32](memory[retArea + 0].addr)[] = cast[int32](dataPtrWasm0)
          block:
            for i0 in 0 ..< res.len:
              cast[ptr uint8](memory[dataPtrWasm0 + i0 * 1 + 0].addr)[] = res[i0]
        else:
          cast[ptr int32](memory[retArea + 0].addr)[] = 0
        cast[ptr int32](memory[retArea + 4].addr)[] = cast[int32](res.len)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/test-interface", "[static]blob.merge",
                                 ty):
        var lhs: MyBlob
        var rhs: MyBlob
        block:
          let resPtr = ?host.resources.resourceHostData(parameters[0].i32,
              MyBlob)
          lhs = resPtr[]
          ?host.resources.resourceDrop(parameters[0].i32, callDestroy = false)
        block:
          let resPtr = ?host.resources.resourceHostData(parameters[1].i32,
              MyBlob)
          rhs = resPtr[]
          ?host.resources.resourceDrop(parameters[1].i32, callDestroy = false)
        let res = testInterfaceMerge(host, store, lhs, rhs)
        parameters[0].i32 = ?host.resources.resourceNew(res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32], [])
      linker.defineFuncUnchecked("my:host/test-interface", "[static]blob.print",
                                 ty):
        var lhs: ptr MyBlob
        var rhs: ptr MyBlob
        lhs = ?host.resources.resourceHostData(parameters[0].i32, MyBlob)
        rhs = ?host.resources.resourceHostData(parameters[1].i32, MyBlob)
        testInterfacePrint(host, store, lhs[], rhs[])
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype(
          [WasmValkind.I32, WasmValkind.I32, WasmValkind.I32], [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[constructor]callback", ty):
        var data: uint32
        var key: uint32
        var drop: uint32
        data = cast[uint32](parameters[0].i32)
        key = cast[uint32](parameters[1].i32)
        drop = cast[uint32](parameters[2].i32)
        let res = callbackTypesNewCallback(host, store, data, key, drop)
        parameters[0].i32 = ?host.resources.resourceNew(res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[method]callback.data", ty):
        var self: ptr Callback
        self = ?host.resources.resourceHostData(parameters[0].i32, Callback)
        let res = callbackTypesData(host, store, self[])
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
  block:
    let e = block:
      var ty: ptr WasmFunctypeT = newFunctype([WasmValkind.I32],
          [WasmValkind.I32])
      linker.defineFuncUnchecked("my:host/callback-types",
                                 "[method]callback.key", ty):
        var self: ptr Callback
        self = ?host.resources.resourceHostData(parameters[0].i32, Callback)
        let res = callbackTypesKey(host, store, self[])
        parameters[0].i32 = cast[int32](res)
    if e.isErr:
      return e
