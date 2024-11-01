(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func))
  (type (;6;) (func (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i64 i32) (result i64)))
  (type (;9;) (func (param i32 i64)))
  (type (;10;) (func (param i32 i32 i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32 i64) (result i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i32 f64 i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i64 i32) (result i32)))
  (type (;16;) (func (param i32 i64 i64 i32)))
  (type (;17;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;18;) (func (param i32 f64) (result i32)))
  (type (;19;) (func (param i32 f64)))
  (type (;20;) (func (param i32 f32)))
  (type (;21;) (func (param i64 i64 i64)))
  (type (;22;) (func (param i64)))
  (type (;23;) (func (param i32 f32) (result f32)))
  (type (;24;) (func (param i32 i32 i32 i32 i64 i32 i32) (result i32)))
  (type (;25;) (func (param f64 i32) (result f64)))
  (type (;26;) (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;27;) (func (param i32 i32 i32 i32)))
  (type (;28;) (func (param i64 i32 i32) (result i32)))
  (type (;29;) (func (param f64) (result i64)))
  (type (;30;) (func (param i64 i64) (result f64)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__wasi_proc_exit (;0;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_close" (func $__wasi_fd_close (;2;) (type 3)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__wasi_fd_write (;3;) (type 7)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $__wasi_fd_seek (;4;) (type 17)))
  (table (;0;) 13 13 funcref)
  (memory (;0;) 256 65536)
  (global $__stack_pointer (;0;) (mut i32) i32.const 65536)
  (global $__stack_end (;1;) (mut i32) i32.const 0)
  (global $__stack_base (;2;) (mut i32) i32.const 0)
  (export "memory" (memory 0))
  (export "__indirect_function_table" (table 0))
  (export "hello" (func $hello))
  (export "foo" (func $foo))
  (export "_initialize" (func $_initialize))
  (export "__errno_location" (func $__errno_location))
  (export "emscripten_stack_init" (func $emscripten_stack_init))
  (export "emscripten_stack_get_free" (func $emscripten_stack_get_free))
  (export "emscripten_stack_get_base" (func $emscripten_stack_get_base))
  (export "emscripten_stack_get_end" (func $emscripten_stack_get_end))
  (export "stackSave" (func $stackSave))
  (export "stackRestore" (func $stackRestore))
  (export "stackAlloc" (func $stackAlloc))
  (export "emscripten_stack_get_current" (func $emscripten_stack_get_current))
  (elem (;0;) (i32.const 1) func $rttiDestroy__systemZexceptions_u58 $rttiDestroy__systemZexceptions_u56 $rttiDestroy__systemZexceptions_u60 $__wasm_call_ctors $__stdio_close $__stdio_write $__stdio_seek $__emscripten_stdout_close $__emscripten_stdout_seek $fmt_fp $pop_arg_long_double $sn_write)
  (func $__wasm_call_ctors (;5;) (type 5)
    call $emscripten_stack_init
    call $init_pthread_self
  )
  (func $rttiDestroy__systemZexceptions_u58 (;6;) (type 0) (param i32)
    local.get 0
    call $eqdestroy___system_u3768
  )
  (func $eqdestroy___system_u3768 (;7;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 1
    i32.const 66164
    i32.store offset=28
    local.get 1
    i32.const 65708
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store16 offset=32
    local.get 1
    i32.const 0
    i32.store offset=24
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store offset=16
        local.get 1
        i32.const 0
        i32.store16 offset=34
        i32.const 0
        local.get 1
        i32.const 16
        i32.add
        i32.store offset=75156
        local.get 1
        i32.const 16
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 1
      local.get 3
      i32.store offset=16
      i32.const 0
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=34
      local.get 1
      i32.const 16
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 1
    i32.const 66164
    i32.store offset=28
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 3
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.const 58
          i32.store offset=24
          local.get 1
          i32.const 66116
          i32.store offset=52
          local.get 1
          i32.const 66713
          i32.store offset=44
          local.get 1
          i32.const 0
          i32.store16 offset=56
          local.get 1
          i32.const 0
          i32.store offset=48
          i32.const 0
          local.set 4
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 1
            local.get 3
            i32.store offset=40
            i32.const 0
            local.get 1
            i32.const 40
            i32.add
            i32.store offset=75156
            local.get 1
            local.get 4
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=58
            local.get 3
            local.set 4
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
          end
          i32.const 0
          local.get 4
          i32.store offset=75156
          local.get 2
          i32.const -4
          i32.add
          local.tee 2
          i32.load
          local.tee 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 234
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.const -8
            i32.add
            local.tee 5
            local.get 3
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.get 5
          i32.store
        end
        i32.const 0
        local.get 4
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.get 4
      i32.load
      i32.store offset=75156
      local.get 0
      i32.load offset=4
      call $nimDestroyAndDispose
    end
    block ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      i32.load
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 3
      i32.add
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 3
      call $dealloc
    end
    local.get 1
    local.get 0
    i64.load offset=20 align=4
    i64.store offset=8
    local.get 1
    i32.const 8
    i32.add
    call $eqdestroy___stdZassertions_u69
    local.get 0
    i32.load offset=28
    local.set 2
    local.get 1
    i32.const 66164
    i32.store offset=28
    local.get 1
    i32.const 65708
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store16 offset=32
    local.get 1
    i32.const 0
    i32.store offset=24
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store offset=16
        local.get 1
        i32.const 0
        i32.store16 offset=34
        i32.const 0
        local.get 1
        i32.const 16
        i32.add
        i32.store offset=75156
        local.get 1
        i32.const 16
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 1
      local.get 3
      i32.store offset=16
      i32.const 0
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=34
      local.get 1
      i32.const 16
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 1
    i32.const 66164
    i32.store offset=28
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 3
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.const 58
          i32.store offset=24
          local.get 1
          i32.const 66116
          i32.store offset=52
          local.get 1
          i32.const 66713
          i32.store offset=44
          local.get 1
          i32.const 0
          i32.store16 offset=56
          local.get 1
          i32.const 0
          i32.store offset=48
          i32.const 0
          local.set 4
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 1
            local.get 3
            i32.store offset=40
            i32.const 0
            local.get 1
            i32.const 40
            i32.add
            i32.store offset=75156
            local.get 1
            local.get 4
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=58
            local.get 3
            local.set 4
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
          end
          i32.const 0
          local.get 4
          i32.store offset=75156
          local.get 2
          i32.const -4
          i32.add
          local.tee 2
          i32.load
          local.tee 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 234
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.const -8
            i32.add
            local.tee 0
            local.get 3
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.get 0
          i32.store
        end
        i32.const 0
        local.get 4
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.get 4
      i32.load
      i32.store offset=75156
      local.get 0
      i32.load offset=28
      call $nimDestroyAndDispose
    end
    local.get 1
    i32.const 64
    i32.add
    global.set $__stack_pointer
  )
  (func $rttiDestroy__systemZexceptions_u56 (;8;) (type 0) (param i32)
    local.get 0
    call $eqdestroy___system_u4147
  )
  (func $eqdestroy___system_u4147 (;9;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 1
    i32.const 66164
    i32.store offset=28
    local.get 1
    i32.const 65708
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store16 offset=32
    local.get 1
    i32.const 0
    i32.store offset=24
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store offset=16
        local.get 1
        i32.const 0
        i32.store16 offset=34
        i32.const 0
        local.get 1
        i32.const 16
        i32.add
        i32.store offset=75156
        local.get 1
        i32.const 16
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 1
      local.get 3
      i32.store offset=16
      i32.const 0
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=34
      local.get 1
      i32.const 16
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 1
    i32.const 66164
    i32.store offset=28
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 3
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.const 58
          i32.store offset=24
          local.get 1
          i32.const 66116
          i32.store offset=52
          local.get 1
          i32.const 66713
          i32.store offset=44
          local.get 1
          i32.const 0
          i32.store16 offset=56
          local.get 1
          i32.const 0
          i32.store offset=48
          i32.const 0
          local.set 4
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 1
            local.get 3
            i32.store offset=40
            i32.const 0
            local.get 1
            i32.const 40
            i32.add
            i32.store offset=75156
            local.get 1
            local.get 4
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=58
            local.get 3
            local.set 4
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
          end
          i32.const 0
          local.get 4
          i32.store offset=75156
          local.get 2
          i32.const -4
          i32.add
          local.tee 2
          i32.load
          local.tee 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 234
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.const -8
            i32.add
            local.tee 5
            local.get 3
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.get 5
          i32.store
        end
        i32.const 0
        local.get 4
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.get 4
      i32.load
      i32.store offset=75156
      local.get 0
      i32.load offset=4
      call $nimDestroyAndDispose
    end
    block ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      i32.load
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 3
      i32.add
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 3
      call $dealloc
    end
    local.get 1
    local.get 0
    i64.load offset=20 align=4
    i64.store offset=8
    local.get 1
    i32.const 8
    i32.add
    call $eqdestroy___stdZassertions_u69
    local.get 0
    i32.load offset=28
    local.set 2
    local.get 1
    i32.const 66164
    i32.store offset=28
    local.get 1
    i32.const 65708
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store16 offset=32
    local.get 1
    i32.const 0
    i32.store offset=24
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store offset=16
        local.get 1
        i32.const 0
        i32.store16 offset=34
        i32.const 0
        local.get 1
        i32.const 16
        i32.add
        i32.store offset=75156
        local.get 1
        i32.const 16
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 1
      local.get 3
      i32.store offset=16
      i32.const 0
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=34
      local.get 1
      i32.const 16
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 1
    i32.const 66164
    i32.store offset=28
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 3
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.const 58
          i32.store offset=24
          local.get 1
          i32.const 66116
          i32.store offset=52
          local.get 1
          i32.const 66713
          i32.store offset=44
          local.get 1
          i32.const 0
          i32.store16 offset=56
          local.get 1
          i32.const 0
          i32.store offset=48
          i32.const 0
          local.set 4
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 1
            local.get 3
            i32.store offset=40
            i32.const 0
            local.get 1
            i32.const 40
            i32.add
            i32.store offset=75156
            local.get 1
            local.get 4
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=58
            local.get 3
            local.set 4
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
          end
          i32.const 0
          local.get 4
          i32.store offset=75156
          local.get 2
          i32.const -4
          i32.add
          local.tee 2
          i32.load
          local.tee 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 234
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.const -8
            i32.add
            local.tee 0
            local.get 3
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.get 0
          i32.store
        end
        i32.const 0
        local.get 4
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.get 4
      i32.load
      i32.store offset=75156
      local.get 0
      i32.load offset=28
      call $nimDestroyAndDispose
    end
    local.get 1
    i32.const 64
    i32.add
    global.set $__stack_pointer
  )
  (func $rttiDestroy__systemZexceptions_u60 (;10;) (type 0) (param i32)
    local.get 0
    call $eqdestroy___system_u3820
  )
  (func $eqdestroy___system_u3820 (;11;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 1
    i32.const 66164
    i32.store offset=28
    local.get 1
    i32.const 65708
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store16 offset=32
    local.get 1
    i32.const 0
    i32.store offset=24
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store offset=16
        local.get 1
        i32.const 0
        i32.store16 offset=34
        i32.const 0
        local.get 1
        i32.const 16
        i32.add
        i32.store offset=75156
        local.get 1
        i32.const 16
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 1
      local.get 3
      i32.store offset=16
      i32.const 0
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=34
      local.get 1
      i32.const 16
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 1
    i32.const 66164
    i32.store offset=28
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 3
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.const 58
          i32.store offset=24
          local.get 1
          i32.const 66116
          i32.store offset=52
          local.get 1
          i32.const 66713
          i32.store offset=44
          local.get 1
          i32.const 0
          i32.store16 offset=56
          local.get 1
          i32.const 0
          i32.store offset=48
          i32.const 0
          local.set 4
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 1
            local.get 3
            i32.store offset=40
            i32.const 0
            local.get 1
            i32.const 40
            i32.add
            i32.store offset=75156
            local.get 1
            local.get 4
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=58
            local.get 3
            local.set 4
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
          end
          i32.const 0
          local.get 4
          i32.store offset=75156
          local.get 2
          i32.const -4
          i32.add
          local.tee 2
          i32.load
          local.tee 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 234
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.const -8
            i32.add
            local.tee 5
            local.get 3
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.get 5
          i32.store
        end
        i32.const 0
        local.get 4
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.get 4
      i32.load
      i32.store offset=75156
      local.get 0
      i32.load offset=4
      call $nimDestroyAndDispose
    end
    block ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      i32.load
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 3
      i32.add
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 3
      call $dealloc
    end
    local.get 1
    local.get 0
    i64.load offset=20 align=4
    i64.store offset=8
    local.get 1
    i32.const 8
    i32.add
    call $eqdestroy___stdZassertions_u69
    local.get 0
    i32.load offset=28
    local.set 2
    local.get 1
    i32.const 66164
    i32.store offset=28
    local.get 1
    i32.const 65708
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store16 offset=32
    local.get 1
    i32.const 0
    i32.store offset=24
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store offset=16
        local.get 1
        i32.const 0
        i32.store16 offset=34
        i32.const 0
        local.get 1
        i32.const 16
        i32.add
        i32.store offset=75156
        local.get 1
        i32.const 16
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 1
      local.get 3
      i32.store offset=16
      i32.const 0
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=34
      local.get 1
      i32.const 16
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 1
    i32.const 66164
    i32.store offset=28
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 3
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.const 58
          i32.store offset=24
          local.get 1
          i32.const 66116
          i32.store offset=52
          local.get 1
          i32.const 66713
          i32.store offset=44
          local.get 1
          i32.const 0
          i32.store16 offset=56
          local.get 1
          i32.const 0
          i32.store offset=48
          i32.const 0
          local.set 4
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 1
            local.get 3
            i32.store offset=40
            i32.const 0
            local.get 1
            i32.const 40
            i32.add
            i32.store offset=75156
            local.get 1
            local.get 4
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=58
            local.get 3
            local.set 4
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
          end
          i32.const 0
          local.get 4
          i32.store offset=75156
          local.get 2
          i32.const -4
          i32.add
          local.tee 2
          i32.load
          local.tee 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 234
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.const -8
            i32.add
            local.tee 0
            local.get 3
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.get 0
          i32.store
        end
        i32.const 0
        local.get 4
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.get 4
      i32.load
      i32.store offset=75156
      local.get 0
      i32.load offset=28
      call $nimDestroyAndDispose
    end
    local.get 1
    i32.const 64
    i32.add
    global.set $__stack_pointer
  )
  (func $addInt__stdZprivateZdigitsutils_u175 (;12;) (type 9) (param i32 i64)
    (local i32 i32 i32 i64 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66100
    i32.store offset=12
    local.get 2
    i32.const 65738
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.store
              local.get 2
              i32.const 0
              i32.store16 offset=18
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 3
            i32.store
            i32.const 0
            local.get 2
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=18
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 2
          i32.const 88
          i32.store offset=8
          local.get 2
          i32.const 66100
          i32.store offset=36
          local.get 2
          i32.const 66232
          i32.store offset=28
          local.get 2
          i32.const 0
          i32.store16 offset=40
          local.get 2
          i32.const 0
          i32.store offset=32
          local.get 2
          local.set 3
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 2
        i32.const 88
        i32.store offset=8
        i32.const 0
        i32.load offset=75156
        local.set 3
        local.get 2
        i32.const 66100
        i32.store offset=36
        local.get 2
        i32.const 66232
        i32.store offset=28
        local.get 2
        i32.const 0
        i32.store16 offset=40
        local.get 2
        i32.const 0
        i32.store offset=32
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 1
                i64.const 100
                i64.lt_u
                br_if 0 (;@6;)
                i32.const 23
                local.set 3
                loop ;; label = @7
                  block ;; label = @8
                    local.get 1
                    local.tee 5
                    local.get 5
                    i64.const 100
                    i64.div_u
                    local.tee 1
                    i64.const 9223372036854775708
                    i64.mul
                    i64.add
                    i64.const 1
                    i64.shl
                    local.tee 6
                    i64.const 32768
                    i64.lt_u
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 67
                    i32.store offset=32
                    call $raiseRangeErrorNoArgs
                    br 7 (;@1;)
                  end
                  block ;; label = @8
                    local.get 3
                    i32.const 24
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 68
                    i32.store offset=32
                    i32.const -1
                    i32.const 23
                    call $raiseIndexError2
                    br 7 (;@1;)
                  end
                  block ;; label = @8
                    local.get 6
                    i32.wrap_i64
                    i32.const 65534
                    i32.and
                    local.tee 7
                    i32.const 1
                    i32.or
                    local.tee 4
                    i32.const 200
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 68
                    i32.store offset=32
                    local.get 4
                    i32.const 199
                    call $raiseIndexError2
                    br 7 (;@1;)
                  end
                  local.get 2
                  i32.const 48
                  i32.add
                  local.get 3
                  i32.add
                  local.tee 8
                  i32.const -1
                  i32.add
                  local.get 7
                  i32.const 66736
                  i32.add
                  i32.load8_u
                  i32.store8
                  local.get 8
                  local.get 4
                  i32.const 66736
                  i32.add
                  i32.load8_u
                  i32.store8
                  local.get 3
                  i32.const -2
                  i32.add
                  local.set 3
                  local.get 5
                  i64.const 9999
                  i64.gt_u
                  br_if 0 (;@7;)
                end
                local.get 5
                i64.const 1000
                i64.ge_u
                br_if 2 (;@4;)
                local.get 2
                i32.const 74
                i32.store offset=32
                local.get 3
                i32.const 24
                i32.lt_u
                br_if 1 (;@5;)
                local.get 3
                i32.const 23
                call $raiseIndexError2
                br 5 (;@1;)
              end
              i32.const 23
              local.set 3
              local.get 1
              i64.const 10
              i64.lt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 77
              i32.store offset=32
              i32.const 23
              local.set 3
              br 2 (;@3;)
            end
            local.get 1
            i32.wrap_i64
            i32.const 48
            i32.add
            local.set 4
            br 2 (;@2;)
          end
          local.get 2
          i32.const 77
          i32.store offset=32
          local.get 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
          local.get 3
          i32.const 23
          call $raiseIndexError2
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 1
          i32.wrap_i64
          i32.const 1
          i32.shl
          local.tee 7
          i32.const 1
          i32.or
          local.tee 4
          i32.const 200
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          i32.const 199
          call $raiseIndexError2
          br 2 (;@1;)
        end
        local.get 2
        i32.const 48
        i32.add
        local.get 3
        i32.add
        local.get 4
        i32.const 66736
        i32.add
        i32.load8_u
        i32.store8
        local.get 2
        i32.const 78
        i32.store offset=32
        block ;; label = @3
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
          i32.const -1
          i32.const 23
          call $raiseIndexError2
          br 2 (;@1;)
        end
        local.get 7
        i32.const 66736
        i32.add
        i32.load8_u
        local.set 4
      end
      local.get 2
      i32.const 48
      i32.add
      local.get 3
      i32.add
      local.tee 8
      local.get 4
      i32.store8
      local.get 2
      i32.const 80
      i32.store offset=32
      local.get 2
      i32.const 66100
      i32.store offset=84
      local.get 2
      i32.const 65870
      i32.store offset=76
      local.get 2
      i32.const 0
      i32.store16 offset=88
      local.get 2
      i32.const 0
      i32.store offset=80
      i32.const 24
      local.get 3
      i32.sub
      local.set 4
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 3
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.store offset=72
          local.get 2
          i32.const 0
          i32.store16 offset=90
          i32.const 0
          local.get 2
          i32.const 72
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 7
        local.get 2
        local.get 3
        i32.store offset=72
        i32.const 0
        local.get 2
        i32.const 72
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 7
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=90
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 2
      i32.const 66100
      i32.store offset=84
      local.get 0
      i32.load
      local.set 3
      local.get 2
      i32.const 45
      i32.store offset=80
      block ;; label = @2
        block ;; label = @3
          local.get 4
          i32.const 0
          i32.lt_s
          local.get 3
          local.get 4
          i32.add
          local.tee 7
          local.get 3
          i32.lt_s
          i32.eq
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 7
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 7
          i64.extend_i32_s
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          br 1 (;@2;)
        end
        local.get 0
        local.get 7
        call $setLengthStrV2
        local.get 2
        i32.const 53
        i32.store offset=80
        local.get 0
        i32.load
        local.set 7
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 3
            local.get 7
            i32.lt_s
            br_if 1 (;@3;)
          end
          local.get 3
          local.get 7
          i32.const -1
          i32.add
          call $raiseIndexError2
          br 1 (;@2;)
        end
        local.get 0
        i32.load offset=4
        local.get 3
        i32.add
        i32.const 4
        i32.add
        local.get 8
        local.get 4
        call $__memcpy
        drop
      end
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 3
    i32.store offset=75156
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 96
    i32.add
    global.set $__stack_pointer
  )
  (func $addInt__stdZprivateZdigitsutils_u178 (;13;) (type 9) (param i32 i64)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66100
    i32.store offset=20
    local.get 2
    i32.const 65738
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      local.get 1
      i64.const -1
      i64.gt_s
      br_if 0 (;@1;)
      local.get 2
      i32.const 105
      i32.store offset=16
      local.get 0
      i32.const 1
      call $prepareAdd
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load
      i32.add
      i32.const 4
      i32.add
      i32.const 45
      i32.store8
      i64.const 0
      local.get 1
      i64.sub
      local.set 1
      block ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.const 1
        i32.add
        local.tee 4
        local.get 3
        i32.ge_s
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      i32.store
      local.get 0
      i32.load offset=4
      local.get 4
      i32.add
      i32.const 4
      i32.add
      i32.const 0
      i32.store8
    end
    local.get 2
    i32.const 113
    i32.store offset=16
    local.get 0
    local.get 1
    call $addInt__stdZprivateZdigitsutils_u175
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $writeFloatToBufferSprintf__stdZformatfloat_u81 (;14;) (type 18) (param i32 f64) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66058
    i32.store offset=28
    local.get 2
    i32.const 66444
    i32.store offset=20
    local.get 2
    i32.const 0
    i32.store16 offset=32
    local.get 2
    i32.const 0
    i32.store offset=24
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=16
        local.get 2
        i32.const 0
        i32.store16 offset=34
        i32.const 0
        local.get 2
        i32.const 16
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=16
      i32.const 0
      local.get 2
      i32.const 16
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=34
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    local.get 1
    f64.store
    local.get 2
    i32.const 52
    i32.store offset=24
    local.get 0
    i32.const 65
    i32.const 66422
    local.get 2
    call $snprintf
    local.tee 5
    i32.const -1
    i32.add
    local.set 6
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 5
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          i32.const 0
          local.set 7
          loop ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  local.get 0
                  local.get 3
                  i32.add
                  local.tee 8
                  i32.load8_u
                  local.tee 4
                  i32.const 44
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const 46
                  i32.store8
                  br 1 (;@6;)
                end
                local.get 4
                i32.const -97
                i32.add
                i32.const 255
                i32.and
                i32.const 26
                i32.lt_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 46
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                i32.const -65
                i32.add
                i32.const 255
                i32.and
                i32.const 25
                i32.gt_u
                br_if 1 (;@5;)
              end
              i32.const 1
              local.set 7
            end
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            local.get 5
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 2
          i32.const 66058
          i32.store offset=28
          local.get 7
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 2
        i32.const 66058
        i32.store offset=28
      end
      local.get 0
      local.get 5
      i32.add
      i32.const 12334
      i32.store16 align=1
      local.get 0
      local.get 5
      i32.const 2
      i32.add
      local.tee 5
      i32.add
      i32.const 0
      i32.store8
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              local.get 6
              i32.add
              i32.load8_u
              local.tee 3
              i32.const -68
              i32.add
              br_table 1 (;@4;) 2 (;@3;) 3 (;@2;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 1 (;@4;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 1 (;@4;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            local.get 3
            i32.const 41
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 2
          i32.const 71
          i32.store offset=24
          local.get 2
          i32.const 66058
          i32.store offset=52
          local.get 2
          i32.const 65991
          i32.store offset=44
          local.get 2
          i32.const 0
          i32.store16 offset=56
          local.get 2
          i32.const 0
          i32.store offset=48
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.store offset=40
              local.get 2
              i32.const 0
              i32.store16 offset=58
              i32.const 0
              local.get 2
              i32.const 40
              i32.add
              i32.store offset=75156
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 3
            i32.store offset=40
            i32.const 0
            local.get 2
            i32.const 40
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=58
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
          end
          local.get 0
          i32.const 110
          i32.store8 offset=2
          local.get 0
          i32.const 24942
          i32.store16 align=1
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          local.tee 3
          i32.store offset=75156
          local.get 5
          i32.const 3
          i32.const 0
          i32.load8_u offset=75168
          select
          local.set 5
          br 2 (;@1;)
        end
        i32.const 0
        i32.load offset=75156
        local.set 3
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 45
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.const 75
        i32.store offset=24
        local.get 2
        i32.const 66058
        i32.store offset=52
        local.get 2
        i32.const 65991
        i32.store offset=44
        local.get 2
        i32.const 0
        i32.store16 offset=56
        local.get 2
        i32.const 0
        i32.store offset=48
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 3
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=40
            local.get 2
            i32.const 0
            i32.store16 offset=58
            i32.const 0
            local.get 2
            i32.const 40
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 4
          local.get 2
          local.get 3
          i32.store offset=40
          i32.const 0
          local.get 2
          i32.const 40
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 4
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=58
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 0
        i32.const 1718511917
        i32.store align=1
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 3
        i32.store offset=75156
        local.get 5
        i32.const 4
        i32.const 0
        i32.load8_u offset=75168
        select
        local.set 5
        br 1 (;@1;)
      end
      local.get 2
      i32.const 78
      i32.store offset=24
      local.get 2
      i32.const 66058
      i32.store offset=52
      local.get 2
      i32.const 65991
      i32.store offset=44
      local.get 2
      i32.const 0
      i32.store16 offset=56
      local.get 2
      i32.const 0
      i32.store offset=48
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 3
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.store offset=40
          local.get 2
          i32.const 0
          i32.store16 offset=58
          i32.const 0
          local.get 2
          i32.const 40
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=40
        i32.const 0
        local.get 2
        i32.const 40
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=58
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 0
      i32.const 102
      i32.store8 offset=2
      local.get 0
      i32.const 28265
      i32.store16 align=1
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 3
      i32.store offset=75156
      local.get 5
      i32.const 3
      i32.const 0
      i32.load8_u offset=75168
      select
      local.set 5
    end
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 5
  )
  (func $addFloatSprintf__stdZformatfloat_u112 (;15;) (type 19) (param i32 f64)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66058
    i32.store offset=20
    local.get 2
    i32.const 66428
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 100
    i32.store offset=16
    local.get 2
    i32.const 32
    i32.add
    local.get 1
    call $writeFloatToBufferSprintf__stdZformatfloat_u81
    local.set 4
    i32.const 0
    i32.load offset=75156
    local.set 3
    block ;; label = @1
      i32.const 0
      i32.load8_u offset=75168
      br_if 0 (;@1;)
      local.get 2
      i32.const 101
      i32.store offset=16
      local.get 2
      i32.const 66058
      i32.store offset=116
      local.get 2
      i32.const 66642
      i32.store offset=108
      local.get 2
      i32.const 0
      i32.store16 offset=120
      local.get 2
      i32.const 0
      i32.store offset=112
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.store offset=104
          local.get 2
          i32.const 0
          i32.store16 offset=122
          i32.const 0
          local.get 2
          i32.const 104
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 5
        local.get 2
        local.get 3
        i32.store offset=104
        i32.const 0
        local.get 2
        i32.const 104
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 5
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=122
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 0
      i32.load
      local.set 3
      local.get 2
      i32.const 21
      i32.store offset=112
      local.get 0
      local.get 3
      local.get 4
      i32.add
      call $setLengthStrV2
      local.get 3
      local.get 0
      i32.load offset=4
      i32.add
      i32.const 4
      i32.add
      local.get 2
      i32.const 32
      i32.add
      local.get 4
      call $__memcpy
      drop
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 3
      i32.store offset=75156
    end
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
  )
  (func $dollar___systemZdollars_u11 (;16;) (type 9) (param i32 i64)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66088
    i32.store offset=20
    local.get 2
    i32.const 66719
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 0
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 66088
    i32.store offset=20
    local.get 2
    i32.const 22
    i32.store offset=16
    local.get 0
    local.get 1
    call $addInt__stdZprivateZdigitsutils_u178
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $dollar___systemZdollars_u8 (;17;) (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66088
    i32.store offset=12
    local.get 2
    i32.const 66719
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 0
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 66088
    i32.store offset=12
    local.get 2
    i32.const 18
    i32.store offset=8
    local.get 2
    i32.const 66100
    i32.store offset=36
    local.get 2
    i32.const 65738
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 66100
    i32.store offset=36
    local.get 2
    i32.const 116
    i32.store offset=32
    local.get 0
    local.get 1
    i64.extend_i32_s
    call $addInt__stdZprivateZdigitsutils_u178
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 3
    i32.store offset=75156
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $dollar___test_u34 (;18;) (type 20) (param i32 f32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66088
    i32.store offset=12
    local.get 2
    i32.const 66719
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 0
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 66088
    i32.store offset=12
    local.get 2
    i32.const 14
    i32.store offset=8
    local.get 2
    i32.const 66058
    i32.store offset=36
    local.get 2
    i32.const 65822
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 66058
    i32.store offset=36
    local.get 2
    i32.const 138
    i32.store offset=32
    local.get 0
    local.get 1
    f64.promote_f32
    call $addFloatSprintf__stdZformatfloat_u112
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 3
    i32.store offset=75156
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $callDepthLimitReached__system_u3735 (;19;) (type 5)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 0
    i32.store offset=40
    local.get 0
    i32.const 0
    i64.load offset=67208
    i64.store offset=48
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        br_if 0 (;@2;)
        local.get 0
        i32.const 48
        i32.add
        i32.const 29
        call $prepareAdd
        local.get 0
        i32.load offset=52
        local.tee 1
        local.get 0
        i32.load offset=48
        local.tee 2
        i32.add
        local.tee 3
        i32.const 26
        i32.add
        i32.const 0
        i64.load offset=67350 align=2
        i64.store align=1
        local.get 3
        i32.const 20
        i32.add
        i32.const 0
        i64.load offset=67344 align=4
        i64.store align=1
        local.get 3
        i32.const 12
        i32.add
        i32.const 0
        i64.load offset=67336 align=4
        i64.store align=1
        local.get 3
        i32.const 4
        i32.add
        i32.const 0
        i64.load offset=67328 align=4
        i64.store align=1
        block ;; label = @3
          local.get 2
          i32.const 29
          i32.add
          local.tee 3
          local.get 2
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        i32.store offset=48
        local.get 3
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i32.const 48
      i32.add
      i32.const 34
      call $prepareAdd
      local.get 0
      i32.load offset=52
      local.get 0
      i32.load offset=48
      local.tee 1
      i32.add
      local.tee 2
      i32.const 35
      i32.add
      i32.const 0
      i32.load offset=67395 align=1
      i32.store align=1
      local.get 2
      i32.const 28
      i32.add
      i32.const 0
      i64.load offset=67388 align=4
      i64.store align=1
      local.get 2
      i32.const 20
      i32.add
      i32.const 0
      i64.load offset=67380 align=4
      i64.store align=1
      local.get 2
      i32.const 12
      i32.add
      i32.const 0
      i64.load offset=67372 align=4
      i64.store align=1
      local.get 2
      i32.const 4
      i32.add
      i32.const 0
      i64.load offset=67364 align=4
      i64.store align=1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.const 34
          i32.add
          local.tee 2
          local.get 1
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 0
        local.get 2
        i32.store offset=48
      end
      i32.const 0
      i32.load offset=75156
      local.get 0
      i32.const 48
      i32.add
      call $auxWriteStackTrace__system_u3399
      local.get 0
      i32.load offset=52
      local.set 1
      local.get 0
      i32.load offset=48
      local.set 2
    end
    local.get 1
    i32.const 4
    i32.add
    i32.const 66735
    local.get 2
    select
    local.get 2
    call $showErrorMessage__system_u3178
    block ;; label = @1
      i32.const 0
      i32.load8_u offset=75168
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=52
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 3
      i32.add
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const 66174
      i32.store offset=68
      local.get 0
      i32.const 66606
      i32.store offset=60
      local.get 0
      i32.const 0
      i32.store16 offset=72
      local.get 0
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.store offset=56
          local.get 0
          i32.const 0
          i32.store16 offset=74
          i32.const 0
          local.get 0
          i32.const 56
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 1
        i32.load16_u offset=18
        local.set 3
        local.get 0
        local.get 1
        i32.store offset=56
        i32.const 0
        local.get 0
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 0
        local.get 3
        i32.const 1
        i32.add
        local.tee 1
        i32.store16 offset=74
        local.get 1
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 0
      i32.const 1164
      i32.store offset=64
      i32.const 68628
      local.get 2
      call $rawDealloc__system_u5753
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 0
    i64.const 0
    i64.store offset=32
    local.get 0
    i32.const 48
    i32.add
    i32.const 2000
    call $dollar___systemZdollars_u8
    local.get 0
    local.get 0
    i64.load offset=48
    local.tee 4
    i64.store offset=56
    block ;; label = @1
      i32.const 0
      i32.load8_u offset=75168
      br_if 0 (;@1;)
      local.get 0
      i32.const 32
      i32.add
      local.get 4
      i32.wrap_i64
      i32.const 167
      i32.add
      call $rawNewString
      local.get 0
      i32.const 0
      i64.load offset=67216 align=4
      i64.store offset=24
      local.get 0
      i32.const 32
      i32.add
      local.get 0
      i32.const 24
      i32.add
      call $appendString
      local.get 0
      local.get 0
      i64.load offset=56
      i64.store offset=16
      local.get 0
      i32.const 32
      i32.add
      local.get 0
      i32.const 16
      i32.add
      call $appendString
      local.get 0
      i32.const 0
      i64.load offset=67224 align=4
      i64.store offset=8
      local.get 0
      i32.const 32
      i32.add
      local.get 0
      i32.const 8
      i32.add
      call $appendString
      local.get 0
      local.get 0
      i64.load offset=32
      local.tee 4
      i64.store offset=40
      local.get 0
      local.get 4
      i64.store
      local.get 0
      call $showErrorMessage2__system_u3186
      i32.const 1
      call $exit
      unreachable
    end
    local.get 0
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $contains__system_u5129 (;20;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 65879
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 426
    i32.store offset=8
    local.get 2
    i32.const 66174
    i32.store offset=36
    local.get 2
    i32.const 65773
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    local.get 1
    i32.const 9
    i32.shr_s
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 5
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 5
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 0
          local.get 4
          i32.const 255
          i32.and
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 3
            i32.load offset=4
            local.get 4
            i32.eq
            br_if 2 (;@2;)
            local.get 3
            i32.load
            local.tee 3
            br_if 0 (;@4;)
          end
        end
        i32.const 0
        local.set 3
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 413
      i32.store offset=32
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 4
      i32.store offset=75156
      local.get 2
      i32.const 429
      i32.store offset=8
      local.get 3
      local.get 1
      i32.const 3
      i32.shr_u
      i32.const 60
      i32.and
      i32.add
      i32.const 8
      i32.add
      i32.load
      local.get 1
      i32.shr_u
      i32.const 1
      i32.and
      local.set 3
    end
    i32.const 0
    local.get 4
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $removeChunkFromMatrix__system_u4876 (;21;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 65617
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        local.get 2
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 2
      i32.const 8
      i32.add
      local.set 4
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 4
    end
    local.get 2
    i32.const 274
    i32.store offset=16
    local.get 1
    i32.load offset=4
    local.set 3
    local.get 2
    i32.const 66174
    i32.store offset=44
    local.get 2
    i32.const 65724
    i32.store offset=36
    local.get 2
    i32.const 0
    i32.store16 offset=48
    local.get 2
    i32.const 0
    i32.store offset=40
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 2
              local.get 4
              i32.store offset=32
              local.get 2
              i32.const 0
              i32.store16 offset=50
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 2
            local.get 4
            i32.store offset=32
            i32.const 0
            local.get 2
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 5
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=50
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 2
          i32.const 249
          i32.store offset=40
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 65745
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          local.get 2
          i32.const 32
          i32.add
          local.set 4
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 2
        i32.const 249
        i32.store offset=40
        i32.const 0
        i32.load offset=75156
        local.set 4
        local.get 2
        i32.const 66174
        i32.store offset=68
        local.get 2
        i32.const 65745
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        local.get 4
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.store offset=56
        local.get 2
        i32.const 0
        i32.store16 offset=74
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 2
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=74
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 220
    i32.store offset=64
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 4
    i32.store offset=75156
    local.get 2
    i32.const 251
    i32.store offset=40
    i32.const 0
    local.get 4
    i32.load
    local.tee 4
    i32.store offset=75156
    local.get 3
    local.get 3
    i32.const 255
    i32.gt_u
    i32.const 3
    i32.shl
    i32.const 16
    i32.const 24
    local.get 3
    i32.const 16777216
    i32.lt_u
    select
    local.get 3
    i32.const 65536
    i32.lt_u
    select
    local.tee 5
    local.get 3
    local.get 5
    i32.shr_u
    i32.const 66944
    i32.add
    i32.load8_s
    i32.add
    local.tee 6
    i32.const -5
    i32.add
    i32.shr_s
    local.set 5
    block ;; label = @1
      local.get 1
      i32.load offset=12
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.load offset=16
      i32.store offset=16
    end
    local.get 6
    i32.const -6
    i32.add
    local.set 3
    local.get 5
    i32.const -32
    i32.add
    local.set 6
    block ;; label = @1
      local.get 1
      i32.load offset=16
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      local.get 1
      i32.load offset=12
      i32.store offset=12
    end
    block ;; label = @1
      local.get 0
      local.get 3
      i32.const 7
      i32.shl
      i32.add
      local.get 6
      i32.const 2
      i32.shl
      i32.add
      i32.const 2148
      i32.add
      local.tee 6
      i32.load
      local.get 1
      i32.ne
      br_if 0 (;@1;)
      local.get 6
      local.get 1
      i32.load offset=12
      local.tee 7
      i32.store
      i32.const 0
      local.set 6
      i32.const 0
      i32.load offset=75156
      local.set 4
      local.get 7
      br_if 0 (;@1;)
      local.get 2
      i32.const 268
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65764
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      local.get 0
      local.get 3
      i32.const 2
      i32.shl
      i32.add
      i32.const 2052
      i32.add
      local.set 7
      block ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load16_u offset=18
        local.set 6
        local.get 2
        local.get 4
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 6
        i32.const 1
        i32.add
        local.tee 8
        i32.store16 offset=74
        local.get 4
        local.set 6
        local.get 8
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 6
      end
      local.get 7
      local.get 7
      i32.load
      i32.const -2
      local.get 5
      i32.rotl
      i32.and
      local.tee 5
      i32.store
      i32.const 0
      local.set 4
      i32.const 0
      local.get 6
      i32.store offset=75156
      block ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.set 4
        br 1 (;@1;)
      end
      local.get 2
      i32.const 271
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65764
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 6
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=74
        local.get 6
        local.set 4
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 4
      end
      local.get 0
      local.get 0
      i32.load offset=2048
      i32.const -2
      local.get 3
      i32.rotl
      i32.and
      i32.store offset=2048
      i32.const 0
      local.get 4
      i32.store offset=75156
    end
    local.get 1
    i64.const 0
    i64.store offset=12 align=4
    i32.const 0
    local.get 4
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $excl__system_u5173 (;22;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 66243
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 439
    i32.store offset=8
    local.get 2
    i32.const 66174
    i32.store offset=36
    local.get 2
    i32.const 65773
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    local.get 1
    i32.const 9
    i32.shr_s
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 5
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 5
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        local.get 0
        local.get 4
        i32.const 255
        i32.and
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          loop ;; label = @4
            local.get 3
            i32.load offset=4
            local.get 4
            i32.eq
            br_if 1 (;@3;)
            local.get 3
            i32.load
            local.tee 3
            i32.eqz
            br_if 2 (;@2;)
            br 0 (;@4;)
          end
          unreachable
        end
        local.get 2
        i32.const 413
        i32.store offset=32
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        local.get 2
        i32.const 443
        i32.store offset=8
        local.get 3
        local.get 1
        i32.const 3
        i32.shr_u
        i32.const 60
        i32.and
        i32.add
        i32.const 8
        i32.add
        local.tee 3
        local.get 3
        i32.load
        i32.const -2
        local.get 1
        i32.rotl
        i32.and
        i32.store
        br 1 (;@1;)
      end
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 4
      i32.store offset=75156
    end
    i32.const 0
    local.get 4
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $raiseOutOfMem__system_u4629 (;23;) (type 5)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 66132
    i32.store offset=20
    local.get 0
    i32.const 66218
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.store16 offset=24
    local.get 0
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 1
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store offset=8
        local.get 0
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 0
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 1
      i32.load16_u offset=18
      local.set 2
      local.get 0
      local.get 1
      i32.store offset=8
      i32.const 0
      local.get 0
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 0
      local.get 2
      i32.const 1
      i32.add
      local.tee 1
      i32.store16 offset=26
      local.get 1
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 0
    i32.const 66132
    i32.store offset=20
    local.get 0
    i32.const 47
    i32.store offset=16
    block ;; label = @1
      i32.const 0
      i32.load offset=68624
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call_indirect (type 5)
    end
    local.get 0
    i32.const 48
    i32.store offset=16
    i32.const 0
    i32.load offset=67736
    call $rawWrite
    local.get 0
    i32.const 49
    i32.store offset=16
    i32.const 1
    call $exit
    unreachable
  )
  (func $rawWrite (;24;) (type 0) (param i32)
    i32.const 66721
    i32.const 1
    i32.const 14
    local.get 0
    call $fwrite
    drop
    local.get 0
    call $fflush
    drop
  )
  (func $allocPages__system_u4954 (;25;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 65937
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 322
    i32.store offset=8
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 66172
    i32.store offset=36
    local.get 2
    i32.const 65978
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 142
    i32.store offset=32
    local.get 2
    i32.const 66172
    i32.store offset=36
    block ;; label = @1
      i32.const 0
      local.get 1
      i32.const 3
      i32.const 34
      i32.const -1
      i64.const 0
      call $__mmap
      local.tee 3
      i32.const 1
      i32.add
      i32.const 1
      i32.gt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const 145
      i32.store offset=32
      call $raiseOutOfMem__system_u4629
      unreachable
    end
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 1
    i32.store offset=75156
    i32.const 0
    local.get 1
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $llAlloc__system_u4962 (;26;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 66634
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load offset=5220
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.load
          local.tee 4
          local.get 1
          i32.lt_s
          br_if 0 (;@3;)
          local.get 5
          i32.load offset=4
          local.set 0
          local.get 5
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        i32.const 339
        i32.store offset=16
        local.get 2
        i32.const 66174
        i32.store offset=44
        local.get 2
        i32.const 65937
        i32.store offset=36
        local.get 2
        i32.const 0
        i32.store16 offset=48
        local.get 2
        i32.const 0
        i32.store offset=40
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 3
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=32
            local.get 2
            i32.const 0
            i32.store16 offset=50
            local.get 2
            i32.const 32
            i32.add
            local.set 3
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 4
          local.get 2
          local.get 3
          i32.store offset=32
          i32.const 0
          local.get 2
          i32.const 32
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 4
          i32.const 1
          i32.add
          local.tee 4
          i32.store16 offset=50
          local.get 2
          i32.const 32
          i32.add
          local.set 3
          local.get 4
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          local.set 3
        end
        local.get 2
        i32.const 322
        i32.store offset=40
        local.get 2
        i32.const 66174
        i32.store offset=44
        local.get 2
        i32.const 66172
        i32.store offset=68
        local.get 2
        i32.const 65978
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        block ;; label = @3
          block ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=56
            local.get 2
            i32.const 0
            i32.store16 offset=74
            i32.const 0
            local.get 2
            i32.const 56
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 4
          local.get 2
          local.get 3
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 4
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=74
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 142
        i32.store offset=64
        local.get 2
        i32.const 66172
        i32.store offset=68
        i32.const 0
        i32.const 4096
        i32.const 3
        i32.const 34
        i32.const -1
        i64.const 0
        call $__mmap
        local.tee 3
        i32.const 1
        i32.add
        i32.const 1
        i32.le_u
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        local.get 4
        i32.load
        local.set 4
        local.get 0
        local.get 3
        i32.store offset=5220
        local.get 2
        i32.const 342
        i32.store offset=16
        local.get 2
        i32.const 66174
        i32.store offset=68
        local.get 2
        i32.const 66196
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        block ;; label = @3
          block ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            br 1 (;@3;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 6
          local.get 2
          local.get 4
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 6
          i32.const 1
          i32.add
          local.tee 6
          i32.store16 offset=74
          local.get 6
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          local.get 0
          i32.load offset=5220
          local.set 3
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 4
        end
        local.get 0
        local.get 0
        i32.load offset=5224
        i32.const 4096
        i32.add
        i32.store offset=5224
        i32.const 0
        local.get 4
        i32.store offset=75156
        local.get 3
        local.get 5
        i32.store offset=8
        local.get 3
        i64.const 51539611636
        i64.store align=4
        i32.const 12
        local.set 0
        i32.const 4084
        local.set 4
      end
      local.get 3
      local.get 0
      local.get 1
      i32.add
      i32.store offset=4
      local.get 3
      local.get 4
      local.get 1
      i32.sub
      i32.store
      local.get 0
      local.get 3
      i32.add
      i32.const 0
      local.get 1
      call $__memset
      local.set 3
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
      local.get 2
      i32.const 80
      i32.add
      global.set $__stack_pointer
      local.get 3
      return
    end
    local.get 2
    i32.const 145
    i32.store offset=64
    call $raiseOutOfMem__system_u4629
    unreachable
  )
  (func $intSetPut__system_u5112 (;27;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 66174
    i32.store offset=12
    local.get 3
    i32.const 65678
    i32.store offset=4
    local.get 3
    i32.const 0
    i32.store16 offset=16
    local.get 3
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 4
              br_if 0 (;@5;)
              local.get 3
              local.get 4
              i32.store
              local.get 3
              i32.const 0
              i32.store16 offset=18
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 3
            local.get 4
            i32.store
            i32.const 0
            local.get 3
            i32.store offset=75156
            local.get 3
            local.get 5
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=18
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 3
          i32.const 418
          i32.store offset=8
          local.get 3
          i32.const 66174
          i32.store offset=36
          local.get 3
          i32.const 65773
          i32.store offset=28
          local.get 3
          i32.const 0
          i32.store16 offset=40
          local.get 3
          i32.const 0
          i32.store offset=32
          local.get 3
          local.set 4
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 3
        i32.const 418
        i32.store offset=8
        i32.const 0
        i32.load offset=75156
        local.set 4
        local.get 3
        i32.const 66174
        i32.store offset=36
        local.get 3
        i32.const 65773
        i32.store offset=28
        local.get 3
        i32.const 0
        i32.store16 offset=40
        local.get 3
        i32.const 0
        i32.store offset=32
        local.get 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=24
        local.get 3
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 3
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 3
      local.get 4
      i32.store offset=24
      i32.const 0
      local.get 3
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=42
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 3
    i32.const 66174
    i32.store offset=36
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          local.get 2
          i32.const 255
          i32.and
          i32.const 2
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 4
            i32.load offset=4
            local.get 2
            i32.eq
            br_if 2 (;@2;)
            local.get 4
            i32.load
            local.tee 4
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.const 415
        i32.store offset=32
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        local.get 3
        i32.const 420
        i32.store offset=8
        local.get 0
        i32.const 72
        call $llAlloc__system_u4962
        local.tee 4
        local.get 1
        i32.load
        i32.store
        local.get 1
        local.get 4
        i32.store
        local.get 4
        local.get 2
        i32.store offset=4
        i32.const 0
        i32.load offset=75156
        local.set 2
        br 1 (;@1;)
      end
      local.get 3
      i32.const 413
      i32.store offset=32
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 2
      i32.store offset=75156
    end
    i32.const 0
    local.get 2
    i32.load
    i32.store offset=75156
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $incl__system_u5151 (;28;) (type 10) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 66174
    i32.store offset=20
    local.get 3
    i32.const 66248
    i32.store offset=12
    local.get 3
    i32.const 0
    i32.store16 offset=24
    local.get 3
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=8
        local.get 3
        i32.const 0
        i32.store16 offset=26
        local.get 3
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 3
      local.get 4
      i32.store offset=8
      i32.const 0
      local.get 3
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 5
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=26
      local.get 3
      i32.const 8
      i32.add
      local.set 4
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 4
    end
    local.get 3
    i32.const 434
    i32.store offset=16
    local.get 3
    i32.const 66174
    i32.store offset=44
    local.get 3
    i32.const 65678
    i32.store offset=36
    local.get 3
    i32.const 0
    i32.store16 offset=48
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 2
    i32.const 9
    i32.shr_s
    local.set 5
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 3
              local.get 4
              i32.store offset=32
              local.get 3
              i32.const 0
              i32.store16 offset=50
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 6
            local.get 3
            local.get 4
            i32.store offset=32
            i32.const 0
            local.get 3
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 3
            local.get 6
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=50
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 3
          i32.const 418
          i32.store offset=40
          local.get 3
          i32.const 66174
          i32.store offset=68
          local.get 3
          i32.const 65773
          i32.store offset=60
          local.get 3
          i32.const 0
          i32.store16 offset=72
          local.get 3
          i32.const 0
          i32.store offset=64
          local.get 3
          i32.const 32
          i32.add
          local.set 4
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 3
        i32.const 418
        i32.store offset=40
        i32.const 0
        i32.load offset=75156
        local.set 4
        local.get 3
        i32.const 66174
        i32.store offset=68
        local.get 3
        i32.const 65773
        i32.store offset=60
        local.get 3
        i32.const 0
        i32.store16 offset=72
        local.get 3
        i32.const 0
        i32.store offset=64
        local.get 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=56
        local.get 3
        i32.const 0
        i32.store16 offset=74
        i32.const 0
        local.get 3
        i32.const 56
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 6
      local.get 3
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 3
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 6
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=74
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 3
    i32.const 66174
    i32.store offset=68
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          local.get 5
          i32.const 255
          i32.and
          i32.const 2
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 4
            i32.load offset=4
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            local.get 4
            i32.load
            local.tee 4
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.const 415
        i32.store offset=64
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        local.get 3
        i32.const 420
        i32.store offset=40
        local.get 0
        i32.const 72
        call $llAlloc__system_u4962
        local.tee 4
        local.get 1
        i32.load
        i32.store
        local.get 1
        local.get 4
        i32.store
        local.get 4
        local.get 5
        i32.store offset=4
        i32.const 0
        i32.load offset=75156
        local.set 5
        br 1 (;@1;)
      end
      local.get 3
      i32.const 413
      i32.store offset=64
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 5
      i32.store offset=75156
    end
    i32.const 0
    local.get 5
    i32.load
    local.tee 5
    i32.store offset=75156
    local.get 3
    i32.const 436
    i32.store offset=16
    local.get 4
    local.get 2
    i32.const 3
    i32.shr_u
    i32.const 60
    i32.and
    i32.add
    i32.const 8
    i32.add
    local.tee 4
    local.get 4
    i32.load
    i32.const 1
    local.get 2
    i32.shl
    i32.or
    i32.store
    i32.const 0
    local.get 5
    i32.load
    i32.store offset=75156
    local.get 3
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $splitChunk2__system_u5399 (;29;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 66174
    i32.store offset=20
    local.get 3
    i32.const 66685
    i32.store offset=12
    local.get 3
    i32.const 0
    i32.store16 offset=24
    local.get 3
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 4
              br_if 0 (;@5;)
              local.get 3
              local.get 4
              i32.store offset=8
              local.get 3
              i32.const 0
              i32.store16 offset=26
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 3
            local.get 4
            i32.store offset=8
            i32.const 0
            local.get 3
            i32.const 8
            i32.add
            i32.store offset=75156
            local.get 3
            local.get 5
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=26
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 3
          i32.const 614
          i32.store offset=16
          local.get 3
          i32.const 66116
          i32.store offset=116
          local.get 3
          i32.const 66716
          i32.store offset=108
          local.get 3
          i32.const 0
          i32.store16 offset=120
          local.get 3
          i32.const 0
          i32.store offset=112
          local.get 3
          i32.const 8
          i32.add
          local.set 5
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 3
        i32.const 614
        i32.store offset=16
        i32.const 0
        local.set 4
        i32.const 0
        i32.load offset=75156
        local.set 5
        local.get 3
        i32.const 66116
        i32.store offset=116
        local.get 3
        i32.const 66716
        i32.store offset=108
        local.get 3
        i32.const 0
        i32.store16 offset=120
        local.get 3
        i32.const 0
        i32.store offset=112
        local.get 5
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 5
      i32.load16_u offset=18
      local.set 4
      local.get 3
      local.get 5
      i32.store offset=104
      i32.const 0
      local.get 3
      i32.const 104
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 4
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=122
      local.get 5
      local.set 4
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    i32.const 0
    local.get 4
    i32.store offset=75156
    local.get 1
    i32.load offset=4
    local.set 5
    local.get 1
    local.get 2
    i32.add
    local.tee 6
    i64.const 0
    i64.store offset=12 align=4
    local.get 6
    local.get 0
    i32.store offset=8
    local.get 6
    local.get 2
    i32.store
    local.get 6
    local.get 5
    local.get 2
    i32.sub
    local.tee 7
    i32.store offset=4
    local.get 3
    i32.const 627
    i32.store offset=16
    local.get 3
    i32.const 66174
    i32.store offset=44
    local.get 3
    i32.const 66484
    i32.store offset=36
    local.get 3
    i32.const 0
    i32.store16 offset=48
    local.get 3
    i32.const 0
    i32.store offset=40
    block ;; label = @1
      block ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=32
        local.get 3
        i32.const 0
        i32.store16 offset=50
        local.get 3
        i32.const 32
        i32.add
        local.set 5
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 3
      local.get 4
      i32.store offset=32
      i32.const 0
      local.get 3
      i32.const 32
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=50
      local.get 3
      i32.const 32
      i32.add
      local.set 5
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 5
    end
    local.get 3
    i32.const 66174
    i32.store offset=44
    local.get 3
    i32.const 608
    i32.store offset=40
    local.get 1
    i32.load offset=4
    local.set 8
    local.get 3
    i32.const 66116
    i32.store offset=116
    local.get 3
    i32.const 66716
    i32.store offset=108
    local.get 3
    i32.const 0
    i32.store16 offset=120
    local.get 3
    i32.const 0
    i32.store offset=112
    i32.const 0
    local.set 4
    block ;; label = @1
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.load16_u offset=18
      local.set 4
      local.get 3
      local.get 5
      i32.store offset=104
      i32.const 0
      local.get 3
      i32.const 104
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 4
      i32.const 1
      i32.add
      local.tee 9
      i32.store16 offset=122
      local.get 5
      local.set 4
      local.get 9
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 3
    i32.const 610
    i32.store offset=40
    local.get 3
    i32.const 66174
    i32.store offset=68
    local.get 3
    i32.const 66553
    i32.store offset=60
    local.get 3
    i32.const 0
    i32.store16 offset=72
    local.get 3
    i32.const 0
    i32.store offset=64
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 3
              local.get 4
              i32.store offset=56
              local.get 3
              i32.const 0
              i32.store16 offset=74
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 3
            local.get 4
            i32.store offset=56
            i32.const 0
            local.set 4
            i32.const 0
            local.get 3
            i32.const 56
            i32.add
            i32.store offset=75156
            local.get 3
            local.get 5
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=74
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 3
          i32.const 575
          i32.store offset=64
          local.get 3
          i32.const 66174
          i32.store offset=116
          local.get 3
          i32.const 65639
          i32.store offset=108
          local.get 3
          i32.const 0
          i32.store16 offset=120
          local.get 3
          i32.const 0
          i32.store offset=112
          local.get 3
          i32.const 56
          i32.add
          local.set 5
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 3
        i32.const 575
        i32.store offset=64
        i32.const 0
        i32.load offset=75156
        local.set 5
        local.get 3
        i32.const 66174
        i32.store offset=116
        local.get 3
        i32.const 65639
        i32.store offset=108
        local.get 3
        i32.const 0
        i32.store16 offset=120
        local.get 3
        i32.const 0
        i32.store offset=112
        local.get 5
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 5
      i32.load16_u offset=18
      local.set 4
      local.get 3
      local.get 5
      i32.store offset=104
      i32.const 0
      local.get 3
      i32.const 104
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 4
      i32.const 1
      i32.add
      local.tee 9
      i32.store16 offset=122
      local.get 5
      local.set 4
      local.get 9
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 8
    local.get 1
    i32.add
    local.set 9
    local.get 3
    i32.const 66174
    i32.store offset=92
    local.get 3
    i32.const 65879
    i32.store offset=84
    local.get 3
    i32.const 0
    i32.store16 offset=96
    local.get 3
    i32.const 0
    i32.store offset=88
    block ;; label = @1
      block ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=80
        local.get 3
        i32.const 0
        i32.store16 offset=98
        local.get 3
        i32.const 80
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 3
      local.get 4
      i32.store offset=80
      i32.const 0
      local.get 3
      i32.const 80
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 5
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=98
      local.get 3
      i32.const 80
      i32.add
      local.set 4
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 4
    end
    local.get 0
    i32.const 5248
    i32.add
    local.set 8
    local.get 3
    i32.const 426
    i32.store offset=88
    local.get 3
    i32.const 66174
    i32.store offset=116
    local.get 3
    i32.const 65773
    i32.store offset=108
    local.get 3
    i32.const 0
    i32.store16 offset=120
    local.get 3
    i32.const 0
    i32.store offset=112
    local.get 9
    i32.const 21
    i32.shr_s
    local.set 5
    block ;; label = @1
      block ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=104
        local.get 3
        i32.const 0
        i32.store16 offset=122
        i32.const 0
        local.get 3
        i32.const 104
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 10
      local.get 3
      local.get 4
      i32.store offset=104
      i32.const 0
      local.get 3
      i32.const 104
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 10
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=122
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 3
    i32.const 66174
    i32.store offset=116
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 8
          local.get 5
          i32.const 255
          i32.and
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          i32.const 12
          i32.shr_s
          local.set 10
          loop ;; label = @4
            local.get 4
            i32.load offset=4
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            local.get 4
            i32.load
            local.tee 4
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.const 415
        i32.store offset=112
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        local.get 3
        i32.const 431
        i32.store offset=88
        i32.const 0
        local.get 4
        i32.load
        local.tee 4
        i32.store offset=75156
        i32.const 0
        local.get 4
        i32.load
        local.tee 4
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.const 413
      i32.store offset=112
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 5
      i32.store offset=75156
      local.get 3
      i32.const 429
      i32.store offset=88
      local.get 4
      local.get 10
      i32.const 3
      i32.shr_u
      i32.const 60
      i32.and
      i32.add
      i32.const 8
      i32.add
      i32.load
      local.set 11
      i32.const 0
      local.get 5
      i32.load
      local.tee 4
      i32.store offset=75156
      i32.const 0
      local.get 4
      i32.load
      local.tee 4
      i32.store offset=75156
      local.get 11
      local.get 10
      i32.shr_u
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 611
      i32.store offset=40
      local.get 9
      local.get 9
      i32.load
      i32.const 1
      i32.and
      local.get 7
      i32.or
      i32.store
    end
    local.get 4
    i32.load
    local.set 5
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 3
    i32.const 629
    i32.store offset=16
    local.get 3
    i32.const 66174
    i32.store offset=116
    local.get 3
    i32.const 65639
    i32.store offset=108
    local.get 3
    i32.const 0
    i32.store16 offset=120
    local.get 3
    i32.const 0
    i32.store offset=112
    i32.const 0
    local.set 4
    block ;; label = @1
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.load16_u offset=18
      local.set 4
      local.get 3
      local.get 5
      i32.store offset=104
      i32.const 0
      local.get 3
      i32.const 104
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 4
      i32.const 1
      i32.add
      local.tee 1
      i32.store16 offset=122
      local.get 5
      local.set 4
      local.get 1
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 3
    i32.const 66174
    i32.store offset=116
    local.get 3
    i32.const 66248
    i32.store offset=108
    local.get 3
    i32.const 0
    i32.store16 offset=120
    local.get 3
    i32.const 0
    i32.store offset=112
    block ;; label = @1
      block ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=104
        local.get 3
        i32.const 0
        i32.store16 offset=122
        i32.const 0
        local.get 3
        i32.const 104
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 3
      local.get 4
      i32.store offset=104
      i32.const 0
      local.get 3
      i32.const 104
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=122
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 3
    i32.const 434
    i32.store offset=112
    local.get 0
    local.get 8
    local.get 6
    i32.const 21
    i32.shr_s
    call $intSetPut__system_u5112
    local.set 4
    local.get 3
    i32.const 436
    i32.store offset=112
    local.get 4
    local.get 6
    i32.const 12
    i32.shr_s
    local.tee 5
    i32.const 3
    i32.shr_u
    i32.const 60
    i32.and
    i32.add
    i32.const 8
    i32.add
    local.tee 4
    local.get 4
    i32.load
    i32.const 1
    local.get 5
    i32.shl
    i32.or
    i32.store
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 4
    i32.store offset=75156
    i32.const 0
    local.get 4
    i32.load
    i32.store offset=75156
    local.get 3
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 6
  )
  (func $pluspercent___system_u787 (;30;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66116
    i32.store offset=20
    local.get 2
    i32.const 66716
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    i32.const 0
    local.set 3
    block ;; label = @1
      i32.const 0
      i32.load offset=75156
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=26
      local.get 4
      local.set 3
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    i32.const 0
    local.get 3
    i32.store offset=75156
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.add
  )
  (func $updatePrevSize__system_u5394 (;31;) (type 10) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 66174
    i32.store offset=20
    local.get 3
    i32.const 66484
    i32.store offset=12
    local.get 3
    i32.const 0
    i32.store16 offset=24
    local.get 3
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=8
        local.get 3
        i32.const 0
        i32.store16 offset=26
        local.get 3
        i32.const 8
        i32.add
        local.set 5
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 3
      local.get 4
      i32.store offset=8
      i32.const 0
      local.get 3
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=26
      local.get 3
      i32.const 8
      i32.add
      local.set 5
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 5
    end
    local.get 3
    i32.const 66174
    i32.store offset=20
    local.get 3
    i32.const 608
    i32.store offset=16
    local.get 1
    i32.load offset=4
    local.set 6
    local.get 3
    i32.const 66116
    i32.store offset=68
    local.get 3
    i32.const 66716
    i32.store offset=60
    local.get 3
    i32.const 0
    i32.store16 offset=72
    local.get 3
    i32.const 0
    i32.store offset=64
    i32.const 0
    local.set 4
    block ;; label = @1
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.load16_u offset=18
      local.set 4
      local.get 3
      local.get 5
      i32.store offset=56
      i32.const 0
      local.get 3
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 4
      i32.const 1
      i32.add
      local.tee 7
      i32.store16 offset=74
      local.get 5
      local.set 4
      local.get 7
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 3
    i32.const 610
    i32.store offset=16
    local.get 3
    i32.const 66174
    i32.store offset=44
    local.get 3
    i32.const 66553
    i32.store offset=36
    local.get 3
    i32.const 0
    i32.store16 offset=48
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 6
    local.get 1
    i32.add
    local.set 5
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 3
              local.get 4
              i32.store offset=32
              local.get 3
              i32.const 0
              i32.store16 offset=50
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 6
            local.get 3
            local.get 4
            i32.store offset=32
            i32.const 0
            local.set 1
            i32.const 0
            local.get 3
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 3
            local.get 6
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=50
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 3
          i32.const 575
          i32.store offset=40
          local.get 3
          i32.const 66174
          i32.store offset=68
          local.get 3
          i32.const 65639
          i32.store offset=60
          local.get 3
          i32.const 0
          i32.store16 offset=72
          local.get 3
          i32.const 0
          i32.store offset=64
          local.get 3
          i32.const 32
          i32.add
          local.set 4
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 3
        i32.const 575
        i32.store offset=40
        i32.const 0
        i32.load offset=75156
        local.set 4
        local.get 3
        i32.const 66174
        i32.store offset=68
        local.get 3
        i32.const 65639
        i32.store offset=60
        local.get 3
        i32.const 0
        i32.store16 offset=72
        local.get 3
        i32.const 0
        i32.store offset=64
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 1
      local.get 3
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 3
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 1
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=74
      local.get 4
      local.set 1
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 1
    end
    i32.const 0
    local.get 1
    i32.store offset=75156
    local.get 0
    i32.const 5248
    i32.add
    local.get 5
    i32.const 12
    i32.shr_s
    call $contains__system_u5129
    local.set 4
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 1
    i32.store offset=75156
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      local.get 5
      i32.load
      i32.const 1
      i32.and
      local.get 2
      i32.or
      i32.store
    end
    i32.const 0
    local.get 1
    i32.load
    i32.store offset=75156
    local.get 3
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $addChunkToMatrix__system_u4924 (;32;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 65600
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        local.get 2
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 2
      i32.const 8
      i32.add
      local.set 4
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 4
    end
    local.get 2
    i32.const 294
    i32.store offset=16
    local.get 1
    i32.load offset=4
    local.set 3
    local.get 2
    i32.const 66174
    i32.store offset=44
    local.get 2
    i32.const 65724
    i32.store offset=36
    local.get 2
    i32.const 0
    i32.store16 offset=48
    local.get 2
    i32.const 0
    i32.store offset=40
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 2
              local.get 4
              i32.store offset=32
              local.get 2
              i32.const 0
              i32.store16 offset=50
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 2
            local.get 4
            i32.store offset=32
            i32.const 0
            local.get 2
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 5
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=50
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 2
          i32.const 249
          i32.store offset=40
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 65745
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          local.get 2
          i32.const 32
          i32.add
          local.set 4
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 2
        i32.const 249
        i32.store offset=40
        i32.const 0
        i32.load offset=75156
        local.set 4
        local.get 2
        i32.const 66174
        i32.store offset=68
        local.get 2
        i32.const 65745
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        local.get 4
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.store offset=56
        local.get 2
        i32.const 0
        i32.store16 offset=74
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 2
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=74
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 220
    i32.store offset=64
    i32.const 0
    local.set 4
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 5
    i32.store offset=75156
    local.get 2
    i32.const 251
    i32.store offset=40
    i32.const 0
    local.get 5
    i32.load
    i32.store offset=75156
    local.get 1
    i32.const 0
    i32.store offset=16
    local.get 1
    local.get 0
    local.get 3
    i32.const 255
    i32.gt_u
    i32.const 3
    i32.shl
    i32.const 16
    i32.const 24
    local.get 3
    i32.const 16777216
    i32.lt_u
    select
    local.get 3
    i32.const 65536
    i32.lt_u
    select
    local.tee 5
    local.get 3
    local.get 5
    i32.shr_u
    i32.const 66944
    i32.add
    i32.load8_s
    i32.add
    local.tee 6
    i32.const -6
    i32.add
    local.tee 5
    i32.const 7
    i32.shl
    i32.add
    local.get 3
    local.get 6
    i32.const -5
    i32.add
    i32.shr_s
    local.tee 6
    i32.const 2
    i32.shl
    i32.add
    i32.const 2020
    i32.add
    local.tee 3
    i32.load
    i32.store offset=12
    block ;; label = @1
      local.get 3
      i32.load
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      local.get 1
      i32.store offset=16
    end
    local.get 3
    local.get 1
    i32.store
    local.get 2
    i32.const 300
    i32.store offset=16
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 65757
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    local.get 0
    local.get 5
    i32.const 2
    i32.shl
    i32.add
    i32.const 2052
    i32.add
    local.set 3
    block ;; label = @1
      i32.const 0
      i32.load offset=75156
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 1
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 7
      i32.store16 offset=74
      local.get 1
      local.set 4
      local.get 7
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 3
    local.get 3
    i32.load
    i32.const 1
    local.get 6
    i32.shl
    i32.or
    i32.store
    local.get 2
    i32.const 301
    i32.store offset=16
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 65757
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    i32.const 0
    local.set 3
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 1
      i32.store16 offset=74
      local.get 4
      local.set 3
      local.get 1
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 0
    local.get 0
    i32.load offset=2048
    i32.const 1
    local.get 5
    i32.shl
    i32.or
    i32.store offset=2048
    i32.const 0
    local.get 3
    i32.store offset=75156
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $freeBigChunk__system_u5425 (;33;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 66312
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        local.get 2
        i32.const 8
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=26
      local.get 2
      i32.const 8
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 0
    local.get 0
    i32.load offset=5232
    local.get 1
    i32.load offset=4
    i32.add
    i32.store offset=5232
    local.get 1
    local.get 1
    i32.load
    i32.const -2
    i32.and
    local.tee 5
    i32.store
    block ;; label = @1
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 643
      i32.store offset=16
      local.get 2
      i32.const 66116
      i32.store offset=68
      local.get 2
      i32.const 66713
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      i32.const 0
      local.set 4
      block ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 6
        i32.store16 offset=74
        local.get 3
        local.set 4
        local.get 6
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 4
      end
      local.get 2
      i32.const 645
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=44
      local.get 2
      i32.const 66553
      i32.store offset=36
      local.get 2
      i32.const 0
      i32.store16 offset=48
      local.get 2
      i32.const 0
      i32.store offset=40
      local.get 1
      local.get 5
      i32.sub
      local.set 5
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                local.get 2
                local.get 4
                i32.store offset=32
                local.get 2
                i32.const 0
                i32.store16 offset=50
                br 1 (;@5;)
              end
              local.get 4
              i32.load16_u offset=18
              local.set 3
              local.get 2
              local.get 4
              i32.store offset=32
              i32.const 0
              local.set 4
              i32.const 0
              local.get 2
              i32.const 32
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.store16 offset=50
              local.get 3
              i32.const 65535
              i32.and
              i32.const 2000
              i32.eq
              br_if 1 (;@4;)
            end
            local.get 2
            i32.const 575
            i32.store offset=40
            local.get 2
            i32.const 66174
            i32.store offset=68
            local.get 2
            i32.const 65639
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            local.get 2
            i32.const 32
            i32.add
            local.set 3
            br 1 (;@3;)
          end
          call $callDepthLimitReached__system_u3735
          local.get 2
          i32.const 575
          i32.store offset=40
          i32.const 0
          i32.load offset=75156
          local.set 3
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 65639
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 6
        i32.store16 offset=74
        local.get 3
        local.set 4
        local.get 6
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 4
      end
      i32.const 0
      local.get 4
      i32.store offset=75156
      local.get 0
      i32.const 5248
      i32.add
      local.tee 6
      local.get 5
      i32.const 12
      i32.shr_s
      call $contains__system_u5129
      local.set 4
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 66578
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          local.get 2
          i32.const 0
          i32.store16 offset=74
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=74
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 5
      i32.load
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 2
      i32.const 647
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 66287
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=56
          local.get 2
          i32.const 0
          i32.store16 offset=74
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=74
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 2
      i32.const 464
      i32.store offset=64
      local.get 5
      i32.load offset=4
      local.set 4
      i32.const 0
      local.get 3
      i32.store offset=75156
      local.get 4
      i32.const 4049
      i32.lt_s
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=4
      i32.const 1056964607
      i32.gt_s
      br_if 0 (;@1;)
      local.get 2
      i32.const 648
      i32.store offset=16
      local.get 0
      local.get 5
      call $removeChunkFromMatrix__system_u4876
      local.get 5
      local.get 5
      i32.load offset=4
      local.get 1
      i32.load offset=4
      i32.add
      i32.store offset=4
      local.get 2
      i32.const 650
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65639
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      i32.const 0
      local.set 3
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load16_u offset=18
        local.set 3
        local.get 2
        local.get 4
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 7
        i32.store16 offset=74
        local.get 4
        local.set 3
        local.get 7
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 2
      i32.const 66174
      i32.store offset=44
      local.get 2
      i32.const 66243
      i32.store offset=36
      local.get 2
      i32.const 0
      i32.store16 offset=48
      local.get 2
      i32.const 0
      i32.store offset=40
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=32
          local.get 2
          i32.const 0
          i32.store16 offset=50
          local.get 2
          i32.const 32
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=32
        i32.const 0
        local.get 2
        i32.const 32
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=50
        local.get 2
        i32.const 32
        i32.add
        local.set 3
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 3
      end
      local.get 2
      i32.const 439
      i32.store offset=40
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65773
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      local.get 1
      i32.const 21
      i32.shr_s
      local.set 4
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=56
          local.get 2
          i32.const 0
          i32.store16 offset=74
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 7
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 7
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=74
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 2
      i32.const 66174
      i32.store offset=68
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 6
            local.get 4
            i32.const 255
            i32.and
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 12
            i32.shr_s
            local.set 7
            loop ;; label = @5
              local.get 3
              i32.load offset=4
              local.get 4
              i32.eq
              br_if 2 (;@3;)
              local.get 3
              i32.load
              local.tee 3
              br_if 0 (;@5;)
            end
          end
          local.get 2
          i32.const 415
          i32.store offset=64
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          local.tee 1
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 2
        i32.const 413
        i32.store offset=64
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 1
        i32.store offset=75156
        local.get 2
        i32.const 443
        i32.store offset=40
        local.get 3
        local.get 7
        i32.const 3
        i32.shr_u
        i32.const 60
        i32.and
        i32.add
        i32.const 8
        i32.add
        local.tee 3
        local.get 3
        i32.load
        i32.const -2
        local.get 7
        i32.rotl
        i32.and
        i32.store
      end
      local.get 1
      i32.load
      local.set 3
      block ;; label = @2
        local.get 5
        i32.load offset=4
        i32.const 1056964609
        i32.ge_s
        br_if 0 (;@2;)
        local.get 5
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      i32.const 653
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=44
      local.get 2
      i32.const 66685
      i32.store offset=36
      local.get 2
      i32.const 0
      i32.store16 offset=48
      local.get 2
      i32.const 0
      i32.store offset=40
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                br_if 0 (;@6;)
                local.get 2
                local.get 3
                i32.store offset=32
                local.get 2
                i32.const 0
                i32.store16 offset=50
                br 1 (;@5;)
              end
              local.get 3
              i32.load16_u offset=18
              local.set 1
              local.get 2
              local.get 3
              i32.store offset=32
              i32.const 0
              local.get 2
              i32.const 32
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 1
              i32.const 1
              i32.add
              local.tee 1
              i32.store16 offset=50
              local.get 1
              i32.const 65535
              i32.and
              i32.const 2000
              i32.eq
              br_if 1 (;@4;)
            end
            local.get 2
            i32.const 614
            i32.store offset=40
            local.get 2
            i32.const 66116
            i32.store offset=68
            local.get 2
            i32.const 66716
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            local.get 2
            i32.const 32
            i32.add
            local.set 1
            br 1 (;@3;)
          end
          call $callDepthLimitReached__system_u3735
          local.get 2
          i32.const 614
          i32.store offset=40
          i32.const 0
          local.set 3
          i32.const 0
          i32.load offset=75156
          local.set 1
          local.get 2
          i32.const 66116
          i32.store offset=68
          local.get 2
          i32.const 66716
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          local.get 1
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 1
        i32.load16_u offset=18
        local.set 3
        local.get 2
        local.get 1
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=74
        local.get 1
        local.set 3
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      i32.const 0
      local.get 3
      i32.store offset=75156
      local.get 5
      i32.const 1056964620
      i32.add
      i64.const 0
      i64.store align=4
      local.get 5
      i32.const 1056964616
      i32.add
      local.get 0
      i32.store
      local.get 5
      i32.const 1056964608
      i32.add
      local.tee 1
      i32.const 1056964608
      i32.store
      local.get 5
      i32.const 1056964612
      i32.add
      local.get 5
      i32.load offset=4
      i32.const -1056964608
      i32.add
      local.tee 3
      i32.store
      local.get 2
      i32.const 627
      i32.store offset=40
      local.get 0
      local.get 5
      local.get 3
      call $updatePrevSize__system_u5394
      local.get 5
      i32.const 1056964608
      i32.store offset=4
      local.get 2
      i32.const 629
      i32.store offset=40
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65639
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      i32.const 0
      local.set 3
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load16_u offset=18
        local.set 3
        local.get 2
        local.get 4
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 7
        i32.store16 offset=74
        local.get 4
        local.set 3
        local.get 7
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      i32.const 0
      local.get 3
      i32.store offset=75156
      local.get 0
      local.get 6
      local.get 1
      i32.const 12
      i32.shr_s
      call $incl__system_u5151
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
      local.get 2
      i32.const 657
      i32.store offset=16
      local.get 0
      local.get 5
      call $addChunkToMatrix__system_u4924
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 660
    i32.store offset=16
    local.get 1
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 66116
    i32.store offset=68
    local.get 2
    i32.const 66716
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    i32.const 0
    local.set 4
    block ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=74
      local.get 3
      local.set 4
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 2
    i32.const 662
    i32.store offset=16
    local.get 2
    i32.const 66174
    i32.store offset=44
    local.get 2
    i32.const 66553
    i32.store offset=36
    local.get 2
    i32.const 0
    i32.store16 offset=48
    local.get 2
    i32.const 0
    i32.store offset=40
    local.get 5
    local.get 1
    i32.add
    local.set 5
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 2
              local.get 4
              i32.store offset=32
              local.get 2
              i32.const 0
              i32.store16 offset=50
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 3
            local.get 2
            local.get 4
            i32.store offset=32
            i32.const 0
            local.set 4
            i32.const 0
            local.get 2
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=50
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 2
          i32.const 575
          i32.store offset=40
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 65639
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          local.get 2
          i32.const 32
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 2
        i32.const 575
        i32.store offset=40
        i32.const 0
        i32.load offset=75156
        local.set 3
        local.get 2
        i32.const 66174
        i32.store offset=68
        local.get 2
        i32.const 65639
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=74
      local.get 3
      local.set 4
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    i32.const 0
    local.get 4
    i32.store offset=75156
    local.get 0
    i32.const 5248
    i32.add
    local.tee 6
    local.get 5
    i32.const 12
    i32.shr_s
    local.tee 7
    call $contains__system_u5129
    local.set 4
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 3
    i32.store offset=75156
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 66578
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=56
          i32.const 0
          local.set 3
          local.get 2
          i32.const 0
          i32.store16 offset=74
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=74
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 2
      i32.const 467
      i32.store offset=64
      local.get 5
      i32.load
      local.set 4
      i32.const 0
      local.get 3
      i32.store offset=75156
      local.get 4
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 2
      i32.const 664
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 66287
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=56
          i32.const 0
          local.set 3
          local.get 2
          i32.const 0
          i32.store16 offset=74
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=74
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 2
      i32.const 464
      i32.store offset=64
      local.get 5
      i32.load offset=4
      local.set 4
      i32.const 0
      local.get 3
      i32.store offset=75156
      local.get 4
      i32.const 4049
      i32.lt_s
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=4
      i32.const 1056964607
      i32.gt_s
      br_if 0 (;@1;)
      local.get 2
      i32.const 665
      i32.store offset=16
      local.get 0
      local.get 5
      call $removeChunkFromMatrix__system_u4876
      local.get 1
      local.get 1
      i32.load offset=4
      local.get 5
      i32.load offset=4
      i32.add
      i32.store offset=4
      local.get 2
      i32.const 667
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65639
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      i32.const 0
      local.set 3
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load16_u offset=18
        local.set 3
        local.get 2
        local.get 4
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 8
        i32.store16 offset=74
        local.get 4
        local.set 3
        local.get 8
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 2
      i32.const 66174
      i32.store offset=44
      local.get 2
      i32.const 66243
      i32.store offset=36
      local.get 2
      i32.const 0
      i32.store16 offset=48
      local.get 2
      i32.const 0
      i32.store offset=40
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=32
          local.get 2
          i32.const 0
          i32.store16 offset=50
          local.get 2
          i32.const 32
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=32
        i32.const 0
        local.get 2
        i32.const 32
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=50
        local.get 2
        i32.const 32
        i32.add
        local.set 3
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 3
      end
      local.get 2
      i32.const 439
      i32.store offset=40
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65773
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      local.get 5
      i32.const 21
      i32.shr_s
      local.set 4
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=56
          local.get 2
          i32.const 0
          i32.store16 offset=74
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 5
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 5
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=74
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 2
      i32.const 66174
      i32.store offset=68
      block ;; label = @2
        block ;; label = @3
          local.get 6
          local.get 4
          i32.const 255
          i32.and
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            loop ;; label = @5
              local.get 3
              i32.load offset=4
              local.get 4
              i32.eq
              br_if 1 (;@4;)
              local.get 3
              i32.load
              local.tee 3
              i32.eqz
              br_if 2 (;@3;)
              br 0 (;@5;)
            end
            unreachable
          end
          local.get 2
          i32.const 413
          i32.store offset=64
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          local.tee 4
          i32.store offset=75156
          local.get 2
          i32.const 443
          i32.store offset=40
          local.get 3
          local.get 7
          i32.const 3
          i32.shr_u
          i32.const 60
          i32.and
          i32.add
          i32.const 8
          i32.add
          local.tee 3
          local.get 3
          i32.load
          i32.const -2
          local.get 7
          i32.rotl
          i32.and
          i32.store
          br 1 (;@2;)
        end
        local.get 2
        i32.const 415
        i32.store offset=64
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
      end
      i32.const 0
      local.get 4
      i32.load
      local.tee 3
      i32.store offset=75156
      local.get 1
      i32.load offset=4
      i32.const 1056964609
      i32.lt_s
      br_if 0 (;@1;)
      local.get 2
      i32.const 669
      i32.store offset=16
      local.get 2
      i32.const 66174
      i32.store offset=44
      local.get 2
      i32.const 66685
      i32.store offset=36
      local.get 2
      i32.const 0
      i32.store16 offset=48
      local.get 2
      i32.const 0
      i32.store offset=40
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                br_if 0 (;@6;)
                local.get 2
                local.get 3
                i32.store offset=32
                local.get 2
                i32.const 0
                i32.store16 offset=50
                br 1 (;@5;)
              end
              local.get 3
              i32.load16_u offset=18
              local.set 5
              local.get 2
              local.get 3
              i32.store offset=32
              i32.const 0
              local.set 4
              i32.const 0
              local.get 2
              i32.const 32
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 5
              i32.const 1
              i32.add
              local.tee 3
              i32.store16 offset=50
              local.get 3
              i32.const 65535
              i32.and
              i32.const 2000
              i32.eq
              br_if 1 (;@4;)
            end
            local.get 2
            i32.const 614
            i32.store offset=40
            local.get 2
            i32.const 66116
            i32.store offset=68
            local.get 2
            i32.const 66716
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            local.get 2
            i32.const 32
            i32.add
            local.set 3
            br 1 (;@3;)
          end
          call $callDepthLimitReached__system_u3735
          local.get 2
          i32.const 614
          i32.store offset=40
          i32.const 0
          i32.load offset=75156
          local.set 3
          local.get 2
          i32.const 66116
          i32.store offset=68
          local.get 2
          i32.const 66716
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=74
        local.get 3
        local.set 4
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 4
      end
      i32.const 0
      local.get 4
      i32.store offset=75156
      local.get 1
      i32.const 1056964620
      i32.add
      i64.const 0
      i64.store align=4
      local.get 1
      i32.const 1056964616
      i32.add
      local.get 0
      i32.store
      local.get 1
      i32.const 1056964608
      i32.add
      local.tee 3
      i32.const 1056964608
      i32.store
      local.get 1
      i32.const 1056964612
      i32.add
      local.get 1
      i32.load offset=4
      i32.const -1056964608
      i32.add
      local.tee 4
      i32.store
      local.get 2
      i32.const 627
      i32.store offset=40
      local.get 0
      local.get 1
      local.get 4
      call $updatePrevSize__system_u5394
      local.get 1
      i32.const 1056964608
      i32.store offset=4
      local.get 2
      i32.const 629
      i32.store offset=40
      local.get 2
      i32.const 66174
      i32.store offset=68
      local.get 2
      i32.const 65639
      i32.store offset=60
      local.get 2
      i32.const 0
      i32.store16 offset=72
      local.get 2
      i32.const 0
      i32.store offset=64
      i32.const 0
      local.set 4
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 5
        i32.store offset=56
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 7
        i32.store16 offset=74
        local.get 5
        local.set 4
        local.get 7
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 4
      end
      i32.const 0
      local.get 4
      i32.store offset=75156
      local.get 0
      local.get 6
      local.get 3
      i32.const 12
      i32.shr_s
      call $incl__system_u5151
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
      local.get 2
      i32.const 670
      i32.store offset=16
      local.get 0
      local.get 3
      call $addChunkToMatrix__system_u4924
    end
    local.get 2
    i32.const 671
    i32.store offset=16
    local.get 0
    local.get 1
    call $addChunkToMatrix__system_u4924
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $freeHugeChunk__system_u5473 (;34;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 66354
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        local.get 2
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 2
      i32.const 8
      i32.add
      local.set 4
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 4
    end
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 1
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 736
    i32.store offset=16
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 65639
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    i32.const 0
    local.set 3
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=74
      local.get 4
      local.set 3
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 2
    i32.const 66174
    i32.store offset=44
    local.get 2
    i32.const 66243
    i32.store offset=36
    local.get 2
    i32.const 0
    i32.store16 offset=48
    local.get 2
    i32.const 0
    i32.store offset=40
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=32
        local.get 2
        i32.const 0
        i32.store16 offset=50
        local.get 2
        i32.const 32
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=32
      i32.const 0
      local.get 2
      i32.const 32
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=50
      local.get 2
      i32.const 32
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 0
    i32.const 5248
    i32.add
    local.set 6
    local.get 2
    i32.const 439
    i32.store offset=40
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 65773
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    local.get 1
    i32.const 21
    i32.shr_s
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=56
        local.get 2
        i32.const 0
        i32.store16 offset=74
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 7
      local.get 2
      local.get 3
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 7
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=74
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 66174
    i32.store offset=68
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 6
          local.get 4
          i32.const 255
          i32.and
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 12
          i32.shr_s
          local.set 6
          loop ;; label = @4
            local.get 3
            i32.load offset=4
            local.get 4
            i32.eq
            br_if 2 (;@2;)
            local.get 3
            i32.load
            local.tee 3
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.const 415
        i32.store offset=64
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 413
      i32.store offset=64
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 4
      i32.store offset=75156
      local.get 2
      i32.const 443
      i32.store offset=40
      local.get 3
      local.get 6
      i32.const 3
      i32.shr_u
      i32.const 60
      i32.and
      i32.add
      i32.const 8
      i32.add
      local.tee 3
      local.get 3
      i32.load
      i32.const -2
      local.get 6
      i32.rotl
      i32.and
      i32.store
    end
    local.get 4
    i32.load
    local.set 4
    local.get 2
    i32.const 737
    i32.store offset=16
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 66207
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    i32.const 0
    local.set 3
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=74
      local.get 4
      local.set 3
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 0
    local.get 0
    i32.load offset=5224
    local.tee 4
    local.get 5
    i32.sub
    i32.store offset=5224
    local.get 0
    local.get 0
    i32.load offset=5228
    local.tee 6
    local.get 4
    local.get 6
    local.get 4
    i32.gt_s
    select
    i32.store offset=5228
    local.get 2
    i32.const 738
    i32.store offset=16
    local.get 2
    i32.const 66172
    i32.store offset=68
    local.get 2
    i32.const 65933
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=56
        local.get 2
        i32.const 0
        i32.store16 offset=74
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=74
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 66172
    i32.store offset=68
    local.get 2
    i32.const 153
    i32.store offset=64
    local.get 1
    local.get 5
    call $__munmap
    drop
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 3
    i32.store offset=75156
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $deallocBigChunk__system_u5495 (;35;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 66325
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 0
    local.get 0
    i32.load offset=5236
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.sub
    i32.store offset=5236
    local.get 2
    i32.const 804
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.const 1056964609
        i32.lt_s
        br_if 0 (;@2;)
        local.get 2
        i32.const 66174
        i32.store offset=44
        local.get 2
        i32.const 66354
        i32.store offset=36
        local.get 2
        i32.const 0
        i32.store16 offset=48
        local.get 2
        i32.const 0
        i32.store offset=40
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 4
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            i32.store offset=32
            local.get 2
            i32.const 0
            i32.store16 offset=50
            local.get 2
            i32.const 32
            i32.add
            local.set 5
            br 1 (;@3;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 5
          local.get 2
          local.get 4
          i32.store offset=32
          i32.const 0
          local.get 2
          i32.const 32
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 5
          i32.const 1
          i32.add
          local.tee 4
          i32.store16 offset=50
          local.get 2
          i32.const 32
          i32.add
          local.set 5
          local.get 4
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          local.set 5
          local.get 1
          i32.load offset=4
          local.set 3
        end
        local.get 2
        i32.const 736
        i32.store offset=40
        local.get 2
        i32.const 66174
        i32.store offset=44
        local.get 2
        i32.const 66174
        i32.store offset=68
        local.get 2
        i32.const 65639
        i32.store offset=60
        i32.const 0
        local.set 4
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        i32.const 0
        local.set 6
        block ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.load16_u offset=18
          local.set 6
          local.get 2
          local.get 5
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 6
          i32.const 1
          i32.add
          local.tee 7
          i32.store16 offset=74
          local.get 5
          local.set 6
          local.get 7
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 6
        end
        i32.const 0
        local.get 6
        i32.store offset=75156
        local.get 0
        i32.const 5248
        i32.add
        local.get 1
        i32.const 12
        i32.shr_s
        call $excl__system_u5173
        local.get 2
        i32.const 737
        i32.store offset=40
        local.get 2
        i32.const 66174
        i32.store offset=68
        local.get 2
        i32.const 66207
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.load16_u offset=18
          local.set 4
          local.get 2
          local.get 5
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 4
          i32.const 1
          i32.add
          local.tee 6
          i32.store16 offset=74
          local.get 5
          local.set 4
          local.get 6
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 4
        end
        local.get 0
        local.get 0
        i32.load offset=5224
        local.tee 5
        local.get 3
        i32.sub
        i32.store offset=5224
        local.get 0
        local.get 0
        i32.load offset=5228
        local.tee 6
        local.get 5
        local.get 6
        local.get 5
        i32.gt_s
        select
        i32.store offset=5228
        local.get 2
        i32.const 738
        i32.store offset=40
        local.get 2
        i32.const 66172
        i32.store offset=68
        local.get 2
        i32.const 65933
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        block ;; label = @3
          block ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            i32.store offset=56
            local.get 2
            i32.const 0
            i32.store16 offset=74
            i32.const 0
            local.get 2
            i32.const 56
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 0
          local.get 2
          local.get 4
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.store16 offset=74
          local.get 0
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 66172
        i32.store offset=68
        local.get 2
        i32.const 153
        i32.store offset=64
        local.get 1
        local.get 3
        call $__munmap
        drop
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 0
        i32.store offset=75156
        i32.const 0
        local.get 0
        i32.load
        local.tee 0
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 805
      i32.store offset=16
      local.get 0
      local.get 1
      call $freeBigChunk__system_u5425
      i32.const 0
      i32.load offset=75156
      local.set 0
    end
    i32.const 0
    local.get 0
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $rawDealloc__system_u5753 (;36;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 66614
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.store
              local.get 2
              i32.const 0
              i32.store16 offset=18
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 3
            i32.store
            i32.const 0
            local.get 2
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=18
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 2
          i32.const 996
          i32.store offset=8
          local.get 2
          i32.const 66174
          i32.store offset=36
          local.get 2
          i32.const 66005
          i32.store offset=28
          local.get 2
          i32.const 0
          i32.store16 offset=40
          local.get 2
          i32.const 0
          i32.store offset=32
          local.get 2
          local.set 4
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 2
        i32.const 996
        i32.store offset=8
        i32.const 0
        local.set 3
        i32.const 0
        i32.load offset=75156
        local.set 4
        local.get 2
        i32.const 66174
        i32.store offset=36
        local.get 2
        i32.const 66005
        i32.store offset=28
        local.get 2
        i32.const 0
        i32.store16 offset=40
        local.get 2
        i32.const 0
        i32.store offset=32
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=42
      local.get 4
      local.set 3
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 2
    i32.const 998
    i32.store offset=8
    local.get 2
    i32.const 66174
    i32.store offset=36
    local.get 2
    i32.const 66287
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    local.get 1
    i32.const -4096
    i32.and
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 5
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 5
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=42
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 2
    i32.const 464
    i32.store offset=32
    local.get 4
    i32.load offset=4
    local.set 5
    i32.const 0
    local.get 3
    i32.store offset=75156
    block ;; label = @1
      block ;; label = @2
        local.get 5
        i32.const 4048
        i32.gt_s
        br_if 0 (;@2;)
        local.get 4
        i32.load offset=4
        local.set 5
        block ;; label = @3
          local.get 4
          i32.load offset=8
          local.get 0
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          local.get 0
          i32.load offset=5236
          local.get 5
          i32.sub
          i32.store offset=5236
          block ;; label = @4
            local.get 0
            local.get 5
            i32.const 16
            i32.div_s
            i32.const 2
            i32.shl
            i32.add
            local.tee 6
            i32.load
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 4
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 3
            i32.load offset=20
            i32.store
            local.get 3
            local.get 1
            i32.store offset=20
            local.get 3
            local.get 3
            i32.load offset=24
            local.get 5
            i32.add
            i32.store offset=24
            local.get 3
            local.get 3
            i32.load offset=32
            i32.const 1
            i32.add
            i32.store offset=32
            br 3 (;@1;)
          end
          local.get 1
          local.get 4
          i32.load offset=20
          i32.store
          local.get 4
          local.get 1
          i32.store offset=20
          block ;; label = @4
            local.get 4
            i32.load offset=24
            local.tee 3
            local.get 5
            i32.ge_s
            br_if 0 (;@4;)
            local.get 2
            i32.const 1036
            i32.store offset=8
            local.get 2
            i32.const 66174
            i32.store offset=36
            local.get 2
            i32.const 66590
            i32.store offset=28
            local.get 2
            i32.const 0
            i32.store16 offset=40
            local.get 2
            i32.const 0
            i32.store offset=32
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=75156
                local.tee 3
                br_if 0 (;@6;)
                local.get 2
                local.get 3
                i32.store offset=24
                local.get 2
                i32.const 0
                i32.store16 offset=42
                i32.const 0
                local.get 2
                i32.const 24
                i32.add
                i32.store offset=75156
                br 1 (;@5;)
              end
              local.get 3
              i32.load16_u offset=18
              local.set 0
              local.get 2
              local.get 3
              i32.store offset=24
              i32.const 0
              local.get 2
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 0
              i32.const 1
              i32.add
              local.tee 3
              i32.store16 offset=42
              local.get 3
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
            end
            local.get 4
            local.get 6
            i32.load
            i32.store offset=12
            block ;; label = @5
              local.get 6
              i32.load
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              local.get 4
              i32.store offset=16
            end
            local.get 6
            local.get 4
            i32.store
            i32.const 0
            i32.const 0
            i32.load offset=75156
            i32.load
            i32.store offset=75156
            local.get 4
            local.get 4
            i32.load offset=24
            local.get 5
            i32.add
            i32.store offset=24
            br 3 (;@1;)
          end
          local.get 4
          local.get 3
          local.get 5
          i32.add
          local.tee 3
          i32.store offset=24
          local.get 3
          i32.const 4048
          i32.ne
          br_if 2 (;@1;)
          local.get 4
          i32.load offset=32
          br_if 2 (;@1;)
          local.get 2
          i32.const 1044
          i32.store offset=8
          local.get 6
          local.get 4
          call $listRemove__system_u5691
          local.get 4
          i32.const 4096
          i32.store offset=4
          local.get 2
          i32.const 1046
          i32.store offset=8
          local.get 0
          local.get 4
          call $freeBigChunk__system_u5425
          br 2 (;@1;)
        end
        local.get 2
        i32.const 1051
        i32.store offset=8
        local.get 2
        i32.const 66174
        i32.store offset=36
        local.get 2
        i32.const 65688
        i32.store offset=28
        local.get 2
        i32.const 0
        i32.store16 offset=40
        local.get 2
        i32.const 0
        i32.store offset=32
        local.get 5
        i32.const 16
        i32.div_s
        local.set 0
        block ;; label = @3
          block ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=24
            local.get 2
            i32.const 0
            i32.store16 offset=42
            i32.const 0
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 5
          local.get 2
          local.get 3
          i32.store offset=24
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 5
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=42
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 1
        local.get 4
        i32.load offset=8
        local.get 0
        i32.const 2
        i32.shl
        i32.add
        i32.const 1024
        i32.add
        local.tee 3
        i32.load
        i32.store
        local.get 3
        local.get 1
        i32.store
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.load offset=8
        local.tee 1
        local.get 0
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.const 1060
        i32.store offset=8
        local.get 2
        i32.const 66174
        i32.store offset=36
        local.get 2
        i32.const 66325
        i32.store offset=28
        local.get 2
        i32.const 0
        i32.store16 offset=40
        local.get 2
        i32.const 0
        i32.store offset=32
        block ;; label = @3
          block ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=24
            local.get 2
            i32.const 0
            i32.store16 offset=42
            i32.const 0
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 1
          local.get 2
          local.get 3
          i32.store offset=24
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=42
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 0
        local.get 0
        i32.load offset=5236
        local.get 4
        i32.load offset=4
        local.tee 3
        i32.sub
        i32.store offset=5236
        local.get 2
        i32.const 804
        i32.store offset=32
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.const 1056964609
            i32.lt_s
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            call $freeHugeChunk__system_u5473
            br 1 (;@3;)
          end
          local.get 2
          i32.const 805
          i32.store offset=32
          local.get 0
          local.get 4
          call $freeBigChunk__system_u5425
        end
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 1062
      i32.store offset=8
      local.get 2
      i32.const 66174
      i32.store offset=36
      local.get 2
      i32.const 65904
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=24
          local.get 2
          i32.const 0
          i32.store16 offset=42
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          local.get 2
          i32.const 24
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 0
        local.get 2
        local.get 3
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        i32.store16 offset=42
        local.get 2
        i32.const 24
        i32.add
        local.set 3
        local.get 0
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 3
      end
      local.get 4
      local.get 1
      i32.load offset=5244
      i32.store offset=12
      local.get 1
      local.get 4
      i32.store offset=5244
      i32.const 0
      local.get 3
      i32.load
      i32.store offset=75156
    end
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $listRemove__system_u5691 (;37;) (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 66507
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 1
    i32.load offset=12
    local.set 3
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          i32.store
          i32.const 0
          local.set 0
          local.get 3
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 1
        i32.load offset=16
        local.get 3
        i32.store offset=12
        local.get 1
        i32.load offset=12
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load offset=16
        local.set 0
      end
      local.get 3
      local.get 0
      i32.store offset=16
    end
    local.get 1
    i64.const 0
    i64.store offset=12 align=4
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $dealloc (;38;) (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 66174
    i32.store offset=20
    local.get 1
    i32.const 66606
    i32.store offset=12
    local.get 1
    i32.const 0
    i32.store16 offset=24
    local.get 1
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 2
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 1
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.load16_u offset=18
      local.set 3
      local.get 1
      local.get 2
      i32.store offset=8
      i32.const 0
      local.get 1
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 3
      i32.const 1
      i32.add
      local.tee 2
      i32.store16 offset=26
      local.get 2
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 1
    i32.const 1164
    i32.store offset=16
    i32.const 68628
    local.get 0
    call $rawDealloc__system_u5753
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $alignedDealloc (;39;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 16
        i32.gt_s
        br_if 0 (;@2;)
        local.get 2
        i32.const 66174
        i32.store offset=20
        local.get 2
        i32.const 66606
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 1
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.store offset=8
            local.get 2
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 1
          i32.load16_u offset=18
          local.set 3
          local.get 2
          local.get 1
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 3
          i32.const 1
          i32.add
          local.tee 1
          i32.store16 offset=26
          local.get 1
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 1164
        i32.store offset=16
        i32.const 68628
        local.get 0
        call $rawDealloc__system_u5753
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 66116
      i32.store offset=20
      local.get 2
      i32.const 66713
      i32.store offset=12
      i32.const 0
      local.set 3
      local.get 2
      i32.const 0
      i32.store16 offset=24
      local.get 2
      i32.const 0
      i32.store offset=16
      i32.const 0
      local.set 1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load16_u offset=18
        local.set 1
        local.get 2
        local.get 4
        i32.store offset=8
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=26
        local.get 4
        local.set 1
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 1
      end
      local.get 0
      i32.const -2
      i32.add
      i32.load16_u
      local.set 4
      local.get 2
      i32.const 66116
      i32.store offset=20
      local.get 2
      i32.const 66713
      i32.store offset=12
      local.get 2
      i32.const 0
      i32.store16 offset=24
      local.get 2
      i32.const 0
      i32.store offset=16
      block ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load16_u offset=18
        local.set 3
        local.get 2
        local.get 1
        i32.store offset=8
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=26
        local.get 1
        local.set 3
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 2
      i32.const 66174
      i32.store offset=20
      local.get 2
      i32.const 66606
      i32.store offset=12
      local.get 2
      i32.const 0
      i32.store16 offset=24
      local.get 2
      i32.const 0
      i32.store offset=16
      local.get 0
      local.get 4
      i32.sub
      local.set 0
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=8
          local.get 2
          i32.const 0
          i32.store16 offset=26
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 1
        local.get 2
        local.get 3
        i32.store offset=8
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.store16 offset=26
        local.get 1
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 2
      i32.const 1164
      i32.store offset=16
      i32.const 68628
      local.get 0
      call $rawDealloc__system_u5753
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $nimRawDispose (;40;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66164
    i32.store offset=12
    local.get 2
    i32.const 66518
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 66164
    i32.store offset=12
    local.get 2
    i32.const 187
    i32.store offset=8
    local.get 2
    i32.const 66143
    i32.store offset=36
    local.get 2
    i32.const 66039
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 4
        local.set 5
        br 1 (;@1;)
      end
      local.get 2
      i32.const 1108
      i32.store offset=32
      block ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 3
        local.get 1
        i32.ge_s
        br_if 0 (;@2;)
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 3
        i32.lt_s
        br_if 0 (;@2;)
        local.get 4
        local.get 3
        i32.const -1
        i32.xor
        i32.and
        local.set 5
        br 1 (;@1;)
      end
      call $raiseOverflow
    end
    i32.const 0
    local.set 3
    i32.const 0
    i32.load offset=75156
    i32.load
    local.set 4
    local.get 2
    i32.const 66184
    i32.store offset=12
    local.get 2
    i32.const 64
    i32.store offset=8
    local.get 2
    i32.const 66116
    i32.store offset=36
    local.get 2
    i32.const 66713
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=42
      local.get 4
      local.set 3
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 2
    i32.const 66164
    i32.store offset=12
    local.get 2
    i32.const 188
    i32.store offset=8
    local.get 0
    local.get 5
    i32.sub
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 16
        i32.gt_s
        br_if 0 (;@2;)
        local.get 2
        i32.const 66174
        i32.store offset=36
        local.get 2
        i32.const 66606
        i32.store offset=28
        local.get 2
        i32.const 0
        i32.store16 offset=40
        local.get 2
        i32.const 0
        i32.store offset=32
        block ;; label = @3
          block ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=24
            local.get 2
            i32.const 0
            i32.store16 offset=42
            i32.const 0
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 1
          local.get 2
          local.get 3
          i32.store offset=24
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=42
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 1164
        i32.store offset=32
        i32.const 68628
        local.get 4
        call $rawDealloc__system_u5753
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 3
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 66116
      i32.store offset=36
      local.get 2
      i32.const 66713
      i32.store offset=28
      i32.const 0
      local.set 0
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      i32.const 0
      local.set 1
      block ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load16_u offset=18
        local.set 1
        local.get 2
        local.get 3
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=42
        local.get 3
        local.set 1
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 1
      end
      local.get 4
      i32.const -2
      i32.add
      i32.load16_u
      local.set 3
      local.get 2
      i32.const 66116
      i32.store offset=36
      local.get 2
      i32.const 66713
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      block ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load16_u offset=18
        local.set 0
        local.get 2
        local.get 1
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 0
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=42
        local.get 1
        local.set 0
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 0
      end
      local.get 2
      i32.const 66174
      i32.store offset=36
      local.get 2
      i32.const 66606
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      local.get 4
      local.get 3
      i32.sub
      local.set 3
      block ;; label = @2
        block ;; label = @3
          local.get 0
          br_if 0 (;@3;)
          local.get 2
          local.get 0
          i32.store offset=24
          local.get 2
          i32.const 0
          i32.store16 offset=42
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 0
        i32.load16_u offset=18
        local.set 1
        local.get 2
        local.get 0
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.store16 offset=42
        local.get 1
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 2
      i32.const 1164
      i32.store offset=32
      i32.const 68628
      local.get 3
      call $rawDealloc__system_u5753
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 3
      i32.store offset=75156
    end
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $raiseOverflow (;41;) (type 5)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 66154
    i32.store offset=20
    local.get 0
    i32.const 66253
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.store16 offset=24
    local.get 0
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 1
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store offset=8
        local.get 0
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 0
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 1
      i32.load16_u offset=18
      local.set 2
      local.get 0
      local.get 1
      i32.store offset=8
      i32.const 0
      local.get 0
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 0
      local.get 2
      i32.const 1
      i32.add
      local.tee 1
      i32.store16 offset=26
      local.get 1
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    i32.const 32
    i32.const 4
    call $nimNewObj
    local.tee 1
    i32.const 18
    i32.store offset=12
    local.get 1
    i32.const 65795
    i32.store offset=8
    local.get 1
    i32.const 68252
    i32.store
    local.get 1
    i32.const 16
    i32.add
    i32.const 67588
    i32.store
    local.get 0
    i32.const 66154
    i32.store offset=20
    local.get 0
    i32.const 53
    i32.store offset=16
    local.get 1
    i32.const 65795
    local.get 0
    local.get 0
    local.get 0
    call $raiseExceptionEx
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $nimDestroyAndDispose (;42;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 66164
    i32.store offset=20
    local.get 1
    i32.const 66532
    i32.store offset=12
    local.get 1
    i32.const 0
    i32.store16 offset=24
    local.get 1
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 2
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 1
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.load16_u offset=18
      local.set 3
      local.get 1
      local.get 2
      i32.store offset=8
      i32.const 0
      local.get 1
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 1
      local.get 3
      i32.const 1
      i32.add
      local.tee 2
      i32.store16 offset=26
      local.get 2
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load
        local.tee 2
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 196
        i32.store offset=16
        local.get 0
        local.get 3
        call_indirect (type 0)
        block ;; label = @3
          i32.const 0
          i32.load8_u offset=75168
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=75156
          local.set 2
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.set 2
      end
      local.get 1
      i32.const 204
      i32.store offset=16
      local.get 2
      i32.load16_s offset=8
      local.set 2
      local.get 1
      i32.const 66164
      i32.store offset=44
      local.get 1
      i32.const 66518
      i32.store offset=36
      local.get 1
      i32.const 0
      i32.store16 offset=48
      local.get 1
      i32.const 0
      i32.store offset=40
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 3
          br_if 0 (;@3;)
          local.get 1
          local.get 3
          i32.store offset=32
          local.get 1
          i32.const 0
          i32.store16 offset=50
          local.get 1
          i32.const 32
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 1
        local.get 3
        i32.store offset=32
        i32.const 0
        local.get 1
        i32.const 32
        i32.add
        i32.store offset=75156
        local.get 1
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=50
        local.get 1
        i32.const 32
        i32.add
        local.set 3
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 3
      end
      local.get 1
      i32.const 66164
      i32.store offset=44
      local.get 1
      i32.const 187
      i32.store offset=40
      local.get 1
      i32.const 66143
      i32.store offset=68
      local.get 1
      i32.const 66039
      i32.store offset=60
      local.get 1
      i32.const 0
      i32.store16 offset=72
      local.get 1
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 1
          local.get 3
          i32.store offset=56
          local.get 1
          i32.const 0
          i32.store16 offset=74
          i32.const 0
          local.get 1
          i32.const 56
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 1
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 1
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 1
        local.get 4
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=74
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 1
      i32.const 1108
      i32.const 1106
      local.get 2
      select
      i32.store offset=64
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
      local.get 1
      i32.const 66184
      i32.store offset=44
      local.get 1
      i32.const 64
      i32.store offset=40
      local.get 1
      i32.const 66116
      i32.store offset=68
      local.get 1
      i32.const 66713
      i32.store offset=60
      local.get 1
      i32.const 0
      i32.store16 offset=72
      local.get 1
      i32.const 0
      i32.store offset=64
      local.get 2
      i32.const 3
      i32.add
      i32.const 0
      local.get 2
      i32.sub
      i32.and
      i32.const 4
      local.get 2
      select
      local.set 5
      i32.const 0
      local.set 4
      block ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 1
        local.get 3
        i32.store offset=56
        i32.const 0
        local.get 1
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 1
        local.get 4
        i32.const 1
        i32.add
        local.tee 6
        i32.store16 offset=74
        local.get 3
        local.set 4
        local.get 6
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 4
      end
      i32.const 0
      local.get 4
      i32.store offset=75156
      local.get 1
      i32.const 66164
      i32.store offset=44
      local.get 1
      i32.const 188
      i32.store offset=40
      local.get 0
      local.get 5
      i32.sub
      local.get 2
      call $alignedDealloc
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 2
      i32.store offset=75156
    end
    i32.const 0
    local.get 2
    i32.load
    i32.store offset=75156
    local.get 1
    i32.const 80
    i32.add
    global.set $__stack_pointer
  )
  (func $eqdestroy___stdZassertions_u69 (;43;) (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 3
      i32.add
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 1
      i32.const 66174
      i32.store offset=20
      local.get 1
      i32.const 66606
      i32.store offset=12
      local.get 1
      i32.const 0
      i32.store16 offset=24
      local.get 1
      i32.const 0
      i32.store offset=16
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 2
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store offset=8
          local.get 1
          i32.const 0
          i32.store16 offset=26
          i32.const 0
          local.get 1
          i32.const 8
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 2
        i32.load16_u offset=18
        local.set 3
        local.get 1
        local.get 2
        i32.store offset=8
        i32.const 0
        local.get 1
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 1
        local.get 3
        i32.const 1
        i32.add
        local.tee 2
        i32.store16 offset=26
        local.get 2
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 1
      i32.const 1164
      i32.store offset=16
      i32.const 68628
      local.get 0
      call $rawDealloc__system_u5753
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $requestOsChunks__system_u5351 (;44;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 65888
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load8_u offset=6274
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=6276
        local.set 3
        br 1 (;@1;)
      end
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load offset=5236
          local.tee 3
          i32.const 65535
          i32.gt_s
          br_if 0 (;@3;)
          i32.const 16384
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        i32.const 524
        i32.store offset=16
        local.get 2
        i32.const 66172
        i32.store offset=68
        local.get 2
        i32.const 66021
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        local.get 3
        i32.const 2
        i32.shr_u
        local.set 5
        i32.const 0
        local.set 3
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load16_u offset=18
          local.set 3
          local.get 2
          local.get 4
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 3
          i32.const 1
          i32.add
          local.tee 6
          i32.store16 offset=74
          local.get 4
          local.set 3
          local.get 6
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 3
        end
        i32.const 0
        local.get 3
        i32.store offset=75156
        local.get 5
        i32.const 4095
        i32.add
        i32.const 2147479552
        i32.and
        local.tee 3
        local.get 0
        i32.load offset=6276
        i32.const 1
        i32.shl
        local.tee 4
        local.get 3
        local.get 4
        i32.lt_s
        select
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=6276
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                local.get 1
                i32.ge_s
                br_if 0 (;@6;)
                local.get 2
                i32.const 529
                i32.store offset=16
                local.get 2
                i32.const 66174
                i32.store offset=44
                local.get 2
                i32.const 65937
                i32.store offset=36
                local.get 2
                i32.const 0
                i32.store16 offset=48
                local.get 2
                i32.const 0
                i32.store offset=40
                block ;; label = @7
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=75156
                    local.tee 3
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 0
                    i32.store offset=32
                    local.get 2
                    i32.const 0
                    i32.store16 offset=50
                    local.get 2
                    i32.const 32
                    i32.add
                    local.set 3
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.load16_u offset=18
                  local.set 4
                  local.get 2
                  local.get 3
                  i32.store offset=32
                  i32.const 0
                  local.get 2
                  i32.const 32
                  i32.add
                  i32.store offset=75156
                  local.get 2
                  local.get 4
                  i32.const 1
                  i32.add
                  local.tee 4
                  i32.store16 offset=50
                  local.get 2
                  i32.const 32
                  i32.add
                  local.set 3
                  local.get 4
                  i32.const 65535
                  i32.and
                  i32.const 2000
                  i32.ne
                  br_if 0 (;@7;)
                  call $callDepthLimitReached__system_u3735
                  i32.const 0
                  i32.load offset=75156
                  local.set 3
                end
                local.get 2
                i32.const 322
                i32.store offset=40
                local.get 2
                i32.const 66174
                i32.store offset=44
                local.get 2
                i32.const 66172
                i32.store offset=68
                local.get 2
                i32.const 65978
                i32.store offset=60
                local.get 2
                i32.const 0
                i32.store16 offset=72
                local.get 2
                i32.const 0
                i32.store offset=64
                block ;; label = @7
                  block ;; label = @8
                    local.get 3
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 0
                    i32.store offset=56
                    local.get 2
                    i32.const 0
                    i32.store16 offset=74
                    i32.const 0
                    local.get 2
                    i32.const 56
                    i32.add
                    i32.store offset=75156
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.load16_u offset=18
                  local.set 4
                  local.get 2
                  local.get 3
                  i32.store offset=56
                  i32.const 0
                  local.get 2
                  i32.const 56
                  i32.add
                  i32.store offset=75156
                  local.get 2
                  local.get 4
                  i32.const 1
                  i32.add
                  local.tee 3
                  i32.store16 offset=74
                  local.get 3
                  i32.const 65535
                  i32.and
                  i32.const 2000
                  i32.ne
                  br_if 0 (;@7;)
                  call $callDepthLimitReached__system_u3735
                end
                local.get 2
                i32.const 142
                i32.store offset=64
                local.get 2
                i32.const 66172
                i32.store offset=68
                i32.const 0
                local.get 1
                i32.const 3
                i32.const 34
                i32.const -1
                i64.const 0
                call $__mmap
                local.tee 5
                i32.const 1
                i32.add
                i32.const 1
                i32.le_u
                br_if 2 (;@4;)
                i32.const 0
                i32.const 0
                i32.load offset=75156
                i32.load
                local.tee 3
                i32.store offset=75156
                local.get 3
                i32.load
                local.set 3
                br 1 (;@5;)
              end
              local.get 2
              i32.const 531
              i32.store offset=16
              local.get 2
              i32.const 66174
              i32.store offset=44
              local.get 2
              i32.const 65948
              i32.store offset=36
              local.get 2
              i32.const 0
              i32.store16 offset=48
              local.get 2
              i32.const 0
              i32.store offset=40
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=75156
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 0
                  i32.store offset=32
                  local.get 2
                  i32.const 0
                  i32.store16 offset=50
                  local.get 2
                  i32.const 32
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 4
                i32.load16_u offset=18
                local.set 5
                local.get 2
                local.get 4
                i32.store offset=32
                i32.const 0
                local.get 2
                i32.const 32
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 5
                i32.const 1
                i32.add
                local.tee 5
                i32.store16 offset=50
                local.get 2
                i32.const 32
                i32.add
                local.set 4
                local.get 5
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                local.set 4
              end
              local.get 2
              i32.const 328
              i32.store offset=40
              local.get 2
              i32.const 66174
              i32.store offset=44
              local.get 2
              i32.const 66172
              i32.store offset=68
              local.get 2
              i32.const 65962
              i32.store offset=60
              local.get 2
              i32.const 0
              i32.store16 offset=72
              local.get 2
              i32.const 0
              i32.store offset=64
              block ;; label = @6
                block ;; label = @7
                  local.get 4
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 0
                  i32.store offset=56
                  local.get 2
                  i32.const 0
                  i32.store16 offset=74
                  i32.const 0
                  local.get 2
                  i32.const 56
                  i32.add
                  i32.store offset=75156
                  br 1 (;@6;)
                end
                local.get 4
                i32.load16_u offset=18
                local.set 5
                local.get 2
                local.get 4
                i32.store offset=56
                i32.const 0
                local.get 2
                i32.const 56
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 5
                i32.const 1
                i32.add
                local.tee 4
                i32.store16 offset=74
                local.get 4
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
              end
              local.get 2
              i32.const 148
              i32.store offset=64
              local.get 2
              i32.const 66172
              i32.store offset=68
              i32.const 0
              local.get 3
              i32.const 3
              i32.const 34
              i32.const -1
              i64.const 0
              call $__mmap
              local.set 5
              local.get 2
              i32.const 150
              i32.store offset=64
              i32.const 0
              i32.const 0
              i32.load offset=75156
              i32.load
              local.tee 3
              i32.store offset=75156
              local.get 3
              i32.load
              local.set 3
              block ;; label = @6
                local.get 5
                i32.const 1
                i32.add
                i32.const 1
                i32.gt_u
                br_if 0 (;@6;)
                local.get 2
                i32.const 533
                i32.store offset=16
                local.get 2
                i32.const 66174
                i32.store offset=44
                local.get 2
                i32.const 65937
                i32.store offset=36
                local.get 2
                i32.const 0
                i32.store16 offset=48
                local.get 2
                i32.const 0
                i32.store offset=40
                block ;; label = @7
                  block ;; label = @8
                    local.get 3
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 0
                    i32.store offset=32
                    local.get 2
                    i32.const 0
                    i32.store16 offset=50
                    local.get 2
                    i32.const 32
                    i32.add
                    local.set 3
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.load16_u offset=18
                  local.set 4
                  local.get 2
                  local.get 3
                  i32.store offset=32
                  i32.const 0
                  local.get 2
                  i32.const 32
                  i32.add
                  i32.store offset=75156
                  local.get 2
                  local.get 4
                  i32.const 1
                  i32.add
                  local.tee 4
                  i32.store16 offset=50
                  local.get 2
                  i32.const 32
                  i32.add
                  local.set 3
                  local.get 4
                  i32.const 65535
                  i32.and
                  i32.const 2000
                  i32.ne
                  br_if 0 (;@7;)
                  call $callDepthLimitReached__system_u3735
                  i32.const 0
                  i32.load offset=75156
                  local.set 3
                end
                local.get 2
                i32.const 322
                i32.store offset=40
                local.get 2
                i32.const 66174
                i32.store offset=44
                local.get 2
                i32.const 66172
                i32.store offset=68
                local.get 2
                i32.const 65978
                i32.store offset=60
                local.get 2
                i32.const 0
                i32.store16 offset=72
                local.get 2
                i32.const 0
                i32.store offset=64
                block ;; label = @7
                  block ;; label = @8
                    local.get 3
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 0
                    i32.store offset=56
                    local.get 2
                    i32.const 0
                    i32.store16 offset=74
                    i32.const 0
                    local.get 2
                    i32.const 56
                    i32.add
                    i32.store offset=75156
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.load16_u offset=18
                  local.set 4
                  local.get 2
                  local.get 3
                  i32.store offset=56
                  i32.const 0
                  local.get 2
                  i32.const 56
                  i32.add
                  i32.store offset=75156
                  local.get 2
                  local.get 4
                  i32.const 1
                  i32.add
                  local.tee 3
                  i32.store16 offset=74
                  local.get 3
                  i32.const 65535
                  i32.and
                  i32.const 2000
                  i32.ne
                  br_if 0 (;@7;)
                  call $callDepthLimitReached__system_u3735
                end
                local.get 2
                i32.const 142
                i32.store offset=64
                local.get 2
                i32.const 66172
                i32.store offset=68
                i32.const 0
                local.get 1
                i32.const 3
                i32.const 34
                i32.const -1
                i64.const 0
                call $__mmap
                local.tee 5
                i32.const 1
                i32.add
                i32.const 1
                i32.le_u
                br_if 3 (;@3;)
                i32.const 0
                i32.const 0
                i32.load offset=75156
                i32.load
                local.tee 3
                i32.store offset=75156
                local.get 3
                i32.load
                local.set 3
                local.get 0
                i32.const 1
                i32.store8 offset=6274
                br 1 (;@5;)
              end
              local.get 0
              i32.load offset=6276
              local.set 1
            end
            local.get 2
            i32.const 538
            i32.store offset=16
            local.get 2
            i32.const 66174
            i32.store offset=68
            local.get 2
            i32.const 66196
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            i32.const 0
            local.set 4
            block ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.load16_u offset=18
              local.set 4
              local.get 2
              local.get 3
              i32.store offset=56
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 4
              i32.const 1
              i32.add
              local.tee 6
              i32.store16 offset=74
              local.get 3
              local.set 4
              local.get 6
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 4
            end
            local.get 0
            local.get 0
            i32.load offset=5224
            local.get 1
            i32.add
            i32.store offset=5224
            local.get 0
            local.get 0
            i32.load offset=5232
            local.get 1
            i32.add
            i32.store offset=5232
            local.get 2
            i32.const 540
            i32.store offset=16
            local.get 2
            i32.const 66174
            i32.store offset=68
            local.get 2
            i32.const 66368
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            block ;; label = @5
              block ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.store offset=56
                local.get 2
                i32.const 0
                i32.store16 offset=74
                i32.const 0
                local.get 2
                i32.const 56
                i32.add
                i32.store offset=75156
                br 1 (;@5;)
              end
              local.get 4
              i32.load16_u offset=18
              local.set 3
              local.get 2
              local.get 4
              i32.store offset=56
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.store16 offset=74
              local.get 3
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
            end
            local.get 0
            i32.const 6280
            i32.add
            local.set 3
            block ;; label = @5
              block ;; label = @6
                loop ;; label = @7
                  local.get 3
                  i32.load
                  local.tee 4
                  i32.const 30
                  i32.lt_s
                  br_if 1 (;@6;)
                  local.get 3
                  i32.load offset=244
                  local.tee 3
                  br_if 0 (;@7;)
                end
                local.get 2
                i32.const 386
                i32.store offset=64
                local.get 0
                i32.const 248
                call $llAlloc__system_u4962
                local.tee 3
                local.get 0
                i32.const 6524
                i32.add
                local.tee 4
                i32.load
                i32.store offset=244
                local.get 4
                local.get 3
                i32.store
                local.get 3
                i32.const 8
                i32.add
                local.get 1
                i32.store
                local.get 3
                local.get 5
                i32.store offset=4
                local.get 3
                i32.const 1
                i32.store
                br 1 (;@5;)
              end
              local.get 3
              local.get 4
              i32.const 3
              i32.shl
              i32.add
              local.tee 6
              i32.const 8
              i32.add
              local.get 1
              i32.store
              local.get 6
              i32.const 4
              i32.add
              local.get 5
              i32.store
              local.get 3
              local.get 4
              i32.const 1
              i32.add
              i32.store
            end
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
            local.get 5
            local.get 1
            i32.store offset=4
            local.get 5
            i64.const 0
            i64.store offset=12 align=4
            local.get 2
            i32.const 554
            i32.store offset=16
            local.get 2
            i32.const 66116
            i32.store offset=68
            local.get 2
            i32.const 66716
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            i32.const 0
            local.set 3
            block ;; label = @5
              local.get 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.load16_u offset=18
              local.set 3
              local.get 2
              local.get 4
              i32.store offset=56
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 3
              i32.const 1
              i32.add
              local.tee 6
              i32.store16 offset=74
              local.get 4
              local.set 3
              local.get 6
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 3
            end
            local.get 2
            i32.const 557
            i32.store offset=16
            local.get 2
            i32.const 66174
            i32.store offset=68
            local.get 2
            i32.const 65639
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            local.get 1
            local.get 5
            i32.add
            local.set 6
            block ;; label = @5
              block ;; label = @6
                local.get 3
                br_if 0 (;@6;)
                local.get 2
                i32.const 66174
                i32.store offset=44
                local.get 2
                i32.const 65879
                i32.store offset=36
                local.get 2
                i32.const 0
                i32.store16 offset=48
                local.get 2
                i32.const 0
                i32.store offset=40
                local.get 0
                i32.const 5248
                i32.add
                local.set 7
                local.get 6
                i32.const 12
                i32.shr_s
                local.set 8
                br 1 (;@5;)
              end
              local.get 3
              i32.load16_u offset=18
              local.set 4
              local.get 2
              local.get 3
              i32.store offset=56
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 4
              i32.const 1
              i32.add
              local.tee 4
              i32.store16 offset=74
              block ;; label = @6
                local.get 4
                i32.const 65535
                i32.and
                i32.const 2000
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                i32.const 66174
                i32.store offset=44
                local.get 2
                i32.const 65879
                i32.store offset=36
                local.get 2
                i32.const 0
                i32.store16 offset=48
                local.get 2
                i32.const 0
                i32.store offset=40
                local.get 0
                i32.const 5248
                i32.add
                local.set 7
                local.get 6
                i32.const 12
                i32.shr_s
                local.set 8
                br 4 (;@2;)
              end
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 3
              local.get 2
              i32.const 66174
              i32.store offset=44
              local.get 2
              i32.const 65879
              i32.store offset=36
              local.get 2
              i32.const 0
              i32.store16 offset=48
              local.get 2
              i32.const 0
              i32.store offset=40
              local.get 0
              i32.const 5248
              i32.add
              local.set 7
              local.get 6
              i32.const 12
              i32.shr_s
              local.set 8
              local.get 3
              br_if 3 (;@2;)
            end
            local.get 2
            i32.const 0
            i32.store offset=32
            local.get 2
            i32.const 0
            i32.store16 offset=50
            local.get 2
            i32.const 32
            i32.add
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          i32.const 145
          i32.store offset=64
          call $raiseOutOfMem__system_u4629
          unreachable
        end
        local.get 2
        i32.const 145
        i32.store offset=64
        call $raiseOutOfMem__system_u4629
        unreachable
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=32
      i32.const 0
      local.get 2
      i32.const 32
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=50
      local.get 2
      i32.const 32
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 426
    i32.store offset=40
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 65773
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    local.get 6
    i32.const 21
    i32.shr_s
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=56
        local.get 2
        i32.const 0
        i32.store16 offset=74
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 9
      local.get 2
      local.get 3
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 9
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=74
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 66174
    i32.store offset=68
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 7
          local.get 4
          i32.const 255
          i32.and
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 3
            i32.load offset=4
            local.get 4
            i32.eq
            br_if 2 (;@2;)
            local.get 3
            i32.load
            local.tee 3
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.const 415
        i32.store offset=64
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 3
        i32.store offset=75156
        local.get 3
        i32.load
        local.set 4
        br 1 (;@1;)
      end
      local.get 2
      i32.const 413
      i32.store offset=64
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 4
      i32.store offset=75156
      local.get 2
      i32.const 429
      i32.store offset=40
      local.get 4
      i32.load
      local.set 4
      local.get 3
      local.get 8
      i32.const 3
      i32.shr_u
      i32.const 60
      i32.and
      i32.add
      i32.const 8
      i32.add
      i32.load
      local.get 8
      i32.shr_u
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 6
      local.get 6
      i32.load
      i32.const 1
      i32.and
      local.get 1
      i32.or
      i32.store
    end
    local.get 0
    i32.load offset=5240
    local.set 3
    local.get 2
    i32.const 562
    i32.store offset=16
    local.get 2
    i32.const 66116
    i32.store offset=68
    local.get 2
    i32.const 66713
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    local.get 3
    i32.const 4096
    local.get 3
    select
    local.set 8
    i32.const 0
    local.set 3
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=74
      local.get 4
      local.set 3
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 2
    i32.const 565
    i32.store offset=16
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 65639
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    local.get 5
    local.get 8
    i32.sub
    local.set 6
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            i32.const 66174
            i32.store offset=44
            local.get 2
            i32.const 65879
            i32.store offset=36
            local.get 2
            i32.const 0
            i32.store16 offset=48
            local.get 2
            i32.const 0
            i32.store offset=40
            local.get 6
            i32.const 12
            i32.shr_s
            local.set 9
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 4
          local.get 2
          local.get 3
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 4
          i32.const 1
          i32.add
          local.tee 4
          i32.store16 offset=74
          block ;; label = @4
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            i32.const 66174
            i32.store offset=44
            local.get 2
            i32.const 65879
            i32.store offset=36
            local.get 2
            i32.const 0
            i32.store16 offset=48
            local.get 2
            i32.const 0
            i32.store offset=40
            local.get 6
            i32.const 12
            i32.shr_s
            local.set 9
            br 2 (;@2;)
          end
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 3
          local.get 2
          i32.const 66174
          i32.store offset=44
          local.get 2
          i32.const 65879
          i32.store offset=36
          local.get 2
          i32.const 0
          i32.store16 offset=48
          local.get 2
          i32.const 0
          i32.store offset=40
          local.get 6
          i32.const 12
          i32.shr_s
          local.set 9
          local.get 3
          br_if 1 (;@2;)
        end
        local.get 2
        i32.const 0
        i32.store offset=32
        local.get 2
        i32.const 0
        i32.store16 offset=50
        local.get 2
        i32.const 32
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=32
      i32.const 0
      local.get 2
      i32.const 32
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=50
      local.get 2
      i32.const 32
      i32.add
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 426
    i32.store offset=40
    local.get 2
    i32.const 66174
    i32.store offset=68
    local.get 2
    i32.const 65773
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store16 offset=72
    local.get 2
    i32.const 0
    i32.store offset=64
    local.get 6
    i32.const 21
    i32.shr_s
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=56
        local.get 2
        i32.const 0
        i32.store16 offset=74
        i32.const 0
        local.get 2
        i32.const 56
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 10
      local.get 2
      local.get 3
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 10
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=74
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 7
            local.get 4
            i32.const 255
            i32.and
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            loop ;; label = @5
              local.get 3
              i32.load offset=4
              local.get 4
              i32.eq
              br_if 2 (;@3;)
              local.get 3
              i32.load
              local.tee 3
              br_if 0 (;@5;)
            end
          end
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          local.tee 3
          i32.store offset=75156
          i32.const 0
          local.get 3
          i32.load
          local.tee 3
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 2
        i32.const 413
        i32.store offset=64
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        local.get 2
        i32.const 429
        i32.store offset=40
        local.get 3
        local.get 9
        i32.const 3
        i32.shr_u
        i32.const 60
        i32.and
        i32.add
        i32.const 8
        i32.add
        i32.load
        local.set 7
        i32.const 0
        local.get 4
        i32.load
        local.tee 3
        i32.store offset=75156
        local.get 7
        local.get 9
        i32.shr_u
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.load offset=4
        local.get 8
        i32.ne
        br_if 0 (;@2;)
        local.get 5
        i32.load
        i32.const 1
        i32.and
        local.get 8
        i32.or
        local.set 4
        br 1 (;@1;)
      end
      local.get 5
      i32.load
      i32.const 1
      i32.and
      local.set 4
    end
    local.get 5
    local.get 4
    i32.store
    local.get 0
    local.get 1
    i32.store offset=5240
    i32.const 0
    local.get 3
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
    local.get 5
  )
  (func $getBigChunk__system_u5449 (;45;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 66300
    i32.store offset=4
    i32.const 0
    local.set 3
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=75156
                local.tee 4
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.store
                local.get 2
                i32.const 0
                i32.store16 offset=18
                br 1 (;@5;)
              end
              local.get 4
              i32.load16_u offset=18
              local.set 3
              local.get 2
              local.get 4
              i32.store
              i32.const 0
              local.get 2
              i32.store offset=75156
              local.get 2
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.store16 offset=18
              local.get 3
              i32.const 65535
              i32.and
              i32.const 2000
              i32.eq
              br_if 1 (;@4;)
            end
            local.get 2
            i32.const 678
            i32.store offset=8
            local.get 2
            i32.const 66174
            i32.store offset=60
            local.get 2
            i32.const 66408
            i32.store offset=52
            local.get 2
            i32.const 0
            i32.store16 offset=64
            local.get 2
            i32.const 0
            i32.store offset=56
            local.get 2
            local.set 4
            br 1 (;@3;)
          end
          call $callDepthLimitReached__system_u3735
          local.get 2
          i32.const 678
          i32.store offset=8
          i32.const 0
          i32.load offset=75156
          local.set 4
          local.get 2
          i32.const 66174
          i32.store offset=60
          local.get 2
          i32.const 66408
          i32.store offset=52
          local.get 2
          i32.const 0
          i32.store16 offset=64
          local.get 2
          i32.const 0
          i32.store offset=56
          local.get 4
          i32.eqz
          br_if 1 (;@2;)
          local.get 4
          i32.load16_u offset=18
          local.set 3
        end
        local.get 2
        local.get 4
        i32.store offset=48
        i32.const 0
        local.get 2
        i32.const 48
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=66
        local.get 2
        i32.const 48
        i32.add
        local.set 5
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 1 (;@1;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 5
        br 1 (;@1;)
      end
      local.get 2
      i32.const 0
      i32.store offset=48
      local.get 2
      i32.const 0
      i32.store16 offset=66
      local.get 2
      i32.const 48
      i32.add
      local.set 5
    end
    local.get 2
    i32.const 66174
    i32.store offset=60
    local.get 2
    i32.const 235
    i32.store offset=56
    local.get 2
    i32.const 66174
    i32.store offset=84
    local.get 2
    i32.const 65745
    i32.store offset=76
    i32.const 0
    local.set 4
    local.get 2
    i32.const 0
    i32.store16 offset=88
    local.get 2
    i32.const 0
    i32.store offset=80
    i32.const 0
    local.set 3
    block ;; label = @1
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 5
      i32.store offset=72
      i32.const 0
      local.get 2
      i32.const 72
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=90
      local.get 5
      local.set 3
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    local.get 2
    i32.const 66172
    i32.store offset=84
    local.get 2
    i32.const 66021
    i32.store offset=76
    local.get 2
    i32.const 0
    i32.store16 offset=88
    local.get 2
    i32.const 0
    i32.store offset=80
    i32.const 1
    local.get 1
    i32.const 255
    i32.gt_u
    i32.const 3
    i32.shl
    i32.const 16
    i32.const 24
    local.get 1
    i32.const 16777216
    i32.lt_u
    select
    local.get 1
    i32.const 65536
    i32.lt_u
    select
    local.tee 5
    local.get 1
    local.get 5
    i32.shr_u
    i32.const 66944
    i32.add
    i32.load8_s
    i32.add
    i32.const -5
    i32.add
    i32.shl
    local.set 5
    block ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=72
      i32.const 0
      local.get 2
      i32.const 72
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=90
      local.get 3
      local.set 4
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 2
    i32.const 239
    i32.store offset=56
    local.get 2
    i32.const 66174
    i32.store offset=84
    local.get 2
    i32.const 65745
    i32.store offset=76
    local.get 2
    i32.const 0
    i32.store16 offset=88
    local.get 2
    i32.const 0
    i32.store offset=80
    local.get 1
    local.get 5
    i32.const 4095
    i32.add
    i32.const -4096
    i32.and
    local.tee 3
    i32.add
    i32.const -1
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    i32.and
    local.tee 1
    i32.const 1056964608
    local.get 1
    i32.const 1056964608
    i32.lt_s
    select
    local.set 3
    i32.const 0
    local.set 1
    block ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load16_u offset=18
      local.set 1
      local.get 2
      local.get 4
      i32.store offset=72
      i32.const 0
      local.get 2
      i32.const 72
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 1
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=90
      local.get 4
      local.set 1
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 1
    end
    i32.const 0
    local.get 1
    i32.store offset=75156
    local.get 2
    i32.const 241
    i32.store offset=56
    local.get 1
    i32.load
    local.set 1
    local.get 2
    i32.const 680
    i32.store offset=8
    local.get 2
    i32.const 66174
    i32.store offset=36
    local.get 2
    i32.const 66380
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.ne
    i32.const 3
    i32.shl
    i32.const 16
    i32.const 24
    local.get 3
    i32.const 16777216
    i32.lt_u
    select
    local.get 3
    i32.const 65536
    i32.lt_u
    select
    local.tee 4
    local.get 3
    local.get 4
    i32.shr_u
    i32.const 66944
    i32.add
    i32.load8_s
    i32.add
    local.tee 5
    i32.const -6
    i32.add
    local.set 4
    local.get 3
    local.get 5
    i32.const -5
    i32.add
    local.tee 6
    i32.shr_s
    i32.const -32
    i32.add
    local.set 5
    block ;; label = @1
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 1
      i32.load16_u offset=18
      local.set 7
      local.get 2
      local.get 1
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 7
      i32.const 1
      i32.add
      local.tee 1
      i32.store16 offset=42
      local.get 1
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              local.get 4
              i32.const 2
              i32.shl
              i32.add
              i32.const 2052
              i32.add
              i32.load
              i32.const -1
              local.get 5
              i32.shl
              i32.and
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.const 259
              i32.store offset=32
              local.get 2
              i32.const 66174
              i32.store offset=60
              local.get 2
              i32.const 65751
              i32.store offset=52
              local.get 2
              i32.const 0
              i32.store16 offset=64
              local.get 2
              i32.const 0
              i32.store offset=56
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=75156
                  local.tee 5
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 0
                  i32.store offset=48
                  local.get 2
                  i32.const 0
                  i32.store16 offset=66
                  local.get 2
                  i32.const 48
                  i32.add
                  local.set 5
                  br 1 (;@6;)
                end
                local.get 5
                i32.load16_u offset=18
                local.set 6
                local.get 2
                local.get 5
                i32.store offset=48
                i32.const 0
                local.get 2
                i32.const 48
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 6
                i32.const 1
                i32.add
                local.tee 6
                i32.store16 offset=66
                local.get 2
                i32.const 48
                i32.add
                local.set 5
                local.get 6
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                local.set 5
              end
              local.get 2
              i32.const 223
              i32.store offset=56
              local.get 2
              i32.const 66174
              i32.store offset=84
              local.get 2
              i32.const 65745
              i32.store offset=76
              local.get 2
              i32.const 0
              i32.store16 offset=88
              local.get 2
              i32.const 0
              i32.store offset=80
              local.get 1
              i32.const 0
              local.get 1
              i32.sub
              i32.and
              local.set 1
              i32.const 0
              local.set 6
              block ;; label = @6
                local.get 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                i32.load16_u offset=18
                local.set 6
                local.get 2
                local.get 5
                i32.store offset=72
                i32.const 0
                local.get 2
                i32.const 72
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 6
                i32.const 1
                i32.add
                local.tee 7
                i32.store16 offset=90
                local.get 5
                local.set 6
                local.get 7
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                i32.load
                local.set 6
              end
              i32.const 0
              local.get 6
              i32.store offset=75156
              i32.const 0
              local.get 6
              i32.load
              local.tee 5
              i32.store offset=75156
              local.get 0
              local.get 4
              i32.const 7
              i32.shl
              i32.add
              local.get 1
              i32.const 255
              i32.gt_u
              i32.const 3
              i32.shl
              i32.const 16
              i32.const 24
              local.get 1
              i32.const 16777216
              i32.lt_u
              select
              local.get 1
              i32.const 65536
              i32.lt_u
              select
              local.tee 6
              local.get 1
              local.get 6
              i32.shr_u
              i32.const 66944
              i32.add
              i32.load8_s
              i32.add
              local.tee 6
              i32.const 2
              i32.shl
              i32.add
              i32.const 2148
              i32.add
              local.set 1
              br 1 (;@4;)
            end
            local.get 2
            i32.const 262
            i32.store offset=32
            local.get 0
            i32.load offset=2048
            local.set 1
            local.get 2
            i32.const 66174
            i32.store offset=60
            local.get 2
            i32.const 65751
            i32.store offset=52
            local.get 2
            i32.const 0
            i32.store16 offset=64
            local.get 2
            i32.const 0
            i32.store offset=56
            local.get 1
            i32.const -1
            local.get 6
            i32.shl
            i32.and
            local.set 1
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=75156
                local.tee 4
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.store offset=48
                local.get 2
                i32.const 0
                i32.store16 offset=66
                local.get 2
                i32.const 48
                i32.add
                local.set 4
                br 1 (;@5;)
              end
              local.get 4
              i32.load16_u offset=18
              local.set 5
              local.get 2
              local.get 4
              i32.store offset=48
              i32.const 0
              local.get 2
              i32.const 48
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.store16 offset=66
              local.get 2
              i32.const 48
              i32.add
              local.set 4
              local.get 5
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              local.set 4
            end
            local.get 2
            i32.const 223
            i32.store offset=56
            local.get 2
            i32.const 66174
            i32.store offset=84
            local.get 2
            i32.const 65745
            i32.store offset=76
            local.get 2
            i32.const 0
            i32.store16 offset=88
            local.get 2
            i32.const 0
            i32.store offset=80
            local.get 1
            i32.const 0
            local.get 1
            i32.sub
            i32.and
            local.set 1
            i32.const 0
            local.set 5
            block ;; label = @5
              local.get 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.load16_u offset=18
              local.set 5
              local.get 2
              local.get 4
              i32.store offset=72
              i32.const 0
              local.get 2
              i32.const 72
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 5
              i32.const 1
              i32.add
              local.tee 6
              i32.store16 offset=90
              local.get 4
              local.set 5
              local.get 6
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 5
            end
            i32.const 0
            local.get 5
            i32.store offset=75156
            i32.const 0
            local.get 5
            i32.load
            local.tee 5
            i32.store offset=75156
            block ;; label = @5
              local.get 1
              i32.const 255
              i32.gt_u
              i32.const 3
              i32.shl
              i32.const 16
              i32.const 24
              local.get 1
              i32.const 16777216
              i32.lt_u
              select
              local.get 1
              i32.const 65536
              i32.lt_u
              select
              local.tee 4
              local.get 1
              local.get 4
              i32.shr_u
              i32.const 66944
              i32.add
              i32.load8_s
              i32.add
              local.tee 4
              i32.const 0
              i32.gt_s
              br_if 0 (;@5;)
              i32.const 0
              local.get 5
              i32.load
              i32.store offset=75156
              br 2 (;@3;)
            end
            local.get 2
            i32.const 264
            i32.store offset=32
            local.get 0
            local.get 4
            i32.const 2
            i32.shl
            i32.add
            i32.const 2052
            i32.add
            i32.load
            local.set 1
            local.get 2
            i32.const 66174
            i32.store offset=60
            local.get 2
            i32.const 65751
            i32.store offset=52
            local.get 2
            i32.const 0
            i32.store16 offset=64
            local.get 2
            i32.const 0
            i32.store offset=56
            block ;; label = @5
              block ;; label = @6
                local.get 5
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.store offset=48
                local.get 2
                i32.const 0
                i32.store16 offset=66
                local.get 2
                i32.const 48
                i32.add
                local.set 5
                br 1 (;@5;)
              end
              local.get 5
              i32.load16_u offset=18
              local.set 6
              local.get 2
              local.get 5
              i32.store offset=48
              i32.const 0
              local.get 2
              i32.const 48
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 6
              i32.const 1
              i32.add
              local.tee 6
              i32.store16 offset=66
              local.get 2
              i32.const 48
              i32.add
              local.set 5
              local.get 6
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              local.set 5
            end
            local.get 2
            i32.const 223
            i32.store offset=56
            local.get 2
            i32.const 66174
            i32.store offset=84
            local.get 2
            i32.const 65745
            i32.store offset=76
            local.get 2
            i32.const 0
            i32.store16 offset=88
            local.get 2
            i32.const 0
            i32.store offset=80
            local.get 1
            i32.const 0
            local.get 1
            i32.sub
            i32.and
            local.set 1
            i32.const 0
            local.set 6
            block ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              i32.load16_u offset=18
              local.set 6
              local.get 2
              local.get 5
              i32.store offset=72
              i32.const 0
              local.get 2
              i32.const 72
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 6
              i32.const 1
              i32.add
              local.tee 7
              i32.store16 offset=90
              local.get 5
              local.set 6
              local.get 7
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 6
            end
            i32.const 0
            local.get 6
            i32.store offset=75156
            i32.const 0
            local.get 6
            i32.load
            local.tee 5
            i32.store offset=75156
            local.get 0
            local.get 4
            i32.const 7
            i32.shl
            i32.add
            local.get 1
            i32.const 255
            i32.gt_u
            i32.const 3
            i32.shl
            i32.const 16
            i32.const 24
            local.get 1
            i32.const 16777216
            i32.lt_u
            select
            local.get 1
            i32.const 65536
            i32.lt_u
            select
            local.tee 6
            local.get 1
            local.get 6
            i32.shr_u
            i32.const 66944
            i32.add
            i32.load8_s
            i32.add
            local.tee 6
            i32.const 2
            i32.shl
            i32.add
            i32.const 2148
            i32.add
            local.set 1
          end
          local.get 1
          i32.load
          local.set 1
          i32.const 0
          local.get 5
          i32.load
          local.tee 5
          i32.store offset=75156
          local.get 1
          br_if 1 (;@2;)
        end
        block ;; label = @3
          local.get 3
          i32.const 524287
          i32.gt_s
          br_if 0 (;@3;)
          local.get 2
          i32.const 690
          i32.store offset=8
          local.get 0
          i32.const 524288
          call $requestOsChunks__system_u5351
          local.set 1
          local.get 2
          i32.const 691
          i32.store offset=8
          local.get 2
          i32.const 66174
          i32.store offset=84
          local.get 2
          i32.const 66262
          i32.store offset=76
          local.get 2
          i32.const 0
          i32.store16 offset=88
          local.get 2
          i32.const 0
          i32.store offset=80
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 4
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.store offset=72
              local.get 2
              i32.const 0
              i32.store16 offset=90
              i32.const 0
              local.get 2
              i32.const 72
              i32.add
              i32.store offset=75156
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 2
            local.get 4
            i32.store offset=72
            i32.const 0
            local.get 2
            i32.const 72
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 5
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=90
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
          end
          local.get 2
          i32.const 632
          i32.store offset=80
          local.get 0
          local.get 1
          local.get 3
          call $splitChunk2__system_u5399
          local.set 4
          local.get 2
          i32.const 633
          i32.store offset=80
          local.get 0
          local.get 4
          call $addChunkToMatrix__system_u4924
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 4
          local.get 1
          local.get 0
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        i32.const 693
        i32.store offset=8
        local.get 0
        local.get 3
        call $requestOsChunks__system_u5351
        local.set 1
        i32.const 0
        i32.load offset=75156
        local.set 4
        block ;; label = @3
          local.get 3
          local.get 1
          i32.load offset=4
          i32.ge_s
          br_if 0 (;@3;)
          local.get 2
          i32.const 696
          i32.store offset=8
          local.get 2
          i32.const 66174
          i32.store offset=84
          local.get 2
          i32.const 66262
          i32.store offset=76
          local.get 2
          i32.const 0
          i32.store16 offset=88
          local.get 2
          i32.const 0
          i32.store offset=80
          block ;; label = @4
            block ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.store offset=72
              local.get 2
              i32.const 0
              i32.store16 offset=90
              i32.const 0
              local.get 2
              i32.const 72
              i32.add
              i32.store offset=75156
              br 1 (;@4;)
            end
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 2
            local.get 4
            i32.store offset=72
            i32.const 0
            local.get 2
            i32.const 72
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 5
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=90
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
          end
          local.get 2
          i32.const 632
          i32.store offset=80
          local.get 0
          local.get 1
          local.get 3
          call $splitChunk2__system_u5399
          local.set 4
          local.get 2
          i32.const 633
          i32.store offset=80
          local.get 0
          local.get 4
          call $addChunkToMatrix__system_u4924
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          local.tee 4
          i32.store offset=75156
        end
        local.get 1
        local.get 0
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 2
      i32.const 699
      i32.store offset=8
      local.get 2
      i32.const 66174
      i32.store offset=60
      local.get 2
      i32.const 66662
      i32.store offset=52
      local.get 2
      i32.const 0
      i32.store16 offset=64
      local.get 2
      i32.const 0
      i32.store offset=56
      block ;; label = @2
        block ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.store offset=48
          local.get 2
          i32.const 0
          i32.store16 offset=66
          i32.const 0
          local.get 2
          i32.const 48
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 5
        i32.load16_u offset=18
        local.set 7
        local.get 2
        local.get 5
        i32.store offset=48
        i32.const 0
        local.get 2
        i32.const 48
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 7
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=66
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 0
      local.get 4
      i32.const 7
      i32.shl
      i32.add
      local.get 6
      i32.const 2
      i32.shl
      i32.add
      i32.const 2148
      i32.add
      local.get 1
      i32.load offset=12
      local.tee 5
      i32.store
      block ;; label = @2
        block ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.const 0
          i32.store offset=16
          i32.const 0
          i32.load offset=75156
          local.set 5
          br 1 (;@2;)
        end
        local.get 2
        i32.const 268
        i32.store offset=56
        local.get 2
        i32.const 66174
        i32.store offset=84
        local.get 2
        i32.const 65764
        i32.store offset=76
        local.get 2
        i32.const 0
        i32.store16 offset=88
        local.get 2
        i32.const 0
        i32.store offset=80
        local.get 0
        local.get 4
        i32.const 2
        i32.shl
        i32.add
        i32.const 2052
        i32.add
        local.set 5
        i32.const 0
        local.set 7
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.load16_u offset=18
          local.set 7
          local.get 2
          local.get 8
          i32.store offset=72
          i32.const 0
          local.get 2
          i32.const 72
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 7
          i32.const 1
          i32.add
          local.tee 9
          i32.store16 offset=90
          local.get 8
          local.set 7
          local.get 9
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 7
        end
        local.get 5
        local.get 5
        i32.load
        i32.const -2
        local.get 6
        i32.rotl
        i32.and
        local.tee 6
        i32.store
        i32.const 0
        local.get 7
        i32.store offset=75156
        block ;; label = @3
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          local.set 5
          br 1 (;@2;)
        end
        local.get 2
        i32.const 271
        i32.store offset=56
        local.get 2
        i32.const 66174
        i32.store offset=84
        local.get 2
        i32.const 65764
        i32.store offset=76
        local.get 2
        i32.const 0
        i32.store16 offset=88
        local.get 2
        i32.const 0
        i32.store offset=80
        i32.const 0
        local.set 5
        block ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          i32.load16_u offset=18
          local.set 5
          local.get 2
          local.get 7
          i32.store offset=72
          i32.const 0
          local.get 2
          i32.const 72
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 5
          i32.const 1
          i32.add
          local.tee 6
          i32.store16 offset=90
          local.get 7
          local.set 5
          local.get 6
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 5
        end
        local.get 0
        local.get 0
        i32.load offset=2048
        i32.const -2
        local.get 4
        i32.rotl
        i32.and
        i32.store offset=2048
        i32.const 0
        local.get 5
        i32.store offset=75156
      end
      local.get 1
      i64.const 0
      i64.store offset=12 align=4
      local.get 5
      i32.load
      local.set 4
      local.get 3
      i32.const 4096
      i32.add
      local.get 1
      i32.load offset=4
      i32.gt_s
      br_if 0 (;@1;)
      local.get 2
      i32.const 701
      i32.store offset=8
      local.get 2
      i32.const 66174
      i32.store offset=84
      local.get 2
      i32.const 66262
      i32.store offset=76
      local.get 2
      i32.const 0
      i32.store16 offset=88
      local.get 2
      i32.const 0
      i32.store offset=80
      block ;; label = @2
        block ;; label = @3
          local.get 4
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.store offset=72
          local.get 2
          i32.const 0
          i32.store16 offset=90
          i32.const 0
          local.get 2
          i32.const 72
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 4
        i32.load16_u offset=18
        local.set 5
        local.get 2
        local.get 4
        i32.store offset=72
        i32.const 0
        local.get 2
        i32.const 72
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 5
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=90
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 2
      i32.const 632
      i32.store offset=80
      local.get 0
      local.get 1
      local.get 3
      call $splitChunk2__system_u5399
      local.set 4
      local.get 2
      i32.const 633
      i32.store offset=80
      local.get 0
      local.get 4
      call $addChunkToMatrix__system_u4924
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 4
    end
    local.get 1
    i32.const 1
    i32.store
    local.get 2
    i32.const 707
    i32.store offset=8
    local.get 2
    i32.const 66174
    i32.store offset=84
    local.get 2
    i32.const 65639
    i32.store offset=76
    local.get 2
    i32.const 0
    i32.store16 offset=88
    local.get 2
    i32.const 0
    i32.store offset=80
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            local.get 2
            i32.const 66174
            i32.store offset=84
            local.get 2
            i32.const 66248
            i32.store offset=76
            local.get 2
            i32.const 0
            i32.store16 offset=88
            local.get 2
            i32.const 0
            i32.store offset=80
            br 1 (;@3;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 5
          local.get 2
          local.get 4
          i32.store offset=72
          i32.const 0
          local.get 2
          i32.const 72
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.store16 offset=90
          block ;; label = @4
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            i32.const 66174
            i32.store offset=84
            local.get 2
            i32.const 66248
            i32.store offset=76
            local.get 2
            i32.const 0
            i32.store16 offset=88
            local.get 2
            i32.const 0
            i32.store offset=80
            br 2 (;@2;)
          end
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 4
          local.get 2
          i32.const 66174
          i32.store offset=84
          local.get 2
          i32.const 66248
          i32.store offset=76
          local.get 2
          i32.const 0
          i32.store16 offset=88
          local.get 2
          i32.const 0
          i32.store offset=80
          local.get 4
          br_if 1 (;@2;)
        end
        local.get 2
        i32.const 0
        i32.store offset=72
        local.get 2
        i32.const 0
        i32.store16 offset=90
        i32.const 0
        local.get 2
        i32.const 72
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 2
      local.get 4
      i32.store offset=72
      i32.const 0
      local.get 2
      i32.const 72
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=90
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 434
    i32.store offset=80
    local.get 0
    local.get 0
    i32.const 5248
    i32.add
    local.get 1
    i32.const 21
    i32.shr_s
    call $intSetPut__system_u5112
    local.set 4
    local.get 2
    i32.const 436
    i32.store offset=80
    local.get 4
    local.get 1
    i32.const 12
    i32.shr_s
    local.tee 5
    i32.const 3
    i32.shr_u
    i32.const 60
    i32.and
    i32.add
    i32.const 8
    i32.add
    local.tee 4
    local.get 4
    i32.load
    i32.const 1
    local.get 5
    i32.shl
    i32.or
    i32.store
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    local.tee 4
    i32.store offset=75156
    local.get 0
    local.get 0
    i32.load offset=5232
    local.get 3
    i32.sub
    i32.store offset=5232
    i32.const 0
    local.get 4
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 96
    i32.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $rawAlloc__system_u5592 (;46;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=20
    local.get 2
    i32.const 66625
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.store offset=8
              local.get 2
              i32.const 0
              i32.store16 offset=26
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 3
            i32.store offset=8
            i32.const 0
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=26
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.eq
            br_if 1 (;@3;)
          end
          local.get 2
          i32.const 869
          i32.store offset=16
          local.get 2
          i32.const 66172
          i32.store offset=68
          local.get 2
          i32.const 66021
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          local.get 2
          i32.const 8
          i32.add
          local.set 4
          br 1 (;@2;)
        end
        call $callDepthLimitReached__system_u3735
        local.get 2
        i32.const 869
        i32.store offset=16
        i32.const 0
        local.set 3
        i32.const 0
        i32.load offset=75156
        local.set 4
        local.get 2
        i32.const 66172
        i32.store offset=68
        local.get 2
        i32.const 66021
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 3
      local.get 2
      local.get 4
      i32.store offset=56
      i32.const 0
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=74
      local.get 4
      local.set 3
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      i32.load
      local.set 3
    end
    i32.const 0
    local.get 3
    i32.store offset=75156
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        local.tee 6
        i32.const 4048
        i32.gt_s
        br_if 0 (;@2;)
        local.get 6
        i32.const 4
        i32.shr_s
        local.set 7
        block ;; label = @3
          local.get 0
          local.get 6
          i32.const 2
          i32.shr_s
          i32.add
          local.tee 8
          i32.load
          local.tee 4
          br_if 0 (;@3;)
          local.get 2
          i32.const 894
          i32.store offset=16
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 66273
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          block ;; label = @4
            block ;; label = @5
              local.get 3
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.store offset=56
              local.get 2
              i32.const 0
              i32.store16 offset=74
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 3
            i32.store offset=56
            i32.const 0
            local.get 2
            i32.const 56
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=74
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
          end
          local.get 2
          i32.const 741
          i32.store offset=64
          local.get 0
          i32.const 4096
          call $getBigChunk__system_u5449
          local.set 5
          local.get 2
          i32.const 744
          i32.store offset=64
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          i32.store offset=75156
          local.get 5
          i32.const 0
          i32.store offset=32
          local.get 5
          i32.const 0
          i32.store offset=20
          local.get 5
          local.get 6
          i32.store offset=28
          local.get 5
          local.get 6
          i32.store offset=4
          local.get 5
          i32.const 4048
          local.get 6
          i32.sub
          i32.store offset=24
          local.get 5
          i64.const 0
          i64.store offset=12 align=4
          local.get 5
          local.get 0
          local.get 7
          i32.const 2
          i32.shl
          i32.add
          i32.const 1024
          i32.add
          local.tee 3
          i32.load
          i32.store offset=20
          local.get 3
          i32.const 0
          i32.store
          local.get 2
          i32.const 887
          i32.store offset=16
          local.get 2
          i32.const 66174
          i32.store offset=44
          local.get 2
          i32.const 65851
          i32.store offset=36
          local.get 2
          i32.const 0
          i32.store16 offset=48
          local.get 2
          i32.const 0
          i32.store offset=40
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.store offset=32
              local.get 2
              i32.const 0
              i32.store16 offset=50
              i32.const 0
              local.get 2
              i32.const 32
              i32.add
              i32.store offset=75156
              local.get 2
              i32.const 32
              i32.add
              local.set 4
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 3
            i32.store offset=32
            i32.const 0
            local.get 2
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=50
            local.get 2
            i32.const 32
            i32.add
            local.set 4
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            local.set 4
          end
          block ;; label = @4
            block ;; label = @5
              local.get 5
              i32.load offset=20
              local.tee 1
              br_if 0 (;@5;)
              local.get 4
              local.set 3
              i32.const 0
              local.set 7
              br 1 (;@4;)
            end
            i32.const 0
            local.set 7
            loop ;; label = @5
              local.get 2
              i32.const 838
              i32.store offset=40
              local.get 2
              i32.const 66174
              i32.store offset=68
              local.get 2
              i32.const 66005
              i32.store offset=60
              local.get 2
              i32.const 0
              i32.store16 offset=72
              local.get 2
              i32.const 0
              i32.store offset=64
              i32.const 0
              local.set 3
              block ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                i32.load16_u offset=18
                local.set 3
                local.get 2
                local.get 4
                i32.store offset=56
                i32.const 0
                local.get 2
                i32.const 56
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 3
                i32.const 1
                i32.add
                local.tee 9
                i32.store16 offset=74
                local.get 4
                local.set 3
                local.get 9
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                i32.load
                local.set 3
              end
              i32.const 0
              local.get 3
              i32.store offset=75156
              block ;; label = @6
                local.get 5
                local.get 1
                i32.const -4096
                i32.and
                i32.eq
                br_if 0 (;@6;)
                local.get 5
                local.get 5
                i32.load offset=32
                i32.const 1
                i32.add
                i32.store offset=32
              end
              local.get 7
              local.get 6
              i32.add
              local.set 7
              local.get 2
              i32.const 843
              i32.store offset=40
              local.get 3
              local.set 4
              local.get 1
              i32.load
              local.tee 1
              br_if 0 (;@5;)
            end
          end
          local.get 5
          local.get 5
          i32.load offset=24
          local.get 7
          i32.add
          i32.store offset=24
          local.get 2
          i32.const 846
          i32.store offset=40
          local.get 0
          local.get 0
          i32.load offset=5236
          local.get 7
          i32.sub
          i32.store offset=5236
          i32.const 0
          local.get 3
          i32.load
          local.tee 1
          i32.store offset=75156
          block ;; label = @4
            local.get 6
            local.get 5
            i32.load offset=24
            i32.gt_s
            br_if 0 (;@4;)
            local.get 2
            i32.const 911
            i32.store offset=16
            local.get 2
            i32.const 66174
            i32.store offset=68
            local.get 2
            i32.const 66590
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            block ;; label = @5
              block ;; label = @6
                local.get 1
                br_if 0 (;@6;)
                local.get 2
                local.get 1
                i32.store offset=56
                local.get 2
                i32.const 0
                i32.store16 offset=74
                i32.const 0
                local.get 2
                i32.const 56
                i32.add
                i32.store offset=75156
                br 1 (;@5;)
              end
              local.get 1
              i32.load16_u offset=18
              local.set 3
              local.get 2
              local.get 1
              i32.store offset=56
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.store16 offset=74
              local.get 3
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
            end
            local.get 5
            local.get 8
            i32.load
            i32.store offset=12
            block ;; label = @5
              local.get 8
              i32.load
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              local.get 5
              i32.store offset=16
            end
            local.get 8
            local.get 5
            i32.store
            i32.const 0
            i32.const 0
            i32.load offset=75156
            i32.load
            local.tee 1
            i32.store offset=75156
          end
          local.get 5
          i32.const 48
          i32.add
          local.set 10
          br 2 (;@1;)
        end
        block ;; label = @3
          block ;; label = @4
            local.get 4
            i32.load offset=20
            local.tee 10
            br_if 0 (;@4;)
            local.get 2
            i32.const 924
            i32.store offset=16
            local.get 4
            i32.load offset=28
            local.set 5
            local.get 2
            i32.const 66116
            i32.store offset=68
            local.get 2
            i32.const 66716
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            local.get 4
            i32.const 48
            i32.add
            local.set 10
            local.get 5
            local.set 9
            i32.const 0
            local.set 1
            block ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.load16_u offset=18
              local.set 1
              local.get 2
              local.get 3
              i32.store offset=56
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 1
              i32.const 1
              i32.add
              local.tee 11
              i32.store16 offset=74
              local.get 5
              local.set 9
              local.get 3
              local.set 1
              local.get 11
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              local.get 4
              i32.load offset=28
              local.set 9
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 1
            end
            i32.const 0
            local.get 1
            i32.store offset=75156
            local.get 4
            local.get 9
            local.get 6
            i32.add
            i32.store offset=28
            local.get 5
            local.get 10
            i32.add
            local.set 10
            br 1 (;@3;)
          end
          local.get 4
          local.get 10
          i32.load
          i32.store offset=20
          local.get 2
          i32.const 932
          i32.store offset=16
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 66005
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          i32.const 0
          local.set 1
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 1
            local.get 2
            local.get 3
            i32.store offset=56
            i32.const 0
            local.get 2
            i32.const 56
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 5
            i32.store16 offset=74
            local.get 3
            local.set 1
            local.get 5
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 1
          end
          i32.const 0
          local.get 1
          i32.store offset=75156
          local.get 4
          local.get 10
          i32.const -4096
          i32.and
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.get 4
          i32.load offset=32
          i32.const -1
          i32.add
          i32.store offset=32
        end
        local.get 4
        local.get 4
        i32.load offset=24
        local.get 6
        i32.sub
        local.tee 3
        i32.store offset=24
        block ;; label = @3
          local.get 4
          i32.load offset=20
          br_if 0 (;@3;)
          local.get 4
          local.get 0
          local.get 7
          i32.const 2
          i32.shl
          i32.add
          i32.const 1024
          i32.add
          local.tee 3
          i32.load
          i32.store offset=20
          local.get 3
          i32.const 0
          i32.store
          local.get 2
          i32.const 887
          i32.store offset=16
          local.get 2
          i32.const 66174
          i32.store offset=44
          local.get 2
          i32.const 65851
          i32.store offset=36
          local.get 2
          i32.const 0
          i32.store16 offset=48
          local.get 2
          i32.const 0
          i32.store offset=40
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.store offset=32
              local.get 2
              i32.const 0
              i32.store16 offset=50
              i32.const 0
              local.get 2
              i32.const 32
              i32.add
              i32.store offset=75156
              local.get 2
              i32.const 32
              i32.add
              local.set 1
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 1
            local.get 2
            local.get 3
            i32.store offset=32
            i32.const 0
            local.get 2
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=50
            local.get 2
            i32.const 32
            i32.add
            local.set 1
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            local.set 1
          end
          block ;; label = @4
            block ;; label = @5
              local.get 4
              i32.load offset=20
              local.tee 5
              br_if 0 (;@5;)
              local.get 1
              local.set 3
              i32.const 0
              local.set 7
              br 1 (;@4;)
            end
            i32.const 0
            local.set 7
            loop ;; label = @5
              local.get 2
              i32.const 838
              i32.store offset=40
              local.get 2
              i32.const 66174
              i32.store offset=68
              local.get 2
              i32.const 66005
              i32.store offset=60
              local.get 2
              i32.const 0
              i32.store16 offset=72
              local.get 2
              i32.const 0
              i32.store offset=64
              i32.const 0
              local.set 3
              block ;; label = @6
                local.get 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.load16_u offset=18
                local.set 3
                local.get 2
                local.get 1
                i32.store offset=56
                i32.const 0
                local.get 2
                i32.const 56
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 3
                i32.const 1
                i32.add
                local.tee 9
                i32.store16 offset=74
                local.get 1
                local.set 3
                local.get 9
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                i32.load
                local.set 3
              end
              i32.const 0
              local.get 3
              i32.store offset=75156
              block ;; label = @6
                local.get 4
                local.get 5
                i32.const -4096
                i32.and
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                local.get 4
                i32.load offset=32
                i32.const 1
                i32.add
                i32.store offset=32
              end
              local.get 7
              local.get 6
              i32.add
              local.set 7
              local.get 2
              i32.const 843
              i32.store offset=40
              local.get 3
              local.set 1
              local.get 5
              i32.load
              local.tee 5
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 4
          i32.load offset=24
          local.get 7
          i32.add
          i32.store offset=24
          local.get 2
          i32.const 846
          i32.store offset=40
          local.get 0
          local.get 0
          i32.load offset=5236
          local.get 7
          i32.sub
          i32.store offset=5236
          i32.const 0
          local.get 3
          i32.load
          local.tee 1
          i32.store offset=75156
          local.get 4
          i32.load offset=24
          local.set 3
        end
        local.get 3
        local.get 6
        i32.ge_s
        br_if 1 (;@1;)
        local.get 2
        i32.const 952
        i32.store offset=16
        local.get 2
        i32.const 66174
        i32.store offset=68
        local.get 2
        i32.const 66507
        i32.store offset=60
        local.get 2
        i32.const 0
        i32.store16 offset=72
        local.get 2
        i32.const 0
        i32.store offset=64
        block ;; label = @3
          block ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.store offset=56
            local.get 2
            i32.const 0
            i32.store16 offset=74
            i32.const 0
            local.get 2
            i32.const 56
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 1
          i32.load16_u offset=18
          local.set 3
          local.get 2
          local.get 1
          i32.store offset=56
          i32.const 0
          local.get 2
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=74
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 4
        i32.load offset=12
        local.set 3
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 8
              i32.load
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              local.get 8
              local.get 3
              i32.store
              i32.const 0
              local.set 1
              local.get 3
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            local.get 4
            i32.load offset=16
            local.get 3
            i32.store offset=12
            local.get 4
            i32.load offset=12
            local.tee 3
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load offset=16
            local.set 1
          end
          local.get 3
          local.get 1
          i32.store offset=16
        end
        local.get 4
        i64.const 0
        i64.store offset=12 align=4
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 1
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=5244
      local.set 4
      local.get 0
      i32.const 0
      i32.store offset=5244
      block ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 967
        i32.store offset=16
        local.get 2
        i32.const 66174
        i32.store offset=44
        local.get 2
        i32.const 65831
        i32.store offset=36
        local.get 2
        i32.const 0
        i32.store16 offset=48
        local.get 2
        i32.const 0
        i32.store offset=40
        block ;; label = @3
          block ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=32
            local.get 2
            i32.const 0
            i32.store16 offset=50
            i32.const 0
            local.get 2
            i32.const 32
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 5
          local.get 2
          local.get 3
          i32.store offset=32
          i32.const 0
          local.get 2
          i32.const 32
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 5
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=50
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 4
        i32.load offset=12
        local.set 3
        local.get 4
        i32.const 0
        i32.store offset=12
        local.get 2
        i32.const 854
        i32.store offset=40
        local.get 0
        local.get 4
        call $deallocBigChunk__system_u5495
        block ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=12
          local.set 4
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 3
          call $deallocBigChunk__system_u5495
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 3
          local.get 4
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 854
          i32.store offset=40
          local.get 0
          local.get 4
          call $deallocBigChunk__system_u5495
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const 857
            i32.store offset=40
            local.get 2
            i32.const 66174
            i32.store offset=68
            local.get 2
            i32.const 65904
            i32.store offset=60
            local.get 2
            i32.const 0
            i32.store16 offset=72
            local.get 2
            i32.const 0
            i32.store offset=64
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=75156
                local.tee 4
                br_if 0 (;@6;)
                local.get 2
                local.get 4
                i32.store offset=56
                local.get 2
                i32.const 0
                i32.store16 offset=74
                i32.const 0
                local.get 2
                i32.const 56
                i32.add
                i32.store offset=75156
                local.get 2
                i32.const 56
                i32.add
                local.set 4
                br 1 (;@5;)
              end
              local.get 4
              i32.load16_u offset=18
              local.set 5
              local.get 2
              local.get 4
              i32.store offset=56
              i32.const 0
              local.get 2
              i32.const 56
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.store16 offset=74
              local.get 2
              i32.const 56
              i32.add
              local.set 4
              local.get 5
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              local.set 4
            end
            local.get 3
            local.get 0
            i32.load offset=5244
            i32.store offset=12
            local.get 2
            i32.const 823
            i32.store offset=64
            local.get 0
            local.get 3
            i32.store offset=5244
            i32.const 0
            local.get 4
            i32.load
            i32.store offset=75156
          end
          local.get 2
          i32.const 859
          i32.store offset=40
        end
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 3
        i32.store offset=75156
      end
      local.get 2
      i32.const 971
      i32.store offset=16
      local.get 1
      i32.const 32
      i32.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.const 1056964577
          i32.lt_s
          br_if 0 (;@3;)
          local.get 2
          i32.const 66174
          i32.store offset=44
          local.get 2
          i32.const 66341
          i32.store offset=36
          local.get 2
          i32.const 0
          i32.store16 offset=48
          local.get 2
          i32.const 0
          i32.store offset=40
          block ;; label = @4
            block ;; label = @5
              local.get 3
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.store offset=32
              local.get 2
              i32.const 0
              i32.store16 offset=50
              i32.const 0
              local.get 2
              i32.const 32
              i32.add
              i32.store offset=75156
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 1
            local.get 2
            local.get 3
            i32.store offset=32
            i32.const 0
            local.get 2
            i32.const 32
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            i32.store16 offset=50
            local.get 3
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
          end
          local.get 2
          i32.const 713
          i32.store offset=40
          local.get 2
          local.get 4
          call $allocPages__system_u4954
          local.set 3
          local.get 2
          i32.const 719
          i32.store offset=40
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 66196
          i32.store offset=60
          i32.const 0
          local.set 5
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          i32.const 0
          local.set 1
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load16_u offset=18
            local.set 1
            local.get 2
            local.get 6
            i32.store offset=56
            i32.const 0
            local.get 2
            i32.const 56
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 7
            i32.store16 offset=74
            local.get 6
            local.set 1
            local.get 7
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 1
          end
          local.get 0
          local.get 0
          i32.load offset=5224
          local.get 4
          i32.add
          i32.store offset=5224
          i32.const 0
          local.get 1
          i32.store offset=75156
          local.get 3
          local.get 4
          i32.store offset=4
          local.get 3
          i64.const 0
          i64.store offset=12 align=4
          local.get 3
          local.get 0
          i32.store offset=8
          local.get 3
          i32.const 1
          i32.store
          local.get 2
          i32.const 729
          i32.store offset=40
          local.get 2
          i32.const 66174
          i32.store offset=68
          local.get 2
          i32.const 65639
          i32.store offset=60
          local.get 2
          i32.const 0
          i32.store16 offset=72
          local.get 2
          i32.const 0
          i32.store offset=64
          block ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 1
            i32.store offset=56
            i32.const 0
            local.get 2
            i32.const 56
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=74
            local.get 1
            local.set 5
            local.get 4
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 5
          end
          i32.const 0
          local.get 5
          i32.store offset=75156
          local.get 0
          local.get 0
          i32.const 5248
          i32.add
          local.get 3
          i32.const 12
          i32.shr_s
          call $incl__system_u5151
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          local.tee 1
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 2
        i32.const 972
        i32.store offset=16
        local.get 0
        local.get 4
        call $getBigChunk__system_u5449
        local.set 3
        i32.const 0
        i32.load offset=75156
        local.set 1
      end
      local.get 3
      i32.const 32
      i32.add
      local.set 10
      local.get 3
      i32.load offset=4
      local.set 6
    end
    local.get 0
    local.get 0
    i32.load offset=5236
    local.get 6
    i32.add
    i32.store offset=5236
    i32.const 0
    local.get 1
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
    local.get 10
  )
  (func $alignedAlloc__system_u1882 (;47;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 16
        i32.gt_s
        br_if 0 (;@2;)
        local.get 2
        i32.const 66174
        i32.store offset=20
        local.get 2
        i32.const 66619
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 1
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.store offset=8
            local.get 2
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 1
          i32.load16_u offset=18
          local.set 3
          local.get 2
          local.get 1
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 3
          i32.const 1
          i32.add
          local.tee 1
          i32.store16 offset=26
          local.get 1
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 1147
        i32.store offset=16
        i32.const 68628
        local.get 0
        call $rawAlloc__system_u5592
        local.set 3
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.set 3
      block ;; label = @2
        local.get 1
        i32.const 0
        i32.lt_s
        local.get 0
        local.get 1
        i32.add
        local.tee 4
        local.get 0
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.const -1
        i32.add
        local.tee 0
        local.get 4
        i32.ge_s
        br_if 0 (;@2;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 3
        local.get 0
        i32.lt_s
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 3
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 3
          i64.extend_i32_s
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        i32.const 66174
        i32.store offset=20
        local.get 2
        i32.const 66619
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 0
            br_if 0 (;@4;)
            local.get 2
            local.get 0
            i32.store offset=8
            local.get 2
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 0
          i32.load16_u offset=18
          local.set 4
          local.get 2
          local.get 0
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 4
          i32.const 1
          i32.add
          local.tee 0
          i32.store16 offset=26
          local.get 0
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 1147
        i32.store offset=16
        i32.const 0
        local.set 5
        i32.const 68628
        local.get 3
        call $rawAlloc__system_u5592
        local.set 3
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 0
        local.get 2
        i32.const 66116
        i32.store offset=20
        local.get 2
        i32.const 66716
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        local.get 1
        local.get 3
        local.get 1
        i32.const -1
        i32.add
        i32.and
        i32.sub
        local.set 4
        i32.const 0
        local.set 1
        block ;; label = @3
          local.get 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.load16_u offset=18
          local.set 1
          local.get 2
          local.get 0
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 6
          i32.store16 offset=26
          local.get 0
          local.set 1
          local.get 6
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 1
        end
        local.get 4
        local.get 3
        i32.add
        local.tee 3
        i32.const -2
        i32.add
        local.get 4
        i32.store16
        local.get 2
        i32.const 66116
        i32.store offset=20
        local.get 2
        i32.const 66716
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load16_u offset=18
          local.set 0
          local.get 2
          local.get 1
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.store16 offset=26
          local.get 1
          local.set 5
          local.get 0
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 5
        end
        i32.const 0
        local.get 5
        i32.store offset=75156
        br 1 (;@1;)
      end
      call $raiseOverflow
      i32.const 0
      local.set 3
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $raiseRangeErrorI (;48;) (type 21) (param i64 i64 i64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    call $dollar___systemZdollars_u11
    block ;; label = @1
      i32.const 0
      i32.load8_u offset=75168
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.set 4
      local.get 3
      i32.load offset=8
      local.set 5
      local.get 3
      i32.const 8
      i32.add
      local.get 1
      call $dollar___systemZdollars_u11
      i32.const 0
      i32.load8_u offset=75168
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.set 6
      local.get 3
      i32.load offset=8
      local.set 7
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      call $dollar___systemZdollars_u11
      i32.const 0
      local.set 8
      i32.const 0
      i32.load8_u offset=75168
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.set 9
      block ;; label = @2
        local.get 7
        local.get 5
        i32.add
        local.get 3
        i32.load offset=8
        local.tee 10
        i32.add
        local.tee 11
        i32.const -30
        i32.lt_s
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 11
          i32.const 32
          i32.add
          local.tee 12
          local.get 11
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 12
          i32.const 4
          i32.add
          local.tee 13
          local.get 12
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 13
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 13
          i64.extend_i32_s
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          br 1 (;@2;)
        end
        local.get 11
        i32.const 31
        i32.add
        local.set 12
        local.get 3
        i32.const 66174
        i32.store offset=20
        local.get 3
        i32.const 66619
        i32.store offset=12
        local.get 3
        i32.const 0
        i32.store16 offset=24
        local.get 3
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 11
            br_if 0 (;@4;)
            local.get 3
            i32.const 0
            i32.store offset=8
            local.get 3
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 3
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 11
          i32.load16_u offset=18
          local.set 8
          local.get 3
          local.get 11
          i32.store offset=8
          i32.const 0
          local.get 3
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 3
          local.get 8
          i32.const 1
          i32.add
          local.tee 11
          i32.store16 offset=26
          local.get 11
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 3
        i32.const 1147
        i32.store offset=16
        i32.const 68628
        local.get 13
        call $rawAlloc__system_u5592
        local.set 8
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        local.get 8
        i32.const 0
        i32.store8 offset=4
        local.get 8
        local.get 12
        i32.store
      end
      local.get 8
      i32.const 17
      i32.add
      i32.const 0
      i64.load offset=67273 align=1
      i64.store align=1
      local.get 8
      i32.const 12
      i32.add
      i32.const 0
      i64.load offset=67268 align=4
      i64.store align=1
      local.get 8
      i32.const 0
      i64.load offset=67260 align=4
      i64.store offset=4 align=1
      i32.const 20
      local.set 11
      block ;; label = @2
        local.get 5
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 5
          i32.const 1
          i32.add
          local.tee 12
          local.get 5
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 12
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          i64.const -2147483648
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          br 1 (;@2;)
        end
        local.get 8
        i32.const 24
        i32.add
        local.get 4
        i32.const 4
        i32.add
        local.get 12
        call $__memcpy
        drop
        i32.const 20
        local.set 11
        block ;; label = @3
          local.get 5
          i32.const 20
          i32.add
          local.tee 12
          local.get 5
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 12
        local.set 11
      end
      local.get 8
      local.get 11
      i32.add
      i32.const 4
      i32.add
      i64.const 9128598458822176
      i64.store align=1
      block ;; label = @2
        block ;; label = @3
          local.get 11
          i32.const 7
          i32.add
          local.tee 5
          local.get 11
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 5
        local.set 11
      end
      block ;; label = @2
        local.get 7
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 7
          i32.const 1
          i32.add
          local.tee 5
          local.get 7
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 5
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          i64.const -2147483648
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          br 1 (;@2;)
        end
        local.get 8
        local.get 11
        i32.add
        i32.const 4
        i32.add
        local.get 6
        i32.const 4
        i32.add
        local.get 5
        call $__memcpy
        drop
        block ;; label = @3
          local.get 7
          i32.const 0
          i32.lt_s
          local.get 11
          local.get 7
          i32.add
          local.tee 5
          local.get 11
          i32.lt_s
          i32.eq
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 5
        local.set 11
      end
      local.get 8
      local.get 11
      i32.add
      local.tee 5
      i32.const 8
      i32.add
      i32.const 0
      i32.load8_u offset=67292
      i32.store8
      local.get 5
      i32.const 4
      i32.add
      i32.const 0
      i32.load offset=67288
      i32.store align=1
      block ;; label = @2
        block ;; label = @3
          local.get 11
          i32.const 4
          i32.add
          local.tee 5
          local.get 11
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 5
        local.set 11
      end
      block ;; label = @2
        local.get 10
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 10
          i32.const 1
          i32.add
          local.tee 5
          local.get 10
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        block ;; label = @3
          local.get 5
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          i64.const -2147483648
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          br 1 (;@2;)
        end
        local.get 8
        local.get 11
        i32.add
        i32.const 4
        i32.add
        local.get 9
        i32.const 4
        i32.add
        local.get 5
        call $__memcpy
        drop
        block ;; label = @3
          local.get 10
          i32.const 0
          i32.lt_s
          local.get 11
          local.get 10
          i32.add
          local.tee 5
          local.get 11
          i32.lt_s
          i32.eq
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 5
        local.set 11
      end
      local.get 8
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 11
      i64.extend_i32_u
      i64.or
      call $sysFatal__system_u3952
      block ;; label = @2
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.const 3
        i32.add
        i32.load8_u
        i32.const 64
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 66174
        i32.store offset=20
        local.get 3
        i32.const 66606
        i32.store offset=12
        local.get 3
        i32.const 0
        i32.store16 offset=24
        local.get 3
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 11
            br_if 0 (;@4;)
            local.get 3
            i32.const 0
            i32.store offset=8
            local.get 3
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 3
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 11
          i32.load16_u offset=18
          local.set 8
          local.get 3
          local.get 11
          i32.store offset=8
          i32.const 0
          local.get 3
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 3
          local.get 8
          i32.const 1
          i32.add
          local.tee 11
          i32.store16 offset=26
          local.get 11
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 3
        i32.const 1164
        i32.store offset=16
        i32.const 68628
        local.get 9
        call $rawDealloc__system_u5753
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
      end
      block ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 3
        i32.add
        i32.load8_u
        i32.const 64
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 66174
        i32.store offset=20
        local.get 3
        i32.const 66606
        i32.store offset=12
        local.get 3
        i32.const 0
        i32.store16 offset=24
        local.get 3
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 11
            br_if 0 (;@4;)
            local.get 3
            i32.const 0
            i32.store offset=8
            local.get 3
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 3
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 11
          i32.load16_u offset=18
          local.set 8
          local.get 3
          local.get 11
          i32.store offset=8
          i32.const 0
          local.get 3
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 3
          local.get 8
          i32.const 1
          i32.add
          local.tee 11
          i32.store16 offset=26
          local.get 11
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 3
        i32.const 1164
        i32.store offset=16
        i32.const 68628
        local.get 6
        call $rawDealloc__system_u5753
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
      end
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 3
      i32.add
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 3
      i32.const 66174
      i32.store offset=20
      local.get 3
      i32.const 66606
      i32.store offset=12
      local.get 3
      i32.const 0
      i32.store16 offset=24
      local.get 3
      i32.const 0
      i32.store offset=16
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 11
          br_if 0 (;@3;)
          local.get 3
          i32.const 0
          i32.store offset=8
          local.get 3
          i32.const 0
          i32.store16 offset=26
          i32.const 0
          local.get 3
          i32.const 8
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 11
        i32.load16_u offset=18
        local.set 8
        local.get 3
        local.get 11
        i32.store offset=8
        i32.const 0
        local.get 3
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 3
        local.get 8
        i32.const 1
        i32.add
        local.tee 11
        i32.store16 offset=26
        local.get 11
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 3
      i32.const 1164
      i32.store offset=16
      i32.const 68628
      local.get 4
      call $rawDealloc__system_u5753
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $nimNewObj (;49;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66164
    i32.store offset=12
    local.get 2
    i32.const 66398
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 66164
    i32.store offset=12
    local.get 2
    i32.const 91
    i32.store offset=8
    local.get 2
    i32.const 66143
    i32.store offset=36
    local.get 2
    i32.const 66039
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 4
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      i32.const 1108
      i32.store offset=32
      block ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 3
        local.get 1
        i32.ge_s
        br_if 0 (;@2;)
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 3
        i32.lt_s
        br_if 0 (;@2;)
        local.get 4
        local.get 3
        i32.const -1
        i32.xor
        i32.and
        local.set 3
        br 1 (;@1;)
      end
      call $raiseOverflow
    end
    i32.const 0
    local.set 4
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 92
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.const 0
        i32.lt_s
        local.get 0
        local.get 3
        i32.add
        local.tee 5
        local.get 0
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      local.get 2
      i32.const 66164
      i32.store offset=12
      local.get 2
      i32.const 96
      i32.store offset=8
      block ;; label = @2
        local.get 5
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 5
        i64.extend_i32_s
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 1
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 1
        i64.extend_i32_s
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 5
      local.get 1
      call $alignedAlloc0__system_u1922
      local.set 4
      local.get 2
      i32.const 66184
      i32.store offset=12
      local.get 2
      i32.const 61
      i32.store offset=8
      local.get 2
      i32.const 66116
      i32.store offset=36
      local.get 2
      i32.const 66716
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      i32.const 0
      local.set 1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load16_u offset=18
        local.set 1
        local.get 2
        local.get 0
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=42
        local.get 0
        local.set 1
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 1
      end
      i32.const 0
      local.get 1
      i32.store offset=75156
      local.get 3
      local.get 4
      i32.add
      local.set 4
    end
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $raiseExceptionEx (;50;) (type 12) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block ;; label = @1
      local.get 0
      i32.load offset=8
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store offset=8
    end
    local.get 0
    i32.const 20
    i32.add
    local.set 6
    i32.const 0
    i32.load offset=75156
    local.set 1
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load offset=20
        local.tee 7
        br_if 0 (;@2;)
        local.get 1
        local.get 6
        call $auxWriteStackTrace__system_u3282
        br 1 (;@1;)
      end
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      i32.const 1
      i32.add
      local.tee 8
      local.get 7
      i32.lt_s
      local.set 9
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.const 24
                i32.add
                i32.load
                local.tee 10
                i32.eqz
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 9
                  br_if 0 (;@7;)
                  local.get 10
                  i32.load
                  i32.const -1073741825
                  i32.and
                  local.get 8
                  i32.ge_s
                  br_if 3 (;@4;)
                  local.get 7
                  local.get 10
                  i32.const 1
                  i32.const 12
                  i32.const 4
                  call $prepareSeqAddUninit
                  local.set 10
                  br 2 (;@5;)
                end
                call $raiseOverflow
                br 4 (;@2;)
              end
              local.get 5
              i32.const 66143
              i32.store offset=36
              local.get 5
              i32.const 66039
              i32.store offset=28
              local.get 5
              i32.const 0
              i32.store16 offset=40
              local.get 5
              i32.const 0
              i32.store offset=32
              local.get 1
              i32.load16_u offset=18
              local.set 10
              local.get 5
              local.get 1
              i32.store offset=24
              i32.const 0
              local.get 5
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 5
              local.get 10
              i32.const 1
              i32.add
              local.tee 10
              i32.store16 offset=42
              block ;; label = @6
                local.get 10
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                i32.load
                local.set 1
              end
              i32.const 0
              local.get 1
              i32.store offset=75156
              local.get 9
              br_if 2 (;@3;)
              local.get 8
              i32.const 12
              i32.const 4
              call $newSeqPayloadUninit
              local.set 10
            end
            local.get 0
            local.get 10
            i32.store offset=24
          end
          local.get 6
          local.get 8
          i32.store
          local.get 10
          local.get 7
          i32.const 12
          i32.mul
          i32.add
          local.tee 1
          i32.const 12
          i32.add
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          i64.const -42949672960
          i64.store align=4
          br 1 (;@2;)
        end
        call $raiseOverflow
        local.get 0
        i32.const 0
        i32.store offset=24
        call $raiseOverflow
      end
      i32.const 0
      local.set 1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=75156
                local.tee 7
                i32.eqz
                br_if 0 (;@6;)
                local.get 7
                local.set 10
                loop ;; label = @7
                  local.get 1
                  local.tee 8
                  i32.const 1
                  i32.add
                  local.set 1
                  local.get 10
                  i32.load
                  local.tee 10
                  br_if 0 (;@7;)
                end
                local.get 6
                i32.load
                local.tee 10
                br_if 2 (;@4;)
                local.get 5
                i32.const 66143
                i32.store offset=12
                local.get 5
                i32.const 66014
                i32.store offset=4
                i32.const 0
                local.set 9
                local.get 5
                i32.const 0
                i32.store16 offset=16
                local.get 5
                i32.const 0
                i32.store offset=8
                local.get 7
                i32.load16_u offset=18
                local.set 10
                local.get 5
                local.get 7
                i32.store
                i32.const 0
                local.get 5
                i32.store offset=75156
                local.get 5
                local.get 10
                i32.const 1
                i32.add
                local.tee 11
                i32.store16 offset=18
                local.get 5
                local.set 10
                block ;; label = @7
                  local.get 11
                  i32.const 65535
                  i32.and
                  i32.const 2000
                  i32.ne
                  br_if 0 (;@7;)
                  call $callDepthLimitReached__system_u3735
                  i32.const 0
                  i32.load offset=75156
                  local.set 10
                end
                local.get 5
                i32.const 66143
                i32.store offset=12
                local.get 5
                i32.const 635
                i32.store offset=8
                local.get 5
                i32.const 66143
                i32.store offset=36
                local.get 5
                i32.const 66039
                i32.store offset=28
                local.get 5
                i32.const 0
                i32.store16 offset=40
                local.get 5
                i32.const 0
                i32.store offset=32
                block ;; label = @7
                  local.get 10
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 10
                  i32.load16_u offset=18
                  local.set 9
                  local.get 5
                  local.get 10
                  i32.store offset=24
                  i32.const 0
                  local.get 5
                  i32.const 24
                  i32.add
                  i32.store offset=75156
                  local.get 5
                  local.get 9
                  i32.const 1
                  i32.add
                  local.tee 11
                  i32.store16 offset=42
                  local.get 10
                  local.set 9
                  local.get 11
                  i32.const 65535
                  i32.and
                  i32.const 2000
                  i32.ne
                  br_if 0 (;@7;)
                  call $callDepthLimitReached__system_u3735
                  i32.const 0
                  i32.load offset=75156
                  i32.load
                  local.set 9
                end
                i32.const 0
                local.get 9
                i32.store offset=75156
                local.get 1
                i32.const 12
                i32.const 4
                call $newSeqPayloadUninit
                local.tee 10
                i32.const 4
                i32.add
                i32.const 0
                local.get 8
                i32.const 12
                i32.mul
                i32.const 12
                i32.add
                call $__memset
                drop
                i32.const 0
                i32.load offset=75156
                i32.load
                local.set 8
                br 1 (;@5;)
              end
              local.get 6
              i32.load
              br_if 3 (;@2;)
              i32.const 0
              local.set 8
              i32.const 0
              local.set 10
              i32.const 0
              local.set 1
            end
            i32.const 0
            local.get 8
            i32.store offset=75156
            block ;; label = @5
              local.get 0
              i32.load offset=24
              local.tee 9
              local.get 10
              i32.eq
              br_if 0 (;@5;)
              local.get 9
              i32.eqz
              br_if 0 (;@5;)
              local.get 9
              i32.const 3
              i32.add
              i32.load8_u
              i32.const 64
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i32.const 66174
              i32.store offset=36
              local.get 5
              i32.const 66606
              i32.store offset=28
              local.get 5
              i32.const 0
              i32.store16 offset=40
              local.get 5
              i32.const 0
              i32.store offset=32
              block ;; label = @6
                block ;; label = @7
                  local.get 8
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 0
                  i32.store offset=24
                  local.get 5
                  i32.const 0
                  i32.store16 offset=42
                  i32.const 0
                  local.get 5
                  i32.const 24
                  i32.add
                  i32.store offset=75156
                  br 1 (;@6;)
                end
                local.get 8
                i32.load16_u offset=18
                local.set 11
                local.get 5
                local.get 8
                i32.store offset=24
                i32.const 0
                local.get 5
                i32.const 24
                i32.add
                i32.store offset=75156
                local.get 5
                local.get 11
                i32.const 1
                i32.add
                local.tee 8
                i32.store16 offset=42
                local.get 8
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
              end
              local.get 5
              i32.const 1164
              i32.store offset=32
              i32.const 68628
              local.get 9
              call $rawDealloc__system_u5753
              i32.const 0
              i32.const 0
              i32.load offset=75156
              i32.load
              i32.store offset=75156
            end
            local.get 0
            local.get 10
            i32.store offset=24
            local.get 0
            local.get 1
            i32.store offset=20
            br 1 (;@3;)
          end
          local.get 10
          local.get 1
          i32.add
          local.set 11
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  local.get 0
                  i32.load offset=24
                  local.tee 9
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 9
                  i32.load
                  i32.const -1073741825
                  i32.and
                  local.get 11
                  i32.ge_s
                  br_if 1 (;@6;)
                end
                local.get 10
                i32.const 0
                i32.gt_s
                local.get 11
                local.get 10
                i32.sub
                local.tee 12
                local.get 11
                i32.lt_s
                i32.xor
                br_if 1 (;@5;)
                local.get 0
                local.get 10
                local.get 9
                local.get 12
                i32.const 12
                i32.const 4
                call $prepareSeqAddUninit
                i32.store offset=24
              end
              local.get 6
              local.get 11
              i32.store
              block ;; label = @6
                local.get 1
                i32.const 3
                i32.and
                local.tee 12
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 1
                loop ;; label = @7
                  local.get 0
                  i32.load offset=24
                  local.get 10
                  i32.const 12
                  i32.mul
                  i32.add
                  local.tee 9
                  i32.const 12
                  i32.add
                  i32.const 0
                  i32.store align=1
                  local.get 9
                  i32.const 4
                  i32.add
                  i64.const 0
                  i64.store align=1
                  local.get 10
                  i32.const 1
                  i32.add
                  local.set 10
                  local.get 1
                  i32.const 1
                  i32.add
                  local.tee 1
                  local.get 12
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 8
              i32.const 3
              i32.lt_u
              br_if 1 (;@4;)
              loop ;; label = @6
                local.get 0
                i32.load offset=24
                local.get 10
                i32.const 12
                i32.mul
                local.tee 1
                i32.add
                local.tee 8
                i32.const 12
                i32.add
                i32.const 0
                i32.store align=1
                local.get 8
                i32.const 4
                i32.add
                i64.const 0
                i64.store align=1
                local.get 1
                local.get 0
                i32.load offset=24
                i32.add
                local.tee 8
                i32.const 24
                i32.add
                i32.const 0
                i32.store align=1
                local.get 8
                i32.const 16
                i32.add
                i64.const 0
                i64.store align=1
                local.get 1
                local.get 0
                i32.load offset=24
                i32.add
                local.tee 8
                i32.const 36
                i32.add
                i32.const 0
                i32.store align=1
                local.get 8
                i32.const 28
                i32.add
                i64.const 0
                i64.store align=1
                local.get 1
                local.get 0
                i32.load offset=24
                i32.add
                local.tee 1
                i32.const 48
                i32.add
                i32.const 0
                i32.store align=1
                local.get 1
                i32.const 40
                i32.add
                i64.const 0
                i64.store align=1
                local.get 10
                i32.const 4
                i32.add
                local.tee 10
                local.get 11
                i32.ne
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
              unreachable
            end
            call $raiseOverflow
          end
          local.get 11
          local.set 1
        end
        local.get 7
        i32.eqz
        br_if 0 (;@2;)
        loop ;; label = @3
          local.get 7
          i64.load offset=4 align=4
          local.set 13
          local.get 0
          i32.load offset=24
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.const 12
          i32.mul
          i32.add
          local.tee 10
          i32.const 12
          i32.add
          local.get 7
          i32.load offset=12
          i32.store
          local.get 10
          i32.const 4
          i32.add
          local.get 13
          i64.store align=4
          local.get 7
          i32.load
          local.tee 7
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.load offset=20
      local.tee 1
      i32.const 1
      i32.add
      local.tee 10
      local.get 1
      i32.lt_s
      local.set 8
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.load offset=24
              local.tee 7
              i32.eqz
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 8
                br_if 0 (;@6;)
                local.get 7
                i32.load
                i32.const -1073741825
                i32.and
                local.get 10
                i32.ge_s
                br_if 3 (;@3;)
                local.get 1
                local.get 7
                i32.const 1
                i32.const 12
                i32.const 4
                call $prepareSeqAddUninit
                local.set 7
                br 2 (;@4;)
              end
              call $raiseOverflow
              br 4 (;@1;)
            end
            local.get 5
            i32.const 66143
            i32.store offset=36
            local.get 5
            i32.const 66039
            i32.store offset=28
            local.get 5
            i32.const 0
            i32.store16 offset=40
            local.get 5
            i32.const 0
            i32.store offset=32
            i32.const 0
            local.set 7
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 9
              i32.eqz
              br_if 0 (;@5;)
              local.get 9
              i32.load16_u offset=18
              local.set 7
              local.get 5
              local.get 9
              i32.store offset=24
              i32.const 0
              local.get 5
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 5
              local.get 7
              i32.const 1
              i32.add
              local.tee 11
              i32.store16 offset=42
              local.get 9
              local.set 7
              local.get 11
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 7
            end
            i32.const 0
            local.get 7
            i32.store offset=75156
            local.get 8
            br_if 2 (;@2;)
            local.get 10
            i32.const 12
            i32.const 4
            call $newSeqPayloadUninit
            local.set 7
          end
          local.get 0
          local.get 7
          i32.store offset=24
        end
        local.get 6
        local.get 10
        i32.store
        local.get 7
        local.get 1
        i32.const 12
        i32.mul
        i32.add
        local.tee 1
        i32.const 12
        i32.add
        i32.const 0
        i32.store
        local.get 1
        i32.const 4
        i32.add
        i64.const -429496729600
        i64.store align=4
        br 1 (;@1;)
      end
      call $raiseOverflow
      local.get 0
      i32.const 0
      i32.store offset=24
      call $raiseOverflow
    end
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75160
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call_indirect (type 3)
        i32.eqz
        br_if 1 (;@1;)
      end
      block ;; label = @2
        i32.const 0
        i32.load offset=75164
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call_indirect (type 3)
        i32.eqz
        br_if 1 (;@1;)
      end
      i32.const 0
      i32.load offset=75156
      local.set 1
      block ;; label = @2
        i32.const 0
        i32.load offset=75700
        local.tee 7
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.const 66164
        i32.store offset=12
        local.get 5
        i32.const 66474
        i32.store offset=4
        local.get 5
        i32.const 0
        i32.store16 offset=16
        local.get 5
        i32.const 0
        i32.store offset=8
        block ;; label = @3
          block ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            local.get 5
            i32.const 0
            i32.store
            local.get 5
            i32.const 0
            i32.store16 offset=18
            local.get 5
            local.set 10
            br 1 (;@3;)
          end
          local.get 1
          i32.load16_u offset=18
          local.set 10
          local.get 5
          local.get 1
          i32.store
          i32.const 0
          local.get 5
          i32.store offset=75156
          local.get 5
          local.get 10
          i32.const 1
          i32.add
          local.tee 1
          i32.store16 offset=18
          local.get 5
          local.set 10
          local.get 1
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          local.set 10
        end
        local.get 5
        i32.const 58
        i32.store offset=8
        local.get 5
        i32.const 66164
        i32.store offset=12
        local.get 5
        i32.const 66116
        i32.store offset=36
        local.get 5
        i32.const 66713
        i32.store offset=28
        local.get 5
        i32.const 0
        i32.store16 offset=40
        local.get 5
        i32.const 0
        i32.store offset=32
        i32.const 0
        local.set 1
        block ;; label = @3
          local.get 10
          i32.eqz
          br_if 0 (;@3;)
          local.get 10
          i32.load16_u offset=18
          local.set 1
          local.get 5
          local.get 10
          i32.store offset=24
          i32.const 0
          local.get 5
          i32.const 24
          i32.add
          i32.store offset=75156
          local.get 5
          local.get 1
          i32.const 1
          i32.add
          local.tee 8
          i32.store16 offset=42
          local.get 10
          local.set 1
          local.get 8
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 1
        end
        i32.const 0
        local.get 1
        i32.store offset=75156
        block ;; label = @3
          block ;; label = @4
            local.get 7
            i32.const -4
            i32.add
            local.tee 8
            i32.load
            local.tee 10
            i32.const 8
            i32.add
            local.tee 9
            local.get 10
            i32.ge_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 1
            br 1 (;@3;)
          end
          local.get 8
          local.get 9
          i32.store
        end
        local.get 1
        i32.load
        local.set 1
      end
      local.get 0
      i32.load offset=28
      local.set 10
      local.get 5
      i32.const 66164
      i32.store offset=12
      local.get 5
      i32.const 65708
      i32.store offset=4
      local.get 5
      i32.const 0
      i32.store16 offset=16
      local.get 5
      i32.const 0
      i32.store offset=8
      block ;; label = @2
        block ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 5
          i32.const 0
          i32.store
          local.get 5
          i32.const 0
          i32.store16 offset=18
          i32.const 0
          local.get 5
          i32.store offset=75156
          local.get 5
          local.set 1
          br 1 (;@2;)
        end
        local.get 1
        i32.load16_u offset=18
        local.set 8
        local.get 5
        local.get 1
        i32.store
        i32.const 0
        local.get 5
        i32.store offset=75156
        local.get 5
        local.get 8
        i32.const 1
        i32.add
        local.tee 8
        i32.store16 offset=18
        local.get 5
        local.set 1
        local.get 8
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 1
      end
      block ;; label = @2
        block ;; label = @3
          local.get 10
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.set 1
          br 1 (;@2;)
        end
        local.get 5
        i32.const 58
        i32.store offset=8
        local.get 5
        i32.const 66116
        i32.store offset=36
        local.get 5
        i32.const 66713
        i32.store offset=28
        local.get 5
        i32.const 0
        i32.store16 offset=40
        local.get 5
        i32.const 0
        i32.store offset=32
        i32.const 0
        local.set 8
        block ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load16_u offset=18
          local.set 8
          local.get 5
          local.get 1
          i32.store offset=24
          i32.const 0
          local.get 5
          i32.const 24
          i32.add
          i32.store offset=75156
          local.get 5
          local.get 8
          i32.const 1
          i32.add
          local.tee 9
          i32.store16 offset=42
          local.get 1
          local.set 8
          local.get 9
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 8
        end
        i32.const 0
        local.get 8
        i32.store offset=75156
        block ;; label = @3
          local.get 10
          i32.const -4
          i32.add
          local.tee 10
          i32.load
          local.tee 1
          i32.const 8
          i32.lt_u
          br_if 0 (;@3;)
          local.get 5
          i32.const 234
          i32.store offset=8
          block ;; label = @4
            local.get 1
            i32.const -8
            i32.add
            local.tee 9
            local.get 1
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 1
            br 2 (;@2;)
          end
          local.get 10
          local.get 9
          i32.store
          local.get 8
          i32.load
          local.set 1
          br 1 (;@2;)
        end
        i32.const 0
        local.get 8
        i32.load
        i32.store offset=75156
        local.get 0
        i32.load offset=28
        call $nimDestroyAndDispose
        i32.const 0
        i32.load offset=75156
        local.set 1
      end
      local.get 0
      local.get 7
      i32.store offset=28
      i32.const 0
      i32.load offset=75700
      local.set 10
      local.get 5
      i32.const 66164
      i32.store offset=12
      local.get 5
      i32.const 65708
      i32.store offset=4
      local.get 5
      i32.const 0
      i32.store16 offset=16
      local.get 5
      i32.const 0
      i32.store offset=8
      block ;; label = @2
        block ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 5
          i32.const 0
          i32.store
          local.get 5
          i32.const 0
          i32.store16 offset=18
          i32.const 0
          local.get 5
          i32.store offset=75156
          local.get 5
          local.set 1
          br 1 (;@2;)
        end
        local.get 1
        i32.load16_u offset=18
        local.set 7
        local.get 5
        local.get 1
        i32.store
        i32.const 0
        local.get 5
        i32.store offset=75156
        local.get 5
        local.get 7
        i32.const 1
        i32.add
        local.tee 7
        i32.store16 offset=18
        local.get 5
        local.set 1
        local.get 7
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 1
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 10
              br_if 0 (;@5;)
              local.get 1
              local.set 7
              br 1 (;@4;)
            end
            local.get 5
            i32.const 58
            i32.store offset=8
            local.get 5
            i32.const 66116
            i32.store offset=36
            local.get 5
            i32.const 66713
            i32.store offset=28
            local.get 5
            i32.const 0
            i32.store16 offset=40
            local.get 5
            i32.const 0
            i32.store offset=32
            i32.const 0
            local.set 7
            block ;; label = @5
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.load16_u offset=18
              local.set 7
              local.get 5
              local.get 1
              i32.store offset=24
              i32.const 0
              local.get 5
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 5
              local.get 7
              i32.const 1
              i32.add
              local.tee 8
              i32.store16 offset=42
              local.get 1
              local.set 7
              local.get 8
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 7
            end
            i32.const 0
            local.get 7
            i32.store offset=75156
            local.get 10
            i32.const -4
            i32.add
            local.tee 10
            i32.load
            local.tee 1
            i32.const 8
            i32.lt_u
            br_if 1 (;@3;)
            local.get 5
            i32.const 234
            i32.store offset=8
            block ;; label = @5
              local.get 1
              i32.const -8
              i32.add
              local.tee 8
              local.get 1
              i32.lt_s
              br_if 0 (;@5;)
              call $raiseOverflow
              i32.const 0
              i32.load offset=75156
              local.set 7
              br 1 (;@4;)
            end
            local.get 10
            local.get 8
            i32.store
          end
          i32.const 0
          local.get 7
          i32.load
          i32.store offset=75156
          br 1 (;@2;)
        end
        i32.const 0
        local.get 7
        i32.load
        i32.store offset=75156
        i32.const 0
        i32.load offset=75700
        call $nimDestroyAndDispose
      end
      i32.const 0
      i32.const 1
      i32.store8 offset=75168
      i32.const 0
      local.get 0
      i32.store offset=75700
    end
    local.get 5
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $sysFatal__system_u3952 (;51;) (type 22) (param i64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 66154
    i32.store offset=12
    local.get 1
    i32.const 66253
    i32.store offset=4
    local.get 1
    i32.const 0
    i32.store16 offset=16
    local.get 1
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 2
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store
        local.get 1
        i32.const 0
        i32.store16 offset=18
        i32.const 0
        local.get 1
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.load16_u offset=18
      local.set 3
      local.get 1
      local.get 2
      i32.store
      i32.const 0
      local.get 1
      i32.store offset=75156
      local.get 1
      local.get 3
      i32.const 1
      i32.add
      local.tee 2
      i32.store16 offset=18
      local.get 2
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    i32.const 32
    i32.const 4
    call $nimNewObj
    local.tee 2
    local.get 0
    i64.store offset=12 align=4
    local.get 2
    i32.const 65810
    i32.store offset=8
    local.get 2
    i32.const 68224
    i32.store
    local.get 1
    i32.const 66154
    i32.store offset=12
    local.get 1
    i32.const 53
    i32.store offset=8
    local.get 2
    i32.const 20
    i32.add
    local.set 3
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.load offset=20
        local.tee 4
        br_if 0 (;@2;)
        local.get 3
        call $rawWriteStackTrace__system_u3515
        br 1 (;@1;)
      end
      i32.const 0
      i32.load offset=75156
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 1
      i32.add
      local.tee 6
      local.get 4
      i32.lt_s
      local.set 7
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 2
                i32.const 24
                i32.add
                i32.load
                local.tee 8
                i32.eqz
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 7
                  br_if 0 (;@7;)
                  local.get 8
                  i32.load
                  i32.const -1073741825
                  i32.and
                  local.get 6
                  i32.ge_s
                  br_if 3 (;@4;)
                  local.get 4
                  local.get 8
                  i32.const 1
                  i32.const 12
                  i32.const 4
                  call $prepareSeqAddUninit
                  local.set 8
                  br 2 (;@5;)
                end
                call $raiseOverflow
                br 4 (;@2;)
              end
              local.get 1
              i32.const 66143
              i32.store offset=36
              local.get 1
              i32.const 66039
              i32.store offset=28
              local.get 1
              i32.const 0
              i32.store16 offset=40
              local.get 1
              i32.const 0
              i32.store offset=32
              local.get 5
              i32.load16_u offset=18
              local.set 8
              local.get 1
              local.get 5
              i32.store offset=24
              i32.const 0
              local.get 1
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 1
              local.get 8
              i32.const 1
              i32.add
              local.tee 8
              i32.store16 offset=42
              block ;; label = @6
                local.get 8
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                i32.load
                local.set 5
              end
              i32.const 0
              local.get 5
              i32.store offset=75156
              local.get 7
              br_if 2 (;@3;)
              local.get 6
              i32.const 12
              i32.const 4
              call $newSeqPayloadUninit
              local.set 8
            end
            local.get 2
            local.get 8
            i32.store offset=24
          end
          local.get 3
          local.get 6
          i32.store
          local.get 8
          local.get 4
          i32.const 12
          i32.mul
          i32.add
          local.tee 4
          i32.const 12
          i32.add
          i32.const 0
          i32.store
          local.get 4
          i32.const 4
          i32.add
          i64.const -42949672960
          i64.store align=4
          br 1 (;@2;)
        end
        call $raiseOverflow
        local.get 2
        i32.const 0
        i32.store offset=24
        call $raiseOverflow
      end
      i32.const 0
      local.set 6
      i32.const 0
      i32.load offset=75156
      local.get 3
      call $auxWriteStackTrace__system_u3282
      local.get 2
      i32.load offset=20
      local.tee 4
      i32.const 1
      i32.add
      local.tee 7
      local.get 4
      i32.lt_s
      local.set 8
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 2
              i32.load offset=24
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 8
                br_if 0 (;@6;)
                local.get 5
                i32.load
                i32.const -1073741825
                i32.and
                local.get 7
                i32.ge_s
                br_if 3 (;@3;)
                local.get 4
                local.get 5
                i32.const 1
                i32.const 12
                i32.const 4
                call $prepareSeqAddUninit
                local.set 5
                br 2 (;@4;)
              end
              call $raiseOverflow
              br 4 (;@1;)
            end
            local.get 1
            i32.const 66143
            i32.store offset=36
            local.get 1
            i32.const 66039
            i32.store offset=28
            local.get 1
            i32.const 0
            i32.store16 offset=40
            local.get 1
            i32.const 0
            i32.store offset=32
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              i32.load16_u offset=18
              local.set 6
              local.get 1
              local.get 5
              i32.store offset=24
              i32.const 0
              local.get 1
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 1
              local.get 6
              i32.const 1
              i32.add
              local.tee 9
              i32.store16 offset=42
              local.get 5
              local.set 6
              local.get 9
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 6
            end
            i32.const 0
            local.get 6
            i32.store offset=75156
            local.get 8
            br_if 2 (;@2;)
            local.get 7
            i32.const 12
            i32.const 4
            call $newSeqPayloadUninit
            local.set 5
          end
          local.get 2
          local.get 5
          i32.store offset=24
        end
        local.get 3
        local.get 7
        i32.store
        local.get 5
        local.get 4
        i32.const 12
        i32.mul
        i32.add
        local.tee 3
        i32.const 12
        i32.add
        i32.const 0
        i32.store
        local.get 3
        i32.const 4
        i32.add
        i64.const -429496729600
        i64.store align=4
        br 1 (;@1;)
      end
      call $raiseOverflow
      local.get 2
      i32.const 0
      i32.store offset=24
      call $raiseOverflow
    end
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75160
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        call_indirect (type 3)
        i32.eqz
        br_if 1 (;@1;)
      end
      block ;; label = @2
        i32.const 0
        i32.load offset=75164
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        call_indirect (type 3)
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 28
      i32.add
      i32.const 0
      i32.load offset=75700
      call $eqcopy___system_u3236
      i32.const 75700
      local.get 2
      call $eqsink___system_u3242
      i32.const 0
      i32.const 1
      i32.store8 offset=75168
    end
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 1
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $newSeqPayloadUninit (;52;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 1
        i32.ge_s
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.const 66143
      i32.store offset=20
      local.get 3
      i32.const 66039
      i32.store offset=12
      local.get 3
      i32.const 0
      i32.store16 offset=24
      local.get 3
      i32.const 0
      i32.store offset=16
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 4
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.store offset=8
          local.get 3
          i32.const 0
          i32.store16 offset=26
          i32.const 0
          local.get 3
          i32.const 8
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 4
        i32.load16_u offset=18
        local.set 5
        local.get 3
        local.get 4
        i32.store offset=8
        i32.const 0
        local.get 3
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 3
        local.get 5
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=26
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      block ;; label = @2
        block ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 4
          local.set 5
          br 1 (;@2;)
        end
        local.get 3
        i32.const 1108
        i32.store offset=16
        block ;; label = @3
          local.get 2
          i32.const -1
          i32.add
          local.tee 4
          local.get 2
          i32.ge_s
          br_if 0 (;@3;)
          local.get 4
          i32.const 4
          i32.add
          local.tee 5
          local.get 4
          i32.lt_s
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          i32.const -1
          i32.xor
          i32.and
          local.set 5
          br 1 (;@2;)
        end
        call $raiseOverflow
      end
      i32.const 0
      local.set 4
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
      block ;; label = @2
        local.get 0
        i64.extend_i32_s
        local.get 1
        i64.extend_i32_s
        i64.mul
        local.tee 6
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        local.get 6
        i32.wrap_i64
        local.tee 1
        i32.const 31
        i32.shr_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 1
        i32.const 0
        i32.lt_s
        local.get 5
        local.get 1
        i32.add
        local.tee 4
        local.get 5
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 4
        i64.extend_i32_s
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 2
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 2
        i64.extend_i32_s
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 4
      local.get 2
      call $alignedAlloc__system_u1882
      local.tee 4
      local.get 0
      i32.store
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $realloc__system_u5846 (;53;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 66174
    i32.store offset=20
    local.get 3
    i32.const 66598
    i32.store offset=12
    local.get 3
    i32.const 0
    i32.store16 offset=24
    local.get 3
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        i32.store offset=8
        local.get 3
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 3
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 3
      local.get 4
      i32.store offset=8
      i32.const 0
      local.get 3
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 3
      local.get 5
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=26
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        local.get 3
        i32.const 1168
        i32.store offset=16
        local.get 3
        i32.const 66174
        i32.store offset=68
        local.get 3
        i32.const 66619
        i32.store offset=60
        local.get 3
        i32.const 0
        i32.store16 offset=72
        local.get 3
        i32.const 0
        i32.store offset=64
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 4
            br_if 0 (;@4;)
            local.get 3
            local.get 4
            i32.store offset=56
            local.get 3
            i32.const 0
            i32.store16 offset=74
            i32.const 0
            local.get 3
            i32.const 56
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 5
          local.get 3
          local.get 4
          i32.store offset=56
          i32.const 0
          local.get 3
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 3
          local.get 5
          i32.const 1
          i32.add
          local.tee 4
          i32.store16 offset=74
          local.get 4
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 3
        i32.const 1147
        i32.store offset=64
        local.get 0
        local.get 2
        call $rawAlloc__system_u5592
        local.set 5
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.const 1170
        i32.store offset=16
        local.get 3
        i32.const 66174
        i32.store offset=44
        local.get 3
        i32.const 66499
        i32.store offset=36
        local.get 3
        i32.const 0
        i32.store16 offset=48
        local.get 3
        i32.const 0
        i32.store offset=40
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  local.get 4
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 4
                  i32.store offset=32
                  local.get 3
                  i32.const 0
                  i32.store16 offset=50
                  br 1 (;@6;)
                end
                local.get 4
                i32.load16_u offset=18
                local.set 6
                local.get 3
                local.get 4
                i32.store offset=32
                i32.const 0
                local.set 4
                i32.const 0
                local.get 3
                i32.const 32
                i32.add
                i32.store offset=75156
                local.get 3
                local.get 6
                i32.const 1
                i32.add
                local.tee 6
                i32.store16 offset=50
                local.get 6
                i32.const 65535
                i32.and
                i32.const 2000
                i32.eq
                br_if 1 (;@5;)
              end
              local.get 3
              i32.const 1133
              i32.store offset=40
              local.get 3
              i32.const 66174
              i32.store offset=68
              local.get 3
              i32.const 66005
              i32.store offset=60
              local.get 3
              i32.const 0
              i32.store16 offset=72
              local.get 3
              i32.const 0
              i32.store offset=64
              local.get 3
              i32.const 32
              i32.add
              local.set 6
              br 1 (;@4;)
            end
            call $callDepthLimitReached__system_u3735
            local.get 3
            i32.const 1133
            i32.store offset=40
            i32.const 0
            i32.load offset=75156
            local.set 6
            local.get 3
            i32.const 66174
            i32.store offset=68
            local.get 3
            i32.const 66005
            i32.store offset=60
            local.get 3
            i32.const 0
            i32.store16 offset=72
            local.get 3
            i32.const 0
            i32.store offset=64
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 6
          i32.load16_u offset=18
          local.set 4
          local.get 3
          local.get 6
          i32.store offset=56
          i32.const 0
          local.get 3
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 3
          local.get 4
          i32.const 1
          i32.add
          local.tee 7
          i32.store16 offset=74
          local.get 6
          local.set 4
          local.get 7
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 4
        end
        local.get 1
        i32.const -4096
        i32.and
        local.tee 8
        i32.load offset=4
        local.set 7
        local.get 3
        i32.const 1136
        i32.store offset=40
        local.get 3
        i32.const 66174
        i32.store offset=68
        local.get 3
        i32.const 66287
        i32.store offset=60
        local.get 3
        i32.const 0
        i32.store16 offset=72
        local.get 3
        i32.const 0
        i32.store offset=64
        i32.const 0
        local.set 6
        block ;; label = @3
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load16_u offset=18
          local.set 6
          local.get 3
          local.get 4
          i32.store offset=56
          i32.const 0
          local.get 3
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 3
          local.get 6
          i32.const 1
          i32.add
          local.tee 9
          i32.store16 offset=74
          local.get 4
          local.set 6
          local.get 9
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 6
        end
        local.get 8
        i32.load offset=4
        local.set 4
        i32.const 0
        local.get 6
        i32.store offset=75156
        i32.const 0
        local.get 6
        i32.load
        i32.store offset=75156
        local.get 5
        local.get 1
        local.get 7
        local.get 7
        i32.const -32
        i32.add
        local.get 4
        i32.const 4049
        i32.lt_s
        select
        local.tee 4
        local.get 2
        local.get 4
        local.get 2
        i32.lt_s
        select
        call $__memcpy
        drop
        local.get 3
        i32.const 1171
        i32.store offset=16
        local.get 3
        i32.const 66174
        i32.store offset=68
        local.get 3
        i32.const 66606
        i32.store offset=60
        local.get 3
        i32.const 0
        i32.store16 offset=72
        local.get 3
        i32.const 0
        i32.store offset=64
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 4
            br_if 0 (;@4;)
            local.get 3
            local.get 4
            i32.store offset=56
            local.get 3
            i32.const 0
            i32.store16 offset=74
            i32.const 0
            local.get 3
            i32.const 56
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 2
          local.get 3
          local.get 4
          i32.store offset=56
          i32.const 0
          local.get 3
          i32.const 56
          i32.add
          i32.store offset=75156
          local.get 3
          local.get 2
          i32.const 1
          i32.add
          local.tee 4
          i32.store16 offset=74
          local.get 4
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 3
        i32.const 1164
        i32.store offset=64
        local.get 0
        local.get 1
        call $rawDealloc__system_u5753
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        local.tee 4
        i32.store offset=75156
        br 1 (;@1;)
      end
      i32.const 0
      local.set 5
      i32.const 0
      i32.load offset=75156
      local.set 4
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 1173
      i32.store offset=16
      local.get 3
      i32.const 66174
      i32.store offset=68
      local.get 3
      i32.const 66606
      i32.store offset=60
      local.get 3
      i32.const 0
      i32.store16 offset=72
      local.get 3
      i32.const 0
      i32.store offset=64
      block ;; label = @2
        block ;; label = @3
          local.get 4
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.store offset=56
          local.get 3
          i32.const 0
          i32.store16 offset=74
          i32.const 0
          local.get 3
          i32.const 56
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 4
        i32.load16_u offset=18
        local.set 2
        local.get 3
        local.get 4
        i32.store offset=56
        i32.const 0
        local.get 3
        i32.const 56
        i32.add
        i32.store offset=75156
        local.get 3
        local.get 2
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=74
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 3
      i32.const 1164
      i32.store offset=64
      local.get 0
      local.get 1
      call $rawDealloc__system_u5753
      i32.const 0
      local.set 5
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      local.tee 4
      i32.store offset=75156
    end
    i32.const 0
    local.get 4
    i32.load
    i32.store offset=75156
    local.get 3
    i32.const 80
    i32.add
    global.set $__stack_pointer
    local.get 5
  )
  (func $alignedRealloc__system_u1936 (;54;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.const 16
        i32.gt_s
        br_if 0 (;@2;)
        i32.const 68628
        local.get 0
        local.get 2
        call $realloc__system_u5846
        local.set 5
        br 1 (;@1;)
      end
      local.get 2
      local.get 3
      call $alignedAlloc__system_u1882
      local.tee 5
      local.get 0
      local.get 1
      call $__memcpy
      drop
      local.get 4
      i32.const 66116
      i32.store offset=20
      local.get 4
      i32.const 66713
      i32.store offset=12
      i32.const 0
      local.set 2
      local.get 4
      i32.const 0
      i32.store16 offset=24
      local.get 4
      i32.const 0
      i32.store offset=16
      i32.const 0
      local.set 3
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load16_u offset=18
        local.set 3
        local.get 4
        local.get 1
        i32.store offset=8
        i32.const 0
        local.get 4
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 4
        local.get 3
        i32.const 1
        i32.add
        local.tee 6
        i32.store16 offset=26
        local.get 1
        local.set 3
        local.get 6
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      local.get 0
      i32.const -2
      i32.add
      i32.load16_u
      local.set 1
      local.get 4
      i32.const 66116
      i32.store offset=20
      local.get 4
      i32.const 66713
      i32.store offset=12
      local.get 4
      i32.const 0
      i32.store16 offset=24
      local.get 4
      i32.const 0
      i32.store offset=16
      block ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load16_u offset=18
        local.set 2
        local.get 4
        local.get 3
        i32.store offset=8
        i32.const 0
        local.get 4
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 4
        local.get 2
        i32.const 1
        i32.add
        local.tee 6
        i32.store16 offset=26
        local.get 3
        local.set 2
        local.get 6
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 2
      end
      local.get 4
      i32.const 66174
      i32.store offset=20
      local.get 4
      i32.const 66606
      i32.store offset=12
      local.get 4
      i32.const 0
      i32.store16 offset=24
      local.get 4
      i32.const 0
      i32.store offset=16
      local.get 0
      local.get 1
      i32.sub
      local.set 0
      block ;; label = @2
        block ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          local.get 4
          local.get 2
          i32.store offset=8
          local.get 4
          i32.const 0
          i32.store16 offset=26
          i32.const 0
          local.get 4
          i32.const 8
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 2
        i32.load16_u offset=18
        local.set 3
        local.get 4
        local.get 2
        i32.store offset=8
        i32.const 0
        local.get 4
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 4
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=26
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 4
      i32.const 1164
      i32.store offset=16
      i32.const 68628
      local.get 0
      call $rawDealloc__system_u5753
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 5
  )
  (func $prepareSeqAddUninit (;55;) (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 66143
    i32.store offset=20
    local.get 5
    i32.const 66039
    i32.store offset=12
    local.get 5
    i32.const 0
    i32.store16 offset=24
    local.get 5
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 6
        br_if 0 (;@2;)
        local.get 5
        local.get 6
        i32.store offset=8
        local.get 5
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 5
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 6
      i32.load16_u offset=18
      local.set 7
      local.get 5
      local.get 6
      i32.store offset=8
      i32.const 0
      local.get 5
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 5
      local.get 7
      i32.const 1
      i32.add
      local.tee 6
      i32.store16 offset=26
      local.get 6
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    block ;; label = @1
      block ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        i32.const 4
        local.set 7
        br 1 (;@1;)
      end
      local.get 5
      i32.const 1108
      i32.store offset=16
      block ;; label = @2
        local.get 4
        i32.const -1
        i32.add
        local.tee 6
        local.get 4
        i32.ge_s
        br_if 0 (;@2;)
        local.get 6
        i32.const 4
        i32.add
        local.tee 7
        local.get 6
        i32.lt_s
        br_if 0 (;@2;)
        local.get 7
        local.get 6
        i32.const -1
        i32.xor
        i32.and
        local.set 7
        br 1 (;@1;)
      end
      call $raiseOverflow
    end
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.const 1
        i32.ge_s
        br_if 0 (;@2;)
        local.get 1
        local.set 6
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        local.set 6
        block ;; label = @3
          local.get 2
          i32.const 0
          i32.lt_s
          local.get 0
          local.get 2
          i32.add
          local.tee 2
          local.get 0
          i32.lt_s
          i32.eq
          br_if 0 (;@3;)
          call $raiseOverflow
          br 2 (;@1;)
        end
        local.get 2
        local.get 3
        local.get 4
        call $newSeqPayloadUninit
        local.set 6
        br 1 (;@1;)
      end
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.load
          i32.const -1073741825
          i32.and
          local.tee 8
          i32.const 1
          i32.ge_s
          br_if 0 (;@3;)
          i32.const 4
          local.set 9
          br 1 (;@2;)
        end
        local.get 8
        i32.const 1
        i32.shl
        local.set 9
        local.get 8
        i32.const 32768
        i32.lt_u
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 8
          i64.extend_i32_s
          i64.const 3
          i64.mul
          local.tee 10
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          local.get 10
          i32.wrap_i64
          local.tee 6
          i32.const 31
          i32.shr_s
          i32.eq
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 6
        i32.const 1
        i32.shr_u
        local.set 9
      end
      i32.const 0
      local.set 6
      block ;; label = @2
        local.get 2
        i32.const 0
        i32.lt_s
        local.get 0
        local.get 2
        i32.add
        local.tee 2
        local.get 0
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      local.get 9
      local.get 2
      local.get 9
      local.get 2
      i32.gt_s
      select
      local.set 2
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 3
            i32.add
            i32.load8_u
            i32.const 64
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i64.extend_i32_s
            local.tee 11
            local.get 2
            i64.extend_i32_s
            i64.mul
            local.tee 10
            i64.const 32
            i64.shr_u
            i32.wrap_i64
            local.get 10
            i32.wrap_i64
            local.tee 3
            i32.const 31
            i32.shr_s
            i32.ne
            br_if 2 (;@2;)
            i32.const 0
            local.set 6
            block ;; label = @5
              local.get 3
              i32.const 0
              i32.lt_s
              local.get 7
              local.get 3
              i32.add
              local.tee 3
              local.get 7
              i32.lt_s
              i32.eq
              br_if 0 (;@5;)
              call $raiseOverflow
              br 4 (;@1;)
            end
            block ;; label = @5
              local.get 3
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 3
              i64.extend_i32_s
              i64.const 0
              i64.const 2147483647
              call $raiseRangeErrorI
              i32.const 0
              local.set 6
              br 4 (;@1;)
            end
            block ;; label = @5
              local.get 4
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 4
              i64.extend_i32_s
              i64.const 0
              i64.const 2147483647
              call $raiseRangeErrorI
              i32.const 0
              local.set 6
              br 4 (;@1;)
            end
            local.get 3
            local.get 4
            call $alignedAlloc__system_u1882
            local.tee 6
            local.get 7
            call $pluspercent___system_u787
            local.set 3
            local.get 1
            local.get 7
            call $pluspercent___system_u787
            local.set 1
            local.get 0
            i64.extend_i32_s
            local.get 11
            i64.mul
            local.tee 10
            i64.const 32
            i64.shr_u
            i32.wrap_i64
            local.get 10
            i32.wrap_i64
            local.tee 4
            i32.const 31
            i32.shr_s
            i32.ne
            br_if 2 (;@2;)
            block ;; label = @5
              local.get 4
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 4
              i64.extend_i32_s
              i64.const 0
              i64.const 2147483647
              call $raiseRangeErrorI
              i32.const 0
              local.set 6
              br 4 (;@1;)
            end
            local.get 3
            local.get 1
            local.get 4
            call $__memcpy
            drop
            br 1 (;@3;)
          end
          local.get 3
          i64.extend_i32_s
          local.tee 11
          local.get 8
          i64.extend_i32_s
          i64.mul
          local.tee 10
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          local.get 10
          i32.wrap_i64
          local.tee 0
          i32.const 31
          i32.shr_s
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.set 6
          block ;; label = @4
            local.get 0
            i32.const 0
            i32.lt_s
            local.get 7
            local.get 0
            i32.add
            local.tee 0
            local.get 7
            i32.lt_s
            i32.eq
            br_if 0 (;@4;)
            call $raiseOverflow
            br 3 (;@1;)
          end
          local.get 11
          local.get 2
          i64.extend_i32_s
          i64.mul
          local.tee 10
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          local.get 10
          i32.wrap_i64
          local.tee 3
          i32.const 31
          i32.shr_s
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.set 6
          block ;; label = @4
            local.get 3
            i32.const 0
            i32.lt_s
            local.get 7
            local.get 3
            i32.add
            local.tee 3
            local.get 7
            i32.lt_s
            i32.eq
            br_if 0 (;@4;)
            call $raiseOverflow
            br 3 (;@1;)
          end
          block ;; label = @4
            local.get 0
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 0
            i64.extend_i32_s
            i64.const 0
            i64.const 2147483647
            call $raiseRangeErrorI
            i32.const 0
            local.set 6
            br 3 (;@1;)
          end
          block ;; label = @4
            local.get 3
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 3
            i64.extend_i32_s
            i64.const 0
            i64.const 2147483647
            call $raiseRangeErrorI
            i32.const 0
            local.set 6
            br 3 (;@1;)
          end
          block ;; label = @4
            local.get 4
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 4
            i64.extend_i32_s
            i64.const 0
            i64.const 2147483647
            call $raiseRangeErrorI
            i32.const 0
            local.set 6
            br 3 (;@1;)
          end
          local.get 1
          local.get 0
          local.get 3
          local.get 4
          call $alignedRealloc__system_u1936
          local.set 6
        end
        local.get 6
        local.get 2
        i32.store
        br 1 (;@1;)
      end
      call $raiseOverflow
      i32.const 0
      local.set 6
    end
    local.get 5
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 6
  )
  (func $auxWriteStackTrace__system_u3282 (;56;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 3
              local.get 0
              local.set 4
              loop ;; label = @6
                local.get 3
                local.tee 5
                i32.const 1
                i32.add
                local.set 3
                local.get 4
                i32.load
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 1
              i32.load
              local.tee 6
              br_if 2 (;@3;)
              local.get 3
              local.set 4
              br 1 (;@4;)
            end
            local.get 1
            i32.load
            br_if 3 (;@1;)
            i32.const 0
            local.set 4
          end
          local.get 2
          i32.const 66143
          i32.store offset=12
          local.get 2
          i32.const 66014
          i32.store offset=4
          local.get 2
          i32.const 0
          i32.store16 offset=16
          local.get 2
          i32.const 0
          i32.store offset=8
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.store
              local.get 2
              i32.const 0
              i32.store16 offset=18
              i32.const 0
              local.get 2
              i32.store offset=75156
              local.get 2
              local.set 3
              br 1 (;@4;)
            end
            local.get 3
            i32.load16_u offset=18
            local.set 6
            local.get 2
            local.get 3
            i32.store
            i32.const 0
            local.get 2
            i32.store offset=75156
            local.get 2
            local.get 6
            i32.const 1
            i32.add
            local.tee 6
            i32.store16 offset=18
            local.get 2
            local.set 3
            local.get 6
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            local.set 3
          end
          local.get 2
          i32.const 66143
          i32.store offset=12
          local.get 2
          i32.const 635
          i32.store offset=8
          block ;; label = @4
            block ;; label = @5
              local.get 4
              i32.const 1
              i32.ge_s
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              i32.const 0
              local.set 5
              br 1 (;@4;)
            end
            local.get 2
            i32.const 66143
            i32.store offset=36
            local.get 2
            i32.const 66039
            i32.store offset=28
            local.get 2
            i32.const 0
            i32.store16 offset=40
            local.get 2
            i32.const 0
            i32.store offset=32
            i32.const 0
            local.set 6
            block ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.load16_u offset=18
              local.set 6
              local.get 2
              local.get 3
              i32.store offset=24
              i32.const 0
              local.get 2
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 6
              i32.const 1
              i32.add
              local.tee 5
              i32.store16 offset=42
              local.get 3
              local.set 6
              local.get 5
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 6
            end
            i32.const 0
            local.get 6
            i32.store offset=75156
            local.get 4
            i32.const 12
            i32.const 4
            call $newSeqPayloadUninit
            local.tee 6
            i32.const 4
            i32.add
            i32.const 0
            local.get 4
            i32.const 12
            i32.mul
            call $__memset
            drop
            i32.const 0
            i32.load offset=75156
            local.set 3
            local.get 4
            local.set 5
          end
          i32.const 0
          local.get 3
          i32.load
          local.tee 7
          i32.store offset=75156
          block ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 3
            local.get 6
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const 3
            i32.add
            i32.load8_u
            i32.const 64
            i32.and
            br_if 0 (;@4;)
            local.get 2
            i32.const 66174
            i32.store offset=36
            local.get 2
            i32.const 66606
            i32.store offset=28
            local.get 2
            i32.const 0
            i32.store16 offset=40
            local.get 2
            i32.const 0
            i32.store offset=32
            block ;; label = @5
              block ;; label = @6
                local.get 7
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.store offset=24
                local.get 2
                i32.const 0
                i32.store16 offset=42
                i32.const 0
                local.get 2
                i32.const 24
                i32.add
                i32.store offset=75156
                br 1 (;@5;)
              end
              local.get 7
              i32.load16_u offset=18
              local.set 8
              local.get 2
              local.get 7
              i32.store offset=24
              i32.const 0
              local.get 2
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 8
              i32.const 1
              i32.add
              local.tee 7
              i32.store16 offset=42
              local.get 7
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
            end
            local.get 2
            i32.const 1164
            i32.store offset=32
            i32.const 68628
            local.get 3
            call $rawDealloc__system_u5753
            i32.const 0
            i32.const 0
            i32.load offset=75156
            i32.load
            i32.store offset=75156
          end
          local.get 1
          local.get 6
          i32.store offset=4
          local.get 1
          local.get 5
          i32.store
          br 1 (;@2;)
        end
        local.get 6
        local.get 3
        i32.add
        local.set 4
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 1
              i32.load offset=4
              local.tee 7
              i32.eqz
              br_if 0 (;@5;)
              local.get 7
              i32.load
              i32.const -1073741825
              i32.and
              local.get 4
              i32.ge_s
              br_if 1 (;@4;)
            end
            local.get 6
            i32.const 0
            i32.gt_s
            local.get 4
            local.get 6
            i32.sub
            local.tee 8
            local.get 4
            i32.lt_s
            i32.xor
            br_if 1 (;@3;)
            local.get 1
            local.get 6
            local.get 7
            local.get 8
            i32.const 12
            i32.const 4
            call $prepareSeqAddUninit
            i32.store offset=4
          end
          local.get 1
          local.get 4
          i32.store
          block ;; label = @4
            local.get 3
            i32.const 3
            i32.and
            local.tee 8
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            loop ;; label = @5
              local.get 1
              i32.load offset=4
              local.get 6
              i32.const 12
              i32.mul
              i32.add
              local.tee 7
              i32.const 12
              i32.add
              i32.const 0
              i32.store align=1
              local.get 7
              i32.const 4
              i32.add
              i64.const 0
              i64.store align=1
              local.get 6
              i32.const 1
              i32.add
              local.set 6
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              local.get 8
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 5
          i32.const 3
          i32.lt_u
          br_if 1 (;@2;)
          loop ;; label = @4
            local.get 1
            i32.load offset=4
            local.get 6
            i32.const 12
            i32.mul
            local.tee 3
            i32.add
            local.tee 5
            i32.const 12
            i32.add
            i32.const 0
            i32.store align=1
            local.get 5
            i32.const 4
            i32.add
            i64.const 0
            i64.store align=1
            local.get 3
            local.get 1
            i32.load offset=4
            i32.add
            local.tee 5
            i32.const 24
            i32.add
            i32.const 0
            i32.store align=1
            local.get 5
            i32.const 16
            i32.add
            i64.const 0
            i64.store align=1
            local.get 3
            local.get 1
            i32.load offset=4
            i32.add
            local.tee 5
            i32.const 36
            i32.add
            i32.const 0
            i32.store align=1
            local.get 5
            i32.const 28
            i32.add
            i64.const 0
            i64.store align=1
            local.get 3
            local.get 1
            i32.load offset=4
            i32.add
            local.tee 3
            i32.const 48
            i32.add
            i32.const 0
            i32.store align=1
            local.get 3
            i32.const 40
            i32.add
            i64.const 0
            i64.store align=1
            local.get 6
            i32.const 4
            i32.add
            local.tee 6
            local.get 4
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
          unreachable
        end
        call $raiseOverflow
      end
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 0
        i64.load offset=4 align=4
        local.set 9
        local.get 1
        i32.load offset=4
        local.get 4
        i32.const -1
        i32.add
        local.tee 4
        i32.const 12
        i32.mul
        i32.add
        local.tee 3
        i32.const 12
        i32.add
        local.get 0
        i32.load offset=12
        i32.store
        local.get 3
        i32.const 4
        i32.add
        local.get 9
        i64.store align=4
        local.get 0
        i32.load
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $rawWriteStackTrace__system_u3515 (;57;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              local.set 4
              loop ;; label = @6
                local.get 2
                local.tee 5
                i32.const 1
                i32.add
                local.set 2
                local.get 4
                i32.load
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 0
              i32.load
              local.tee 4
              br_if 2 (;@3;)
              local.get 1
              i32.const 66143
              i32.store offset=12
              local.get 1
              i32.const 66014
              i32.store offset=4
              i32.const 0
              local.set 6
              local.get 1
              i32.const 0
              i32.store16 offset=16
              local.get 1
              i32.const 0
              i32.store offset=8
              local.get 3
              i32.load16_u offset=18
              local.set 4
              local.get 1
              local.get 3
              i32.store
              i32.const 0
              local.get 1
              i32.store offset=75156
              local.get 1
              local.get 4
              i32.const 1
              i32.add
              local.tee 7
              i32.store16 offset=18
              local.get 1
              local.set 4
              block ;; label = @6
                local.get 7
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                local.set 4
              end
              local.get 1
              i32.const 66143
              i32.store offset=12
              local.get 1
              i32.const 635
              i32.store offset=8
              local.get 1
              i32.const 66143
              i32.store offset=36
              local.get 1
              i32.const 66039
              i32.store offset=28
              local.get 1
              i32.const 0
              i32.store16 offset=40
              local.get 1
              i32.const 0
              i32.store offset=32
              block ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                i32.load16_u offset=18
                local.set 6
                local.get 1
                local.get 4
                i32.store offset=24
                i32.const 0
                local.get 1
                i32.const 24
                i32.add
                i32.store offset=75156
                local.get 1
                local.get 6
                i32.const 1
                i32.add
                local.tee 7
                i32.store16 offset=42
                local.get 4
                local.set 6
                local.get 7
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
                i32.const 0
                i32.load offset=75156
                i32.load
                local.set 6
              end
              i32.const 0
              local.get 6
              i32.store offset=75156
              local.get 2
              i32.const 12
              i32.const 4
              call $newSeqPayloadUninit
              local.tee 4
              i32.const 4
              i32.add
              i32.const 0
              local.get 5
              i32.const 12
              i32.mul
              i32.const 12
              i32.add
              call $__memset
              drop
              i32.const 0
              i32.load offset=75156
              i32.load
              local.set 5
              br 1 (;@4;)
            end
            local.get 0
            i32.load
            br_if 3 (;@1;)
            i32.const 0
            local.set 5
            i32.const 0
            local.set 4
            i32.const 0
            local.set 2
          end
          i32.const 0
          local.get 5
          i32.store offset=75156
          block ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 6
            local.get 4
            i32.eq
            br_if 0 (;@4;)
            local.get 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 3
            i32.add
            i32.load8_u
            i32.const 64
            i32.and
            br_if 0 (;@4;)
            local.get 1
            i32.const 66174
            i32.store offset=36
            local.get 1
            i32.const 66606
            i32.store offset=28
            local.get 1
            i32.const 0
            i32.store16 offset=40
            local.get 1
            i32.const 0
            i32.store offset=32
            block ;; label = @5
              block ;; label = @6
                local.get 5
                br_if 0 (;@6;)
                local.get 1
                i32.const 0
                i32.store offset=24
                local.get 1
                i32.const 0
                i32.store16 offset=42
                i32.const 0
                local.get 1
                i32.const 24
                i32.add
                i32.store offset=75156
                br 1 (;@5;)
              end
              local.get 5
              i32.load16_u offset=18
              local.set 7
              local.get 1
              local.get 5
              i32.store offset=24
              i32.const 0
              local.get 1
              i32.const 24
              i32.add
              i32.store offset=75156
              local.get 1
              local.get 7
              i32.const 1
              i32.add
              local.tee 5
              i32.store16 offset=42
              local.get 5
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
            end
            local.get 1
            i32.const 1164
            i32.store offset=32
            i32.const 68628
            local.get 6
            call $rawDealloc__system_u5753
            i32.const 0
            i32.const 0
            i32.load offset=75156
            i32.load
            i32.store offset=75156
          end
          local.get 0
          local.get 4
          i32.store offset=4
          local.get 0
          local.get 2
          i32.store
          br 1 (;@2;)
        end
        local.get 4
        local.get 2
        i32.add
        local.set 7
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load offset=4
                local.tee 6
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.load
                i32.const -1073741825
                i32.and
                local.get 7
                i32.ge_s
                br_if 1 (;@5;)
              end
              local.get 4
              i32.const 0
              i32.gt_s
              local.get 7
              local.get 4
              i32.sub
              local.tee 8
              local.get 7
              i32.lt_s
              i32.xor
              br_if 1 (;@4;)
              local.get 0
              local.get 4
              local.get 6
              local.get 8
              i32.const 12
              i32.const 4
              call $prepareSeqAddUninit
              i32.store offset=4
            end
            local.get 0
            local.get 7
            i32.store
            block ;; label = @5
              local.get 2
              i32.const 3
              i32.and
              local.tee 8
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 2
              loop ;; label = @6
                local.get 0
                i32.load offset=4
                local.get 4
                i32.const 12
                i32.mul
                i32.add
                local.tee 6
                i32.const 12
                i32.add
                i32.const 0
                i32.store align=1
                local.get 6
                i32.const 4
                i32.add
                i64.const 0
                i64.store align=1
                local.get 4
                i32.const 1
                i32.add
                local.set 4
                local.get 2
                i32.const 1
                i32.add
                local.tee 2
                local.get 8
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 5
            i32.const 3
            i32.lt_u
            br_if 1 (;@3;)
            loop ;; label = @5
              local.get 0
              i32.load offset=4
              local.get 4
              i32.const 12
              i32.mul
              local.tee 2
              i32.add
              local.tee 5
              i32.const 12
              i32.add
              i32.const 0
              i32.store align=1
              local.get 5
              i32.const 4
              i32.add
              i64.const 0
              i64.store align=1
              local.get 2
              local.get 0
              i32.load offset=4
              i32.add
              local.tee 5
              i32.const 24
              i32.add
              i32.const 0
              i32.store align=1
              local.get 5
              i32.const 16
              i32.add
              i64.const 0
              i64.store align=1
              local.get 2
              local.get 0
              i32.load offset=4
              i32.add
              local.tee 5
              i32.const 36
              i32.add
              i32.const 0
              i32.store align=1
              local.get 5
              i32.const 28
              i32.add
              i64.const 0
              i64.store align=1
              local.get 2
              local.get 0
              i32.load offset=4
              i32.add
              local.tee 2
              i32.const 48
              i32.add
              i32.const 0
              i32.store align=1
              local.get 2
              i32.const 40
              i32.add
              i64.const 0
              i64.store align=1
              local.get 4
              i32.const 4
              i32.add
              local.tee 4
              local.get 7
              i32.ne
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
            unreachable
          end
          call $raiseOverflow
        end
        local.get 7
        local.set 2
      end
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 3
        i64.load offset=4 align=4
        local.set 9
        local.get 0
        i32.load offset=4
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        i32.const 12
        i32.mul
        i32.add
        local.tee 4
        i32.const 12
        i32.add
        local.get 3
        i32.load offset=12
        i32.store
        local.get 4
        i32.const 4
        i32.add
        local.get 9
        i64.store align=4
        local.get 3
        i32.load
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $eqcopy___system_u3236 (;58;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    i32.load offset=75156
    local.set 3
    block ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 66164
      i32.store offset=12
      local.get 2
      i32.const 66474
      i32.store offset=4
      local.get 2
      i32.const 0
      i32.store16 offset=16
      local.get 2
      i32.const 0
      i32.store offset=8
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store
          local.get 2
          i32.const 0
          i32.store16 offset=18
          local.get 2
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 4
        local.get 2
        local.get 3
        i32.store
        i32.const 0
        local.get 2
        i32.store offset=75156
        local.get 2
        local.get 4
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=18
        local.get 2
        local.set 4
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        local.set 4
      end
      local.get 2
      i32.const 58
      i32.store offset=8
      local.get 2
      i32.const 66164
      i32.store offset=12
      local.get 2
      i32.const 66116
      i32.store offset=36
      local.get 2
      i32.const 66713
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      i32.const 0
      local.set 3
      block ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load16_u offset=18
        local.set 3
        local.get 2
        local.get 4
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=42
        local.get 4
        local.set 3
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
        i32.const 0
        i32.load offset=75156
        i32.load
        local.set 3
      end
      i32.const 0
      local.get 3
      i32.store offset=75156
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.const -4
          i32.add
          local.tee 5
          i32.load
          local.tee 4
          i32.const 8
          i32.add
          local.tee 6
          local.get 4
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          i32.const 0
          i32.load offset=75156
          local.set 3
          br 1 (;@2;)
        end
        local.get 5
        local.get 6
        i32.store
      end
      i32.const 0
      local.get 3
      i32.load
      local.tee 3
      i32.store offset=75156
    end
    local.get 0
    i32.load
    local.set 5
    local.get 2
    i32.const 66164
    i32.store offset=12
    local.get 2
    i32.const 65708
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        i32.const 0
        local.get 2
        i32.store offset=75156
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 5
            br_if 0 (;@4;)
            local.get 3
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          i32.const 58
          i32.store offset=8
          local.get 2
          i32.const 66116
          i32.store offset=36
          local.get 2
          i32.const 66713
          i32.store offset=28
          local.get 2
          i32.const 0
          i32.store16 offset=40
          local.get 2
          i32.const 0
          i32.store offset=32
          i32.const 0
          local.set 4
          block ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load16_u offset=18
            local.set 4
            local.get 2
            local.get 3
            i32.store offset=24
            i32.const 0
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 4
            i32.const 1
            i32.add
            local.tee 6
            i32.store16 offset=42
            local.get 3
            local.set 4
            local.get 6
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 4
          end
          i32.const 0
          local.get 4
          i32.store offset=75156
          local.get 5
          i32.const -4
          i32.add
          local.tee 5
          i32.load
          local.tee 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 2
          i32.const 234
          i32.store offset=8
          block ;; label = @4
            local.get 3
            i32.const -8
            i32.add
            local.tee 6
            local.get 3
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 4
            br 1 (;@3;)
          end
          local.get 5
          local.get 6
          i32.store
        end
        i32.const 0
        local.get 4
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 230
      i32.store offset=8
      i32.const 0
      local.get 4
      i32.load
      local.tee 4
      i32.store offset=75156
      local.get 0
      i32.load
      local.set 3
      local.get 2
      i32.const 66164
      i32.store offset=36
      local.get 2
      i32.const 66532
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      block ;; label = @2
        block ;; label = @3
          local.get 4
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.store offset=24
          local.get 2
          i32.const 0
          i32.store16 offset=42
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 4
        i32.load16_u offset=18
        local.set 5
        local.get 2
        local.get 4
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 5
        i32.const 1
        i32.add
        local.tee 4
        i32.store16 offset=42
        local.get 4
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.load
          local.tee 4
          i32.load
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 196
          i32.store offset=32
          local.get 3
          local.get 5
          call_indirect (type 0)
          i32.const 0
          i32.load8_u offset=75168
          br_if 1 (;@2;)
          local.get 3
          i32.load
          local.set 4
        end
        local.get 2
        i32.const 204
        i32.store offset=32
        local.get 3
        local.get 4
        i32.load16_s offset=8
        call $nimRawDispose
      end
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $eqsink___system_u3242 (;59;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 3
    local.get 2
    i32.const 66164
    i32.store offset=12
    local.get 2
    i32.const 65708
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 4
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        i32.const 0
        local.get 2
        i32.store offset=75156
        local.get 2
        local.set 4
        br 1 (;@1;)
      end
      local.get 4
      i32.load16_u offset=18
      local.set 5
      local.get 2
      local.get 4
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 5
      i32.const 1
      i32.add
      local.tee 5
      i32.store16 offset=18
      local.get 2
      local.set 4
      local.get 5
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 4
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 4
            local.set 5
            br 1 (;@3;)
          end
          local.get 2
          i32.const 58
          i32.store offset=8
          local.get 2
          i32.const 66116
          i32.store offset=36
          local.get 2
          i32.const 66713
          i32.store offset=28
          local.get 2
          i32.const 0
          i32.store16 offset=40
          local.get 2
          i32.const 0
          i32.store offset=32
          i32.const 0
          local.set 5
          block ;; label = @4
            local.get 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.load16_u offset=18
            local.set 5
            local.get 2
            local.get 4
            i32.store offset=24
            i32.const 0
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 5
            i32.const 1
            i32.add
            local.tee 6
            i32.store16 offset=42
            local.get 4
            local.set 5
            local.get 6
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
            i32.const 0
            i32.load offset=75156
            i32.load
            local.set 5
          end
          i32.const 0
          local.get 5
          i32.store offset=75156
          local.get 3
          i32.const -4
          i32.add
          local.tee 3
          i32.load
          local.tee 4
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 2
          i32.const 234
          i32.store offset=8
          block ;; label = @4
            local.get 4
            i32.const -8
            i32.add
            local.tee 6
            local.get 4
            i32.lt_s
            br_if 0 (;@4;)
            call $raiseOverflow
            i32.const 0
            i32.load offset=75156
            local.set 5
            br 1 (;@3;)
          end
          local.get 3
          local.get 6
          i32.store
        end
        i32.const 0
        local.get 5
        i32.load
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 2
      i32.const 230
      i32.store offset=8
      i32.const 0
      local.get 5
      i32.load
      local.tee 5
      i32.store offset=75156
      local.get 0
      i32.load
      local.set 4
      local.get 2
      i32.const 66164
      i32.store offset=36
      local.get 2
      i32.const 66532
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.store16 offset=40
      local.get 2
      i32.const 0
      i32.store offset=32
      block ;; label = @2
        block ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          local.get 2
          local.get 5
          i32.store offset=24
          local.get 2
          i32.const 0
          i32.store16 offset=42
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 5
        i32.load16_u offset=18
        local.set 3
        local.get 2
        local.get 5
        i32.store offset=24
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 5
        i32.store16 offset=42
        local.get 5
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      block ;; label = @2
        block ;; label = @3
          local.get 4
          i32.load
          local.tee 5
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 196
          i32.store offset=32
          local.get 4
          local.get 3
          call_indirect (type 0)
          i32.const 0
          i32.load8_u offset=75168
          br_if 1 (;@2;)
          local.get 4
          i32.load
          local.set 5
        end
        local.get 2
        i32.const 204
        i32.store offset=32
        local.get 4
        local.get 5
        i32.load16_s offset=8
        call $nimRawDispose
      end
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $prepareAdd (;60;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 0
        i32.lt_s
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.tee 1
        local.get 3
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load
          local.tee 4
          i32.const 1073741824
          i32.and
          i32.eqz
          br_if 1 (;@2;)
        end
        block ;; label = @3
          local.get 1
          i32.const 1
          i32.add
          local.tee 4
          local.get 1
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 4
          i32.const 4
          i32.add
          local.tee 5
          local.get 4
          i32.ge_s
          br_if 0 (;@3;)
          call $raiseOverflow
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 5
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 5
          i64.extend_i32_s
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          br 2 (;@1;)
        end
        local.get 2
        i32.const 66174
        i32.store offset=20
        local.get 2
        i32.const 66619
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 4
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 2
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 6
          local.get 2
          local.get 4
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 6
          i32.const 1
          i32.add
          local.tee 4
          i32.store16 offset=26
          local.get 4
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 1147
        i32.store offset=16
        i32.const 68628
        local.get 5
        call $rawAlloc__system_u5592
        local.set 4
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 4
        local.get 1
        i32.store
        block ;; label = @3
          local.get 0
          i32.load
          local.tee 0
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 0
            local.get 1
            local.get 0
            local.get 1
            i32.lt_s
            select
            local.tee 1
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 1
            i64.extend_i32_s
            i64.const 0
            i64.const 2147483647
            call $raiseRangeErrorI
            br 3 (;@1;)
          end
          local.get 4
          i32.const 4
          i32.add
          local.get 3
          i32.const 4
          i32.add
          local.get 1
          call $__memcpy
          drop
          br 2 (;@1;)
        end
        local.get 3
        br_if 1 (;@1;)
        local.get 4
        i32.const 0
        i32.store8 offset=4
        br 1 (;@1;)
      end
      local.get 4
      i32.const -1073741825
      i32.and
      local.tee 3
      local.get 1
      i32.ge_s
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.const 1
          i32.ge_s
          br_if 0 (;@3;)
          i32.const 4
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        i32.const 1
        i32.shl
        local.set 4
        local.get 3
        i32.const 32768
        i32.lt_u
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 3
          i64.extend_i32_s
          i64.const 3
          i64.mul
          local.tee 7
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          local.get 7
          i32.wrap_i64
          local.tee 3
          i32.const 31
          i32.shr_s
          i32.eq
          br_if 0 (;@3;)
          call $raiseOverflow
          br 1 (;@2;)
        end
        local.get 3
        i32.const 1
        i32.shr_u
        local.set 4
      end
      block ;; label = @2
        local.get 1
        local.get 4
        local.get 1
        local.get 4
        i32.gt_s
        select
        local.tee 3
        i32.const 1
        i32.add
        local.tee 5
        local.get 3
        i32.ge_s
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 5
        i32.const 4
        i32.add
        local.tee 6
        local.get 5
        i32.ge_s
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 6
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 6
        i64.extend_i32_s
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        br 1 (;@1;)
      end
      local.get 0
      i32.const 68628
      local.get 0
      i32.load offset=4
      local.get 6
      call $realloc__system_u5846
      local.tee 5
      i32.store offset=4
      local.get 5
      local.get 3
      i32.store
      local.get 1
      local.get 4
      i32.ge_s
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 1
        i32.const 0
        i32.gt_s
        local.get 3
        local.get 1
        i32.sub
        local.tee 0
        local.get 3
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 0
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        i64.extend_i32_s
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        br 1 (;@1;)
      end
      local.get 5
      local.get 1
      i32.const 1
      i32.add
      i32.add
      i32.const 4
      i32.add
      i32.const 0
      local.get 0
      call $__memset
      drop
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $raiseRangeErrorNoArgs (;61;) (type 5)
    i32.const 0
    i64.load offset=67200
    call $sysFatal__system_u3952
  )
  (func $setLengthStrV2 (;62;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load
                local.tee 4
                i32.const 1073741824
                i32.and
                i32.eqz
                br_if 1 (;@5;)
              end
              block ;; label = @6
                local.get 1
                i32.const 1
                i32.add
                local.tee 4
                local.get 1
                i32.ge_s
                br_if 0 (;@6;)
                call $raiseOverflow
                br 5 (;@1;)
              end
              block ;; label = @6
                local.get 4
                i32.const 4
                i32.add
                local.tee 5
                local.get 4
                i32.ge_s
                br_if 0 (;@6;)
                call $raiseOverflow
                br 5 (;@1;)
              end
              block ;; label = @6
                local.get 5
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
                local.get 5
                i64.extend_i32_s
                i64.const 0
                i64.const 2147483647
                call $raiseRangeErrorI
                br 5 (;@1;)
              end
              local.get 2
              i32.const 66174
              i32.store offset=20
              local.get 2
              i32.const 66619
              i32.store offset=12
              local.get 2
              i32.const 0
              i32.store16 offset=24
              local.get 2
              i32.const 0
              i32.store offset=16
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=75156
                  local.tee 6
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 0
                  i32.store offset=8
                  local.get 2
                  i32.const 0
                  i32.store16 offset=26
                  i32.const 0
                  local.get 2
                  i32.const 8
                  i32.add
                  i32.store offset=75156
                  br 1 (;@6;)
                end
                local.get 6
                i32.load16_u offset=18
                local.set 7
                local.get 2
                local.get 6
                i32.store offset=8
                i32.const 0
                local.get 2
                i32.const 8
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 7
                i32.const 1
                i32.add
                local.tee 6
                i32.store16 offset=26
                local.get 6
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
              end
              local.get 2
              i32.const 1147
              i32.store offset=16
              i32.const 68628
              local.get 5
              call $rawAlloc__system_u5592
              local.set 5
              i32.const 0
              i32.const 0
              i32.load offset=75156
              i32.load
              i32.store offset=75156
              local.get 0
              local.get 5
              i32.store offset=4
              local.get 5
              local.get 1
              i32.store
              block ;; label = @6
                local.get 0
                i32.load
                local.tee 6
                i32.const 1
                i32.lt_s
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 6
                  local.get 1
                  local.get 6
                  local.get 1
                  i32.lt_s
                  select
                  local.tee 4
                  i32.const -1
                  i32.gt_s
                  br_if 0 (;@7;)
                  local.get 4
                  i64.extend_i32_s
                  i64.const 0
                  i64.const 2147483647
                  call $raiseRangeErrorI
                  br 6 (;@1;)
                end
                local.get 5
                i32.const 4
                i32.add
                local.get 3
                i32.const 4
                i32.add
                local.get 4
                call $__memcpy
                drop
                block ;; label = @7
                  local.get 0
                  i32.load
                  local.tee 3
                  local.get 1
                  i32.ge_s
                  br_if 0 (;@7;)
                  block ;; label = @8
                    local.get 3
                    i32.const 0
                    i32.gt_s
                    local.get 1
                    local.get 3
                    i32.sub
                    local.tee 4
                    local.get 1
                    i32.lt_s
                    i32.eq
                    br_if 0 (;@8;)
                    call $raiseOverflow
                    br 7 (;@1;)
                  end
                  block ;; label = @8
                    local.get 4
                    i32.const 1
                    i32.add
                    local.tee 5
                    local.get 4
                    i32.ge_s
                    br_if 0 (;@8;)
                    call $raiseOverflow
                    br 7 (;@1;)
                  end
                  block ;; label = @8
                    local.get 5
                    i32.const -1
                    i32.gt_s
                    br_if 0 (;@8;)
                    local.get 5
                    i64.extend_i32_s
                    i64.const 0
                    i64.const 2147483647
                    call $raiseRangeErrorI
                    br 7 (;@1;)
                  end
                  local.get 0
                  i32.load offset=4
                  local.get 3
                  i32.add
                  i32.const 4
                  i32.add
                  i32.const 0
                  local.get 5
                  call $__memset
                  drop
                  br 3 (;@4;)
                end
                local.get 0
                i32.load offset=4
                local.get 1
                i32.add
                i32.const 4
                i32.add
                i32.const 0
                i32.store8
                br 2 (;@4;)
              end
              block ;; label = @6
                local.get 4
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                local.get 5
                i32.const 4
                i32.add
                i32.const 0
                local.get 4
                call $__memset
                drop
                br 2 (;@4;)
              end
              local.get 4
              i64.extend_i32_s
              i64.const 0
              i64.const 2147483647
              call $raiseRangeErrorI
              br 4 (;@1;)
            end
            local.get 0
            i32.load
            local.get 1
            i32.ge_s
            br_if 0 (;@4;)
            local.get 4
            i32.const -1073741825
            i32.and
            local.tee 3
            local.get 1
            i32.ge_s
            br_if 0 (;@4;)
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.const 1
                i32.lt_s
                br_if 0 (;@6;)
                local.get 3
                i32.const 1
                i32.shl
                local.set 4
                block ;; label = @7
                  local.get 3
                  i32.const 32768
                  i32.lt_u
                  br_if 0 (;@7;)
                  block ;; label = @8
                    local.get 3
                    i64.extend_i32_s
                    i64.const 3
                    i64.mul
                    local.tee 8
                    i64.const 32
                    i64.shr_u
                    i32.wrap_i64
                    local.get 8
                    i32.wrap_i64
                    local.tee 5
                    i32.const 31
                    i32.shr_s
                    i32.eq
                    br_if 0 (;@8;)
                    call $raiseOverflow
                    br 1 (;@7;)
                  end
                  local.get 5
                  i32.const 1
                  i32.shr_u
                  local.set 4
                end
                local.get 4
                local.get 1
                local.get 4
                local.get 1
                i32.gt_s
                select
                local.set 4
                local.get 3
                i32.const 5
                i32.add
                local.set 5
                br 1 (;@5;)
              end
              local.get 3
              i32.const 5
              i32.add
              local.set 5
              local.get 3
              i32.const -6
              i32.le_s
              br_if 3 (;@2;)
              local.get 1
              i32.const 4
              local.get 1
              i32.const 4
              i32.gt_s
              select
              local.set 4
            end
            block ;; label = @5
              local.get 4
              i32.const 1
              i32.add
              local.tee 3
              local.get 4
              i32.ge_s
              br_if 0 (;@5;)
              call $raiseOverflow
              br 4 (;@1;)
            end
            block ;; label = @5
              local.get 3
              i32.const 4
              i32.add
              local.tee 6
              local.get 3
              i32.ge_s
              br_if 0 (;@5;)
              call $raiseOverflow
              br 4 (;@1;)
            end
            block ;; label = @5
              local.get 6
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 6
              i64.extend_i32_s
              i64.const 0
              i64.const 2147483647
              call $raiseRangeErrorI
              br 4 (;@1;)
            end
            i32.const 68628
            local.get 0
            i32.load offset=4
            local.get 6
            call $realloc__system_u5846
            local.set 3
            block ;; label = @5
              local.get 6
              local.get 5
              i32.le_u
              br_if 0 (;@5;)
              local.get 5
              local.get 3
              i32.add
              i32.const 0
              local.get 6
              local.get 5
              i32.sub
              call $__memset
              drop
            end
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 3
            local.get 4
            i32.store
          end
          local.get 0
          i32.load offset=4
          local.get 1
          i32.add
          i32.const 4
          i32.add
          i32.const 0
          i32.store8
        end
        local.get 0
        local.get 1
        i32.store
        br 1 (;@1;)
      end
      local.get 5
      i64.extend_i32_s
      i64.const 0
      i64.const 2147483647
      call $raiseRangeErrorI
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $rawNewString (;63;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i64.const 0
    i64.store align=4
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 0
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        i64.const 0
        i64.store align=4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 3
        local.get 1
        i32.ge_s
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 3
        i32.ge_s
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 4
        i64.extend_i32_s
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        br 1 (;@1;)
      end
      local.get 2
      i32.const 66174
      i32.store offset=20
      local.get 2
      i32.const 66619
      i32.store offset=12
      local.get 2
      i32.const 0
      i32.store16 offset=24
      local.get 2
      i32.const 0
      i32.store offset=16
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 3
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store offset=8
          local.get 2
          i32.const 0
          i32.store16 offset=26
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 3
        i32.load16_u offset=18
        local.set 5
        local.get 2
        local.get 3
        i32.store offset=8
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 5
        i32.const 1
        i32.add
        local.tee 3
        i32.store16 offset=26
        local.get 3
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      local.get 2
      i32.const 1147
      i32.store offset=16
      i32.const 68628
      local.get 4
      call $rawAlloc__system_u5592
      local.set 3
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
      local.get 3
      i32.const 0
      i32.store8 offset=4
      local.get 3
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $appendString (;64;) (type 1) (param i32 i32)
    (local i32 i32)
    block ;; label = @1
      local.get 1
      i32.load
      local.tee 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 2
        i32.const 1
        i32.add
        local.tee 3
        local.get 2
        i32.ge_s
        br_if 0 (;@2;)
        call $raiseOverflow
        return
      end
      block ;; label = @2
        local.get 3
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        i64.const -2147483648
        i64.const 0
        i64.const 2147483647
        call $raiseRangeErrorI
        return
      end
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load
      i32.add
      i32.const 4
      i32.add
      local.get 1
      i32.load offset=4
      i32.const 4
      i32.add
      local.get 3
      call $__memcpy
      drop
      block ;; label = @2
        local.get 2
        i32.const 0
        i32.lt_s
        local.get 0
        i32.load
        local.tee 1
        local.get 2
        i32.add
        local.tee 2
        local.get 1
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        return
      end
      local.get 0
      local.get 2
      i32.store
    end
  )
  (func $auxWriteStackTrace__system_u3399 (;65;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    local.set 3
    block ;; label = @1
      block ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        i32.const 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 0
      local.set 4
      loop ;; label = @2
        local.get 3
        i32.const 2
        i32.shl
        i32.const 75184
        i32.add
        local.get 0
        i32.store
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 3
        i32.const 1
        i32.add
        local.set 5
        local.get 0
        i32.load
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.const 95
        i32.lt_u
        local.set 6
        local.get 5
        local.set 3
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.set 3
      loop ;; label = @2
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 3
        i32.load
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    i32.const 0
    local.set 7
    block ;; label = @1
      local.get 4
      i32.const 129
      i32.lt_s
      br_if 0 (;@1;)
      local.get 4
      local.get 5
      i32.sub
      local.tee 4
      i32.const -31
      i32.add
      local.set 7
      block ;; label = @2
        local.get 4
        i32.const 32
        i32.lt_s
        br_if 0 (;@2;)
        local.get 7
        i32.const 3
        i32.and
        local.set 8
        block ;; label = @3
          local.get 4
          i32.const -32
          i32.add
          i32.const 3
          i32.lt_u
          br_if 0 (;@3;)
          local.get 7
          i32.const -4
          i32.and
          local.set 9
          i32.const 0
          local.set 6
          loop ;; label = @4
            i32.const 0
            local.set 4
            block ;; label = @5
              local.get 0
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load
              local.set 4
            end
            i32.const 0
            local.set 0
            i32.const 0
            local.set 3
            block ;; label = @5
              local.get 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.load
              local.set 3
            end
            block ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.load
              local.set 0
            end
            block ;; label = @5
              block ;; label = @6
                local.get 0
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                br 1 (;@5;)
              end
              local.get 0
              i32.load
              local.set 0
            end
            local.get 6
            i32.const 4
            i32.add
            local.tee 6
            local.get 9
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 8
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        loop ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              br 1 (;@4;)
            end
            local.get 0
            i32.load
            local.set 0
          end
          local.get 4
          i32.const 1
          i32.add
          local.tee 4
          local.get 8
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 2
      i32.shl
      i32.const 75184
      i32.add
      i32.const 0
      i32.store
      local.get 5
      i32.const 1
      i32.add
      local.set 5
    end
    block ;; label = @1
      block ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        local.get 5
        local.set 6
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 5
        i32.const 127
        i32.le_s
        br_if 0 (;@2;)
        local.get 5
        local.set 6
        br 1 (;@1;)
      end
      loop ;; label = @2
        local.get 5
        i32.const 2
        i32.shl
        i32.const 75184
        i32.add
        local.get 0
        i32.store
        local.get 5
        i32.const 1
        i32.add
        local.set 6
        local.get 0
        i32.load
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        i32.const 127
        i32.lt_s
        local.set 4
        local.get 6
        local.set 5
        local.get 4
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      local.get 6
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      loop ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 6
            local.tee 9
            i32.const -1
            i32.add
            local.tee 6
            i32.const 2
            i32.shl
            i32.const 75184
            i32.add
            local.tee 8
            i32.load
            local.tee 4
            br_if 0 (;@4;)
            local.get 1
            i32.const 1
            call $prepareAdd
            local.get 1
            i32.load offset=4
            local.get 1
            i32.load
            i32.add
            i32.const 4
            i32.add
            i32.const 40
            i32.store16 align=1
            block ;; label = @5
              block ;; label = @6
                local.get 1
                i32.load
                local.tee 0
                i32.const 1
                i32.add
                local.tee 5
                local.get 0
                i32.ge_s
                br_if 0 (;@6;)
                call $raiseOverflow
                br 1 (;@5;)
              end
              local.get 1
              local.get 5
              i32.store
            end
            local.get 2
            i32.const 8
            i32.add
            local.get 7
            call $dollar___systemZdollars_u8
            i32.const 0
            i32.load8_u offset=75168
            br_if 3 (;@1;)
            local.get 2
            i32.load offset=12
            local.set 5
            local.get 1
            local.get 2
            i32.load offset=8
            local.tee 0
            call $prepareAdd
            block ;; label = @5
              local.get 0
              i32.const 1
              i32.lt_s
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 0
                i32.const 1
                i32.add
                local.tee 4
                local.get 0
                i32.ge_s
                br_if 0 (;@6;)
                call $raiseOverflow
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 4
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
                i64.const -2147483648
                i64.const 0
                i64.const 2147483647
                call $raiseRangeErrorI
                br 1 (;@5;)
              end
              local.get 1
              i32.load offset=4
              local.get 1
              i32.load
              i32.add
              i32.const 4
              i32.add
              local.get 5
              i32.const 4
              i32.add
              local.get 4
              call $__memcpy
              drop
              block ;; label = @6
                local.get 0
                i32.const 0
                i32.lt_s
                local.get 1
                i32.load
                local.tee 4
                local.get 0
                i32.add
                local.tee 0
                local.get 4
                i32.lt_s
                i32.eq
                br_if 0 (;@6;)
                call $raiseOverflow
                br 1 (;@5;)
              end
              local.get 1
              local.get 0
              i32.store
            end
            local.get 1
            i32.const 20
            call $prepareAdd
            local.get 1
            i32.load offset=4
            local.get 1
            i32.load
            i32.add
            local.tee 0
            i32.const 17
            i32.add
            i32.const 0
            i64.load offset=67313 align=1
            i64.store align=1
            local.get 0
            i32.const 12
            i32.add
            i32.const 0
            i64.load offset=67308 align=4
            i64.store align=1
            local.get 0
            i32.const 4
            i32.add
            i32.const 0
            i64.load offset=67300 align=4
            i64.store align=1
            block ;; label = @5
              block ;; label = @6
                local.get 1
                i32.load
                local.tee 0
                i32.const 20
                i32.add
                local.tee 4
                local.get 0
                i32.ge_s
                br_if 0 (;@6;)
                call $raiseOverflow
                br 1 (;@5;)
              end
              local.get 1
              local.get 4
              i32.store
            end
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.const 3
            i32.add
            i32.load8_u
            i32.const 64
            i32.and
            br_if 1 (;@3;)
            local.get 2
            i32.const 66174
            i32.store offset=20
            local.get 2
            i32.const 66606
            i32.store offset=12
            local.get 2
            i32.const 0
            i32.store16 offset=24
            local.get 2
            i32.const 0
            i32.store offset=16
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=75156
                local.tee 0
                br_if 0 (;@6;)
                local.get 2
                local.get 0
                i32.store offset=8
                local.get 2
                i32.const 0
                i32.store16 offset=26
                i32.const 0
                local.get 2
                i32.const 8
                i32.add
                i32.store offset=75156
                br 1 (;@5;)
              end
              local.get 0
              i32.load16_u offset=18
              local.set 4
              local.get 2
              local.get 0
              i32.store offset=8
              i32.const 0
              local.get 2
              i32.const 8
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 4
              i32.const 1
              i32.add
              local.tee 0
              i32.store16 offset=26
              local.get 0
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
            end
            local.get 2
            i32.const 1164
            i32.store offset=16
            i32.const 68628
            local.get 5
            call $rawDealloc__system_u5753
            i32.const 0
            i32.const 0
            i32.load offset=75156
            i32.load
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 1
          i32.load
          local.set 10
          block ;; label = @4
            local.get 4
            i32.load offset=12
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            local.get 3
            i32.load8_u
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            loop ;; label = @5
              local.get 1
              i32.const 1
              call $prepareAdd
              local.get 1
              i32.load offset=4
              local.get 1
              i32.load
              i32.add
              i32.const 4
              i32.add
              local.get 5
              i32.store8
              block ;; label = @6
                block ;; label = @7
                  local.get 1
                  i32.load
                  local.tee 5
                  i32.const 1
                  i32.add
                  local.tee 4
                  local.get 5
                  i32.ge_s
                  br_if 0 (;@7;)
                  call $raiseOverflow
                  br 1 (;@6;)
                end
                local.get 1
                local.get 4
                i32.store
                local.get 1
                i32.load offset=4
                local.get 4
                i32.add
                i32.const 4
                i32.add
                i32.const 0
                i32.store8
              end
              local.get 3
              local.get 0
              i32.const 1
              i32.add
              local.tee 0
              i32.add
              i32.load8_u
              local.tee 5
              br_if 0 (;@5;)
            end
            local.get 8
            i32.load
            local.set 4
          end
          block ;; label = @4
            local.get 4
            i32.load offset=8
            i32.const 1
            i32.lt_s
            br_if 0 (;@4;)
            local.get 1
            i32.const 1
            call $prepareAdd
            local.get 1
            i32.load offset=4
            local.get 1
            i32.load
            i32.add
            i32.const 4
            i32.add
            i32.const 40
            i32.store16 align=1
            block ;; label = @5
              block ;; label = @6
                local.get 1
                i32.load
                local.tee 0
                i32.const 1
                i32.add
                local.tee 5
                local.get 0
                i32.ge_s
                br_if 0 (;@6;)
                call $raiseOverflow
                br 1 (;@5;)
              end
              local.get 1
              local.get 5
              i32.store
            end
            local.get 8
            i32.load
            i64.load32_s offset=8
            local.set 11
            local.get 2
            i32.const 66100
            i32.store offset=20
            local.get 2
            i32.const 65738
            i32.store offset=12
            local.get 2
            i32.const 0
            i32.store16 offset=24
            local.get 2
            i32.const 0
            i32.store offset=16
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=75156
                local.tee 0
                br_if 0 (;@6;)
                local.get 2
                local.get 0
                i32.store offset=8
                local.get 2
                i32.const 0
                i32.store16 offset=26
                i32.const 0
                local.get 2
                i32.const 8
                i32.add
                i32.store offset=75156
                br 1 (;@5;)
              end
              local.get 0
              i32.load16_u offset=18
              local.set 5
              local.get 2
              local.get 0
              i32.store offset=8
              i32.const 0
              local.get 2
              i32.const 8
              i32.add
              i32.store offset=75156
              local.get 2
              local.get 5
              i32.const 1
              i32.add
              local.tee 0
              i32.store16 offset=26
              local.get 0
              i32.const 65535
              i32.and
              i32.const 2000
              i32.ne
              br_if 0 (;@5;)
              call $callDepthLimitReached__system_u3735
            end
            local.get 2
            i32.const 66100
            i32.store offset=20
            local.get 2
            i32.const 116
            i32.store offset=16
            local.get 1
            local.get 11
            call $addInt__stdZprivateZdigitsutils_u178
            i32.const 0
            i32.const 0
            i32.load offset=75156
            i32.load
            i32.store offset=75156
            local.get 1
            i32.const 1
            call $prepareAdd
            local.get 1
            i32.load offset=4
            local.get 1
            i32.load
            i32.add
            i32.const 4
            i32.add
            i32.const 41
            i32.store16 align=1
            block ;; label = @5
              local.get 1
              i32.load
              local.tee 0
              i32.const 1
              i32.add
              local.tee 5
              local.get 0
              i32.ge_s
              br_if 0 (;@5;)
              call $raiseOverflow
              br 1 (;@4;)
            end
            local.get 1
            local.get 5
            i32.store
          end
          i32.const 1
          local.set 0
          local.get 10
          local.get 1
          i32.load
          i32.sub
          i32.const 25
          i32.add
          local.tee 5
          i32.const 1
          local.get 5
          i32.const 1
          i32.gt_s
          select
          local.set 3
          loop ;; label = @4
            local.get 1
            i32.const 1
            call $prepareAdd
            local.get 1
            i32.load offset=4
            local.get 1
            i32.load
            i32.add
            i32.const 4
            i32.add
            i32.const 32
            i32.store8
            block ;; label = @5
              block ;; label = @6
                local.get 1
                i32.load
                local.tee 5
                i32.const 1
                i32.add
                local.tee 4
                local.get 5
                i32.ge_s
                br_if 0 (;@6;)
                call $raiseOverflow
                br 1 (;@5;)
              end
              local.get 1
              local.get 4
              i32.store
              local.get 1
              i32.load offset=4
              local.get 4
              i32.add
              i32.const 4
              i32.add
              i32.const 0
              i32.store8
            end
            local.get 0
            local.get 3
            i32.ne
            local.set 5
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 5
            br_if 0 (;@4;)
          end
          block ;; label = @4
            local.get 8
            i32.load
            i32.load offset=4
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            local.get 3
            i32.load8_u
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            loop ;; label = @5
              local.get 1
              i32.const 1
              call $prepareAdd
              local.get 1
              i32.load offset=4
              local.get 1
              i32.load
              i32.add
              i32.const 4
              i32.add
              local.get 5
              i32.store8
              block ;; label = @6
                block ;; label = @7
                  local.get 1
                  i32.load
                  local.tee 5
                  i32.const 1
                  i32.add
                  local.tee 4
                  local.get 5
                  i32.ge_s
                  br_if 0 (;@7;)
                  call $raiseOverflow
                  br 1 (;@6;)
                end
                local.get 1
                local.get 4
                i32.store
                local.get 1
                i32.load offset=4
                local.get 4
                i32.add
                i32.const 4
                i32.add
                i32.const 0
                i32.store8
              end
              local.get 3
              local.get 0
              i32.const 1
              i32.add
              local.tee 0
              i32.add
              i32.load8_u
              local.tee 5
              br_if 0 (;@5;)
            end
          end
          local.get 1
          i32.const 1
          call $prepareAdd
          local.get 1
          i32.load offset=4
          local.get 1
          i32.load
          i32.add
          i32.const 4
          i32.add
          i32.const 10
          i32.store16 align=1
          block ;; label = @4
            local.get 1
            i32.load
            local.tee 0
            i32.const 1
            i32.add
            local.tee 5
            local.get 0
            i32.ge_s
            br_if 0 (;@4;)
            call $raiseOverflow
            br 1 (;@3;)
          end
          local.get 1
          local.get 5
          i32.store
        end
        local.get 9
        i32.const 1
        i32.gt_s
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $showErrorMessage__system_u3178 (;66;) (type 1) (param i32 i32)
    (local i32 i32 i64 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75696
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 0
                br_if 0 (;@6;)
                i64.const 0
                local.set 4
                br 4 (;@2;)
              end
              i64.const 0
              local.set 4
              block ;; label = @6
                local.get 0
                call $strlen
                local.tee 3
                i32.const 1
                i32.ge_s
                br_if 0 (;@6;)
                i64.const 0
                local.set 5
                br 3 (;@3;)
              end
              local.get 3
              i32.const 1
              i32.add
              local.tee 1
              local.get 3
              i32.lt_s
              br_if 1 (;@4;)
              local.get 1
              i32.const 4
              i32.add
              local.tee 6
              local.get 1
              i32.lt_s
              br_if 1 (;@4;)
              block ;; label = @6
                local.get 6
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
                i64.const 0
                local.set 4
                local.get 6
                i64.extend_i32_s
                i64.const 0
                i64.const 2147483647
                call $raiseRangeErrorI
                i64.const 0
                local.set 5
                br 3 (;@3;)
              end
              local.get 2
              i32.const 66174
              i32.store offset=36
              local.get 2
              i32.const 66619
              i32.store offset=28
              local.get 2
              i32.const 0
              i32.store16 offset=40
              local.get 2
              i32.const 0
              i32.store offset=32
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=75156
                  local.tee 7
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 7
                  i32.store offset=24
                  local.get 2
                  i32.const 0
                  i32.store16 offset=42
                  i32.const 0
                  local.get 2
                  i32.const 24
                  i32.add
                  i32.store offset=75156
                  br 1 (;@6;)
                end
                local.get 7
                i32.load16_u offset=18
                local.set 8
                local.get 2
                local.get 7
                i32.store offset=24
                i32.const 0
                local.get 2
                i32.const 24
                i32.add
                i32.store offset=75156
                local.get 2
                local.get 8
                i32.const 1
                i32.add
                local.tee 7
                i32.store16 offset=42
                local.get 7
                i32.const 65535
                i32.and
                i32.const 2000
                i32.ne
                br_if 0 (;@6;)
                call $callDepthLimitReached__system_u3735
              end
              local.get 2
              i32.const 1147
              i32.store offset=32
              i32.const 68628
              local.get 6
              call $rawAlloc__system_u5592
              local.set 6
              i32.const 0
              i32.const 0
              i32.load offset=75156
              i32.load
              i32.store offset=75156
              local.get 6
              local.get 3
              i32.store
              block ;; label = @6
                local.get 1
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
                i64.const 0
                local.set 4
                i64.const -2147483648
                i64.const 0
                i64.const 2147483647
                call $raiseRangeErrorI
                i64.const 0
                local.set 5
                br 3 (;@3;)
              end
              local.get 6
              i32.const 4
              i32.add
              local.get 0
              local.get 1
              call $__memcpy
              drop
              local.get 6
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.set 5
              local.get 3
              i64.extend_i32_u
              local.set 4
              br 2 (;@3;)
            end
            local.get 0
            i32.const 1
            local.get 1
            i32.const 0
            i32.load offset=67736
            local.tee 3
            call $fwrite
            drop
            local.get 3
            call $fflush
            drop
            br 3 (;@1;)
          end
          call $raiseOverflow
          i64.const 0
          local.set 5
        end
        local.get 5
        local.get 4
        i64.or
        local.set 4
        i32.const 0
        i32.load offset=75696
        local.set 3
      end
      local.get 2
      local.get 4
      i64.store offset=8
      local.get 2
      local.get 4
      i64.store offset=16
      local.get 2
      i32.const 8
      i32.add
      local.get 3
      call_indirect (type 0)
      block ;; label = @2
        local.get 2
        i32.load offset=20
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.add
        i32.load8_u
        i32.const 64
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 66174
        i32.store offset=36
        local.get 2
        i32.const 66606
        i32.store offset=28
        local.get 2
        i32.const 0
        i32.store16 offset=40
        local.get 2
        i32.const 0
        i32.store offset=32
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 3
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=24
            local.get 2
            i32.const 0
            i32.store16 offset=42
            i32.const 0
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 3
          i32.load16_u offset=18
          local.set 1
          local.get 2
          local.get 3
          i32.store offset=24
          i32.const 0
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 3
          i32.store16 offset=42
          local.get 3
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 1164
        i32.store offset=32
        i32.const 68628
        local.get 0
        call $rawDealloc__system_u5753
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
      end
      i32.const 0
      i32.load8_u offset=75168
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store8 offset=75168
      i32.const 75700
      i32.const 0
      i32.load offset=75700
      i32.load offset=28
      call $eqcopy___system_u3236
    end
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
  )
  (func $showErrorMessage2__system_u3186 (;67;) (type 0) (param i32)
    local.get 0
    i32.load offset=4
    i32.const 4
    i32.add
    i32.const 66735
    local.get 0
    i32.load
    local.tee 0
    select
    local.get 0
    call $showErrorMessage__system_u3178
  )
  (func $alloc0__system_u5839 (;68;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 66697
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store16 offset=16
    local.get 2
    i32.const 0
    i32.store offset=8
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store
        local.get 2
        i32.const 0
        i32.store16 offset=18
        local.get 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store
      i32.const 0
      local.get 2
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.store16 offset=18
      local.get 2
      local.set 3
      local.get 4
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
      i32.const 0
      i32.load offset=75156
      local.set 3
    end
    local.get 2
    i32.const 66174
    i32.store offset=12
    local.get 2
    i32.const 1150
    i32.store offset=8
    local.get 2
    i32.const 66174
    i32.store offset=36
    local.get 2
    i32.const 66619
    i32.store offset=28
    local.get 2
    i32.const 0
    i32.store16 offset=40
    local.get 2
    i32.const 0
    i32.store offset=32
    block ;; label = @1
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=24
        local.get 2
        i32.const 0
        i32.store16 offset=42
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=24
      i32.const 0
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=42
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 1147
    i32.store offset=32
    local.get 0
    local.get 1
    call $rawAlloc__system_u5592
    local.set 3
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 3
    i32.const 0
    local.get 1
    call $__memset
    local.set 3
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $alignedAlloc0__system_u1922 (;69;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 16
        i32.gt_s
        br_if 0 (;@2;)
        i32.const 68628
        local.get 0
        call $alloc0__system_u5839
        local.set 3
        br 1 (;@1;)
      end
      i32.const 0
      local.set 3
      block ;; label = @2
        local.get 1
        i32.const 0
        i32.lt_s
        local.get 0
        local.get 1
        i32.add
        local.tee 4
        local.get 0
        i32.lt_s
        i32.eq
        br_if 0 (;@2;)
        call $raiseOverflow
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.const -1
        i32.add
        local.tee 0
        local.get 4
        i32.ge_s
        br_if 0 (;@2;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 3
        local.get 0
        i32.lt_s
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 3
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 3
          i64.extend_i32_s
          i64.const 0
          i64.const 2147483647
          call $raiseRangeErrorI
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        i32.const 68628
        local.get 3
        call $alloc0__system_u5839
        local.set 0
        local.get 2
        i32.const 66116
        i32.store offset=20
        local.get 2
        i32.const 66716
        i32.store offset=12
        i32.const 0
        local.set 5
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        local.get 1
        local.get 0
        local.get 1
        i32.const -1
        i32.add
        i32.and
        i32.sub
        local.set 4
        i32.const 0
        local.set 1
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load16_u offset=18
          local.set 1
          local.get 2
          local.get 3
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 6
          i32.store16 offset=26
          local.get 3
          local.set 1
          local.get 6
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 1
        end
        local.get 4
        local.get 0
        i32.add
        local.tee 3
        i32.const -2
        i32.add
        local.get 4
        i32.store16
        local.get 2
        i32.const 66116
        i32.store offset=20
        local.get 2
        i32.const 66716
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load16_u offset=18
          local.set 0
          local.get 2
          local.get 1
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.store16 offset=26
          local.get 1
          local.set 5
          local.get 0
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
          i32.const 0
          i32.load offset=75156
          i32.load
          local.set 5
        end
        i32.const 0
        local.get 5
        i32.store offset=75156
        br 1 (;@1;)
      end
      call $raiseOverflow
      i32.const 0
      local.set 3
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $raiseIndexError2 (;70;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          i32.const 43
          local.set 1
          i32.const 67612
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        i32.const 8
        i32.add
        local.get 0
        call $dollar___systemZdollars_u8
        i32.const 0
        i32.load8_u offset=75168
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=12
        local.set 4
        local.get 2
        i32.load offset=8
        local.set 0
        local.get 2
        i32.const 8
        i32.add
        local.get 1
        call $dollar___systemZdollars_u8
        i32.const 0
        i32.load8_u offset=75168
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=12
        local.set 5
        local.get 2
        i32.const 8
        i32.add
        local.get 0
        local.get 2
        i32.load offset=8
        local.tee 6
        i32.add
        i32.const 19
        i32.add
        call $rawNewString
        local.get 2
        i32.load offset=12
        local.tee 3
        local.get 2
        i32.load offset=8
        local.tee 1
        i32.add
        local.tee 7
        i32.const 7
        i32.add
        i32.const 0
        i32.load offset=67667 align=1
        i32.store align=1
        local.get 7
        i32.const 4
        i32.add
        i32.const 0
        i32.load offset=67664
        i32.store align=1
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 6
            i32.add
            local.tee 7
            local.get 1
            i32.ge_s
            br_if 0 (;@4;)
            call $raiseOverflow
            br 1 (;@3;)
          end
          local.get 7
          local.set 1
        end
        block ;; label = @3
          local.get 0
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 0
            i32.const 1
            i32.add
            local.tee 7
            local.get 0
            i32.ge_s
            br_if 0 (;@4;)
            call $raiseOverflow
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 7
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            i64.const -2147483648
            i64.const 0
            i64.const 2147483647
            call $raiseRangeErrorI
            br 1 (;@3;)
          end
          local.get 3
          local.get 1
          i32.add
          i32.const 4
          i32.add
          local.get 4
          i32.const 4
          i32.add
          local.get 7
          call $__memcpy
          drop
          block ;; label = @4
            local.get 0
            i32.const 0
            i32.lt_s
            local.get 1
            local.get 0
            i32.add
            local.tee 0
            local.get 1
            i32.lt_s
            i32.eq
            br_if 0 (;@4;)
            call $raiseOverflow
            br 1 (;@3;)
          end
          local.get 0
          local.set 1
        end
        local.get 3
        local.get 1
        i32.add
        local.tee 0
        i32.const 10
        i32.add
        i32.const 0
        i64.load offset=67682 align=2
        i64.store align=1
        local.get 0
        i32.const 4
        i32.add
        i32.const 0
        i64.load offset=67676 align=4
        i64.store align=1
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 13
            i32.add
            local.tee 0
            local.get 1
            i32.ge_s
            br_if 0 (;@4;)
            call $raiseOverflow
            br 1 (;@3;)
          end
          local.get 0
          local.set 1
        end
        block ;; label = @3
          local.get 6
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 6
            i32.const 1
            i32.add
            local.tee 0
            local.get 6
            i32.ge_s
            br_if 0 (;@4;)
            call $raiseOverflow
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 0
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            i64.const -2147483648
            i64.const 0
            i64.const 2147483647
            call $raiseRangeErrorI
            br 1 (;@3;)
          end
          local.get 3
          local.get 1
          i32.add
          i32.const 4
          i32.add
          local.get 5
          i32.const 4
          i32.add
          local.get 0
          call $__memcpy
          drop
          block ;; label = @4
            local.get 6
            i32.const 0
            i32.lt_s
            local.get 1
            local.get 6
            i32.add
            local.tee 0
            local.get 1
            i32.lt_s
            i32.eq
            br_if 0 (;@4;)
            call $raiseOverflow
            br 1 (;@3;)
          end
          local.get 0
          local.set 1
        end
        block ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.const 3
          i32.add
          i32.load8_u
          i32.const 64
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.const 66174
          i32.store offset=20
          local.get 2
          i32.const 66606
          i32.store offset=12
          local.get 2
          i32.const 0
          i32.store16 offset=24
          local.get 2
          i32.const 0
          i32.store offset=16
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=75156
              local.tee 0
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.store offset=8
              local.get 2
              i32.const 0
              i32.store16 offset=26
              i32.const 0
              local.get 2
              i32.const 8
              i32.add
              i32.store offset=75156
              br 1 (;@4;)
            end
            local.get 0
            i32.load16_u offset=18
            local.set 6
            local.get 2
            local.get 0
            i32.store offset=8
            i32.const 0
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=75156
            local.get 2
            local.get 6
            i32.const 1
            i32.add
            local.tee 0
            i32.store16 offset=26
            local.get 0
            i32.const 65535
            i32.and
            i32.const 2000
            i32.ne
            br_if 0 (;@4;)
            call $callDepthLimitReached__system_u3735
          end
          local.get 2
          i32.const 1164
          i32.store offset=16
          i32.const 68628
          local.get 5
          call $rawDealloc__system_u5753
          i32.const 0
          i32.const 0
          i32.load offset=75156
          i32.load
          i32.store offset=75156
        end
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.add
        i32.load8_u
        i32.const 64
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 66174
        i32.store offset=20
        local.get 2
        i32.const 66606
        i32.store offset=12
        local.get 2
        i32.const 0
        i32.store16 offset=24
        local.get 2
        i32.const 0
        i32.store offset=16
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=75156
            local.tee 0
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=8
            local.get 2
            i32.const 0
            i32.store16 offset=26
            i32.const 0
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=75156
            br 1 (;@3;)
          end
          local.get 0
          i32.load16_u offset=18
          local.set 6
          local.get 2
          local.get 0
          i32.store offset=8
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          local.get 2
          local.get 6
          i32.const 1
          i32.add
          local.tee 0
          i32.store16 offset=26
          local.get 0
          i32.const 65535
          i32.and
          i32.const 2000
          i32.ne
          br_if 0 (;@3;)
          call $callDepthLimitReached__system_u3735
        end
        local.get 2
        i32.const 1164
        i32.store offset=16
        i32.const 68628
        local.get 4
        call $rawDealloc__system_u5753
        i32.const 0
        i32.const 0
        i32.load offset=75156
        i32.load
        i32.store offset=75156
      end
      local.get 2
      i32.const 66154
      i32.store offset=20
      local.get 2
      i32.const 66253
      i32.store offset=12
      local.get 2
      i32.const 0
      i32.store16 offset=24
      local.get 2
      i32.const 0
      i32.store offset=16
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=75156
          local.tee 0
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.store offset=8
          local.get 2
          i32.const 0
          i32.store16 offset=26
          i32.const 0
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=75156
          br 1 (;@2;)
        end
        local.get 0
        i32.load16_u offset=18
        local.set 6
        local.get 2
        local.get 0
        i32.store offset=8
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        local.get 2
        local.get 6
        i32.const 1
        i32.add
        local.tee 0
        i32.store16 offset=26
        local.get 0
        i32.const 65535
        i32.and
        i32.const 2000
        i32.ne
        br_if 0 (;@2;)
        call $callDepthLimitReached__system_u3735
      end
      i32.const 32
      i32.const 4
      call $nimNewObj
      local.tee 0
      local.get 1
      i32.store offset=12
      local.get 0
      i32.const 65783
      i32.store offset=8
      local.get 0
      i32.const 68280
      i32.store
      local.get 0
      i32.const 16
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const 66154
      i32.store offset=20
      local.get 2
      i32.const 53
      i32.store offset=16
      local.get 0
      i32.const 65783
      local.get 2
      local.get 2
      local.get 2
      call $raiseExceptionEx
      i32.const 0
      i32.const 0
      i32.load offset=75156
      i32.load
      i32.store offset=75156
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $echoBinSafe (;71;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66143
    i32.store offset=20
    local.get 2
    i32.const 66566
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    i32.const 0
    local.set 3
    i32.const 0
    i32.load offset=67740
    local.set 5
    block ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 2
        i32.const 2919
        i32.store offset=16
        local.get 2
        i32.const 66143
        i32.store offset=20
        local.get 0
        local.get 3
        i32.const 3
        i32.shl
        i32.add
        local.tee 4
        i32.const 4
        i32.add
        i32.load
        i32.const 4
        i32.add
        i32.const 66735
        local.get 4
        i32.load
        local.tee 4
        select
        local.get 4
        i32.const 1
        local.get 5
        call $fwrite
        drop
        local.get 2
        i32.const 66074
        i32.store offset=20
        local.get 2
        i32.const 13
        i32.store offset=16
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 1
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 66143
    i32.store offset=20
    local.get 2
    i32.const 2921
    i32.store offset=16
    i32.const 10
    local.get 5
    call $fputc
    drop
    local.get 2
    i32.const 2922
    i32.store offset=16
    local.get 5
    call $fflush
    drop
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $hello (;72;) (type 5)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 66049
    i32.store offset=20
    local.get 0
    i32.const 66033
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.store16 offset=24
    local.get 0
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 1
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.store offset=8
        local.get 0
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 0
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 1
      i32.load16_u offset=18
      local.set 2
      local.get 0
      local.get 1
      i32.store offset=8
      i32.const 0
      local.get 0
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 0
      local.get 2
      i32.const 1
      i32.add
      local.tee 1
      i32.store16 offset=26
      local.get 1
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 0
    i32.const 66049
    i32.store offset=20
    local.get 0
    i32.const 22
    i32.store offset=16
    i32.const 67692
    i32.const 1
    call $echoBinSafe
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
  )
  (func $foo (;73;) (type 23) (param i32 f32) (result f32)
    (local i32 i32 i32 i32 f32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 66049
    i32.store offset=20
    local.get 2
    i32.const 66029
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store16 offset=24
    local.get 2
    i32.const 0
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=75156
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store16 offset=26
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=75156
        br 1 (;@1;)
      end
      local.get 3
      i32.load16_u offset=18
      local.set 4
      local.get 2
      local.get 3
      i32.store offset=8
      i32.const 0
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=75156
      local.get 2
      local.get 4
      i32.const 1
      i32.add
      local.tee 3
      i32.store16 offset=26
      local.get 3
      i32.const 65535
      i32.and
      i32.const 2000
      i32.ne
      br_if 0 (;@1;)
      call $callDepthLimitReached__system_u3735
    end
    local.get 2
    i32.const 25
    i32.store offset=16
    local.get 2
    i32.const 32
    i32.add
    local.get 0
    call $dollar___systemZdollars_u8
    local.get 2
    i32.load offset=36
    local.set 3
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load8_u offset=75168
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=32
          local.set 4
          local.get 2
          local.get 3
          i32.store offset=36
          local.get 2
          local.get 4
          i32.store offset=32
          local.get 2
          i32.const 0
          i64.load offset=67704
          i64.store offset=40
          local.get 2
          local.get 1
          call $dollar___test_u34
          local.get 2
          i32.load offset=4
          local.set 4
          block ;; label = @4
            i32.const 0
            i32.load8_u offset=75168
            br_if 0 (;@4;)
            local.get 2
            i32.load
            local.set 5
            local.get 2
            i32.const 52
            i32.add
            local.get 4
            i32.store
            local.get 2
            local.get 5
            i32.store offset=48
            local.get 2
            i32.const 32
            i32.add
            i32.const 3
            call $echoBinSafe
            local.get 2
            i32.const 66143
            i32.store offset=20
            local.get 2
            i32.const 378
            i32.store offset=16
            local.get 0
            f32.convert_i32_s
            local.set 6
            block ;; label = @5
              local.get 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.const 3
              i32.add
              i32.load8_u
              i32.const 64
              i32.and
              br_if 0 (;@5;)
              local.get 4
              call $dealloc
            end
            local.get 6
            local.get 1
            f32.add
            local.set 1
            local.get 3
            i32.eqz
            br_if 3 (;@1;)
            local.get 3
            i32.const 3
            i32.add
            i32.load8_u
            i32.const 64
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            br 3 (;@1;)
          end
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.const 3
          i32.add
          i32.load8_u
          i32.const 64
          i32.and
          br_if 0 (;@3;)
          local.get 4
          call $dealloc
        end
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          f32.const 0x0p+0 (;=0;)
          local.set 1
          br 2 (;@1;)
        end
        f32.const 0x0p+0 (;=0;)
        local.set 1
        local.get 3
        i32.const 3
        i32.add
        i32.load8_u
        i32.const 64
        i32.and
        br_if 1 (;@1;)
      end
      local.get 3
      call $dealloc
    end
    i32.const 0
    i32.const 0
    i32.load offset=75156
    i32.load
    i32.store offset=75156
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $_initialize (;74;) (type 5)
    block ;; label = @1
      i32.const 4
      i32.eqz
      br_if 0 (;@1;)
      call $__wasm_call_ctors
    end
  )
  (func $__memcpy (;75;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.get 2
    i32.add
    local.set 3
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            local.get 0
            i32.xor
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 2
            i32.const 1
            i32.lt_s
            br_if 1 (;@3;)
            local.get 0
            local.set 2
            loop ;; label = @5
              local.get 2
              local.get 1
              i32.load8_u
              i32.store8
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              local.get 2
              i32.const 1
              i32.add
              local.tee 2
              i32.const 3
              i32.and
              i32.eqz
              br_if 3 (;@2;)
              local.get 2
              local.get 3
              i32.lt_u
              br_if 0 (;@5;)
              br 3 (;@2;)
            end
            unreachable
          end
          block ;; label = @4
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const -4
            i32.add
            local.tee 4
            local.get 0
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.set 2
            loop ;; label = @5
              local.get 2
              local.get 1
              i32.load8_u
              i32.store8
              local.get 2
              local.get 1
              i32.load8_u offset=1
              i32.store8 offset=1
              local.get 2
              local.get 1
              i32.load8_u offset=2
              i32.store8 offset=2
              local.get 2
              local.get 1
              i32.load8_u offset=3
              i32.store8 offset=3
              local.get 1
              i32.const 4
              i32.add
              local.set 1
              local.get 2
              i32.const 4
              i32.add
              local.tee 2
              local.get 4
              i32.le_u
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
            unreachable
          end
          local.get 0
          local.set 2
          br 2 (;@1;)
        end
        local.get 0
        local.set 2
      end
      block ;; label = @2
        local.get 3
        i32.const -4
        i32.and
        local.tee 4
        i32.const 64
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.const -64
        i32.add
        local.tee 5
        i32.gt_u
        br_if 0 (;@2;)
        loop ;; label = @3
          local.get 2
          local.get 1
          i32.load
          i32.store
          local.get 2
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 2
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 2
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 2
          local.get 1
          i32.load offset=16
          i32.store offset=16
          local.get 2
          local.get 1
          i32.load offset=20
          i32.store offset=20
          local.get 2
          local.get 1
          i32.load offset=24
          i32.store offset=24
          local.get 2
          local.get 1
          i32.load offset=28
          i32.store offset=28
          local.get 2
          local.get 1
          i32.load offset=32
          i32.store offset=32
          local.get 2
          local.get 1
          i32.load offset=36
          i32.store offset=36
          local.get 2
          local.get 1
          i32.load offset=40
          i32.store offset=40
          local.get 2
          local.get 1
          i32.load offset=44
          i32.store offset=44
          local.get 2
          local.get 1
          i32.load offset=48
          i32.store offset=48
          local.get 2
          local.get 1
          i32.load offset=52
          i32.store offset=52
          local.get 2
          local.get 1
          i32.load offset=56
          i32.store offset=56
          local.get 2
          local.get 1
          i32.load offset=60
          i32.store offset=60
          local.get 1
          i32.const 64
          i32.add
          local.set 1
          local.get 2
          i32.const 64
          i32.add
          local.tee 2
          local.get 5
          i32.le_u
          br_if 0 (;@3;)
        end
      end
      local.get 2
      local.get 4
      i32.ge_u
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 2
        local.get 1
        i32.load
        i32.store
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        local.get 2
        i32.const 4
        i32.add
        local.tee 2
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      local.get 2
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        i32.store8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        local.get 3
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
  )
  (func $__memset (;76;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      local.get 0
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 3
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 3
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 4
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=24
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 1
      i32.store
      local.get 4
      local.get 3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 5
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 3
      local.get 5
      i32.add
      local.set 1
      loop ;; label = @2
        local.get 1
        local.get 6
        i64.store offset=24
        local.get 1
        local.get 6
        i64.store offset=16
        local.get 1
        local.get 6
        i64.store offset=8
        local.get 1
        local.get 6
        i64.store
        local.get 1
        i32.const 32
        i32.add
        local.set 1
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
  )
  (func $dummy (;77;) (type 5))
  (func $libc_exit_fini (;78;) (type 5)
    (local i32)
    i32.const 0
    local.set 0
    block ;; label = @1
      i32.const 0
      i32.const 0
      i32.le_u
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        local.tee 0
        i32.load
        call_indirect (type 5)
        local.get 0
        i32.const 0
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    call $dummy
  )
  (func $exit (;79;) (type 0) (param i32)
    call $dummy
    call $libc_exit_fini
    call $__stdio_exit
    local.get 0
    call $_Exit
    unreachable
  )
  (func $_Exit (;80;) (type 0) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable
  )
  (func $__lockfile (;81;) (type 3) (param i32) (result i32)
    i32.const 1
  )
  (func $__unlockfile (;82;) (type 0) (param i32))
  (func $fflush (;83;) (type 3) (param i32) (result i32)
    (local i32 i32 i32)
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      block ;; label = @2
        i32.const 0
        i32.load offset=68608
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=68608
        call $fflush
        local.set 1
      end
      block ;; label = @2
        i32.const 0
        i32.load offset=68456
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=68456
        call $fflush
        local.get 1
        i32.or
        local.set 1
      end
      block ;; label = @2
        call $__ofl_lock
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        loop ;; label = @3
          i32.const 0
          local.set 2
          block ;; label = @4
            local.get 0
            i32.load offset=76
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 0
            call $__lockfile
            local.set 2
          end
          block ;; label = @4
            local.get 0
            i32.load offset=20
            local.get 0
            i32.load offset=28
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            call $fflush
            local.get 1
            i32.or
            local.set 1
          end
          block ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            call $__unlockfile
          end
          local.get 0
          i32.load offset=56
          local.tee 0
          br_if 0 (;@3;)
        end
      end
      call $__ofl_unlock
      local.get 1
      return
    end
    i32.const 0
    local.set 2
    block ;; label = @1
      local.get 0
      i32.load offset=76
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      call $__lockfile
      local.set 2
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=28
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=36
          call_indirect (type 4)
          drop
          local.get 0
          i32.load offset=20
          br_if 0 (;@3;)
          i32.const -1
          local.set 1
          local.get 2
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 3
          i32.sub
          i64.extend_i32_s
          i32.const 1
          local.get 0
          i32.load offset=40
          call_indirect (type 8)
          drop
        end
        i32.const 0
        local.set 1
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 0
        i64.const 0
        i64.store offset=16
        local.get 0
        i64.const 0
        i64.store offset=4 align=4
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      call $__unlockfile
    end
    local.get 1
  )
  (func $__stdio_exit (;84;) (type 5)
    (local i32)
    block ;; label = @1
      call $__ofl_lock
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 0
        call $close_file
        local.get 0
        i32.load offset=56
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    i32.const 0
    i32.load offset=75704
    call $close_file
    i32.const 0
    i32.load offset=68608
    call $close_file
    i32.const 0
    i32.load offset=68456
    call $close_file
  )
  (func $close_file (;85;) (type 0) (param i32)
    (local i32 i32)
    block ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i32.load offset=76
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        call $__lockfile
        drop
      end
      block ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=28
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=36
        call_indirect (type 4)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=40
      call_indirect (type 8)
      drop
    end
  )
  (func $__towrite (;86;) (type 3) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load offset=72
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=72
    block ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 8
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    local.get 0
    local.get 0
    i32.load offset=44
    local.tee 1
    i32.store offset=28
    local.get 0
    local.get 1
    i32.store offset=20
    local.get 0
    local.get 1
    local.get 0
    i32.load offset=48
    i32.add
    i32.store offset=16
    i32.const 0
  )
  (func $__overflow (;87;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store8 offset=15
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const -1
        local.set 3
        local.get 0
        call $__towrite
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=16
        local.set 3
      end
      block ;; label = @2
        local.get 0
        i32.load offset=20
        local.tee 4
        local.get 3
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=80
        local.get 1
        i32.const 255
        i32.and
        local.tee 3
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.const 1
        i32.add
        i32.store offset=20
        local.get 4
        local.get 1
        i32.store8
        br 1 (;@1;)
      end
      i32.const -1
      local.set 3
      local.get 0
      local.get 2
      i32.const 15
      i32.add
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 4)
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.load8_u offset=15
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $fputc (;88;) (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $do_putc
  )
  (func $do_putc (;89;) (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.load offset=76
        local.tee 2
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const -1073741825
        i32.and
        call $__get_tp
        i32.load offset=24
        i32.ne
        br_if 1 (;@1;)
      end
      block ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 2
        local.get 1
        i32.load offset=80
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        local.tee 3
        local.get 1
        i32.load offset=16
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.const 1
        i32.add
        i32.store offset=20
        local.get 3
        local.get 0
        i32.store8
        local.get 2
        return
      end
      local.get 1
      local.get 2
      call $__overflow
      return
    end
    local.get 0
    local.get 1
    call $locking_putc
  )
  (func $locking_putc (;90;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block ;; label = @1
      local.get 1
      i32.const 76
      i32.add
      local.tee 2
      call $a_cas
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call $__lockfile
      drop
    end
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 3
        local.get 1
        i32.load offset=80
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        local.tee 4
        local.get 1
        i32.load offset=16
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        local.get 4
        i32.const 1
        i32.add
        i32.store offset=20
        local.get 4
        local.get 0
        i32.store8
        br 1 (;@1;)
      end
      local.get 1
      local.get 3
      call $__overflow
      local.set 3
    end
    block ;; label = @1
      local.get 2
      call $a_swap
      i32.const 1073741824
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      call $__wake
    end
    local.get 3
  )
  (func $a_cas (;91;) (type 3) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load
    local.tee 1
    i32.const 1073741823
    local.get 1
    select
    i32.store
    local.get 1
  )
  (func $a_swap (;92;) (type 3) (param i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.set 1
    local.get 0
    i32.const 0
    i32.store
    local.get 1
  )
  (func $__wake (;93;) (type 0) (param i32)
    local.get 0
    i32.const 1
    call $emscripten_futex_wake
    drop
  )
  (func $__fwritex (;94;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=16
        local.set 3
      end
      block ;; label = @2
        local.get 3
        local.get 2
        i32.load offset=20
        local.tee 5
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=36
        call_indirect (type 4)
        return
      end
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i32.load offset=80
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        local.set 4
        loop ;; label = @3
          block ;; label = @4
            local.get 4
            local.tee 3
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            br 2 (;@2;)
          end
          local.get 0
          local.get 3
          i32.const -1
          i32.add
          local.tee 4
          i32.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 3
        local.get 2
        i32.load offset=36
        call_indirect (type 4)
        local.tee 4
        local.get 3
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.add
        local.set 0
        local.get 1
        local.get 3
        i32.sub
        local.set 1
        local.get 2
        i32.load offset=20
        local.set 5
      end
      local.get 5
      local.get 0
      local.get 1
      call $__memcpy
      drop
      local.get 2
      local.get 2
      i32.load offset=20
      local.get 1
      i32.add
      i32.store offset=20
      local.get 3
      local.get 1
      i32.add
      local.set 4
    end
    local.get 4
  )
  (func $fwrite (;95;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 2
    local.get 1
    i32.mul
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.load offset=76
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        local.get 3
        call $__fwritex
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      call $__lockfile
      local.set 5
      local.get 0
      local.get 4
      local.get 3
      call $__fwritex
      local.set 0
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      call $__unlockfile
    end
    block ;; label = @1
      local.get 0
      local.get 4
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 0
    local.get 1
    i32.div_u
  )
  (func $__errno_location (;96;) (type 6) (result i32)
    i32.const 75708
  )
  (func $emscripten_get_heap_size (;97;) (type 6) (result i32)
    memory.size
    i32.const 16
    i32.shl
  )
  (func $_mmap_js (;98;) (type 24) (param i32 i32 i32 i32 i64 i32 i32) (result i32)
    i32.const -52
  )
  (func $_munmap_js (;99;) (type 11) (param i32 i32 i32 i32 i32 i64) (result i32)
    i32.const -52
  )
  (func $emscripten_resize_heap (;100;) (type 3) (param i32) (result i32)
    block ;; label = @1
      local.get 0
      memory.size
      i32.const 16
      i32.shl
      i32.sub
      i32.const 65535
      i32.add
      i32.const 16
      i32.shr_u
      memory.grow
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 1
  )
  (func $emscripten_futex_wake (;101;) (type 2) (param i32 i32) (result i32)
    i32.const 0
  )
  (func $__lock (;102;) (type 0) (param i32))
  (func $__unlock (;103;) (type 0) (param i32))
  (func $__syscall_munmap (;104;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 75712
    call $__lock
    local.get 2
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    call $find_mapping
    local.set 3
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          br_if 1 (;@2;)
        end
        i32.const 75712
        call $__unlock
        i32.const -28
        local.set 1
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 3
        i32.load offset=4
        local.get 1
        i32.eq
        br_if 0 (;@2;)
        i32.const 75712
        call $__unlock
        i32.const -28
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      i32.load offset=12
      local.tee 4
      i32.const 36
      i32.add
      i32.const 75716
      local.get 4
      select
      local.get 3
      i32.load offset=36
      i32.store
      i32.const 75712
      call $__unlock
      block ;; label = @2
        local.get 3
        i32.load offset=16
        local.tee 4
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        i32.load offset=32
        local.get 4
        local.get 3
        i32.load offset=12
        local.get 3
        i64.load offset=24
        call $_munmap_js
        local.tee 1
        br_if 1 (;@1;)
      end
      block ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load
        call $dlfree
      end
      i32.const 0
      local.set 1
      local.get 3
      i32.load8_u offset=16
      i32.const 32
      i32.and
      br_if 0 (;@1;)
      local.get 3
      call $dlfree
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $find_mapping (;105;) (type 2) (param i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      i32.const 0
      i32.load offset=75716
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        block ;; label = @3
          local.get 2
          i32.load
          local.get 0
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          return
        end
        block ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          i32.store
        end
        local.get 2
        i32.load offset=36
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    i32.const 0
  )
  (func $__syscall_mmap2 (;106;) (type 11) (param i32 i32 i32 i32 i32 i64) (result i32)
    (local i32)
    i32.const -28
    local.set 6
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 5
      i64.const 12
      i64.shl
      local.set 5
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.const 32
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            i32.const 65536
            local.get 1
            i32.const 15
            i32.add
            i32.const -16
            i32.and
            local.tee 6
            i32.const 40
            i32.add
            call $dlmemalign
            local.tee 0
            br_if 1 (;@3;)
            i32.const -48
            return
          end
          block ;; label = @4
            local.get 1
            local.get 2
            local.get 3
            local.get 4
            local.get 5
            i32.const 40
            call $dlmalloc
            local.tee 6
            i32.const 8
            i32.add
            local.get 6
            call $_mmap_js
            local.tee 0
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 6
            local.get 4
            i32.store offset=12
            br 2 (;@2;)
          end
          local.get 6
          call $dlfree
          local.get 0
          return
        end
        local.get 0
        i32.const 0
        local.get 6
        call $__memset
        drop
        local.get 0
        local.get 6
        i32.add
        local.tee 6
        local.get 0
        i32.store
        local.get 6
        i64.const -4294967295
        i64.store offset=8
      end
      local.get 6
      local.get 2
      i32.store offset=32
      local.get 6
      local.get 5
      i64.store offset=24
      local.get 6
      local.get 3
      i32.store offset=16
      local.get 6
      local.get 1
      i32.store offset=4
      i32.const 75712
      call $__lock
      local.get 6
      i32.const 0
      i32.load offset=75716
      i32.store offset=36
      i32.const 0
      local.get 6
      i32.store offset=75716
      i32.const 75712
      call $__unlock
      local.get 6
      i32.load
      local.set 6
    end
    local.get 6
  )
  (func $dummy.1 (;107;) (type 5))
  (func $__mmap (;108;) (type 11) (param i32 i32 i32 i32 i32 i64) (result i32)
    (local i32)
    block ;; label = @1
      local.get 5
      i64.const -17592186040321
      i64.and
      i64.eqz
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 28
      i32.store
      i32.const -1
      return
    end
    block ;; label = @1
      local.get 1
      i32.const 2147483647
      i32.lt_u
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 48
      i32.store
      i32.const -1
      return
    end
    i32.const -48
    local.set 6
    block ;; label = @1
      local.get 3
      i32.const 16
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      call $dummy.1
      i32.const -63
      local.set 6
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 5
    i64.const 12
    i64.shr_u
    call $__syscall_mmap2
    local.tee 1
    local.get 1
    local.get 6
    i32.const -63
    local.get 3
    i32.const 32
    i32.and
    select
    local.get 1
    i32.const -63
    i32.ne
    select
    local.get 0
    select
    call $__syscall_ret
  )
  (func $__munmap (;109;) (type 2) (param i32 i32) (result i32)
    call $dummy.1
    local.get 0
    local.get 1
    call $__syscall_munmap
    call $__syscall_ret
  )
  (func $__ofl_lock (;110;) (type 6) (result i32)
    i32.const 75720
    call $__lock
    i32.const 75724
  )
  (func $__ofl_unlock (;111;) (type 5)
    i32.const 75720
    call $__unlock
  )
  (func $__syscall_getpid (;112;) (type 6) (result i32)
    i32.const 42
  )
  (func $getpid (;113;) (type 6) (result i32)
    call $__syscall_getpid
  )
  (func $__get_tp (;114;) (type 6) (result i32)
    i32.const 75784
  )
  (func $init_pthread_self (;115;) (type 5)
    i32.const 0
    i32.const 75760
    i32.store offset=75880
    i32.const 0
    call $getpid
    i32.store offset=75808
  )
  (func $snprintf (;116;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 3
    i32.store offset=12
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $vsnprintf
    local.set 3
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $dummy.2 (;117;) (type 3) (param i32) (result i32)
    local.get 0
  )
  (func $__stdio_close (;118;) (type 3) (param i32) (result i32)
    local.get 0
    i32.load offset=60
    call $dummy.2
    call $__wasi_fd_close
  )
  (func $__stdio_write (;119;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.load offset=28
    local.tee 4
    i32.store offset=16
    local.get 0
    i32.load offset=20
    local.set 5
    local.get 3
    local.get 2
    i32.store offset=28
    local.get 3
    local.get 1
    i32.store offset=24
    local.get 3
    local.get 5
    local.get 4
    i32.sub
    local.tee 1
    i32.store offset=20
    local.get 1
    local.get 2
    i32.add
    local.set 6
    local.get 3
    i32.const 16
    i32.add
    local.set 4
    i32.const 2
    local.set 7
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.load offset=60
              local.get 3
              i32.const 16
              i32.add
              i32.const 2
              local.get 3
              i32.const 12
              i32.add
              call $__wasi_fd_write
              call $__wasi_syscall_ret
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              local.set 5
              br 1 (;@4;)
            end
            loop ;; label = @5
              local.get 6
              local.get 3
              i32.load offset=12
              local.tee 1
              i32.eq
              br_if 2 (;@3;)
              block ;; label = @6
                local.get 1
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
                local.get 4
                local.set 5
                br 4 (;@2;)
              end
              local.get 4
              local.get 1
              local.get 4
              i32.load offset=4
              local.tee 8
              i32.gt_u
              local.tee 9
              i32.const 3
              i32.shl
              i32.add
              local.tee 5
              local.get 5
              i32.load
              local.get 1
              local.get 8
              i32.const 0
              local.get 9
              select
              i32.sub
              local.tee 8
              i32.add
              i32.store
              local.get 4
              i32.const 12
              i32.const 4
              local.get 9
              select
              i32.add
              local.tee 4
              local.get 4
              i32.load
              local.get 8
              i32.sub
              i32.store
              local.get 6
              local.get 1
              i32.sub
              local.set 6
              local.get 5
              local.set 4
              local.get 0
              i32.load offset=60
              local.get 5
              local.get 7
              local.get 9
              i32.sub
              local.tee 7
              local.get 3
              i32.const 12
              i32.add
              call $__wasi_fd_write
              call $__wasi_syscall_ret
              i32.eqz
              br_if 0 (;@5;)
            end
          end
          local.get 6
          i32.const -1
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 0
        i32.load offset=44
        local.tee 1
        i32.store offset=28
        local.get 0
        local.get 1
        i32.store offset=20
        local.get 0
        local.get 1
        local.get 0
        i32.load offset=48
        i32.add
        i32.store offset=16
        local.get 2
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
      local.get 0
      i32.const 0
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16
      local.get 0
      local.get 0
      i32.load
      i32.const 32
      i32.or
      i32.store
      local.get 7
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      local.get 5
      i32.load offset=4
      i32.sub
      local.set 1
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $__lseek (;120;) (type 8) (param i32 i64 i32) (result i64)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    local.get 1
    local.get 2
    i32.const 255
    i32.and
    local.get 3
    i32.const 8
    i32.add
    call $__wasi_fd_seek
    call $__wasi_syscall_ret
    local.set 2
    local.get 3
    i64.load offset=8
    local.set 1
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i64.const -1
    local.get 1
    local.get 2
    select
  )
  (func $__stdio_seek (;121;) (type 8) (param i32 i64 i32) (result i64)
    local.get 0
    i32.load offset=60
    local.get 1
    local.get 2
    call $__lseek
  )
  (func $__emscripten_stdout_close (;122;) (type 3) (param i32) (result i32)
    i32.const 0
  )
  (func $__emscripten_stdout_seek (;123;) (type 8) (param i32 i64 i32) (result i64)
    i64.const 0
  )
  (func $strlen (;124;) (type 3) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 0
          i32.load8_u
          br_if 0 (;@3;)
          local.get 0
          local.get 0
          i32.sub
          return
        end
        local.get 0
        local.set 1
        loop ;; label = @3
          local.get 1
          i32.const 1
          i32.add
          local.tee 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          i32.load8_u
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
        unreachable
      end
      loop ;; label = @2
        local.get 1
        local.tee 2
        i32.const 4
        i32.add
        local.set 1
        local.get 2
        i32.load
        local.tee 3
        i32.const -1
        i32.xor
        local.get 3
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        i32.eqz
        br_if 0 (;@2;)
      end
      loop ;; label = @2
        local.get 2
        local.tee 1
        i32.const 1
        i32.add
        local.set 2
        local.get 1
        i32.load8_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub
  )
  (func $__syscall_ret (;125;) (type 3) (param i32) (result i32)
    block ;; label = @1
      local.get 0
      i32.const -4095
      i32.lt_u
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 0
      local.get 0
      i32.sub
      i32.store
      i32.const -1
      local.set 0
    end
    local.get 0
  )
  (func $isdigit (;126;) (type 3) (param i32) (result i32)
    local.get 0
    i32.const -48
    i32.add
    i32.const 10
    i32.lt_u
  )
  (func $memchr (;127;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          local.set 4
          loop ;; label = @4
            local.get 0
            i32.load8_u
            local.get 4
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 2
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        block ;; label = @3
          local.get 0
          i32.load8_u
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.const 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 4
          loop ;; label = @4
            local.get 0
            i32.load
            local.get 4
            i32.xor
            local.tee 3
            i32.const -1
            i32.xor
            local.get 3
            i32.const -16843009
            i32.add
            i32.and
            i32.const -2139062144
            i32.and
            br_if 2 (;@2;)
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            local.get 2
            i32.const -4
            i32.add
            local.tee 2
            i32.const 3
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 255
      i32.and
      local.set 3
      loop ;; label = @2
        block ;; label = @3
          local.get 0
          i32.load8_u
          local.get 3
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          return
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    i32.const 0
  )
  (func $strnlen (;128;) (type 2) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.const 0
    local.get 1
    call $memchr
    local.tee 2
    local.get 0
    i32.sub
    local.get 1
    local.get 2
    select
  )
  (func $frexp (;129;) (type 25) (param f64 i32) (result f64)
    (local i64 i32)
    block ;; label = @1
      local.get 0
      i64.reinterpret_f64
      local.tee 2
      i64.const 52
      i64.shr_u
      i32.wrap_i64
      i32.const 2047
      i32.and
      local.tee 3
      i32.const 2047
      i32.eq
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 0
            f64.const 0x0p+0 (;=0;)
            f64.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            br 1 (;@3;)
          end
          local.get 0
          f64.const 0x1p+64 (;=18446744073709552000;)
          f64.mul
          local.get 1
          call $frexp
          local.set 0
          local.get 1
          i32.load
          i32.const -64
          i32.add
          local.set 3
        end
        local.get 1
        local.get 3
        i32.store
        local.get 0
        return
      end
      local.get 1
      local.get 3
      i32.const -1022
      i32.add
      i32.store
      local.get 2
      i64.const -9218868437227405313
      i64.and
      i64.const 4602678819172646912
      i64.or
      f64.reinterpret_i64
      local.set 0
    end
    local.get 0
  )
  (func $__vfprintf_internal (;130;) (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 208
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 2
    i32.store offset=204
    i32.const 0
    local.set 6
    local.get 5
    i32.const 160
    i32.add
    i32.const 0
    i32.const 40
    call $__memset
    drop
    local.get 5
    local.get 5
    i32.load offset=204
    i32.store offset=200
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        local.get 1
        local.get 5
        i32.const 200
        i32.add
        local.get 5
        i32.const 80
        i32.add
        local.get 5
        i32.const 160
        i32.add
        local.get 3
        local.get 4
        call $printf_core
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 0
        i32.load offset=76
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        call $__lockfile
        local.set 6
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 7
      i32.const -33
      i32.and
      i32.store
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.load offset=48
              br_if 0 (;@5;)
              local.get 0
              i32.const 80
              i32.store offset=48
              local.get 0
              i32.const 0
              i32.store offset=28
              local.get 0
              i64.const 0
              i64.store offset=16
              local.get 0
              i32.load offset=44
              local.set 8
              local.get 0
              local.get 5
              i32.store offset=44
              br 1 (;@4;)
            end
            i32.const 0
            local.set 8
            local.get 0
            i32.load offset=16
            br_if 1 (;@3;)
          end
          i32.const -1
          local.set 2
          local.get 0
          call $__towrite
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 5
        i32.const 200
        i32.add
        local.get 5
        i32.const 80
        i32.add
        local.get 5
        i32.const 160
        i32.add
        local.get 3
        local.get 4
        call $printf_core
        local.set 2
      end
      local.get 7
      i32.const 32
      i32.and
      local.set 4
      block ;; label = @2
        local.get 8
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=36
        call_indirect (type 4)
        drop
        local.get 0
        i32.const 0
        i32.store offset=48
        local.get 0
        local.get 8
        i32.store offset=44
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 0
        i32.load offset=20
        local.set 3
        local.get 0
        i64.const 0
        i64.store offset=16
        local.get 2
        i32.const -1
        local.get 3
        select
        local.set 2
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 3
      local.get 4
      i32.or
      i32.store
      i32.const -1
      local.get 2
      local.get 3
      i32.const 32
      i32.and
      select
      local.set 4
      local.get 6
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $__unlockfile
    end
    local.get 5
    i32.const 208
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $printf_core (;131;) (type 26) (param i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 7
    global.set $__stack_pointer
    local.get 7
    local.get 1
    i32.store offset=76
    local.get 7
    i32.const 55
    i32.add
    local.set 8
    local.get 7
    i32.const 56
    i32.add
    local.set 9
    i32.const 0
    local.set 10
    i32.const 0
    local.set 11
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          loop ;; label = @4
            i32.const 0
            local.set 12
            loop ;; label = @5
              local.get 1
              local.set 13
              local.get 12
              local.get 11
              i32.const 2147483647
              i32.xor
              i32.gt_s
              br_if 2 (;@3;)
              local.get 12
              local.get 11
              i32.add
              local.set 11
              local.get 13
              local.set 12
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        local.get 13
                        i32.load8_u
                        local.tee 14
                        i32.eqz
                        br_if 0 (;@10;)
                        loop ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                local.get 14
                                i32.const 255
                                i32.and
                                local.tee 14
                                br_if 0 (;@14;)
                                local.get 12
                                local.set 1
                                br 1 (;@13;)
                              end
                              local.get 14
                              i32.const 37
                              i32.ne
                              br_if 1 (;@12;)
                              local.get 12
                              local.set 14
                              loop ;; label = @14
                                block ;; label = @15
                                  local.get 14
                                  i32.load8_u offset=1
                                  i32.const 37
                                  i32.eq
                                  br_if 0 (;@15;)
                                  local.get 14
                                  local.set 1
                                  br 2 (;@13;)
                                end
                                local.get 12
                                i32.const 1
                                i32.add
                                local.set 12
                                local.get 14
                                i32.load8_u offset=2
                                local.set 15
                                local.get 14
                                i32.const 2
                                i32.add
                                local.tee 1
                                local.set 14
                                local.get 15
                                i32.const 37
                                i32.eq
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 12
                            local.get 13
                            i32.sub
                            local.tee 12
                            local.get 11
                            i32.const 2147483647
                            i32.xor
                            local.tee 14
                            i32.gt_s
                            br_if 9 (;@3;)
                            block ;; label = @13
                              local.get 0
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 0
                              local.get 13
                              local.get 12
                              call $out
                            end
                            local.get 12
                            br_if 7 (;@5;)
                            local.get 7
                            local.get 1
                            i32.store offset=76
                            local.get 1
                            i32.const 1
                            i32.add
                            local.set 12
                            i32.const -1
                            local.set 16
                            block ;; label = @13
                              local.get 1
                              i32.load8_s offset=1
                              call $isdigit
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 1
                              i32.load8_u offset=2
                              i32.const 36
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 1
                              i32.const 3
                              i32.add
                              local.set 12
                              local.get 1
                              i32.load8_s offset=1
                              i32.const -48
                              i32.add
                              local.set 16
                              i32.const 1
                              local.set 10
                            end
                            local.get 7
                            local.get 12
                            i32.store offset=76
                            i32.const 0
                            local.set 17
                            block ;; label = @13
                              block ;; label = @14
                                local.get 12
                                i32.load8_s
                                local.tee 18
                                i32.const -32
                                i32.add
                                local.tee 1
                                i32.const 31
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 12
                                local.set 15
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 17
                              local.get 12
                              local.set 15
                              i32.const 1
                              local.get 1
                              i32.shl
                              local.tee 1
                              i32.const 75913
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              loop ;; label = @14
                                local.get 7
                                local.get 12
                                i32.const 1
                                i32.add
                                local.tee 15
                                i32.store offset=76
                                local.get 1
                                local.get 17
                                i32.or
                                local.set 17
                                local.get 12
                                i32.load8_s offset=1
                                local.tee 18
                                i32.const -32
                                i32.add
                                local.tee 1
                                i32.const 32
                                i32.ge_u
                                br_if 1 (;@13;)
                                local.get 15
                                local.set 12
                                i32.const 1
                                local.get 1
                                i32.shl
                                local.tee 1
                                i32.const 75913
                                i32.and
                                br_if 0 (;@14;)
                              end
                            end
                            block ;; label = @13
                              block ;; label = @14
                                local.get 18
                                i32.const 42
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 15
                                i32.const 1
                                i32.add
                                local.set 18
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 15
                                    i32.load8_s offset=1
                                    call $isdigit
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 15
                                    i32.load8_u offset=2
                                    i32.const 36
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 18
                                    i32.load8_s
                                    i32.const -48
                                    i32.add
                                    local.set 12
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        br_if 0 (;@18;)
                                        local.get 4
                                        local.get 12
                                        i32.const 2
                                        i32.shl
                                        i32.add
                                        i32.const 10
                                        i32.store
                                        i32.const 0
                                        local.set 19
                                        br 1 (;@17;)
                                      end
                                      local.get 3
                                      local.get 12
                                      i32.const 3
                                      i32.shl
                                      i32.add
                                      i32.load
                                      local.set 19
                                    end
                                    local.get 15
                                    i32.const 3
                                    i32.add
                                    local.set 18
                                    i32.const 1
                                    local.set 10
                                    br 1 (;@15;)
                                  end
                                  local.get 10
                                  br_if 6 (;@9;)
                                  block ;; label = @16
                                    local.get 0
                                    br_if 0 (;@16;)
                                    local.get 7
                                    local.get 18
                                    i32.store offset=76
                                    i32.const 0
                                    local.set 10
                                    i32.const 0
                                    local.set 19
                                    br 3 (;@13;)
                                  end
                                  local.get 2
                                  local.get 2
                                  i32.load
                                  local.tee 12
                                  i32.const 4
                                  i32.add
                                  i32.store
                                  local.get 12
                                  i32.load
                                  local.set 19
                                  i32.const 0
                                  local.set 10
                                end
                                local.get 7
                                local.get 18
                                i32.store offset=76
                                local.get 19
                                i32.const -1
                                i32.gt_s
                                br_if 1 (;@13;)
                                i32.const 0
                                local.get 19
                                i32.sub
                                local.set 19
                                local.get 17
                                i32.const 8192
                                i32.or
                                local.set 17
                                br 1 (;@13;)
                              end
                              local.get 7
                              i32.const 76
                              i32.add
                              call $getint
                              local.tee 19
                              i32.const 0
                              i32.lt_s
                              br_if 10 (;@3;)
                              local.get 7
                              i32.load offset=76
                              local.set 18
                            end
                            i32.const 0
                            local.set 12
                            i32.const -1
                            local.set 20
                            block ;; label = @13
                              block ;; label = @14
                                local.get 18
                                i32.load8_u
                                i32.const 46
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 18
                                local.set 1
                                i32.const 0
                                local.set 21
                                br 1 (;@13;)
                              end
                              block ;; label = @14
                                local.get 18
                                i32.load8_u offset=1
                                i32.const 42
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 18
                                i32.const 2
                                i32.add
                                local.set 1
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 18
                                    i32.load8_s offset=2
                                    call $isdigit
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 18
                                    i32.load8_u offset=3
                                    i32.const 36
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 1
                                    i32.load8_s
                                    i32.const -48
                                    i32.add
                                    local.set 15
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        br_if 0 (;@18;)
                                        local.get 4
                                        local.get 15
                                        i32.const 2
                                        i32.shl
                                        i32.add
                                        i32.const 10
                                        i32.store
                                        i32.const 0
                                        local.set 20
                                        br 1 (;@17;)
                                      end
                                      local.get 3
                                      local.get 15
                                      i32.const 3
                                      i32.shl
                                      i32.add
                                      i32.load
                                      local.set 20
                                    end
                                    local.get 18
                                    i32.const 4
                                    i32.add
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 10
                                  br_if 6 (;@9;)
                                  block ;; label = @16
                                    local.get 0
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 20
                                    br 1 (;@15;)
                                  end
                                  local.get 2
                                  local.get 2
                                  i32.load
                                  local.tee 15
                                  i32.const 4
                                  i32.add
                                  i32.store
                                  local.get 15
                                  i32.load
                                  local.set 20
                                end
                                local.get 7
                                local.get 1
                                i32.store offset=76
                                local.get 20
                                i32.const -1
                                i32.xor
                                i32.const 31
                                i32.shr_u
                                local.set 21
                                br 1 (;@13;)
                              end
                              local.get 7
                              local.get 18
                              i32.const 1
                              i32.add
                              i32.store offset=76
                              i32.const 1
                              local.set 21
                              local.get 7
                              i32.const 76
                              i32.add
                              call $getint
                              local.set 20
                              local.get 7
                              i32.load offset=76
                              local.set 1
                            end
                            loop ;; label = @13
                              local.get 12
                              local.set 15
                              i32.const 28
                              local.set 22
                              local.get 1
                              local.tee 18
                              i32.load8_s
                              local.tee 12
                              i32.const -123
                              i32.add
                              i32.const -58
                              i32.lt_u
                              br_if 11 (;@2;)
                              local.get 18
                              i32.const 1
                              i32.add
                              local.set 1
                              local.get 12
                              local.get 15
                              i32.const 58
                              i32.mul
                              i32.add
                              i32.const 67679
                              i32.add
                              i32.load8_u
                              local.tee 12
                              i32.const -1
                              i32.add
                              i32.const 8
                              i32.lt_u
                              br_if 0 (;@13;)
                            end
                            local.get 7
                            local.get 1
                            i32.store offset=76
                            block ;; label = @13
                              block ;; label = @14
                                local.get 12
                                i32.const 27
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 12
                                i32.eqz
                                br_if 12 (;@2;)
                                block ;; label = @15
                                  local.get 16
                                  i32.const 0
                                  i32.lt_s
                                  br_if 0 (;@15;)
                                  block ;; label = @16
                                    local.get 0
                                    br_if 0 (;@16;)
                                    local.get 4
                                    local.get 16
                                    i32.const 2
                                    i32.shl
                                    i32.add
                                    local.get 12
                                    i32.store
                                    br 12 (;@4;)
                                  end
                                  local.get 7
                                  local.get 3
                                  local.get 16
                                  i32.const 3
                                  i32.shl
                                  i32.add
                                  i64.load
                                  i64.store offset=64
                                  br 2 (;@13;)
                                end
                                local.get 0
                                i32.eqz
                                br_if 8 (;@6;)
                                local.get 7
                                i32.const 64
                                i32.add
                                local.get 12
                                local.get 2
                                local.get 6
                                call $pop_arg
                                br 1 (;@13;)
                              end
                              local.get 16
                              i32.const -1
                              i32.gt_s
                              br_if 11 (;@2;)
                              i32.const 0
                              local.set 12
                              local.get 0
                              i32.eqz
                              br_if 8 (;@5;)
                            end
                            i32.const -1
                            local.set 22
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 11 (;@1;)
                            local.get 17
                            i32.const -65537
                            i32.and
                            local.tee 23
                            local.get 17
                            local.get 17
                            i32.const 8192
                            i32.and
                            select
                            local.set 17
                            i32.const 0
                            local.set 16
                            i32.const 65649
                            local.set 24
                            local.get 9
                            local.set 25
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                block ;; label = @23
                                                  block ;; label = @24
                                                    block ;; label = @25
                                                      block ;; label = @26
                                                        block ;; label = @27
                                                          block ;; label = @28
                                                            local.get 18
                                                            i32.load8_s
                                                            local.tee 12
                                                            i32.const -33
                                                            i32.and
                                                            local.get 12
                                                            local.get 12
                                                            i32.const 15
                                                            i32.and
                                                            i32.const 3
                                                            i32.eq
                                                            select
                                                            local.get 12
                                                            local.get 15
                                                            select
                                                            local.tee 12
                                                            i32.const -88
                                                            i32.add
                                                            br_table 4 (;@24;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 14 (;@14;) 21 (;@7;) 15 (;@13;) 6 (;@22;) 14 (;@14;) 14 (;@14;) 14 (;@14;) 21 (;@7;) 6 (;@22;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 21 (;@7;) 2 (;@26;) 5 (;@23;) 3 (;@25;) 21 (;@7;) 21 (;@7;) 9 (;@19;) 21 (;@7;) 1 (;@27;) 21 (;@7;) 21 (;@7;) 4 (;@24;) 0 (;@28;)
                                                          end
                                                          local.get 9
                                                          local.set 25
                                                          block ;; label = @28
                                                            local.get 12
                                                            i32.const -65
                                                            i32.add
                                                            br_table 14 (;@14;) 21 (;@7;) 11 (;@17;) 21 (;@7;) 14 (;@14;) 14 (;@14;) 14 (;@14;) 0 (;@28;)
                                                          end
                                                          local.get 12
                                                          i32.const 83
                                                          i32.eq
                                                          br_if 9 (;@18;)
                                                          br 19 (;@8;)
                                                        end
                                                        i32.const 0
                                                        local.set 16
                                                        i32.const 65649
                                                        local.set 24
                                                        local.get 7
                                                        i64.load offset=64
                                                        local.set 26
                                                        br 5 (;@21;)
                                                      end
                                                      i32.const 0
                                                      local.set 12
                                                      block ;; label = @26
                                                        block ;; label = @27
                                                          block ;; label = @28
                                                            block ;; label = @29
                                                              block ;; label = @30
                                                                block ;; label = @31
                                                                  block ;; label = @32
                                                                    local.get 15
                                                                    i32.const 255
                                                                    i32.and
                                                                    br_table 0 (;@32;) 1 (;@31;) 2 (;@30;) 3 (;@29;) 4 (;@28;) 27 (;@5;) 5 (;@27;) 6 (;@26;) 27 (;@5;)
                                                                  end
                                                                  local.get 7
                                                                  i32.load offset=64
                                                                  local.get 11
                                                                  i32.store
                                                                  br 26 (;@5;)
                                                                end
                                                                local.get 7
                                                                i32.load offset=64
                                                                local.get 11
                                                                i32.store
                                                                br 25 (;@5;)
                                                              end
                                                              local.get 7
                                                              i32.load offset=64
                                                              local.get 11
                                                              i64.extend_i32_s
                                                              i64.store
                                                              br 24 (;@5;)
                                                            end
                                                            local.get 7
                                                            i32.load offset=64
                                                            local.get 11
                                                            i32.store16
                                                            br 23 (;@5;)
                                                          end
                                                          local.get 7
                                                          i32.load offset=64
                                                          local.get 11
                                                          i32.store8
                                                          br 22 (;@5;)
                                                        end
                                                        local.get 7
                                                        i32.load offset=64
                                                        local.get 11
                                                        i32.store
                                                        br 21 (;@5;)
                                                      end
                                                      local.get 7
                                                      i32.load offset=64
                                                      local.get 11
                                                      i64.extend_i32_s
                                                      i64.store
                                                      br 20 (;@5;)
                                                    end
                                                    local.get 20
                                                    i32.const 8
                                                    local.get 20
                                                    i32.const 8
                                                    i32.gt_u
                                                    select
                                                    local.set 20
                                                    local.get 17
                                                    i32.const 8
                                                    i32.or
                                                    local.set 17
                                                    i32.const 120
                                                    local.set 12
                                                  end
                                                  local.get 7
                                                  i64.load offset=64
                                                  local.get 9
                                                  local.get 12
                                                  i32.const 32
                                                  i32.and
                                                  call $fmt_x
                                                  local.set 13
                                                  i32.const 0
                                                  local.set 16
                                                  i32.const 65649
                                                  local.set 24
                                                  local.get 7
                                                  i64.load offset=64
                                                  i64.eqz
                                                  br_if 3 (;@20;)
                                                  local.get 17
                                                  i32.const 8
                                                  i32.and
                                                  i32.eqz
                                                  br_if 3 (;@20;)
                                                  local.get 12
                                                  i32.const 4
                                                  i32.shr_u
                                                  i32.const 65649
                                                  i32.add
                                                  local.set 24
                                                  i32.const 2
                                                  local.set 16
                                                  br 3 (;@20;)
                                                end
                                                i32.const 0
                                                local.set 16
                                                i32.const 65649
                                                local.set 24
                                                local.get 7
                                                i64.load offset=64
                                                local.get 9
                                                call $fmt_o
                                                local.set 13
                                                local.get 17
                                                i32.const 8
                                                i32.and
                                                i32.eqz
                                                br_if 2 (;@20;)
                                                local.get 20
                                                local.get 9
                                                local.get 13
                                                i32.sub
                                                local.tee 12
                                                i32.const 1
                                                i32.add
                                                local.get 20
                                                local.get 12
                                                i32.gt_s
                                                select
                                                local.set 20
                                                br 2 (;@20;)
                                              end
                                              block ;; label = @22
                                                local.get 7
                                                i64.load offset=64
                                                local.tee 26
                                                i64.const -1
                                                i64.gt_s
                                                br_if 0 (;@22;)
                                                local.get 7
                                                i64.const 0
                                                local.get 26
                                                i64.sub
                                                local.tee 26
                                                i64.store offset=64
                                                i32.const 1
                                                local.set 16
                                                i32.const 65649
                                                local.set 24
                                                br 1 (;@21;)
                                              end
                                              block ;; label = @22
                                                local.get 17
                                                i32.const 2048
                                                i32.and
                                                i32.eqz
                                                br_if 0 (;@22;)
                                                i32.const 1
                                                local.set 16
                                                i32.const 65650
                                                local.set 24
                                                br 1 (;@21;)
                                              end
                                              i32.const 65651
                                              i32.const 65649
                                              local.get 17
                                              i32.const 1
                                              i32.and
                                              local.tee 16
                                              select
                                              local.set 24
                                            end
                                            local.get 26
                                            local.get 9
                                            call $fmt_u
                                            local.set 13
                                          end
                                          block ;; label = @20
                                            local.get 21
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 20
                                            i32.const 0
                                            i32.lt_s
                                            br_if 17 (;@3;)
                                          end
                                          local.get 17
                                          i32.const -65537
                                          i32.and
                                          local.get 17
                                          local.get 21
                                          select
                                          local.set 17
                                          block ;; label = @20
                                            local.get 7
                                            i64.load offset=64
                                            local.tee 26
                                            i64.const 0
                                            i64.ne
                                            br_if 0 (;@20;)
                                            local.get 20
                                            br_if 0 (;@20;)
                                            local.get 9
                                            local.set 13
                                            local.get 9
                                            local.set 25
                                            i32.const 0
                                            local.set 20
                                            br 13 (;@7;)
                                          end
                                          local.get 20
                                          local.get 9
                                          local.get 13
                                          i32.sub
                                          local.get 26
                                          i64.eqz
                                          i32.add
                                          local.tee 12
                                          local.get 20
                                          local.get 12
                                          i32.gt_s
                                          select
                                          local.set 20
                                          br 11 (;@8;)
                                        end
                                        local.get 7
                                        i32.load offset=64
                                        local.tee 12
                                        i32.const 66706
                                        local.get 12
                                        select
                                        local.set 13
                                        local.get 13
                                        local.get 13
                                        local.get 20
                                        i32.const 2147483647
                                        local.get 20
                                        i32.const 2147483647
                                        i32.lt_u
                                        select
                                        call $strnlen
                                        local.tee 12
                                        i32.add
                                        local.set 25
                                        block ;; label = @19
                                          local.get 20
                                          i32.const -1
                                          i32.le_s
                                          br_if 0 (;@19;)
                                          local.get 23
                                          local.set 17
                                          local.get 12
                                          local.set 20
                                          br 12 (;@7;)
                                        end
                                        local.get 23
                                        local.set 17
                                        local.get 12
                                        local.set 20
                                        local.get 25
                                        i32.load8_u
                                        br_if 15 (;@3;)
                                        br 11 (;@7;)
                                      end
                                      block ;; label = @18
                                        local.get 20
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 7
                                        i32.load offset=64
                                        local.set 14
                                        br 2 (;@16;)
                                      end
                                      i32.const 0
                                      local.set 12
                                      local.get 0
                                      i32.const 32
                                      local.get 19
                                      i32.const 0
                                      local.get 17
                                      call $pad
                                      br 2 (;@15;)
                                    end
                                    local.get 7
                                    i32.const 0
                                    i32.store offset=12
                                    local.get 7
                                    local.get 7
                                    i64.load offset=64
                                    i64.store32 offset=8
                                    local.get 7
                                    local.get 7
                                    i32.const 8
                                    i32.add
                                    i32.store offset=64
                                    local.get 7
                                    i32.const 8
                                    i32.add
                                    local.set 14
                                    i32.const -1
                                    local.set 20
                                  end
                                  i32.const 0
                                  local.set 12
                                  block ;; label = @16
                                    loop ;; label = @17
                                      local.get 14
                                      i32.load
                                      local.tee 15
                                      i32.eqz
                                      br_if 1 (;@16;)
                                      block ;; label = @18
                                        local.get 7
                                        i32.const 4
                                        i32.add
                                        local.get 15
                                        call $wctomb
                                        local.tee 15
                                        i32.const 0
                                        i32.lt_s
                                        local.tee 13
                                        br_if 0 (;@18;)
                                        local.get 15
                                        local.get 20
                                        local.get 12
                                        i32.sub
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        local.get 14
                                        i32.const 4
                                        i32.add
                                        local.set 14
                                        local.get 15
                                        local.get 12
                                        i32.add
                                        local.tee 12
                                        local.get 20
                                        i32.lt_u
                                        br_if 1 (;@17;)
                                        br 2 (;@16;)
                                      end
                                    end
                                    local.get 13
                                    br_if 15 (;@1;)
                                  end
                                  i32.const 61
                                  local.set 22
                                  local.get 12
                                  i32.const 0
                                  i32.lt_s
                                  br_if 13 (;@2;)
                                  local.get 0
                                  i32.const 32
                                  local.get 19
                                  local.get 12
                                  local.get 17
                                  call $pad
                                  block ;; label = @16
                                    local.get 12
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 12
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.set 15
                                  local.get 7
                                  i32.load offset=64
                                  local.set 14
                                  loop ;; label = @16
                                    local.get 14
                                    i32.load
                                    local.tee 13
                                    i32.eqz
                                    br_if 1 (;@15;)
                                    local.get 7
                                    i32.const 4
                                    i32.add
                                    local.get 13
                                    call $wctomb
                                    local.tee 13
                                    local.get 15
                                    i32.add
                                    local.tee 15
                                    local.get 12
                                    i32.gt_u
                                    br_if 1 (;@15;)
                                    local.get 0
                                    local.get 7
                                    i32.const 4
                                    i32.add
                                    local.get 13
                                    call $out
                                    local.get 14
                                    i32.const 4
                                    i32.add
                                    local.set 14
                                    local.get 15
                                    local.get 12
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.const 32
                                local.get 19
                                local.get 12
                                local.get 17
                                i32.const 8192
                                i32.xor
                                call $pad
                                local.get 19
                                local.get 12
                                local.get 19
                                local.get 12
                                i32.gt_s
                                select
                                local.set 12
                                br 9 (;@5;)
                              end
                              block ;; label = @14
                                local.get 21
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 20
                                i32.const 0
                                i32.lt_s
                                br_if 11 (;@3;)
                              end
                              i32.const 61
                              local.set 22
                              local.get 0
                              local.get 7
                              f64.load offset=64
                              local.get 19
                              local.get 20
                              local.get 17
                              local.get 12
                              local.get 5
                              call_indirect (type 14)
                              local.tee 12
                              i32.const 0
                              i32.ge_s
                              br_if 8 (;@5;)
                              br 11 (;@2;)
                            end
                            local.get 7
                            local.get 7
                            i64.load offset=64
                            i64.store8 offset=55
                            i32.const 1
                            local.set 20
                            local.get 8
                            local.set 13
                            local.get 9
                            local.set 25
                            local.get 23
                            local.set 17
                            br 5 (;@7;)
                          end
                          local.get 12
                          i32.load8_u offset=1
                          local.set 14
                          local.get 12
                          i32.const 1
                          i32.add
                          local.set 12
                          br 0 (;@11;)
                        end
                        unreachable
                      end
                      local.get 11
                      local.set 22
                      local.get 0
                      br_if 8 (;@1;)
                      local.get 10
                      i32.eqz
                      br_if 3 (;@6;)
                      i32.const 1
                      local.set 12
                      block ;; label = @10
                        loop ;; label = @11
                          local.get 4
                          local.get 12
                          i32.const 2
                          i32.shl
                          i32.add
                          i32.load
                          local.tee 14
                          i32.eqz
                          br_if 1 (;@10;)
                          local.get 3
                          local.get 12
                          i32.const 3
                          i32.shl
                          i32.add
                          local.get 14
                          local.get 2
                          local.get 6
                          call $pop_arg
                          i32.const 1
                          local.set 22
                          local.get 12
                          i32.const 1
                          i32.add
                          local.tee 12
                          i32.const 10
                          i32.ne
                          br_if 0 (;@11;)
                          br 10 (;@1;)
                        end
                        unreachable
                      end
                      i32.const 1
                      local.set 22
                      local.get 12
                      i32.const 10
                      i32.ge_u
                      br_if 8 (;@1;)
                      loop ;; label = @10
                        local.get 4
                        local.get 12
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.load
                        br_if 1 (;@9;)
                        i32.const 1
                        local.set 22
                        local.get 12
                        i32.const 1
                        i32.add
                        local.tee 12
                        i32.const 10
                        i32.eq
                        br_if 9 (;@1;)
                        br 0 (;@10;)
                      end
                      unreachable
                    end
                    i32.const 28
                    local.set 22
                    br 6 (;@2;)
                  end
                  local.get 9
                  local.set 25
                end
                local.get 20
                local.get 25
                local.get 13
                i32.sub
                local.tee 18
                local.get 20
                local.get 18
                i32.gt_s
                select
                local.tee 20
                local.get 16
                i32.const 2147483647
                i32.xor
                i32.gt_s
                br_if 3 (;@3;)
                i32.const 61
                local.set 22
                local.get 19
                local.get 16
                local.get 20
                i32.add
                local.tee 15
                local.get 19
                local.get 15
                i32.gt_s
                select
                local.tee 12
                local.get 14
                i32.gt_s
                br_if 4 (;@2;)
                local.get 0
                i32.const 32
                local.get 12
                local.get 15
                local.get 17
                call $pad
                local.get 0
                local.get 24
                local.get 16
                call $out
                local.get 0
                i32.const 48
                local.get 12
                local.get 15
                local.get 17
                i32.const 65536
                i32.xor
                call $pad
                local.get 0
                i32.const 48
                local.get 20
                local.get 18
                i32.const 0
                call $pad
                local.get 0
                local.get 13
                local.get 18
                call $out
                local.get 0
                i32.const 32
                local.get 12
                local.get 15
                local.get 17
                i32.const 8192
                i32.xor
                call $pad
                br 1 (;@5;)
              end
            end
          end
          i32.const 0
          local.set 22
          br 2 (;@1;)
        end
        i32.const 61
        local.set 22
      end
      call $__errno_location
      local.get 22
      i32.store
      i32.const -1
      local.set 22
    end
    local.get 7
    i32.const 80
    i32.add
    global.set $__stack_pointer
    local.get 22
  )
  (func $out (;132;) (type 10) (param i32 i32 i32)
    block ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 32
      i32.and
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      local.get 0
      call $__fwritex
      drop
    end
  )
  (func $getint (;133;) (type 3) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 1
    block ;; label = @1
      local.get 0
      i32.load
      i32.load8_s
      call $isdigit
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    loop ;; label = @1
      local.get 0
      i32.load
      local.set 2
      i32.const -1
      local.set 3
      block ;; label = @2
        local.get 1
        i32.const 214748364
        i32.gt_u
        br_if 0 (;@2;)
        i32.const -1
        local.get 2
        i32.load8_s
        i32.const -48
        i32.add
        local.tee 3
        local.get 1
        i32.const 10
        i32.mul
        local.tee 1
        i32.add
        local.get 3
        local.get 1
        i32.const 2147483647
        i32.xor
        i32.gt_s
        select
        local.set 3
      end
      local.get 0
      local.get 2
      i32.const 1
      i32.add
      i32.store
      local.get 3
      local.set 1
      local.get 2
      i32.load8_s offset=1
      call $isdigit
      br_if 0 (;@1;)
    end
    local.get 3
  )
  (func $pop_arg (;134;) (type 27) (param i32 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 1
                                          i32.const -9
                                          i32.add
                                          br_table 0 (;@19;) 1 (;@18;) 2 (;@17;) 5 (;@14;) 3 (;@16;) 4 (;@15;) 6 (;@13;) 7 (;@12;) 8 (;@11;) 9 (;@10;) 10 (;@9;) 11 (;@8;) 12 (;@7;) 13 (;@6;) 14 (;@5;) 15 (;@4;) 16 (;@3;) 17 (;@2;) 18 (;@1;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        local.tee 1
                                        i32.const 4
                                        i32.add
                                        i32.store
                                        local.get 0
                                        local.get 1
                                        i32.load
                                        i32.store
                                        return
                                      end
                                      local.get 2
                                      local.get 2
                                      i32.load
                                      local.tee 1
                                      i32.const 4
                                      i32.add
                                      i32.store
                                      local.get 0
                                      local.get 1
                                      i64.load32_s
                                      i64.store
                                      return
                                    end
                                    local.get 2
                                    local.get 2
                                    i32.load
                                    local.tee 1
                                    i32.const 4
                                    i32.add
                                    i32.store
                                    local.get 0
                                    local.get 1
                                    i64.load32_u
                                    i64.store
                                    return
                                  end
                                  local.get 2
                                  local.get 2
                                  i32.load
                                  local.tee 1
                                  i32.const 4
                                  i32.add
                                  i32.store
                                  local.get 0
                                  local.get 1
                                  i64.load32_s
                                  i64.store
                                  return
                                end
                                local.get 2
                                local.get 2
                                i32.load
                                local.tee 1
                                i32.const 4
                                i32.add
                                i32.store
                                local.get 0
                                local.get 1
                                i64.load32_u
                                i64.store
                                return
                              end
                              local.get 2
                              local.get 2
                              i32.load
                              i32.const 7
                              i32.add
                              i32.const -8
                              i32.and
                              local.tee 1
                              i32.const 8
                              i32.add
                              i32.store
                              local.get 0
                              local.get 1
                              i64.load
                              i64.store
                              return
                            end
                            local.get 2
                            local.get 2
                            i32.load
                            local.tee 1
                            i32.const 4
                            i32.add
                            i32.store
                            local.get 0
                            local.get 1
                            i64.load16_s
                            i64.store
                            return
                          end
                          local.get 2
                          local.get 2
                          i32.load
                          local.tee 1
                          i32.const 4
                          i32.add
                          i32.store
                          local.get 0
                          local.get 1
                          i64.load16_u
                          i64.store
                          return
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 1
                        i64.load8_s
                        i64.store
                        return
                      end
                      local.get 2
                      local.get 2
                      i32.load
                      local.tee 1
                      i32.const 4
                      i32.add
                      i32.store
                      local.get 0
                      local.get 1
                      i64.load8_u
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    i32.load
                    i32.const 7
                    i32.add
                    i32.const -8
                    i32.and
                    local.tee 1
                    i32.const 8
                    i32.add
                    i32.store
                    local.get 0
                    local.get 1
                    i64.load
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  i32.load
                  local.tee 1
                  i32.const 4
                  i32.add
                  i32.store
                  local.get 0
                  local.get 1
                  i64.load32_u
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                i32.load
                i32.const 7
                i32.add
                i32.const -8
                i32.and
                local.tee 1
                i32.const 8
                i32.add
                i32.store
                local.get 0
                local.get 1
                i64.load
                i64.store
                return
              end
              local.get 2
              local.get 2
              i32.load
              i32.const 7
              i32.add
              i32.const -8
              i32.and
              local.tee 1
              i32.const 8
              i32.add
              i32.store
              local.get 0
              local.get 1
              i64.load
              i64.store
              return
            end
            local.get 2
            local.get 2
            i32.load
            local.tee 1
            i32.const 4
            i32.add
            i32.store
            local.get 0
            local.get 1
            i64.load32_s
            i64.store
            return
          end
          local.get 2
          local.get 2
          i32.load
          local.tee 1
          i32.const 4
          i32.add
          i32.store
          local.get 0
          local.get 1
          i64.load32_u
          i64.store
          return
        end
        local.get 2
        local.get 2
        i32.load
        i32.const 7
        i32.add
        i32.const -8
        i32.and
        local.tee 1
        i32.const 8
        i32.add
        i32.store
        local.get 0
        local.get 1
        f64.load
        f64.store
        return
      end
      local.get 0
      local.get 2
      local.get 3
      call_indirect (type 1)
    end
  )
  (func $fmt_x (;135;) (type 28) (param i64 i32 i32) (result i32)
    (local i32)
    block ;; label = @1
      local.get 0
      i64.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        i32.wrap_i64
        i32.const 15
        i32.and
        i32.const 68208
        i32.add
        i32.load8_u
        local.get 2
        i32.or
        i32.store8
        local.get 0
        i64.const 15
        i64.gt_u
        local.set 3
        local.get 0
        i64.const 4
        i64.shr_u
        local.set 0
        local.get 3
        br_if 0 (;@2;)
      end
    end
    local.get 1
  )
  (func $fmt_o (;136;) (type 15) (param i64 i32) (result i32)
    (local i32)
    block ;; label = @1
      local.get 0
      i64.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        i32.wrap_i64
        i32.const 7
        i32.and
        i32.const 48
        i32.or
        i32.store8
        local.get 0
        i64.const 7
        i64.gt_u
        local.set 2
        local.get 0
        i64.const 3
        i64.shr_u
        local.set 0
        local.get 2
        br_if 0 (;@2;)
      end
    end
    local.get 1
  )
  (func $fmt_u (;137;) (type 15) (param i64 i32) (result i32)
    (local i64 i32 i32 i32)
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i64.const 4294967296
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 2
        br 1 (;@1;)
      end
      loop ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        local.get 0
        i64.const 10
        i64.div_u
        local.tee 2
        i64.const 10
        i64.mul
        i64.sub
        i32.wrap_i64
        i32.const 48
        i32.or
        i32.store8
        local.get 0
        i64.const 42949672959
        i64.gt_u
        local.set 3
        local.get 2
        local.set 0
        local.get 3
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      local.get 2
      i32.wrap_i64
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 3
        local.get 3
        i32.const 10
        i32.div_u
        local.tee 4
        i32.const 10
        i32.mul
        i32.sub
        i32.const 48
        i32.or
        i32.store8
        local.get 3
        i32.const 9
        i32.gt_u
        local.set 5
        local.get 4
        local.set 3
        local.get 5
        br_if 0 (;@2;)
      end
    end
    local.get 1
  )
  (func $pad (;138;) (type 12) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 256
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block ;; label = @1
      local.get 2
      local.get 3
      i32.le_s
      br_if 0 (;@1;)
      local.get 4
      i32.const 73728
      i32.and
      br_if 0 (;@1;)
      local.get 5
      local.get 1
      i32.const 255
      i32.and
      local.get 2
      local.get 3
      i32.sub
      local.tee 3
      i32.const 256
      local.get 3
      i32.const 256
      i32.lt_u
      local.tee 2
      select
      call $__memset
      drop
      block ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        loop ;; label = @3
          local.get 0
          local.get 5
          i32.const 256
          call $out
          local.get 3
          i32.const -256
          i32.add
          local.tee 3
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 5
      local.get 3
      call $out
    end
    local.get 5
    i32.const 256
    i32.add
    global.set $__stack_pointer
  )
  (func $vfprintf (;139;) (type 4) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i32.const 10
    i32.const 11
    call $__vfprintf_internal
  )
  (func $fmt_fp (;140;) (type 14) (param i32 f64 i32 i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 f64)
    global.get $__stack_pointer
    i32.const 560
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    i32.const 0
    local.set 7
    local.get 6
    i32.const 0
    i32.store offset=44
    block ;; label = @1
      block ;; label = @2
        local.get 1
        call $__DOUBLE_BITS
        local.tee 8
        i64.const -1
        i64.gt_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 9
        i32.const 65659
        local.set 10
        local.get 1
        f64.neg
        local.tee 1
        call $__DOUBLE_BITS
        local.set 8
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.const 2048
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        local.set 9
        i32.const 65662
        local.set 10
        br 1 (;@1;)
      end
      i32.const 65665
      i32.const 65660
      local.get 4
      i32.const 1
      i32.and
      local.tee 9
      select
      local.set 10
      local.get 9
      i32.eqz
      local.set 7
    end
    block ;; label = @1
      block ;; label = @2
        local.get 8
        i64.const 9218868437227405312
        i64.and
        i64.const 9218868437227405312
        i64.ne
        br_if 0 (;@2;)
        local.get 0
        i32.const 32
        local.get 2
        local.get 9
        i32.const 3
        i32.add
        local.tee 11
        local.get 4
        i32.const -65537
        i32.and
        call $pad
        local.get 0
        local.get 10
        local.get 9
        call $out
        local.get 0
        i32.const 66045
        i32.const 66654
        local.get 5
        i32.const 32
        i32.and
        local.tee 12
        select
        i32.const 66470
        i32.const 66658
        local.get 12
        select
        local.get 1
        local.get 1
        f64.ne
        select
        i32.const 3
        call $out
        local.get 0
        i32.const 32
        local.get 2
        local.get 11
        local.get 4
        i32.const 8192
        i32.xor
        call $pad
        local.get 11
        local.get 2
        local.get 11
        local.get 2
        i32.gt_s
        select
        local.set 13
        br 1 (;@1;)
      end
      local.get 6
      i32.const 16
      i32.add
      local.set 14
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 1
              local.get 6
              i32.const 44
              i32.add
              call $frexp
              local.tee 1
              local.get 1
              f64.add
              local.tee 1
              f64.const 0x0p+0 (;=0;)
              f64.eq
              br_if 0 (;@5;)
              local.get 6
              local.get 6
              i32.load offset=44
              local.tee 11
              i32.const -1
              i32.add
              i32.store offset=44
              local.get 5
              i32.const 32
              i32.or
              local.tee 15
              i32.const 97
              i32.ne
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
            local.get 5
            i32.const 32
            i32.or
            local.tee 15
            i32.const 97
            i32.eq
            br_if 2 (;@2;)
            i32.const 6
            local.get 3
            local.get 3
            i32.const 0
            i32.lt_s
            select
            local.set 16
            local.get 6
            i32.load offset=44
            local.set 17
            br 1 (;@3;)
          end
          local.get 6
          local.get 11
          i32.const -29
          i32.add
          local.tee 17
          i32.store offset=44
          i32.const 6
          local.get 3
          local.get 3
          i32.const 0
          i32.lt_s
          select
          local.set 16
          local.get 1
          f64.const 0x1p+28 (;=268435456;)
          f64.mul
          local.set 1
        end
        local.get 6
        i32.const 48
        i32.add
        i32.const 0
        i32.const 288
        local.get 17
        i32.const 0
        i32.lt_s
        select
        i32.add
        local.tee 18
        local.set 12
        loop ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 1
              f64.const 0x1p+32 (;=4294967296;)
              f64.lt
              local.get 1
              f64.const 0x0p+0 (;=0;)
              f64.ge
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.trunc_f64_u
              local.set 11
              br 1 (;@4;)
            end
            i32.const 0
            local.set 11
          end
          local.get 12
          local.get 11
          i32.store
          local.get 12
          i32.const 4
          i32.add
          local.set 12
          local.get 1
          local.get 11
          f64.convert_i32_u
          f64.sub
          f64.const 0x1.dcd65p+29 (;=1000000000;)
          f64.mul
          local.tee 1
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
        end
        block ;; label = @3
          block ;; label = @4
            local.get 17
            i32.const 1
            i32.ge_s
            br_if 0 (;@4;)
            local.get 17
            local.set 3
            local.get 12
            local.set 11
            local.get 18
            local.set 19
            br 1 (;@3;)
          end
          local.get 18
          local.set 19
          local.get 17
          local.set 3
          loop ;; label = @4
            local.get 3
            i32.const 29
            local.get 3
            i32.const 29
            i32.lt_s
            select
            local.set 3
            block ;; label = @5
              local.get 12
              i32.const -4
              i32.add
              local.tee 11
              local.get 19
              i32.lt_u
              br_if 0 (;@5;)
              local.get 3
              i64.extend_i32_u
              local.set 20
              i64.const 0
              local.set 8
              loop ;; label = @6
                local.get 11
                local.get 11
                i64.load32_u
                local.get 20
                i64.shl
                local.get 8
                i64.const 4294967295
                i64.and
                i64.add
                local.tee 8
                local.get 8
                i64.const 1000000000
                i64.div_u
                local.tee 8
                i64.const 1000000000
                i64.mul
                i64.sub
                i64.store32
                local.get 11
                i32.const -4
                i32.add
                local.tee 11
                local.get 19
                i32.ge_u
                br_if 0 (;@6;)
              end
              local.get 8
              i32.wrap_i64
              local.tee 11
              i32.eqz
              br_if 0 (;@5;)
              local.get 19
              i32.const -4
              i32.add
              local.tee 19
              local.get 11
              i32.store
            end
            block ;; label = @5
              loop ;; label = @6
                local.get 12
                local.tee 11
                local.get 19
                i32.le_u
                br_if 1 (;@5;)
                local.get 11
                i32.const -4
                i32.add
                local.tee 12
                i32.load
                i32.eqz
                br_if 0 (;@6;)
              end
            end
            local.get 6
            local.get 6
            i32.load offset=44
            local.get 3
            i32.sub
            local.tee 3
            i32.store offset=44
            local.get 11
            local.set 12
            local.get 3
            i32.const 0
            i32.gt_s
            br_if 0 (;@4;)
          end
        end
        block ;; label = @3
          local.get 3
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 16
          i32.const 25
          i32.add
          i32.const 9
          i32.div_u
          i32.const 1
          i32.add
          local.set 21
          local.get 15
          i32.const 102
          i32.eq
          local.set 22
          loop ;; label = @4
            i32.const 0
            local.get 3
            i32.sub
            local.tee 12
            i32.const 9
            local.get 12
            i32.const 9
            i32.lt_s
            select
            local.set 23
            block ;; label = @5
              block ;; label = @6
                local.get 19
                local.get 11
                i32.lt_u
                br_if 0 (;@6;)
                local.get 19
                i32.load
                local.set 12
                br 1 (;@5;)
              end
              i32.const 1000000000
              local.get 23
              i32.shr_u
              local.set 24
              i32.const -1
              local.get 23
              i32.shl
              i32.const -1
              i32.xor
              local.set 25
              i32.const 0
              local.set 3
              local.get 19
              local.set 12
              loop ;; label = @6
                local.get 12
                local.get 12
                i32.load
                local.tee 13
                local.get 23
                i32.shr_u
                local.get 3
                i32.add
                i32.store
                local.get 13
                local.get 25
                i32.and
                local.get 24
                i32.mul
                local.set 3
                local.get 12
                i32.const 4
                i32.add
                local.tee 12
                local.get 11
                i32.lt_u
                br_if 0 (;@6;)
              end
              local.get 19
              i32.load
              local.set 12
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 11
              local.get 3
              i32.store
              local.get 11
              i32.const 4
              i32.add
              local.set 11
            end
            local.get 6
            local.get 6
            i32.load offset=44
            local.get 23
            i32.add
            local.tee 3
            i32.store offset=44
            local.get 18
            local.get 19
            local.get 12
            i32.eqz
            i32.const 2
            i32.shl
            i32.add
            local.tee 19
            local.get 22
            select
            local.tee 12
            local.get 21
            i32.const 2
            i32.shl
            i32.add
            local.get 11
            local.get 11
            local.get 12
            i32.sub
            i32.const 2
            i32.shr_s
            local.get 21
            i32.gt_s
            select
            local.set 11
            local.get 3
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
          end
        end
        i32.const 0
        local.set 3
        block ;; label = @3
          local.get 19
          local.get 11
          i32.ge_u
          br_if 0 (;@3;)
          local.get 18
          local.get 19
          i32.sub
          i32.const 2
          i32.shr_s
          i32.const 9
          i32.mul
          local.set 3
          i32.const 10
          local.set 12
          local.get 19
          i32.load
          local.tee 13
          i32.const 10
          i32.lt_u
          br_if 0 (;@3;)
          loop ;; label = @4
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            local.get 13
            local.get 12
            i32.const 10
            i32.mul
            local.tee 12
            i32.ge_u
            br_if 0 (;@4;)
          end
        end
        block ;; label = @3
          local.get 16
          i32.const 0
          local.get 3
          local.get 15
          i32.const 102
          i32.eq
          select
          i32.sub
          local.get 16
          i32.const 0
          i32.ne
          local.get 15
          i32.const 103
          i32.eq
          i32.and
          i32.sub
          local.tee 12
          local.get 11
          local.get 18
          i32.sub
          i32.const 2
          i32.shr_s
          i32.const 9
          i32.mul
          i32.const -9
          i32.add
          i32.ge_s
          br_if 0 (;@3;)
          local.get 12
          i32.const 9216
          i32.add
          local.tee 13
          i32.const 9
          i32.div_s
          local.tee 24
          i32.const 2
          i32.shl
          local.get 6
          i32.const 48
          i32.add
          i32.const 4
          i32.const 292
          local.get 17
          i32.const 0
          i32.lt_s
          select
          i32.add
          i32.add
          i32.const -4096
          i32.add
          local.set 23
          i32.const 10
          local.set 12
          block ;; label = @4
            local.get 13
            local.get 24
            i32.const 9
            i32.mul
            i32.sub
            local.tee 13
            i32.const 7
            i32.gt_s
            br_if 0 (;@4;)
            loop ;; label = @5
              local.get 12
              i32.const 10
              i32.mul
              local.set 12
              local.get 13
              i32.const 1
              i32.add
              local.tee 13
              i32.const 8
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 23
          i32.const 4
          i32.add
          local.set 25
          block ;; label = @4
            block ;; label = @5
              local.get 23
              i32.load
              local.tee 13
              local.get 13
              local.get 12
              i32.div_u
              local.tee 21
              local.get 12
              i32.mul
              i32.sub
              local.tee 24
              br_if 0 (;@5;)
              local.get 25
              local.get 11
              i32.eq
              br_if 1 (;@4;)
            end
            block ;; label = @5
              block ;; label = @6
                local.get 21
                i32.const 1
                i32.and
                br_if 0 (;@6;)
                f64.const 0x1p+53 (;=9007199254740992;)
                local.set 1
                local.get 12
                i32.const 1000000000
                i32.ne
                br_if 1 (;@5;)
                local.get 23
                local.get 19
                i32.le_u
                br_if 1 (;@5;)
                local.get 23
                i32.const -4
                i32.add
                i32.load8_u
                i32.const 1
                i32.and
                i32.eqz
                br_if 1 (;@5;)
              end
              f64.const 0x1.0000000000001p+53 (;=9007199254740994;)
              local.set 1
            end
            f64.const 0x1p-1 (;=0.5;)
            f64.const 0x1p+0 (;=1;)
            f64.const 0x1.8p+0 (;=1.5;)
            local.get 25
            local.get 11
            i32.eq
            select
            f64.const 0x1.8p+0 (;=1.5;)
            local.get 24
            local.get 12
            i32.const 1
            i32.shr_u
            local.tee 25
            i32.eq
            select
            local.get 24
            local.get 25
            i32.lt_u
            select
            local.set 26
            block ;; label = @5
              local.get 7
              br_if 0 (;@5;)
              local.get 10
              i32.load8_u
              i32.const 45
              i32.ne
              br_if 0 (;@5;)
              local.get 26
              f64.neg
              local.set 26
              local.get 1
              f64.neg
              local.set 1
            end
            local.get 23
            local.get 13
            local.get 24
            i32.sub
            local.tee 13
            i32.store
            local.get 1
            local.get 26
            f64.add
            local.get 1
            f64.eq
            br_if 0 (;@4;)
            local.get 23
            local.get 13
            local.get 12
            i32.add
            local.tee 12
            i32.store
            block ;; label = @5
              local.get 12
              i32.const 1000000000
              i32.lt_u
              br_if 0 (;@5;)
              loop ;; label = @6
                local.get 23
                i32.const 0
                i32.store
                block ;; label = @7
                  local.get 23
                  i32.const -4
                  i32.add
                  local.tee 23
                  local.get 19
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 19
                  i32.const -4
                  i32.add
                  local.tee 19
                  i32.const 0
                  i32.store
                end
                local.get 23
                local.get 23
                i32.load
                i32.const 1
                i32.add
                local.tee 12
                i32.store
                local.get 12
                i32.const 999999999
                i32.gt_u
                br_if 0 (;@6;)
              end
            end
            local.get 18
            local.get 19
            i32.sub
            i32.const 2
            i32.shr_s
            i32.const 9
            i32.mul
            local.set 3
            i32.const 10
            local.set 12
            local.get 19
            i32.load
            local.tee 13
            i32.const 10
            i32.lt_u
            br_if 0 (;@4;)
            loop ;; label = @5
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              local.get 13
              local.get 12
              i32.const 10
              i32.mul
              local.tee 12
              i32.ge_u
              br_if 0 (;@5;)
            end
          end
          local.get 23
          i32.const 4
          i32.add
          local.tee 12
          local.get 11
          local.get 11
          local.get 12
          i32.gt_u
          select
          local.set 11
        end
        block ;; label = @3
          loop ;; label = @4
            local.get 11
            local.tee 12
            local.get 19
            i32.le_u
            local.tee 13
            br_if 1 (;@3;)
            local.get 12
            i32.const -4
            i32.add
            local.tee 11
            i32.load
            i32.eqz
            br_if 0 (;@4;)
          end
        end
        block ;; label = @3
          block ;; label = @4
            local.get 15
            i32.const 103
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            i32.const 8
            i32.and
            local.set 23
            br 1 (;@3;)
          end
          local.get 3
          i32.const -1
          i32.xor
          i32.const -1
          local.get 16
          i32.const 1
          local.get 16
          select
          local.tee 11
          local.get 3
          i32.gt_s
          local.get 3
          i32.const -5
          i32.gt_s
          i32.and
          local.tee 23
          select
          local.get 11
          i32.add
          local.set 16
          i32.const -1
          i32.const -2
          local.get 23
          select
          local.get 5
          i32.add
          local.set 5
          local.get 4
          i32.const 8
          i32.and
          local.tee 23
          br_if 0 (;@3;)
          i32.const -9
          local.set 11
          block ;; label = @4
            local.get 13
            br_if 0 (;@4;)
            local.get 12
            i32.const -4
            i32.add
            i32.load
            local.tee 23
            i32.eqz
            br_if 0 (;@4;)
            i32.const 10
            local.set 13
            i32.const 0
            local.set 11
            local.get 23
            i32.const 10
            i32.rem_u
            br_if 0 (;@4;)
            loop ;; label = @5
              local.get 11
              local.tee 24
              i32.const 1
              i32.add
              local.set 11
              local.get 23
              local.get 13
              i32.const 10
              i32.mul
              local.tee 13
              i32.rem_u
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 24
            i32.const -1
            i32.xor
            local.set 11
          end
          local.get 12
          local.get 18
          i32.sub
          i32.const 2
          i32.shr_s
          i32.const 9
          i32.mul
          local.set 13
          block ;; label = @4
            local.get 5
            i32.const -33
            i32.and
            i32.const 70
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 23
            local.get 16
            local.get 13
            local.get 11
            i32.add
            i32.const -9
            i32.add
            local.tee 11
            i32.const 0
            local.get 11
            i32.const 0
            i32.gt_s
            select
            local.tee 11
            local.get 16
            local.get 11
            i32.lt_s
            select
            local.set 16
            br 1 (;@3;)
          end
          i32.const 0
          local.set 23
          local.get 16
          local.get 3
          local.get 13
          i32.add
          local.get 11
          i32.add
          i32.const -9
          i32.add
          local.tee 11
          i32.const 0
          local.get 11
          i32.const 0
          i32.gt_s
          select
          local.tee 11
          local.get 16
          local.get 11
          i32.lt_s
          select
          local.set 16
        end
        i32.const -1
        local.set 13
        local.get 16
        i32.const 2147483645
        i32.const 2147483646
        local.get 16
        local.get 23
        i32.or
        local.tee 24
        select
        i32.gt_s
        br_if 1 (;@1;)
        local.get 16
        local.get 24
        i32.const 0
        i32.ne
        i32.add
        i32.const 1
        i32.add
        local.set 25
        block ;; label = @3
          block ;; label = @4
            local.get 5
            i32.const -33
            i32.and
            local.tee 22
            i32.const 70
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            local.get 25
            i32.const 2147483647
            i32.xor
            i32.gt_s
            br_if 3 (;@1;)
            local.get 3
            i32.const 0
            local.get 3
            i32.const 0
            i32.gt_s
            select
            local.set 11
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 14
            local.get 3
            local.get 3
            i32.const 31
            i32.shr_s
            local.tee 11
            i32.xor
            local.get 11
            i32.sub
            i64.extend_i32_u
            local.get 14
            call $fmt_u
            local.tee 11
            i32.sub
            i32.const 1
            i32.gt_s
            br_if 0 (;@4;)
            loop ;; label = @5
              local.get 11
              i32.const -1
              i32.add
              local.tee 11
              i32.const 48
              i32.store8
              local.get 14
              local.get 11
              i32.sub
              i32.const 2
              i32.lt_s
              br_if 0 (;@5;)
            end
          end
          local.get 11
          i32.const -2
          i32.add
          local.tee 21
          local.get 5
          i32.store8
          i32.const -1
          local.set 13
          local.get 11
          i32.const -1
          i32.add
          i32.const 45
          i32.const 43
          local.get 3
          i32.const 0
          i32.lt_s
          select
          i32.store8
          local.get 14
          local.get 21
          i32.sub
          local.tee 11
          local.get 25
          i32.const 2147483647
          i32.xor
          i32.gt_s
          br_if 2 (;@1;)
        end
        i32.const -1
        local.set 13
        local.get 11
        local.get 25
        i32.add
        local.tee 11
        local.get 9
        i32.const 2147483647
        i32.xor
        i32.gt_s
        br_if 1 (;@1;)
        local.get 0
        i32.const 32
        local.get 2
        local.get 11
        local.get 9
        i32.add
        local.tee 25
        local.get 4
        call $pad
        local.get 0
        local.get 10
        local.get 9
        call $out
        local.get 0
        i32.const 48
        local.get 2
        local.get 25
        local.get 4
        i32.const 65536
        i32.xor
        call $pad
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 22
                i32.const 70
                i32.ne
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                i32.const 8
                i32.or
                local.set 23
                local.get 6
                i32.const 16
                i32.add
                i32.const 9
                i32.or
                local.set 3
                local.get 18
                local.get 19
                local.get 19
                local.get 18
                i32.gt_u
                select
                local.tee 13
                local.set 19
                loop ;; label = @7
                  local.get 19
                  i64.load32_u
                  local.get 3
                  call $fmt_u
                  local.set 11
                  block ;; label = @8
                    block ;; label = @9
                      local.get 19
                      local.get 13
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 11
                      local.get 6
                      i32.const 16
                      i32.add
                      i32.le_u
                      br_if 1 (;@8;)
                      loop ;; label = @10
                        local.get 11
                        i32.const -1
                        i32.add
                        local.tee 11
                        i32.const 48
                        i32.store8
                        local.get 11
                        local.get 6
                        i32.const 16
                        i32.add
                        i32.gt_u
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                      unreachable
                    end
                    local.get 11
                    local.get 3
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const 48
                    i32.store8 offset=24
                    local.get 23
                    local.set 11
                  end
                  local.get 0
                  local.get 11
                  local.get 3
                  local.get 11
                  i32.sub
                  call $out
                  local.get 19
                  i32.const 4
                  i32.add
                  local.tee 19
                  local.get 18
                  i32.le_u
                  br_if 0 (;@7;)
                end
                block ;; label = @7
                  local.get 24
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 66704
                  i32.const 1
                  call $out
                end
                local.get 19
                local.get 12
                i32.ge_u
                br_if 1 (;@5;)
                local.get 16
                i32.const 1
                i32.lt_s
                br_if 1 (;@5;)
                loop ;; label = @7
                  block ;; label = @8
                    local.get 19
                    i64.load32_u
                    local.get 3
                    call $fmt_u
                    local.tee 11
                    local.get 6
                    i32.const 16
                    i32.add
                    i32.le_u
                    br_if 0 (;@8;)
                    loop ;; label = @9
                      local.get 11
                      i32.const -1
                      i32.add
                      local.tee 11
                      i32.const 48
                      i32.store8
                      local.get 11
                      local.get 6
                      i32.const 16
                      i32.add
                      i32.gt_u
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 0
                  local.get 11
                  local.get 16
                  i32.const 9
                  local.get 16
                  i32.const 9
                  i32.lt_s
                  select
                  call $out
                  local.get 16
                  i32.const -9
                  i32.add
                  local.set 11
                  local.get 19
                  i32.const 4
                  i32.add
                  local.tee 19
                  local.get 12
                  i32.ge_u
                  br_if 3 (;@4;)
                  local.get 16
                  i32.const 9
                  i32.gt_s
                  local.set 13
                  local.get 11
                  local.set 16
                  local.get 13
                  br_if 0 (;@7;)
                  br 3 (;@4;)
                end
                unreachable
              end
              block ;; label = @6
                local.get 16
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                local.get 12
                local.get 19
                i32.const 4
                i32.add
                local.get 12
                local.get 19
                i32.gt_u
                select
                local.set 24
                local.get 6
                i32.const 16
                i32.add
                i32.const 8
                i32.or
                local.set 18
                local.get 6
                i32.const 16
                i32.add
                i32.const 9
                i32.or
                local.set 3
                local.get 19
                local.set 12
                loop ;; label = @7
                  block ;; label = @8
                    local.get 12
                    i64.load32_u
                    local.get 3
                    call $fmt_u
                    local.tee 11
                    local.get 3
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const 48
                    i32.store8 offset=24
                    local.get 18
                    local.set 11
                  end
                  block ;; label = @8
                    block ;; label = @9
                      local.get 12
                      local.get 19
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 11
                      local.get 6
                      i32.const 16
                      i32.add
                      i32.le_u
                      br_if 1 (;@8;)
                      loop ;; label = @10
                        local.get 11
                        i32.const -1
                        i32.add
                        local.tee 11
                        i32.const 48
                        i32.store8
                        local.get 11
                        local.get 6
                        i32.const 16
                        i32.add
                        i32.gt_u
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                      unreachable
                    end
                    local.get 0
                    local.get 11
                    i32.const 1
                    call $out
                    local.get 11
                    i32.const 1
                    i32.add
                    local.set 11
                    local.get 16
                    local.get 23
                    i32.or
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 66704
                    i32.const 1
                    call $out
                  end
                  local.get 0
                  local.get 11
                  local.get 3
                  local.get 11
                  i32.sub
                  local.tee 13
                  local.get 16
                  local.get 16
                  local.get 13
                  i32.gt_s
                  select
                  call $out
                  local.get 16
                  local.get 13
                  i32.sub
                  local.set 16
                  local.get 12
                  i32.const 4
                  i32.add
                  local.tee 12
                  local.get 24
                  i32.ge_u
                  br_if 1 (;@6;)
                  local.get 16
                  i32.const -1
                  i32.gt_s
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.const 48
              local.get 16
              i32.const 18
              i32.add
              i32.const 18
              i32.const 0
              call $pad
              local.get 0
              local.get 21
              local.get 14
              local.get 21
              i32.sub
              call $out
              br 2 (;@3;)
            end
            local.get 16
            local.set 11
          end
          local.get 0
          i32.const 48
          local.get 11
          i32.const 9
          i32.add
          i32.const 9
          i32.const 0
          call $pad
        end
        local.get 0
        i32.const 32
        local.get 2
        local.get 25
        local.get 4
        i32.const 8192
        i32.xor
        call $pad
        local.get 25
        local.get 2
        local.get 25
        local.get 2
        i32.gt_s
        select
        local.set 13
        br 1 (;@1;)
      end
      local.get 10
      local.get 5
      i32.const 26
      i32.shl
      i32.const 31
      i32.shr_s
      i32.const 9
      i32.and
      i32.add
      local.set 25
      block ;; label = @2
        local.get 3
        i32.const 11
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 12
        local.get 3
        i32.sub
        local.set 11
        f64.const 0x1p+4 (;=16;)
        local.set 26
        loop ;; label = @3
          local.get 26
          f64.const 0x1p+4 (;=16;)
          f64.mul
          local.set 26
          local.get 11
          i32.const -1
          i32.add
          local.tee 11
          br_if 0 (;@3;)
        end
        block ;; label = @3
          local.get 25
          i32.load8_u
          i32.const 45
          i32.ne
          br_if 0 (;@3;)
          local.get 26
          local.get 1
          f64.neg
          local.get 26
          f64.sub
          f64.add
          f64.neg
          local.set 1
          br 1 (;@2;)
        end
        local.get 1
        local.get 26
        f64.add
        local.get 26
        f64.sub
        local.set 1
      end
      block ;; label = @2
        local.get 6
        i32.load offset=44
        local.tee 11
        local.get 11
        i32.const 31
        i32.shr_s
        local.tee 11
        i32.xor
        local.get 11
        i32.sub
        i64.extend_i32_u
        local.get 14
        call $fmt_u
        local.tee 11
        local.get 14
        i32.ne
        br_if 0 (;@2;)
        local.get 6
        i32.const 48
        i32.store8 offset=15
        local.get 6
        i32.const 15
        i32.add
        local.set 11
      end
      local.get 9
      i32.const 2
      i32.or
      local.set 23
      local.get 5
      i32.const 32
      i32.and
      local.set 19
      local.get 6
      i32.load offset=44
      local.set 12
      local.get 11
      i32.const -2
      i32.add
      local.tee 24
      local.get 5
      i32.const 15
      i32.add
      i32.store8
      local.get 11
      i32.const -1
      i32.add
      i32.const 45
      i32.const 43
      local.get 12
      i32.const 0
      i32.lt_s
      select
      i32.store8
      local.get 4
      i32.const 8
      i32.and
      local.set 13
      local.get 6
      i32.const 16
      i32.add
      local.set 12
      loop ;; label = @2
        local.get 12
        local.set 11
        block ;; label = @3
          block ;; label = @4
            local.get 1
            f64.abs
            f64.const 0x1p+31 (;=2147483648;)
            f64.lt
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.trunc_f64_s
            local.set 12
            br 1 (;@3;)
          end
          i32.const -2147483648
          local.set 12
        end
        local.get 11
        local.get 12
        i32.const 68208
        i32.add
        i32.load8_u
        local.get 19
        i32.or
        i32.store8
        local.get 1
        local.get 12
        f64.convert_i32_s
        f64.sub
        f64.const 0x1p+4 (;=16;)
        f64.mul
        local.set 1
        block ;; label = @3
          local.get 11
          i32.const 1
          i32.add
          local.tee 12
          local.get 6
          i32.const 16
          i32.add
          i32.sub
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 13
            br_if 0 (;@4;)
            local.get 3
            i32.const 0
            i32.gt_s
            br_if 0 (;@4;)
            local.get 1
            f64.const 0x0p+0 (;=0;)
            f64.eq
            br_if 1 (;@3;)
          end
          local.get 11
          i32.const 46
          i32.store8 offset=1
          local.get 11
          i32.const 2
          i32.add
          local.set 12
        end
        local.get 1
        f64.const 0x0p+0 (;=0;)
        f64.ne
        br_if 0 (;@2;)
      end
      i32.const -1
      local.set 13
      i32.const 2147483645
      local.get 23
      local.get 14
      local.get 24
      i32.sub
      local.tee 19
      i32.add
      local.tee 21
      i32.sub
      local.get 3
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 32
      local.get 2
      local.get 21
      local.get 3
      i32.const 2
      i32.add
      local.get 12
      local.get 6
      i32.const 16
      i32.add
      i32.sub
      local.tee 11
      local.get 11
      i32.const -2
      i32.add
      local.get 3
      i32.lt_s
      select
      local.get 11
      local.get 3
      select
      local.tee 3
      i32.add
      local.tee 12
      local.get 4
      call $pad
      local.get 0
      local.get 25
      local.get 23
      call $out
      local.get 0
      i32.const 48
      local.get 2
      local.get 12
      local.get 4
      i32.const 65536
      i32.xor
      call $pad
      local.get 0
      local.get 6
      i32.const 16
      i32.add
      local.get 11
      call $out
      local.get 0
      i32.const 48
      local.get 3
      local.get 11
      i32.sub
      i32.const 0
      i32.const 0
      call $pad
      local.get 0
      local.get 24
      local.get 19
      call $out
      local.get 0
      i32.const 32
      local.get 2
      local.get 12
      local.get 4
      i32.const 8192
      i32.xor
      call $pad
      local.get 12
      local.get 2
      local.get 12
      local.get 2
      i32.gt_s
      select
      local.set 13
    end
    local.get 6
    i32.const 560
    i32.add
    global.set $__stack_pointer
    local.get 13
  )
  (func $pop_arg_long_double (;141;) (type 1) (param i32 i32)
    (local i32)
    local.get 1
    local.get 1
    i32.load
    i32.const 7
    i32.add
    i32.const -8
    i32.and
    local.tee 2
    i32.const 16
    i32.add
    i32.store
    local.get 0
    local.get 2
    i64.load
    local.get 2
    i32.const 8
    i32.add
    i64.load
    call $__trunctfdf2
    f64.store
  )
  (func $__DOUBLE_BITS (;142;) (type 29) (param f64) (result i64)
    local.get 0
    i64.reinterpret_f64
  )
  (func $vsnprintf (;143;) (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 160
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    local.get 4
    i32.const 158
    i32.add
    local.get 1
    select
    local.tee 5
    i32.store offset=148
    local.get 4
    i32.const 0
    local.get 1
    i32.const -1
    i32.add
    local.tee 0
    local.get 0
    local.get 1
    i32.gt_u
    select
    i32.store offset=152
    i64.const 0
    local.set 6
    loop ;; label = @1
      local.get 4
      local.get 6
      i32.wrap_i64
      i32.add
      i32.const 0
      i32.store8
      local.get 6
      i64.const 1
      i64.add
      local.tee 6
      i64.const 144
      i64.lt_u
      br_if 0 (;@1;)
    end
    i32.const -1
    local.set 0
    local.get 4
    i32.const -1
    i32.store offset=76
    local.get 4
    i32.const 12
    i32.store offset=36
    local.get 4
    i32.const -1
    i32.store offset=80
    local.get 4
    local.get 4
    i32.const 159
    i32.add
    i32.store offset=44
    local.get 4
    local.get 4
    i32.const 148
    i32.add
    i32.store offset=84
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        call $__errno_location
        i32.const 61
        i32.store
        br 1 (;@1;)
      end
      local.get 5
      i32.const 0
      i32.store8
      local.get 4
      local.get 2
      local.get 3
      call $vfprintf
      local.set 0
    end
    local.get 4
    i32.const 160
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $sn_write (;144;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=84
    local.tee 3
    i32.load
    local.set 4
    block ;; label = @1
      local.get 3
      i32.load offset=4
      local.tee 5
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=28
      local.tee 6
      i32.sub
      local.tee 7
      local.get 5
      local.get 7
      i32.lt_u
      select
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 6
      local.get 7
      call $__memcpy
      drop
      local.get 3
      local.get 3
      i32.load
      local.get 7
      i32.add
      local.tee 4
      i32.store
      local.get 3
      local.get 3
      i32.load offset=4
      local.get 7
      i32.sub
      local.tee 5
      i32.store offset=4
    end
    block ;; label = @1
      local.get 5
      local.get 2
      local.get 5
      local.get 2
      i32.lt_u
      select
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 1
      local.get 5
      call $__memcpy
      drop
      local.get 3
      local.get 3
      i32.load
      local.get 5
      i32.add
      local.tee 4
      i32.store
      local.get 3
      local.get 3
      i32.load offset=4
      local.get 5
      i32.sub
      i32.store offset=4
    end
    local.get 4
    i32.const 0
    i32.store8
    local.get 0
    local.get 0
    i32.load offset=44
    local.tee 3
    i32.store offset=28
    local.get 0
    local.get 3
    i32.store offset=20
    local.get 2
  )
  (func $__wasi_syscall_ret (;145;) (type 3) (param i32) (result i32)
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    call $__errno_location
    local.get 0
    i32.store
    i32.const -1
  )
  (func $wcrtomb (;146;) (type 4) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 127
        i32.le_u
        br_if 1 (;@1;)
        block ;; label = @3
          block ;; label = @4
            call $__get_tp
            i32.load offset=96
            i32.load
            br_if 0 (;@4;)
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 3 (;@1;)
            call $__errno_location
            i32.const 25
            i32.store
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 1
            i32.const 2047
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=1
            local.get 0
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 192
            i32.or
            i32.store8
            i32.const 2
            return
          end
          block ;; label = @4
            block ;; label = @5
              local.get 1
              i32.const 55296
              i32.lt_u
              br_if 0 (;@5;)
              local.get 1
              i32.const -8192
              i32.and
              i32.const 57344
              i32.ne
              br_if 1 (;@4;)
            end
            local.get 0
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=2
            local.get 0
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8
            local.get 0
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=1
            i32.const 3
            return
          end
          block ;; label = @4
            local.get 1
            i32.const -65536
            i32.add
            i32.const 1048575
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=3
            local.get 0
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 240
            i32.or
            i32.store8
            local.get 0
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=2
            local.get 0
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=1
            i32.const 4
            return
          end
          call $__errno_location
          i32.const 25
          i32.store
        end
        i32.const -1
        local.set 3
      end
      local.get 3
      return
    end
    local.get 0
    local.get 1
    i32.store8
    i32.const 1
  )
  (func $wctomb (;147;) (type 2) (param i32 i32) (result i32)
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.const 0
    call $wcrtomb
  )
  (func $sbrk (;148;) (type 3) (param i32) (result i32)
    (local i32 i32)
    i32.const 0
    i32.load offset=68612
    local.tee 1
    local.get 0
    i32.const 7
    i32.add
    i32.const -8
    i32.and
    local.tee 2
    i32.add
    local.set 0
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.le_u
        br_if 1 (;@1;)
      end
      block ;; label = @2
        local.get 0
        call $emscripten_get_heap_size
        i32.le_u
        br_if 0 (;@2;)
        local.get 0
        call $emscripten_resize_heap
        i32.eqz
        br_if 1 (;@1;)
      end
      i32.const 0
      local.get 0
      i32.store offset=68612
      local.get 1
      return
    end
    call $__errno_location
    i32.const 48
    i32.store
    i32.const -1
  )
  (func $dlmalloc (;149;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 0
                                  i32.const 244
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=76968
                                    local.tee 2
                                    i32.const 16
                                    local.get 0
                                    i32.const 11
                                    i32.add
                                    i32.const -8
                                    i32.and
                                    local.get 0
                                    i32.const 11
                                    i32.lt_u
                                    select
                                    local.tee 3
                                    i32.const 3
                                    i32.shr_u
                                    local.tee 4
                                    i32.shr_u
                                    local.tee 0
                                    i32.const 3
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.const -1
                                        i32.xor
                                        i32.const 1
                                        i32.and
                                        local.get 4
                                        i32.add
                                        local.tee 5
                                        i32.const 3
                                        i32.shl
                                        local.tee 4
                                        i32.const 77008
                                        i32.add
                                        local.tee 0
                                        local.get 4
                                        i32.const 77016
                                        i32.add
                                        i32.load
                                        local.tee 4
                                        i32.load offset=8
                                        local.tee 3
                                        i32.ne
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        local.get 2
                                        i32.const -2
                                        local.get 5
                                        i32.rotl
                                        i32.and
                                        i32.store offset=76968
                                        br 1 (;@17;)
                                      end
                                      local.get 3
                                      local.get 0
                                      i32.store offset=12
                                      local.get 0
                                      local.get 3
                                      i32.store offset=8
                                    end
                                    local.get 4
                                    i32.const 8
                                    i32.add
                                    local.set 0
                                    local.get 4
                                    local.get 5
                                    i32.const 3
                                    i32.shl
                                    local.tee 5
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    local.get 4
                                    local.get 5
                                    i32.add
                                    local.tee 4
                                    local.get 4
                                    i32.load offset=4
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    br 15 (;@1;)
                                  end
                                  local.get 3
                                  i32.const 0
                                  i32.load offset=76976
                                  local.tee 6
                                  i32.le_u
                                  br_if 1 (;@14;)
                                  block ;; label = @16
                                    local.get 0
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        local.get 4
                                        i32.shl
                                        i32.const 2
                                        local.get 4
                                        i32.shl
                                        local.tee 0
                                        i32.const 0
                                        local.get 0
                                        i32.sub
                                        i32.or
                                        i32.and
                                        i32.ctz
                                        local.tee 4
                                        i32.const 3
                                        i32.shl
                                        local.tee 0
                                        i32.const 77008
                                        i32.add
                                        local.tee 5
                                        local.get 0
                                        i32.const 77016
                                        i32.add
                                        i32.load
                                        local.tee 0
                                        i32.load offset=8
                                        local.tee 7
                                        i32.ne
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        local.get 2
                                        i32.const -2
                                        local.get 4
                                        i32.rotl
                                        i32.and
                                        local.tee 2
                                        i32.store offset=76968
                                        br 1 (;@17;)
                                      end
                                      local.get 7
                                      local.get 5
                                      i32.store offset=12
                                      local.get 5
                                      local.get 7
                                      i32.store offset=8
                                    end
                                    local.get 0
                                    local.get 3
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    local.get 0
                                    local.get 3
                                    i32.add
                                    local.tee 7
                                    local.get 4
                                    i32.const 3
                                    i32.shl
                                    local.tee 4
                                    local.get 3
                                    i32.sub
                                    local.tee 5
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    local.get 0
                                    local.get 4
                                    i32.add
                                    local.get 5
                                    i32.store
                                    block ;; label = @17
                                      local.get 6
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 6
                                      i32.const -8
                                      i32.and
                                      i32.const 77008
                                      i32.add
                                      local.set 3
                                      i32.const 0
                                      i32.load offset=76988
                                      local.set 4
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 2
                                          i32.const 1
                                          local.get 6
                                          i32.const 3
                                          i32.shr_u
                                          i32.shl
                                          local.tee 8
                                          i32.and
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          local.get 2
                                          local.get 8
                                          i32.or
                                          i32.store offset=76968
                                          local.get 3
                                          local.set 8
                                          br 1 (;@18;)
                                        end
                                        local.get 3
                                        i32.load offset=8
                                        local.set 8
                                      end
                                      local.get 3
                                      local.get 4
                                      i32.store offset=8
                                      local.get 8
                                      local.get 4
                                      i32.store offset=12
                                      local.get 4
                                      local.get 3
                                      i32.store offset=12
                                      local.get 4
                                      local.get 8
                                      i32.store offset=8
                                    end
                                    local.get 0
                                    i32.const 8
                                    i32.add
                                    local.set 0
                                    i32.const 0
                                    local.get 7
                                    i32.store offset=76988
                                    i32.const 0
                                    local.get 5
                                    i32.store offset=76976
                                    br 15 (;@1;)
                                  end
                                  i32.const 0
                                  i32.load offset=76972
                                  local.tee 9
                                  i32.eqz
                                  br_if 1 (;@14;)
                                  local.get 9
                                  i32.ctz
                                  i32.const 2
                                  i32.shl
                                  i32.const 77272
                                  i32.add
                                  i32.load
                                  local.tee 7
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 3
                                  i32.sub
                                  local.set 4
                                  local.get 7
                                  local.set 5
                                  block ;; label = @16
                                    loop ;; label = @17
                                      block ;; label = @18
                                        local.get 5
                                        i32.load offset=16
                                        local.tee 0
                                        br_if 0 (;@18;)
                                        local.get 5
                                        i32.const 20
                                        i32.add
                                        i32.load
                                        local.tee 0
                                        i32.eqz
                                        br_if 2 (;@16;)
                                      end
                                      local.get 0
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 3
                                      i32.sub
                                      local.tee 5
                                      local.get 4
                                      local.get 5
                                      local.get 4
                                      i32.lt_u
                                      local.tee 5
                                      select
                                      local.set 4
                                      local.get 0
                                      local.get 7
                                      local.get 5
                                      select
                                      local.set 7
                                      local.get 0
                                      local.set 5
                                      br 0 (;@17;)
                                    end
                                    unreachable
                                  end
                                  local.get 7
                                  i32.load offset=24
                                  local.set 10
                                  block ;; label = @16
                                    local.get 7
                                    i32.load offset=12
                                    local.tee 8
                                    local.get 7
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 7
                                    i32.load offset=8
                                    local.tee 0
                                    i32.const 0
                                    i32.load offset=76984
                                    i32.lt_u
                                    drop
                                    local.get 0
                                    local.get 8
                                    i32.store offset=12
                                    local.get 8
                                    local.get 0
                                    i32.store offset=8
                                    br 14 (;@2;)
                                  end
                                  block ;; label = @16
                                    local.get 7
                                    i32.const 20
                                    i32.add
                                    local.tee 5
                                    i32.load
                                    local.tee 0
                                    br_if 0 (;@16;)
                                    local.get 7
                                    i32.load offset=16
                                    local.tee 0
                                    i32.eqz
                                    br_if 3 (;@13;)
                                    local.get 7
                                    i32.const 16
                                    i32.add
                                    local.set 5
                                  end
                                  loop ;; label = @16
                                    local.get 5
                                    local.set 11
                                    local.get 0
                                    local.tee 8
                                    i32.const 20
                                    i32.add
                                    local.tee 5
                                    i32.load
                                    local.tee 0
                                    br_if 0 (;@16;)
                                    local.get 8
                                    i32.const 16
                                    i32.add
                                    local.set 5
                                    local.get 8
                                    i32.load offset=16
                                    local.tee 0
                                    br_if 0 (;@16;)
                                  end
                                  local.get 11
                                  i32.const 0
                                  i32.store
                                  br 13 (;@2;)
                                end
                                i32.const -1
                                local.set 3
                                local.get 0
                                i32.const -65
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 0
                                i32.const 11
                                i32.add
                                local.tee 0
                                i32.const -8
                                i32.and
                                local.set 3
                                i32.const 0
                                i32.load offset=76972
                                local.tee 6
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 11
                                block ;; label = @15
                                  local.get 3
                                  i32.const 256
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  i32.const 31
                                  local.set 11
                                  local.get 3
                                  i32.const 16777215
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  local.get 3
                                  i32.const 38
                                  local.get 0
                                  i32.const 8
                                  i32.shr_u
                                  i32.clz
                                  local.tee 0
                                  i32.sub
                                  i32.shr_u
                                  i32.const 1
                                  i32.and
                                  local.get 0
                                  i32.const 1
                                  i32.shl
                                  i32.sub
                                  i32.const 62
                                  i32.add
                                  local.set 11
                                end
                                i32.const 0
                                local.get 3
                                i32.sub
                                local.set 4
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 11
                                        i32.const 2
                                        i32.shl
                                        i32.const 77272
                                        i32.add
                                        i32.load
                                        local.tee 5
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        local.set 0
                                        i32.const 0
                                        local.set 8
                                        br 1 (;@17;)
                                      end
                                      i32.const 0
                                      local.set 0
                                      local.get 3
                                      i32.const 0
                                      i32.const 25
                                      local.get 11
                                      i32.const 1
                                      i32.shr_u
                                      i32.sub
                                      local.get 11
                                      i32.const 31
                                      i32.eq
                                      select
                                      i32.shl
                                      local.set 7
                                      i32.const 0
                                      local.set 8
                                      loop ;; label = @18
                                        block ;; label = @19
                                          local.get 5
                                          i32.load offset=4
                                          i32.const -8
                                          i32.and
                                          local.get 3
                                          i32.sub
                                          local.tee 2
                                          local.get 4
                                          i32.ge_u
                                          br_if 0 (;@19;)
                                          local.get 2
                                          local.set 4
                                          local.get 5
                                          local.set 8
                                          local.get 2
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          local.set 4
                                          local.get 5
                                          local.set 8
                                          local.get 5
                                          local.set 0
                                          br 3 (;@16;)
                                        end
                                        local.get 0
                                        local.get 5
                                        i32.const 20
                                        i32.add
                                        i32.load
                                        local.tee 2
                                        local.get 2
                                        local.get 5
                                        local.get 7
                                        i32.const 29
                                        i32.shr_u
                                        i32.const 4
                                        i32.and
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i32.load
                                        local.tee 5
                                        i32.eq
                                        select
                                        local.get 0
                                        local.get 2
                                        select
                                        local.set 0
                                        local.get 7
                                        i32.const 1
                                        i32.shl
                                        local.set 7
                                        local.get 5
                                        br_if 0 (;@18;)
                                      end
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      local.get 8
                                      i32.or
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 8
                                      i32.const 2
                                      local.get 11
                                      i32.shl
                                      local.tee 0
                                      i32.const 0
                                      local.get 0
                                      i32.sub
                                      i32.or
                                      local.get 6
                                      i32.and
                                      local.tee 0
                                      i32.eqz
                                      br_if 3 (;@14;)
                                      local.get 0
                                      i32.ctz
                                      i32.const 2
                                      i32.shl
                                      i32.const 77272
                                      i32.add
                                      i32.load
                                      local.set 0
                                    end
                                    local.get 0
                                    i32.eqz
                                    br_if 1 (;@15;)
                                  end
                                  loop ;; label = @16
                                    local.get 0
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 3
                                    i32.sub
                                    local.tee 2
                                    local.get 4
                                    i32.lt_u
                                    local.set 7
                                    block ;; label = @17
                                      local.get 0
                                      i32.load offset=16
                                      local.tee 5
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 20
                                      i32.add
                                      i32.load
                                      local.set 5
                                    end
                                    local.get 2
                                    local.get 4
                                    local.get 7
                                    select
                                    local.set 4
                                    local.get 0
                                    local.get 8
                                    local.get 7
                                    select
                                    local.set 8
                                    local.get 5
                                    local.set 0
                                    local.get 5
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 8
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 4
                                i32.const 0
                                i32.load offset=76976
                                local.get 3
                                i32.sub
                                i32.ge_u
                                br_if 0 (;@14;)
                                local.get 8
                                i32.load offset=24
                                local.set 11
                                block ;; label = @15
                                  local.get 8
                                  i32.load offset=12
                                  local.tee 7
                                  local.get 8
                                  i32.eq
                                  br_if 0 (;@15;)
                                  local.get 8
                                  i32.load offset=8
                                  local.tee 0
                                  i32.const 0
                                  i32.load offset=76984
                                  i32.lt_u
                                  drop
                                  local.get 0
                                  local.get 7
                                  i32.store offset=12
                                  local.get 7
                                  local.get 0
                                  i32.store offset=8
                                  br 12 (;@3;)
                                end
                                block ;; label = @15
                                  local.get 8
                                  i32.const 20
                                  i32.add
                                  local.tee 5
                                  i32.load
                                  local.tee 0
                                  br_if 0 (;@15;)
                                  local.get 8
                                  i32.load offset=16
                                  local.tee 0
                                  i32.eqz
                                  br_if 3 (;@12;)
                                  local.get 8
                                  i32.const 16
                                  i32.add
                                  local.set 5
                                end
                                loop ;; label = @15
                                  local.get 5
                                  local.set 2
                                  local.get 0
                                  local.tee 7
                                  i32.const 20
                                  i32.add
                                  local.tee 5
                                  i32.load
                                  local.tee 0
                                  br_if 0 (;@15;)
                                  local.get 7
                                  i32.const 16
                                  i32.add
                                  local.set 5
                                  local.get 7
                                  i32.load offset=16
                                  local.tee 0
                                  br_if 0 (;@15;)
                                end
                                local.get 2
                                i32.const 0
                                i32.store
                                br 11 (;@3;)
                              end
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=76976
                                local.tee 0
                                local.get 3
                                i32.lt_u
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.load offset=76988
                                local.set 4
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 0
                                    local.get 3
                                    i32.sub
                                    local.tee 5
                                    i32.const 16
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                    local.get 4
                                    local.get 3
                                    i32.add
                                    local.tee 7
                                    local.get 5
                                    i32.const 1
                                    i32.or
                                    i32.store offset=4
                                    local.get 4
                                    local.get 0
                                    i32.add
                                    local.get 5
                                    i32.store
                                    local.get 4
                                    local.get 3
                                    i32.const 3
                                    i32.or
                                    i32.store offset=4
                                    br 1 (;@15;)
                                  end
                                  local.get 4
                                  local.get 0
                                  i32.const 3
                                  i32.or
                                  i32.store offset=4
                                  local.get 4
                                  local.get 0
                                  i32.add
                                  local.tee 0
                                  local.get 0
                                  i32.load offset=4
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  i32.const 0
                                  local.set 7
                                  i32.const 0
                                  local.set 5
                                end
                                i32.const 0
                                local.get 5
                                i32.store offset=76976
                                i32.const 0
                                local.get 7
                                i32.store offset=76988
                                local.get 4
                                i32.const 8
                                i32.add
                                local.set 0
                                br 13 (;@1;)
                              end
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=76980
                                local.tee 7
                                local.get 3
                                i32.le_u
                                br_if 0 (;@14;)
                                i32.const 0
                                local.get 7
                                local.get 3
                                i32.sub
                                local.tee 4
                                i32.store offset=76980
                                i32.const 0
                                i32.const 0
                                i32.load offset=76992
                                local.tee 0
                                local.get 3
                                i32.add
                                local.tee 5
                                i32.store offset=76992
                                local.get 5
                                local.get 4
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 0
                                local.get 3
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 0
                                i32.const 8
                                i32.add
                                local.set 0
                                br 13 (;@1;)
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=77440
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  i32.load offset=77448
                                  local.set 4
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                i64.const -1
                                i64.store offset=77452 align=4
                                i32.const 0
                                i64.const 17592186048512
                                i64.store offset=77444 align=4
                                i32.const 0
                                local.get 1
                                i32.const 12
                                i32.add
                                i32.const -16
                                i32.and
                                i32.const 1431655768
                                i32.xor
                                i32.store offset=77440
                                i32.const 0
                                i32.const 0
                                i32.store offset=77460
                                i32.const 0
                                i32.const 0
                                i32.store offset=77412
                                i32.const 4096
                                local.set 4
                              end
                              i32.const 0
                              local.set 0
                              local.get 4
                              local.get 3
                              i32.const 47
                              i32.add
                              local.tee 6
                              i32.add
                              local.tee 2
                              i32.const 0
                              local.get 4
                              i32.sub
                              local.tee 11
                              i32.and
                              local.tee 8
                              local.get 3
                              i32.le_u
                              br_if 12 (;@1;)
                              i32.const 0
                              local.set 0
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=77408
                                local.tee 4
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.load offset=77400
                                local.tee 5
                                local.get 8
                                i32.add
                                local.tee 10
                                local.get 5
                                i32.le_u
                                br_if 13 (;@1;)
                                local.get 10
                                local.get 4
                                i32.gt_u
                                br_if 13 (;@1;)
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  i32.const 0
                                  i32.load8_u offset=77412
                                  i32.const 4
                                  i32.and
                                  br_if 0 (;@15;)
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            i32.const 0
                                            i32.load offset=76992
                                            local.tee 4
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            i32.const 77416
                                            local.set 0
                                            loop ;; label = @21
                                              block ;; label = @22
                                                local.get 0
                                                i32.load
                                                local.tee 5
                                                local.get 4
                                                i32.gt_u
                                                br_if 0 (;@22;)
                                                local.get 5
                                                local.get 0
                                                i32.load offset=4
                                                i32.add
                                                local.get 4
                                                i32.gt_u
                                                br_if 3 (;@19;)
                                              end
                                              local.get 0
                                              i32.load offset=8
                                              local.tee 0
                                              br_if 0 (;@21;)
                                            end
                                          end
                                          i32.const 0
                                          call $sbrk
                                          local.tee 7
                                          i32.const -1
                                          i32.eq
                                          br_if 3 (;@16;)
                                          local.get 8
                                          local.set 2
                                          block ;; label = @20
                                            i32.const 0
                                            i32.load offset=77444
                                            local.tee 0
                                            i32.const -1
                                            i32.add
                                            local.tee 4
                                            local.get 7
                                            i32.and
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 8
                                            local.get 7
                                            i32.sub
                                            local.get 4
                                            local.get 7
                                            i32.add
                                            i32.const 0
                                            local.get 0
                                            i32.sub
                                            i32.and
                                            i32.add
                                            local.set 2
                                          end
                                          local.get 2
                                          local.get 3
                                          i32.le_u
                                          br_if 3 (;@16;)
                                          block ;; label = @20
                                            i32.const 0
                                            i32.load offset=77408
                                            local.tee 0
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            i32.const 0
                                            i32.load offset=77400
                                            local.tee 4
                                            local.get 2
                                            i32.add
                                            local.tee 5
                                            local.get 4
                                            i32.le_u
                                            br_if 4 (;@16;)
                                            local.get 5
                                            local.get 0
                                            i32.gt_u
                                            br_if 4 (;@16;)
                                          end
                                          local.get 2
                                          call $sbrk
                                          local.tee 0
                                          local.get 7
                                          i32.ne
                                          br_if 1 (;@18;)
                                          br 5 (;@14;)
                                        end
                                        local.get 2
                                        local.get 7
                                        i32.sub
                                        local.get 11
                                        i32.and
                                        local.tee 2
                                        call $sbrk
                                        local.tee 7
                                        local.get 0
                                        i32.load
                                        local.get 0
                                        i32.load offset=4
                                        i32.add
                                        i32.eq
                                        br_if 1 (;@17;)
                                        local.get 7
                                        local.set 0
                                      end
                                      local.get 0
                                      i32.const -1
                                      i32.eq
                                      br_if 1 (;@16;)
                                      block ;; label = @18
                                        local.get 2
                                        local.get 3
                                        i32.const 48
                                        i32.add
                                        i32.lt_u
                                        br_if 0 (;@18;)
                                        local.get 0
                                        local.set 7
                                        br 4 (;@14;)
                                      end
                                      local.get 6
                                      local.get 2
                                      i32.sub
                                      i32.const 0
                                      i32.load offset=77448
                                      local.tee 4
                                      i32.add
                                      i32.const 0
                                      local.get 4
                                      i32.sub
                                      i32.and
                                      local.tee 4
                                      call $sbrk
                                      i32.const -1
                                      i32.eq
                                      br_if 1 (;@16;)
                                      local.get 4
                                      local.get 2
                                      i32.add
                                      local.set 2
                                      local.get 0
                                      local.set 7
                                      br 3 (;@14;)
                                    end
                                    local.get 7
                                    i32.const -1
                                    i32.ne
                                    br_if 2 (;@14;)
                                  end
                                  i32.const 0
                                  i32.const 0
                                  i32.load offset=77412
                                  i32.const 4
                                  i32.or
                                  i32.store offset=77412
                                end
                                local.get 8
                                call $sbrk
                                local.set 7
                                i32.const 0
                                call $sbrk
                                local.set 0
                                local.get 7
                                i32.const -1
                                i32.eq
                                br_if 5 (;@9;)
                                local.get 0
                                i32.const -1
                                i32.eq
                                br_if 5 (;@9;)
                                local.get 7
                                local.get 0
                                i32.ge_u
                                br_if 5 (;@9;)
                                local.get 0
                                local.get 7
                                i32.sub
                                local.tee 2
                                local.get 3
                                i32.const 40
                                i32.add
                                i32.le_u
                                br_if 5 (;@9;)
                              end
                              i32.const 0
                              i32.const 0
                              i32.load offset=77400
                              local.get 2
                              i32.add
                              local.tee 0
                              i32.store offset=77400
                              block ;; label = @14
                                local.get 0
                                i32.const 0
                                i32.load offset=77404
                                i32.le_u
                                br_if 0 (;@14;)
                                i32.const 0
                                local.get 0
                                i32.store offset=77404
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=76992
                                  local.tee 4
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 77416
                                  local.set 0
                                  loop ;; label = @16
                                    local.get 7
                                    local.get 0
                                    i32.load
                                    local.tee 5
                                    local.get 0
                                    i32.load offset=4
                                    local.tee 8
                                    i32.add
                                    i32.eq
                                    br_if 2 (;@14;)
                                    local.get 0
                                    i32.load offset=8
                                    local.tee 0
                                    br_if 0 (;@16;)
                                    br 5 (;@11;)
                                  end
                                  unreachable
                                end
                                block ;; label = @15
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=76984
                                    local.tee 0
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 7
                                    local.get 0
                                    i32.ge_u
                                    br_if 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.get 7
                                  i32.store offset=76984
                                end
                                i32.const 0
                                local.set 0
                                i32.const 0
                                local.get 2
                                i32.store offset=77420
                                i32.const 0
                                local.get 7
                                i32.store offset=77416
                                i32.const 0
                                i32.const -1
                                i32.store offset=77000
                                i32.const 0
                                i32.const 0
                                i32.load offset=77440
                                i32.store offset=77004
                                i32.const 0
                                i32.const 0
                                i32.store offset=77428
                                loop ;; label = @15
                                  local.get 0
                                  i32.const 3
                                  i32.shl
                                  local.tee 4
                                  i32.const 77016
                                  i32.add
                                  local.get 4
                                  i32.const 77008
                                  i32.add
                                  local.tee 5
                                  i32.store
                                  local.get 4
                                  i32.const 77020
                                  i32.add
                                  local.get 5
                                  i32.store
                                  local.get 0
                                  i32.const 1
                                  i32.add
                                  local.tee 0
                                  i32.const 32
                                  i32.ne
                                  br_if 0 (;@15;)
                                end
                                i32.const 0
                                local.get 2
                                i32.const -40
                                i32.add
                                local.tee 0
                                i32.const -8
                                local.get 7
                                i32.sub
                                i32.const 7
                                i32.and
                                local.tee 4
                                i32.sub
                                local.tee 5
                                i32.store offset=76980
                                i32.const 0
                                local.get 7
                                local.get 4
                                i32.add
                                local.tee 4
                                i32.store offset=76992
                                local.get 4
                                local.get 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 7
                                local.get 0
                                i32.add
                                i32.const 40
                                i32.store offset=4
                                i32.const 0
                                i32.const 0
                                i32.load offset=77456
                                i32.store offset=76996
                                br 4 (;@10;)
                              end
                              local.get 4
                              local.get 7
                              i32.ge_u
                              br_if 2 (;@11;)
                              local.get 4
                              local.get 5
                              i32.lt_u
                              br_if 2 (;@11;)
                              local.get 0
                              i32.load offset=12
                              i32.const 8
                              i32.and
                              br_if 2 (;@11;)
                              local.get 0
                              local.get 8
                              local.get 2
                              i32.add
                              i32.store offset=4
                              i32.const 0
                              local.get 4
                              i32.const -8
                              local.get 4
                              i32.sub
                              i32.const 7
                              i32.and
                              local.tee 0
                              i32.add
                              local.tee 5
                              i32.store offset=76992
                              i32.const 0
                              i32.const 0
                              i32.load offset=76980
                              local.get 2
                              i32.add
                              local.tee 7
                              local.get 0
                              i32.sub
                              local.tee 0
                              i32.store offset=76980
                              local.get 5
                              local.get 0
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              local.get 4
                              local.get 7
                              i32.add
                              i32.const 40
                              i32.store offset=4
                              i32.const 0
                              i32.const 0
                              i32.load offset=77456
                              i32.store offset=76996
                              br 3 (;@10;)
                            end
                            i32.const 0
                            local.set 8
                            br 10 (;@2;)
                          end
                          i32.const 0
                          local.set 7
                          br 8 (;@3;)
                        end
                        block ;; label = @11
                          local.get 7
                          i32.const 0
                          i32.load offset=76984
                          local.tee 8
                          i32.ge_u
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 7
                          i32.store offset=76984
                          local.get 7
                          local.set 8
                        end
                        local.get 7
                        local.get 2
                        i32.add
                        local.set 5
                        i32.const 77416
                        local.set 0
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                loop ;; label = @15
                                  local.get 0
                                  i32.load
                                  local.get 5
                                  i32.eq
                                  br_if 1 (;@14;)
                                  local.get 0
                                  i32.load offset=8
                                  local.tee 0
                                  br_if 0 (;@15;)
                                  br 2 (;@13;)
                                end
                                unreachable
                              end
                              local.get 0
                              i32.load8_u offset=12
                              i32.const 8
                              i32.and
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            i32.const 77416
                            local.set 0
                            loop ;; label = @13
                              block ;; label = @14
                                local.get 0
                                i32.load
                                local.tee 5
                                local.get 4
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 5
                                local.get 0
                                i32.load offset=4
                                i32.add
                                local.tee 5
                                local.get 4
                                i32.gt_u
                                br_if 3 (;@11;)
                              end
                              local.get 0
                              i32.load offset=8
                              local.set 0
                              br 0 (;@13;)
                            end
                            unreachable
                          end
                          local.get 0
                          local.get 7
                          i32.store
                          local.get 0
                          local.get 0
                          i32.load offset=4
                          local.get 2
                          i32.add
                          i32.store offset=4
                          local.get 7
                          i32.const -8
                          local.get 7
                          i32.sub
                          i32.const 7
                          i32.and
                          i32.add
                          local.tee 11
                          local.get 3
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 5
                          i32.const -8
                          local.get 5
                          i32.sub
                          i32.const 7
                          i32.and
                          i32.add
                          local.tee 2
                          local.get 11
                          local.get 3
                          i32.add
                          local.tee 3
                          i32.sub
                          local.set 0
                          block ;; label = @12
                            local.get 2
                            local.get 4
                            i32.ne
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 3
                            i32.store offset=76992
                            i32.const 0
                            i32.const 0
                            i32.load offset=76980
                            local.get 0
                            i32.add
                            local.tee 0
                            i32.store offset=76980
                            local.get 3
                            local.get 0
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            br 8 (;@4;)
                          end
                          block ;; label = @12
                            local.get 2
                            i32.const 0
                            i32.load offset=76988
                            i32.ne
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 3
                            i32.store offset=76988
                            i32.const 0
                            i32.const 0
                            i32.load offset=76976
                            local.get 0
                            i32.add
                            local.tee 0
                            i32.store offset=76976
                            local.get 3
                            local.get 0
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 3
                            local.get 0
                            i32.add
                            local.get 0
                            i32.store
                            br 8 (;@4;)
                          end
                          local.get 2
                          i32.load offset=4
                          local.tee 4
                          i32.const 3
                          i32.and
                          i32.const 1
                          i32.ne
                          br_if 6 (;@5;)
                          local.get 4
                          i32.const -8
                          i32.and
                          local.set 6
                          block ;; label = @12
                            local.get 4
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 2
                            i32.load offset=8
                            local.tee 5
                            local.get 4
                            i32.const 3
                            i32.shr_u
                            local.tee 8
                            i32.const 3
                            i32.shl
                            i32.const 77008
                            i32.add
                            local.tee 7
                            i32.eq
                            drop
                            block ;; label = @13
                              local.get 2
                              i32.load offset=12
                              local.tee 4
                              local.get 5
                              i32.ne
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=76968
                              i32.const -2
                              local.get 8
                              i32.rotl
                              i32.and
                              i32.store offset=76968
                              br 7 (;@6;)
                            end
                            local.get 4
                            local.get 7
                            i32.eq
                            drop
                            local.get 5
                            local.get 4
                            i32.store offset=12
                            local.get 4
                            local.get 5
                            i32.store offset=8
                            br 6 (;@6;)
                          end
                          local.get 2
                          i32.load offset=24
                          local.set 10
                          block ;; label = @12
                            local.get 2
                            i32.load offset=12
                            local.tee 7
                            local.get 2
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 2
                            i32.load offset=8
                            local.tee 4
                            local.get 8
                            i32.lt_u
                            drop
                            local.get 4
                            local.get 7
                            i32.store offset=12
                            local.get 7
                            local.get 4
                            i32.store offset=8
                            br 5 (;@7;)
                          end
                          block ;; label = @12
                            local.get 2
                            i32.const 20
                            i32.add
                            local.tee 5
                            i32.load
                            local.tee 4
                            br_if 0 (;@12;)
                            local.get 2
                            i32.load offset=16
                            local.tee 4
                            i32.eqz
                            br_if 4 (;@8;)
                            local.get 2
                            i32.const 16
                            i32.add
                            local.set 5
                          end
                          loop ;; label = @12
                            local.get 5
                            local.set 8
                            local.get 4
                            local.tee 7
                            i32.const 20
                            i32.add
                            local.tee 5
                            i32.load
                            local.tee 4
                            br_if 0 (;@12;)
                            local.get 7
                            i32.const 16
                            i32.add
                            local.set 5
                            local.get 7
                            i32.load offset=16
                            local.tee 4
                            br_if 0 (;@12;)
                          end
                          local.get 8
                          i32.const 0
                          i32.store
                          br 4 (;@7;)
                        end
                        i32.const 0
                        local.get 2
                        i32.const -40
                        i32.add
                        local.tee 0
                        i32.const -8
                        local.get 7
                        i32.sub
                        i32.const 7
                        i32.and
                        local.tee 8
                        i32.sub
                        local.tee 11
                        i32.store offset=76980
                        i32.const 0
                        local.get 7
                        local.get 8
                        i32.add
                        local.tee 8
                        i32.store offset=76992
                        local.get 8
                        local.get 11
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 7
                        local.get 0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 0
                        i32.load offset=77456
                        i32.store offset=76996
                        local.get 4
                        local.get 5
                        i32.const 39
                        local.get 5
                        i32.sub
                        i32.const 7
                        i32.and
                        i32.add
                        i32.const -47
                        i32.add
                        local.tee 0
                        local.get 0
                        local.get 4
                        i32.const 16
                        i32.add
                        i32.lt_u
                        select
                        local.tee 8
                        i32.const 27
                        i32.store offset=4
                        local.get 8
                        i32.const 16
                        i32.add
                        i32.const 0
                        i64.load offset=77424 align=4
                        i64.store align=4
                        local.get 8
                        i32.const 0
                        i64.load offset=77416 align=4
                        i64.store offset=8 align=4
                        i32.const 0
                        local.get 8
                        i32.const 8
                        i32.add
                        i32.store offset=77424
                        i32.const 0
                        local.get 2
                        i32.store offset=77420
                        i32.const 0
                        local.get 7
                        i32.store offset=77416
                        i32.const 0
                        i32.const 0
                        i32.store offset=77428
                        local.get 8
                        i32.const 24
                        i32.add
                        local.set 0
                        loop ;; label = @11
                          local.get 0
                          i32.const 7
                          i32.store offset=4
                          local.get 0
                          i32.const 8
                          i32.add
                          local.set 7
                          local.get 0
                          i32.const 4
                          i32.add
                          local.set 0
                          local.get 7
                          local.get 5
                          i32.lt_u
                          br_if 0 (;@11;)
                        end
                        local.get 8
                        local.get 4
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 8
                        local.get 8
                        i32.load offset=4
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get 4
                        local.get 8
                        local.get 4
                        i32.sub
                        local.tee 7
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 8
                        local.get 7
                        i32.store
                        block ;; label = @11
                          local.get 7
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 7
                          i32.const -8
                          i32.and
                          i32.const 77008
                          i32.add
                          local.set 0
                          block ;; label = @12
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=76968
                              local.tee 5
                              i32.const 1
                              local.get 7
                              i32.const 3
                              i32.shr_u
                              i32.shl
                              local.tee 7
                              i32.and
                              br_if 0 (;@13;)
                              i32.const 0
                              local.get 5
                              local.get 7
                              i32.or
                              i32.store offset=76968
                              local.get 0
                              local.set 5
                              br 1 (;@12;)
                            end
                            local.get 0
                            i32.load offset=8
                            local.set 5
                          end
                          local.get 0
                          local.get 4
                          i32.store offset=8
                          local.get 5
                          local.get 4
                          i32.store offset=12
                          local.get 4
                          local.get 0
                          i32.store offset=12
                          local.get 4
                          local.get 5
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        i32.const 31
                        local.set 0
                        block ;; label = @11
                          local.get 7
                          i32.const 16777215
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 7
                          i32.const 38
                          local.get 7
                          i32.const 8
                          i32.shr_u
                          i32.clz
                          local.tee 0
                          i32.sub
                          i32.shr_u
                          i32.const 1
                          i32.and
                          local.get 0
                          i32.const 1
                          i32.shl
                          i32.sub
                          i32.const 62
                          i32.add
                          local.set 0
                        end
                        local.get 4
                        local.get 0
                        i32.store offset=28
                        local.get 4
                        i64.const 0
                        i64.store offset=16 align=4
                        local.get 0
                        i32.const 2
                        i32.shl
                        i32.const 77272
                        i32.add
                        local.set 5
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=76972
                              local.tee 8
                              i32.const 1
                              local.get 0
                              i32.shl
                              local.tee 2
                              i32.and
                              br_if 0 (;@13;)
                              i32.const 0
                              local.get 8
                              local.get 2
                              i32.or
                              i32.store offset=76972
                              local.get 5
                              local.get 4
                              i32.store
                              local.get 4
                              local.get 5
                              i32.store offset=24
                              br 1 (;@12;)
                            end
                            local.get 7
                            i32.const 0
                            i32.const 25
                            local.get 0
                            i32.const 1
                            i32.shr_u
                            i32.sub
                            local.get 0
                            i32.const 31
                            i32.eq
                            select
                            i32.shl
                            local.set 0
                            local.get 5
                            i32.load
                            local.set 8
                            loop ;; label = @13
                              local.get 8
                              local.tee 5
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 7
                              i32.eq
                              br_if 2 (;@11;)
                              local.get 0
                              i32.const 29
                              i32.shr_u
                              local.set 8
                              local.get 0
                              i32.const 1
                              i32.shl
                              local.set 0
                              local.get 5
                              local.get 8
                              i32.const 4
                              i32.and
                              i32.add
                              i32.const 16
                              i32.add
                              local.tee 2
                              i32.load
                              local.tee 8
                              br_if 0 (;@13;)
                            end
                            local.get 2
                            local.get 4
                            i32.store
                            local.get 4
                            local.get 5
                            i32.store offset=24
                          end
                          local.get 4
                          local.get 4
                          i32.store offset=12
                          local.get 4
                          local.get 4
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        local.get 5
                        i32.load offset=8
                        local.tee 0
                        local.get 4
                        i32.store offset=12
                        local.get 5
                        local.get 4
                        i32.store offset=8
                        local.get 4
                        i32.const 0
                        i32.store offset=24
                        local.get 4
                        local.get 5
                        i32.store offset=12
                        local.get 4
                        local.get 0
                        i32.store offset=8
                      end
                      i32.const 0
                      i32.load offset=76980
                      local.tee 0
                      local.get 3
                      i32.le_u
                      br_if 0 (;@9;)
                      i32.const 0
                      local.get 0
                      local.get 3
                      i32.sub
                      local.tee 4
                      i32.store offset=76980
                      i32.const 0
                      i32.const 0
                      i32.load offset=76992
                      local.tee 0
                      local.get 3
                      i32.add
                      local.tee 5
                      i32.store offset=76992
                      local.get 5
                      local.get 4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 3
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 0
                      i32.const 8
                      i32.add
                      local.set 0
                      br 8 (;@1;)
                    end
                    call $__errno_location
                    i32.const 48
                    i32.store
                    i32.const 0
                    local.set 0
                    br 7 (;@1;)
                  end
                  i32.const 0
                  local.set 7
                end
                local.get 10
                i32.eqz
                br_if 0 (;@6;)
                block ;; label = @7
                  block ;; label = @8
                    local.get 2
                    local.get 2
                    i32.load offset=28
                    local.tee 5
                    i32.const 2
                    i32.shl
                    i32.const 77272
                    i32.add
                    local.tee 4
                    i32.load
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 7
                    i32.store
                    local.get 7
                    br_if 1 (;@7;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=76972
                    i32.const -2
                    local.get 5
                    i32.rotl
                    i32.and
                    i32.store offset=76972
                    br 2 (;@6;)
                  end
                  local.get 10
                  i32.const 16
                  i32.const 20
                  local.get 10
                  i32.load offset=16
                  local.get 2
                  i32.eq
                  select
                  i32.add
                  local.get 7
                  i32.store
                  local.get 7
                  i32.eqz
                  br_if 1 (;@6;)
                end
                local.get 7
                local.get 10
                i32.store offset=24
                block ;; label = @7
                  local.get 2
                  i32.load offset=16
                  local.tee 4
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 4
                  i32.store offset=16
                  local.get 4
                  local.get 7
                  i32.store offset=24
                end
                local.get 2
                i32.const 20
                i32.add
                i32.load
                local.tee 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 7
                i32.const 20
                i32.add
                local.get 4
                i32.store
                local.get 4
                local.get 7
                i32.store offset=24
              end
              local.get 6
              local.get 0
              i32.add
              local.set 0
              local.get 2
              local.get 6
              i32.add
              local.tee 2
              i32.load offset=4
              local.set 4
            end
            local.get 2
            local.get 4
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 3
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 3
            local.get 0
            i32.add
            local.get 0
            i32.store
            block ;; label = @5
              local.get 0
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 0
              i32.const -8
              i32.and
              i32.const 77008
              i32.add
              local.set 4
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=76968
                  local.tee 5
                  i32.const 1
                  local.get 0
                  i32.const 3
                  i32.shr_u
                  i32.shl
                  local.tee 0
                  i32.and
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 5
                  local.get 0
                  i32.or
                  i32.store offset=76968
                  local.get 4
                  local.set 0
                  br 1 (;@6;)
                end
                local.get 4
                i32.load offset=8
                local.set 0
              end
              local.get 4
              local.get 3
              i32.store offset=8
              local.get 0
              local.get 3
              i32.store offset=12
              local.get 3
              local.get 4
              i32.store offset=12
              local.get 3
              local.get 0
              i32.store offset=8
              br 1 (;@4;)
            end
            i32.const 31
            local.set 4
            block ;; label = @5
              local.get 0
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@5;)
              local.get 0
              i32.const 38
              local.get 0
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 4
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 4
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 4
            end
            local.get 3
            local.get 4
            i32.store offset=28
            local.get 3
            i64.const 0
            i64.store offset=16 align=4
            local.get 4
            i32.const 2
            i32.shl
            i32.const 77272
            i32.add
            local.set 5
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=76972
                  local.tee 7
                  i32.const 1
                  local.get 4
                  i32.shl
                  local.tee 8
                  i32.and
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 7
                  local.get 8
                  i32.or
                  i32.store offset=76972
                  local.get 5
                  local.get 3
                  i32.store
                  local.get 3
                  local.get 5
                  i32.store offset=24
                  br 1 (;@6;)
                end
                local.get 0
                i32.const 0
                i32.const 25
                local.get 4
                i32.const 1
                i32.shr_u
                i32.sub
                local.get 4
                i32.const 31
                i32.eq
                select
                i32.shl
                local.set 4
                local.get 5
                i32.load
                local.set 7
                loop ;; label = @7
                  local.get 7
                  local.tee 5
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 0
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 4
                  i32.const 29
                  i32.shr_u
                  local.set 7
                  local.get 4
                  i32.const 1
                  i32.shl
                  local.set 4
                  local.get 5
                  local.get 7
                  i32.const 4
                  i32.and
                  i32.add
                  i32.const 16
                  i32.add
                  local.tee 8
                  i32.load
                  local.tee 7
                  br_if 0 (;@7;)
                end
                local.get 8
                local.get 3
                i32.store
                local.get 3
                local.get 5
                i32.store offset=24
              end
              local.get 3
              local.get 3
              i32.store offset=12
              local.get 3
              local.get 3
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=8
            local.tee 0
            local.get 3
            i32.store offset=12
            local.get 5
            local.get 3
            i32.store offset=8
            local.get 3
            i32.const 0
            i32.store offset=24
            local.get 3
            local.get 5
            i32.store offset=12
            local.get 3
            local.get 0
            i32.store offset=8
          end
          local.get 11
          i32.const 8
          i32.add
          local.set 0
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 11
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 8
              local.get 8
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 77272
              i32.add
              local.tee 0
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.get 7
              i32.store
              local.get 7
              br_if 1 (;@4;)
              i32.const 0
              local.get 6
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              local.tee 6
              i32.store offset=76972
              br 2 (;@3;)
            end
            local.get 11
            i32.const 16
            i32.const 20
            local.get 11
            i32.load offset=16
            local.get 8
            i32.eq
            select
            i32.add
            local.get 7
            i32.store
            local.get 7
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 7
          local.get 11
          i32.store offset=24
          block ;; label = @4
            local.get 8
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 7
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 7
            i32.store offset=24
          end
          local.get 8
          i32.const 20
          i32.add
          i32.load
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          i32.const 20
          i32.add
          local.get 0
          i32.store
          local.get 0
          local.get 7
          i32.store offset=24
        end
        block ;; label = @3
          block ;; label = @4
            local.get 4
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 8
            local.get 4
            local.get 3
            i32.add
            local.tee 0
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 0
            i32.add
            local.tee 0
            local.get 0
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 8
          local.get 3
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 8
          local.get 3
          i32.add
          local.tee 7
          local.get 4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 7
          local.get 4
          i32.add
          local.get 4
          i32.store
          block ;; label = @4
            local.get 4
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const -8
            i32.and
            i32.const 77008
            i32.add
            local.set 0
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=76968
                local.tee 5
                i32.const 1
                local.get 4
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 4
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                local.get 4
                i32.or
                i32.store offset=76968
                local.get 0
                local.set 4
                br 1 (;@5;)
              end
              local.get 0
              i32.load offset=8
              local.set 4
            end
            local.get 0
            local.get 7
            i32.store offset=8
            local.get 4
            local.get 7
            i32.store offset=12
            local.get 7
            local.get 0
            i32.store offset=12
            local.get 7
            local.get 4
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 0
          block ;; label = @4
            local.get 4
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 38
            local.get 4
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 0
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 0
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 0
          end
          local.get 7
          local.get 0
          i32.store offset=28
          local.get 7
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i32.const 2
          i32.shl
          i32.const 77272
          i32.add
          local.set 5
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 6
                i32.const 1
                local.get 0
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 6
                local.get 3
                i32.or
                i32.store offset=76972
                local.get 5
                local.get 7
                i32.store
                local.get 7
                local.get 5
                i32.store offset=24
                br 1 (;@5;)
              end
              local.get 4
              i32.const 0
              i32.const 25
              local.get 0
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 0
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 0
              local.get 5
              i32.load
              local.set 3
              loop ;; label = @6
                local.get 3
                local.tee 5
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 4
                i32.eq
                br_if 2 (;@4;)
                local.get 0
                i32.const 29
                i32.shr_u
                local.set 3
                local.get 0
                i32.const 1
                i32.shl
                local.set 0
                local.get 5
                local.get 3
                i32.const 4
                i32.and
                i32.add
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 3
                br_if 0 (;@6;)
              end
              local.get 2
              local.get 7
              i32.store
              local.get 7
              local.get 5
              i32.store offset=24
            end
            local.get 7
            local.get 7
            i32.store offset=12
            local.get 7
            local.get 7
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=8
          local.tee 0
          local.get 7
          i32.store offset=12
          local.get 5
          local.get 7
          i32.store offset=8
          local.get 7
          i32.const 0
          i32.store offset=24
          local.get 7
          local.get 5
          i32.store offset=12
          local.get 7
          local.get 0
          i32.store offset=8
        end
        local.get 8
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 10
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 7
            local.get 7
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.const 77272
            i32.add
            local.tee 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 8
            i32.store
            local.get 8
            br_if 1 (;@3;)
            i32.const 0
            local.get 9
            i32.const -2
            local.get 5
            i32.rotl
            i32.and
            i32.store offset=76972
            br 2 (;@2;)
          end
          local.get 10
          i32.const 16
          i32.const 20
          local.get 10
          i32.load offset=16
          local.get 7
          i32.eq
          select
          i32.add
          local.get 8
          i32.store
          local.get 8
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 8
        local.get 10
        i32.store offset=24
        block ;; label = @3
          local.get 7
          i32.load offset=16
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          local.get 0
          i32.store offset=16
          local.get 0
          local.get 8
          i32.store offset=24
        end
        local.get 7
        i32.const 20
        i32.add
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        i32.const 20
        i32.add
        local.get 0
        i32.store
        local.get 0
        local.get 8
        i32.store offset=24
      end
      block ;; label = @2
        block ;; label = @3
          local.get 4
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 7
          local.get 4
          local.get 3
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 0
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 7
        local.get 3
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 7
        local.get 3
        i32.add
        local.tee 5
        local.get 4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 4
        i32.add
        local.get 4
        i32.store
        block ;; label = @3
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.const -8
          i32.and
          i32.const 77008
          i32.add
          local.set 3
          i32.const 0
          i32.load offset=76988
          local.set 0
          block ;; label = @4
            block ;; label = @5
              i32.const 1
              local.get 6
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 8
              local.get 2
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 8
              local.get 2
              i32.or
              i32.store offset=76968
              local.get 3
              local.set 8
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.set 8
          end
          local.get 3
          local.get 0
          i32.store offset=8
          local.get 8
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 3
          i32.store offset=12
          local.get 0
          local.get 8
          i32.store offset=8
        end
        i32.const 0
        local.get 5
        i32.store offset=76988
        i32.const 0
        local.get 4
        i32.store offset=76976
      end
      local.get 7
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $dlfree (;150;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=76984
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 1
              i32.const 0
              i32.load offset=76988
              i32.eq
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 2
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=8
                local.tee 4
                local.get 2
                i32.const 3
                i32.shr_u
                local.tee 5
                i32.const 3
                i32.shl
                i32.const 77008
                i32.add
                local.tee 6
                i32.eq
                drop
                block ;; label = @7
                  local.get 1
                  i32.load offset=12
                  local.tee 2
                  local.get 4
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=76968
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=76968
                  br 5 (;@2;)
                end
                local.get 2
                local.get 6
                i32.eq
                drop
                local.get 4
                local.get 2
                i32.store offset=12
                local.get 2
                local.get 4
                i32.store offset=8
                br 4 (;@2;)
              end
              local.get 1
              i32.load offset=24
              local.set 7
              block ;; label = @6
                local.get 1
                i32.load offset=12
                local.tee 6
                local.get 1
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=8
                local.tee 2
                local.get 4
                i32.lt_u
                drop
                local.get 2
                local.get 6
                i32.store offset=12
                local.get 6
                local.get 2
                i32.store offset=8
                br 3 (;@3;)
              end
              block ;; label = @6
                local.get 1
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 2
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=16
                local.tee 2
                i32.eqz
                br_if 2 (;@4;)
                local.get 1
                i32.const 16
                i32.add
                local.set 4
              end
              loop ;; label = @6
                local.get 4
                local.set 5
                local.get 2
                local.tee 6
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 2
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 4
                local.get 6
                i32.load offset=16
                local.tee 2
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
              br 2 (;@3;)
            end
            local.get 3
            i32.load offset=4
            local.tee 2
            i32.const 3
            i32.and
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
            i32.const 0
            local.get 0
            i32.store offset=76976
            local.get 3
            local.get 2
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 3
            local.get 0
            i32.store
            return
          end
          i32.const 0
          local.set 6
        end
        local.get 7
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 1
            local.get 1
            i32.load offset=28
            local.tee 4
            i32.const 2
            i32.shl
            i32.const 77272
            i32.add
            local.tee 2
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 2
            local.get 6
            i32.store
            local.get 6
            br_if 1 (;@3;)
            i32.const 0
            i32.const 0
            i32.load offset=76972
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=76972
            br 2 (;@2;)
          end
          local.get 7
          i32.const 16
          i32.const 20
          local.get 7
          i32.load offset=16
          local.get 1
          i32.eq
          select
          i32.add
          local.get 6
          i32.store
          local.get 6
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 6
        local.get 7
        i32.store offset=24
        block ;; label = @3
          local.get 1
          i32.load offset=16
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.store offset=16
          local.get 2
          local.get 6
          i32.store offset=24
        end
        local.get 1
        i32.const 20
        i32.add
        i32.load
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 20
        i32.add
        local.get 2
        i32.store
        local.get 2
        local.get 6
        i32.store offset=24
      end
      local.get 1
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 2
                i32.const 2
                i32.and
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=76992
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=76992
                  i32.const 0
                  i32.const 0
                  i32.load offset=76980
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=76980
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  i32.const 0
                  i32.load offset=76988
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=76976
                  i32.const 0
                  i32.const 0
                  i32.store offset=76988
                  return
                end
                block ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=76988
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=76988
                  i32.const 0
                  i32.const 0
                  i32.load offset=76976
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=76976
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 0
                  i32.add
                  local.get 0
                  i32.store
                  return
                end
                local.get 2
                i32.const -8
                i32.and
                local.get 0
                i32.add
                local.set 0
                block ;; label = @7
                  local.get 2
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  local.get 2
                  i32.const 3
                  i32.shr_u
                  local.tee 5
                  i32.const 3
                  i32.shl
                  i32.const 77008
                  i32.add
                  local.tee 6
                  i32.eq
                  drop
                  block ;; label = @8
                    local.get 3
                    i32.load offset=12
                    local.tee 2
                    local.get 4
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=76968
                    i32.const -2
                    local.get 5
                    i32.rotl
                    i32.and
                    i32.store offset=76968
                    br 5 (;@3;)
                  end
                  local.get 2
                  local.get 6
                  i32.eq
                  drop
                  local.get 4
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 4
                  i32.store offset=8
                  br 4 (;@3;)
                end
                local.get 3
                i32.load offset=24
                local.set 7
                block ;; label = @7
                  local.get 3
                  i32.load offset=12
                  local.tee 6
                  local.get 3
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=8
                  local.tee 2
                  i32.const 0
                  i32.load offset=76984
                  i32.lt_u
                  drop
                  local.get 2
                  local.get 6
                  i32.store offset=12
                  local.get 6
                  local.get 2
                  i32.store offset=8
                  br 3 (;@4;)
                end
                block ;; label = @7
                  local.get 3
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 2
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=16
                  local.tee 2
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 4
                end
                loop ;; label = @7
                  local.get 4
                  local.set 5
                  local.get 2
                  local.tee 6
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 2
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.add
                  local.set 4
                  local.get 6
                  i32.load offset=16
                  local.tee 2
                  br_if 0 (;@7;)
                end
                local.get 5
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 3
              local.get 2
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              br 3 (;@2;)
            end
            i32.const 0
            local.set 6
          end
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 3
              local.get 3
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 77272
              i32.add
              local.tee 2
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=76972
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=76972
              br 2 (;@3;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 3
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.load offset=16
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 3
          i32.const 20
          i32.add
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 2
          local.get 6
          i32.store offset=24
        end
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        i32.const 0
        i32.load offset=76988
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=76976
        return
      end
      block ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 77008
        i32.add
        local.set 2
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=76968
            local.tee 4
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 0
            i32.or
            i32.store offset=76968
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 2
        local.get 1
        i32.store offset=8
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 77272
      i32.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=76972
              local.tee 6
              i32.const 1
              local.get 2
              i32.shl
              local.tee 3
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 6
              local.get 3
              i32.or
              i32.store offset=76972
              local.get 4
              local.get 1
              i32.store
              local.get 1
              local.get 4
              i32.store offset=24
              br 1 (;@4;)
            end
            local.get 0
            i32.const 0
            i32.const 25
            local.get 2
            i32.const 1
            i32.shr_u
            i32.sub
            local.get 2
            i32.const 31
            i32.eq
            select
            i32.shl
            local.set 2
            local.get 4
            i32.load
            local.set 6
            loop ;; label = @5
              local.get 6
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 6
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 4
              local.get 6
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 3
              i32.load
              local.tee 6
              br_if 0 (;@5;)
            end
            local.get 3
            local.get 1
            i32.store
            local.get 1
            local.get 4
            i32.store offset=24
          end
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 4
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
      end
      i32.const 0
      i32.const 0
      i32.load offset=77000
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=77000
    end
  )
  (func $dlmemalign (;151;) (type 2) (param i32 i32) (result i32)
    block ;; label = @1
      local.get 0
      i32.const 8
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    local.get 0
    local.get 1
    call $internal_memalign
  )
  (func $internal_memalign (;152;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 16
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 16
        local.get 0
        i32.const 16
        i32.gt_u
        select
        local.tee 3
        local.get 3
        i32.const -1
        i32.add
        i32.and
        br_if 0 (;@2;)
        local.get 3
        local.set 0
        br 1 (;@1;)
      end
      loop ;; label = @2
        local.get 2
        local.tee 0
        i32.const 1
        i32.shl
        local.set 2
        local.get 0
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      i32.const -64
      local.get 0
      i32.sub
      local.get 1
      i32.gt_u
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 48
      i32.store
      i32.const 0
      return
    end
    block ;; label = @1
      i32.const 16
      local.get 1
      i32.const 11
      i32.add
      i32.const -8
      i32.and
      local.get 1
      i32.const 11
      i32.lt_u
      select
      local.tee 1
      local.get 0
      i32.add
      i32.const 12
      i32.add
      call $dlmalloc
      local.tee 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 2
    i32.const -8
    i32.add
    local.set 3
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const -1
        i32.add
        local.get 2
        i32.and
        br_if 0 (;@2;)
        local.get 3
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const -4
      i32.add
      local.tee 4
      i32.load
      local.tee 5
      i32.const -8
      i32.and
      local.get 2
      local.get 0
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 0
      i32.sub
      i32.and
      i32.const -8
      i32.add
      local.tee 2
      i32.const 0
      local.get 0
      local.get 2
      local.get 3
      i32.sub
      i32.const 15
      i32.gt_u
      select
      i32.add
      local.tee 0
      local.get 3
      i32.sub
      local.tee 2
      i32.sub
      local.set 6
      block ;; label = @2
        local.get 5
        i32.const 3
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.load
        local.set 3
        local.get 0
        local.get 6
        i32.store offset=4
        local.get 0
        local.get 3
        local.get 2
        i32.add
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 6
      local.get 0
      i32.load offset=4
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 6
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 4
      local.get 2
      local.get 4
      i32.load
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store
      local.get 3
      local.get 2
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 3
      local.get 2
      call $dispose_chunk
    end
    block ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 2
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const -8
      i32.and
      local.tee 3
      local.get 1
      i32.const 16
      i32.add
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.tee 2
      local.get 3
      local.get 1
      i32.sub
      local.tee 1
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      local.get 3
      i32.add
      local.tee 3
      local.get 3
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 2
      local.get 1
      call $dispose_chunk
    end
    local.get 0
    i32.const 8
    i32.add
  )
  (func $dispose_chunk (;153;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                local.get 3
                i32.sub
                local.tee 0
                i32.const 0
                i32.load offset=76988
                i32.eq
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 3
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=8
                  local.tee 4
                  local.get 3
                  i32.const 3
                  i32.shr_u
                  local.tee 5
                  i32.const 3
                  i32.shl
                  i32.const 77008
                  i32.add
                  local.tee 6
                  i32.eq
                  drop
                  local.get 0
                  i32.load offset=12
                  local.tee 3
                  local.get 4
                  i32.ne
                  br_if 2 (;@5;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=76968
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=76968
                  br 5 (;@2;)
                end
                local.get 0
                i32.load offset=24
                local.set 7
                block ;; label = @7
                  local.get 0
                  i32.load offset=12
                  local.tee 6
                  local.get 0
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=8
                  local.tee 3
                  i32.const 0
                  i32.load offset=76984
                  i32.lt_u
                  drop
                  local.get 3
                  local.get 6
                  i32.store offset=12
                  local.get 6
                  local.get 3
                  i32.store offset=8
                  br 4 (;@3;)
                end
                block ;; label = @7
                  local.get 0
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 3
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=16
                  local.tee 3
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 0
                  i32.const 16
                  i32.add
                  local.set 4
                end
                loop ;; label = @7
                  local.get 4
                  local.set 5
                  local.get 3
                  local.tee 6
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 3
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.add
                  local.set 4
                  local.get 6
                  i32.load offset=16
                  local.tee 3
                  br_if 0 (;@7;)
                end
                local.get 5
                i32.const 0
                i32.store
                br 3 (;@3;)
              end
              local.get 2
              i32.load offset=4
              local.tee 3
              i32.const 3
              i32.and
              i32.const 3
              i32.ne
              br_if 3 (;@2;)
              i32.const 0
              local.get 1
              i32.store offset=76976
              local.get 2
              local.get 3
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 0
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 2
              local.get 1
              i32.store
              return
            end
            local.get 3
            local.get 6
            i32.eq
            drop
            local.get 4
            local.get 3
            i32.store offset=12
            local.get 3
            local.get 4
            i32.store offset=8
            br 2 (;@2;)
          end
          i32.const 0
          local.set 6
        end
        local.get 7
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=28
            local.tee 4
            i32.const 2
            i32.shl
            i32.const 77272
            i32.add
            local.tee 3
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            local.get 6
            i32.store
            local.get 6
            br_if 1 (;@3;)
            i32.const 0
            i32.const 0
            i32.load offset=76972
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=76972
            br 2 (;@2;)
          end
          local.get 7
          i32.const 16
          i32.const 20
          local.get 7
          i32.load offset=16
          local.get 0
          i32.eq
          select
          i32.add
          local.get 6
          i32.store
          local.get 6
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 6
        local.get 7
        i32.store offset=24
        block ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 3
          i32.store offset=16
          local.get 3
          local.get 6
          i32.store offset=24
        end
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 20
        i32.add
        local.get 3
        i32.store
        local.get 3
        local.get 6
        i32.store offset=24
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 2
                i32.load offset=4
                local.tee 3
                i32.const 2
                i32.and
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 2
                  i32.const 0
                  i32.load offset=76992
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 0
                  i32.store offset=76992
                  i32.const 0
                  i32.const 0
                  i32.load offset=76980
                  local.get 1
                  i32.add
                  local.tee 1
                  i32.store offset=76980
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 0
                  i32.load offset=76988
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=76976
                  i32.const 0
                  i32.const 0
                  i32.store offset=76988
                  return
                end
                block ;; label = @7
                  local.get 2
                  i32.const 0
                  i32.load offset=76988
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 0
                  i32.store offset=76988
                  i32.const 0
                  i32.const 0
                  i32.load offset=76976
                  local.get 1
                  i32.add
                  local.tee 1
                  i32.store offset=76976
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 1
                  i32.add
                  local.get 1
                  i32.store
                  return
                end
                local.get 3
                i32.const -8
                i32.and
                local.get 1
                i32.add
                local.set 1
                block ;; label = @7
                  local.get 3
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 2
                  i32.load offset=8
                  local.tee 4
                  local.get 3
                  i32.const 3
                  i32.shr_u
                  local.tee 5
                  i32.const 3
                  i32.shl
                  i32.const 77008
                  i32.add
                  local.tee 6
                  i32.eq
                  drop
                  block ;; label = @8
                    local.get 2
                    i32.load offset=12
                    local.tee 3
                    local.get 4
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=76968
                    i32.const -2
                    local.get 5
                    i32.rotl
                    i32.and
                    i32.store offset=76968
                    br 5 (;@3;)
                  end
                  local.get 3
                  local.get 6
                  i32.eq
                  drop
                  local.get 4
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 4
                  i32.store offset=8
                  br 4 (;@3;)
                end
                local.get 2
                i32.load offset=24
                local.set 7
                block ;; label = @7
                  local.get 2
                  i32.load offset=12
                  local.tee 6
                  local.get 2
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 2
                  i32.load offset=8
                  local.tee 3
                  i32.const 0
                  i32.load offset=76984
                  i32.lt_u
                  drop
                  local.get 3
                  local.get 6
                  i32.store offset=12
                  local.get 6
                  local.get 3
                  i32.store offset=8
                  br 3 (;@4;)
                end
                block ;; label = @7
                  local.get 2
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 3
                  br_if 0 (;@7;)
                  local.get 2
                  i32.load offset=16
                  local.tee 3
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 4
                end
                loop ;; label = @7
                  local.get 4
                  local.set 5
                  local.get 3
                  local.tee 6
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 3
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.add
                  local.set 4
                  local.get 6
                  i32.load offset=16
                  local.tee 3
                  br_if 0 (;@7;)
                end
                local.get 5
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 2
              local.get 3
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 0
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.add
              local.get 1
              i32.store
              br 3 (;@2;)
            end
            i32.const 0
            local.set 6
          end
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 2
              local.get 2
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 77272
              i32.add
              local.tee 3
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 3
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=76972
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=76972
              br 2 (;@3;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 2
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block ;; label = @4
            local.get 2
            i32.load offset=16
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 3
            i32.store offset=16
            local.get 3
            local.get 6
            i32.store offset=24
          end
          local.get 2
          i32.const 20
          i32.add
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.const 20
          i32.add
          local.get 3
          i32.store
          local.get 3
          local.get 6
          i32.store offset=24
        end
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 1
        i32.add
        local.get 1
        i32.store
        local.get 0
        i32.const 0
        i32.load offset=76988
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 1
        i32.store offset=76976
        return
      end
      block ;; label = @2
        local.get 1
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        i32.const 77008
        i32.add
        local.set 3
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=76968
            local.tee 4
            i32.const 1
            local.get 1
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 1
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 1
            i32.or
            i32.store offset=76968
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 3
          i32.load offset=8
          local.set 1
        end
        local.get 3
        local.get 0
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 0
        local.get 3
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 3
      block ;; label = @2
        local.get 1
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 38
        local.get 1
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 3
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 3
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16 align=4
      local.get 3
      i32.const 2
      i32.shl
      i32.const 77272
      i32.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=76972
            local.tee 6
            i32.const 1
            local.get 3
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 6
            local.get 2
            i32.or
            i32.store offset=76972
            local.get 4
            local.get 0
            i32.store
            local.get 0
            local.get 4
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 1
          i32.const 0
          i32.const 25
          local.get 3
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 3
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 3
          local.get 4
          i32.load
          local.set 6
          loop ;; label = @4
            local.get 6
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 1
            i32.eq
            br_if 2 (;@2;)
            local.get 3
            i32.const 29
            i32.shr_u
            local.set 6
            local.get 3
            i32.const 1
            i32.shl
            local.set 3
            local.get 4
            local.get 6
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 2
            i32.load
            local.tee 6
            br_if 0 (;@4;)
          end
          local.get 2
          local.get 0
          i32.store
          local.get 0
          local.get 4
          i32.store offset=24
        end
        local.get 0
        local.get 0
        i32.store offset=12
        local.get 0
        local.get 0
        i32.store offset=8
        return
      end
      local.get 4
      i32.load offset=8
      local.tee 1
      local.get 0
      i32.store offset=12
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 1
      i32.store offset=8
    end
  )
  (func $__ashlti3 (;154;) (type 16) (param i32 i64 i64 i32)
    (local i64)
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.const 64
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.const -64
        i32.add
        i64.extend_i32_u
        i64.shl
        local.set 2
        i64.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 64
      local.get 3
      i32.sub
      i64.extend_i32_u
      i64.shr_u
      local.get 2
      local.get 3
      i64.extend_i32_u
      local.tee 4
      i64.shl
      i64.or
      local.set 2
      local.get 1
      local.get 4
      i64.shl
      local.set 1
    end
    local.get 0
    local.get 1
    i64.store
    local.get 0
    local.get 2
    i64.store offset=8
  )
  (func $__lshrti3 (;155;) (type 16) (param i32 i64 i64 i32)
    (local i64)
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i32.const 64
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.const -64
        i32.add
        i64.extend_i32_u
        i64.shr_u
        local.set 1
        i64.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 64
      local.get 3
      i32.sub
      i64.extend_i32_u
      i64.shl
      local.get 1
      local.get 3
      i64.extend_i32_u
      local.tee 4
      i64.shr_u
      i64.or
      local.set 1
      local.get 2
      local.get 4
      i64.shr_u
      local.set 2
    end
    local.get 0
    local.get 1
    i64.store
    local.get 0
    local.get 2
    i64.store offset=8
  )
  (func $__trunctfdf2 (;156;) (type 30) (param i64 i64) (result f64)
    (local i32 i64 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i64.const 9223372036854775807
        i64.and
        local.tee 3
        i64.const -4323737117252386816
        i64.add
        local.get 3
        i64.const -4899634919602388992
        i64.add
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        i64.const 60
        i64.shr_u
        local.get 1
        i64.const 4
        i64.shl
        i64.or
        local.set 3
        block ;; label = @3
          local.get 0
          i64.const 1152921504606846975
          i64.and
          local.tee 0
          i64.const 576460752303423489
          i64.lt_u
          br_if 0 (;@3;)
          local.get 3
          i64.const 4611686018427387905
          i64.add
          local.set 4
          br 2 (;@1;)
        end
        local.get 3
        i64.const 4611686018427387904
        i64.add
        local.set 4
        local.get 0
        i64.const 576460752303423488
        i64.ne
        br_if 1 (;@1;)
        local.get 4
        local.get 3
        i64.const 1
        i64.and
        i64.add
        local.set 4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 0
        i64.eqz
        local.get 3
        i64.const 9223090561878065152
        i64.lt_u
        local.get 3
        i64.const 9223090561878065152
        i64.eq
        select
        br_if 0 (;@2;)
        local.get 0
        i64.const 60
        i64.shr_u
        local.get 1
        i64.const 4
        i64.shl
        i64.or
        i64.const 2251799813685247
        i64.and
        i64.const 9221120237041090560
        i64.or
        local.set 4
        br 1 (;@1;)
      end
      i64.const 9218868437227405312
      local.set 4
      local.get 3
      i64.const 4899634919602388991
      i64.gt_u
      br_if 0 (;@1;)
      i64.const 0
      local.set 4
      local.get 3
      i64.const 48
      i64.shr_u
      i32.wrap_i64
      local.tee 5
      i32.const 15249
      i32.lt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const 16
      i32.add
      local.get 0
      local.get 1
      i64.const 281474976710655
      i64.and
      i64.const 281474976710656
      i64.or
      local.tee 3
      local.get 5
      i32.const -15233
      i32.add
      call $__ashlti3
      local.get 2
      local.get 0
      local.get 3
      i32.const 15361
      local.get 5
      i32.sub
      call $__lshrti3
      local.get 2
      i64.load
      local.tee 3
      i64.const 60
      i64.shr_u
      local.get 2
      i32.const 8
      i32.add
      i64.load
      i64.const 4
      i64.shl
      i64.or
      local.set 4
      block ;; label = @2
        local.get 3
        i64.const 1152921504606846975
        i64.and
        local.get 2
        i64.load offset=16
        local.get 2
        i32.const 16
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.or
        i64.const 0
        i64.ne
        i64.extend_i32_u
        i64.or
        local.tee 3
        i64.const 576460752303423489
        i64.lt_u
        br_if 0 (;@2;)
        local.get 4
        i64.const 1
        i64.add
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i64.const 576460752303423488
      i64.ne
      br_if 0 (;@1;)
      local.get 4
      i64.const 1
      i64.and
      local.get 4
      i64.add
      local.set 4
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4
    local.get 1
    i64.const -9223372036854775808
    i64.and
    i64.or
    f64.reinterpret_i64
  )
  (func $emscripten_stack_init (;157;) (type 5)
    i32.const 65536
    global.set $__stack_base
    i32.const 0
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set $__stack_end
  )
  (func $emscripten_stack_get_free (;158;) (type 6) (result i32)
    global.get $__stack_pointer
    global.get $__stack_end
    i32.sub
  )
  (func $emscripten_stack_get_base (;159;) (type 6) (result i32)
    global.get $__stack_base
  )
  (func $emscripten_stack_get_end (;160;) (type 6) (result i32)
    global.get $__stack_end
  )
  (func $stackSave (;161;) (type 6) (result i32)
    global.get $__stack_pointer
  )
  (func $stackRestore (;162;) (type 0) (param i32)
    local.get 0
    global.set $__stack_pointer
  )
  (func $stackAlloc (;163;) (type 3) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    global.set $__stack_pointer
    local.get 1
  )
  (func $emscripten_stack_get_current (;164;) (type 6) (result i32)
    global.get $__stack_pointer
  )
  (data $.rodata (;0;) (i32.const 65536) "\00\08\a2\dc\00\ac\9cL\00U\a2\1f\001\a3c\00\08\a2\dc\00\ac\9cL\00U\a2\1f\00R\d22\00\e4\a5\88\00\00\00\00\00\00\00\00\00\00\00\00\00\08\a2\dc\00\ac\9cL\00U\a2\1f\00K\13^addChunkToMatrix\00removeChunkFromMatrix\00pageIndex\00-+   0X0x\00-0X+0X 0X-0x+0x 0x\00intSetPut\00addToSharedFreeList\00nimDecRefIsLast\00mappingInsert\00addInt\00msbit\00lsbit\00setBit\00clearBit\00intSetGet\00IndexDefect\00OverflowDefect\00RangeDefect\00addFloat\00freeDeferredObjects\00compensateCounters\00addChars\00contains\00requestOsChunks\00addToSharedFreeListBigChunks\00osDeallocPages\00tryAllocPages\00osTryAllocPages\00osAllocPages\00writeToBuffer\00pageAddr\00newSeq\00roundup\00foo\00hello\00align\00nan\00test.nim\00formatfloat.nim\00iterators.nim\00dollars.nim\00digitsutils.nim\00arithmetics.nim\00mmdisp.nim\00system.nim\00fatal.nim\00arc.nim\00osalloc.nim\00seqs_v2.nim\00incCurrMem\00decCurrMem\00raiseOutOfMem\00addIntImpl\00excl\00incl\00sysFatal\00splitChunk\00getSmallChunk\00isSmallChunk\00getBigChunk\00freeBigChunk\00deallocBigChunk\00getHugeChunk\00freeHugeChunk\00addHeapLink\00findSuitableBlock\00nimNewObj\00mappingSearch\00%.16g\00addFloatSprintf\00writeFloatToBufferSprintf\00inf\00nimIncRef\00updatePrevSize\00ptrSize\00listRemove\00nimRawDispose\00nimDestroyAndDispose\00isAccessible\00echoBinSafe\00chunkUnused\00listAdd\00realloc\00dealloc\00rawDealloc\00rawAlloc\00llAlloc\00addCstringN\00NAN\00INF\00removeChunkFromMatrix2\00splitChunk2\00alloc0\00.\00(null)\00-%\00+%\00$\00out of memory\0a\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00\00\00\00\00\00\00\00\ff\00\01\01\02\02\02\02\03\03\03\03\03\03\03\03\04\04\04\04\04\04\04\04\04\04\04\04\04\04\04\04\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\12\00\00\00\a0\06\01\00\00\00\00\00H\07\01\002\00\00\00P\07\01\00u\00\00\00\88\07\01\00\12\00\00@value out of range\00\00\14\00\00@value out of range: \00\00\00\00\04\00\00@ .. \00\00\00\00\14\00\00@ calls omitted) ...\0a\00\00\00\00\1d\00\00@No stack traceback available\0a\00\00\00\22\00\00@Traceback (most recent call last)\0a\00\00\00\00\00@\00\00\00\002\00\00@Error: call depth limit reached in a debug build (\00\00u\00\00@ function calls). You can change it with -d:nimCallDepthLimit=<int> but really try to avoid deep recursions instead.\0a\00\00\00\12\00\00@over- or underflow\00\00+\00\00@index out of bounds, the container is empty\00\06\00\00@index \00\00\0d\00\00@ not in 0 .. \00\00\00\0b\00\00\00\80\08\01\00\00\00\00\00\02\00\00\00\90\08\01\00\0b\00\00@hello world\00\02\00\00@, \00\00\d8\0a\01\00p\0b\01\00\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\00\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\000123456789ABCDEF")
  (data $.data (;1;) (i32.const 68224) "\01\00\00\00 \00\00\00\04\00\03\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00\04\00\04\00\10\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00 \00\00\00\04\00\03\000\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\07\00\00\00\94(\01\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\d8\0a\01\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\09\00\00\00\a8(\01\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00p\0b\01\00\a0.\01\00")
)
