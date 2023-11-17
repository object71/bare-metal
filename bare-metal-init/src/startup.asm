.thumb
.syntax divided

.extern __bss_start__
.extern __bss_end__
.extern __data_start__
.extern __data_end__
.extern __data_rom_start__
.extern __preinit_array_start__
.extern __preinit_array_end__
.extern __init_array_start__
.extern __init_array_end__
.extern __fini_array_start__
.extern __fini_array_end__

.section .text

.thumb_func
.global __reset
__reset:

__bss_reset:
    mov r0, #0x0
    ldr r1, =#__bss_start__
    ldr r2, =#__bss_end__
    cmp r1, r2
    beq __clear_data
__bss_reset_cycle:
    str r0, [r1]
    add r1, #4
    cmp r1, r2
    bne __bss_reset_cycle

__clear_data:
    ldr r1, =#__data_start__
    ldr r2, =#__data_end__
    ldr r3, =#__data_rom_start__
    cmp r1, r2
    beq __call_init_functions
__clear_data_cycle:
    ldr r0, [r3]
    str r0, [r1]
    add r1, #4
    add r3, #4
    cmp r1, r2
    bne __clear_data_cycle

__call_init_functions:
    ldr a1, =#__preinit_array_start__
    ldr a2, =#__preinit_array_end__
    bl __callback_array_execute_common
    ldr a1, =#__init_array_start__
    ldr a2, =#__init_array_end__
    bl __callback_array_execute_common

    b __start

    ldr a1, =#__fini_array_start__
    ldr a2, =#__fini_array_end__
    bl __callback_array_execute_common
    b __hang

.thumb_func
.global __hang
__hang:
    yield
    b __hang

.thumb_func
__start:
    bl main

.thumb_func
__callback_array_execute_common:
    cmp a1, a2
    beq __callback_array_execute_cycle_end
    mov v1, a1
    mov v2, a2
    mov v4, lr
__callback_array_execute_cycle:
    ldr v3, [v1]
    blx v3
    add v1, #4
    cmp v1, v2
    bne __callback_array_execute_cycle
    mov lr, v4
__callback_array_execute_cycle_end:
    bx lr
