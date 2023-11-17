MEMORY
{
  FLASH (rx) : ORIGIN = 0x0, LENGTH = 512K
  RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

OUTPUT_FORMAT ("elf32-littlearm")

SECTIONS {
    /* CODE GO IN ROM */
    .text : {
        KEEP(*(.interrupt_vector))
        KEEP(*(.text))
        KEEP(*(.text.*))
    } > FLASH

    /* CONSTANTS GO IN ROM */
    .rodata : {
        KEEP(*(.rodata))
        KEEP(*(.rodata.*))
    } > FLASH

    /* ARRAY OF INITIALIZATION & FINALIZATION FUNCTIONS */
    .preinit_array : {
        KEEP(*(.preinit_array))
        KEEP(*(.preinit_array.*))
    } > FLASH

    .init_array : {
        KEEP(*(.init_array))
        KEEP(*(.init_array.*))

        KEEP (*(.ctors))
        KEEP (*(.ctors.*))
    } > FLASH

    .fini_array : {
        KEEP (*(.dtors))
        KEEP (*(.dtors.*))

        KEEP(*(.fini_array))
        KEEP(*(.fini_array.*))
    } > FLASH

    /* ALLOCATE RAM SECTION FOR DYNAMIC DATA */
    .bss : {
        KEEP(*(.bss))
        KEEP(*(.bss.*))
    } > RAM

    /* ALLOCATE RAM SECTION FOR DATA AND ALSO INITIAL VALUES IN ROM */
    .data : {
        KEEP(*(.data))
        KEEP(*(.data.*))
    } > RAM AT> FLASH
}

/* GLOBAL BSS RAM */
__bss_start__ = ADDR(.bss);
__bss_end__ = __bss_start__ + SIZEOF(.bss);

/* GLOBAL INITIALIZED RAM FROM ROM */
__data_start__ = ADDR(.data);
__data_end__ = __data_start__ + SIZEOF(.data);
__data_rom_start__ = LOADADDR(.data);

__preinit_array_start__ = ADDR(.preinit_array);
__preinit_array_end__ = __preinit_array_start__ + SIZEOF(.preinit_array);

__init_array_start__ = ADDR(.init_array);
__init_array_end__ = __init_array_start__ + SIZEOF(.init_array);

__fini_array_start__ = ADDR(.fini_array);
__fini_array_end__ = __fini_array_start__ + SIZEOF(.fini_array);

__stack_top__ = ORIGIN(RAM) + LENGTH(RAM);
__stack_bottom__ = __data_end__;

