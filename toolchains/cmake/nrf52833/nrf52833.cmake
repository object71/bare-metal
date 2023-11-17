set(CMAKE_SYSTEM_PROCESSOR "cortex-m4")

add_compile_options("-mcpu=cortex-m4")
add_compile_options("-mthumb")
add_compile_options("-march=armv7e-m+fp")

# ASM only options ('-Wa,' must be added for C/C++)
add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:-Wa,>-meabi=4")
add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:-Wa,>-mfloat-abi=hard")
add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:-Wa,>-mfpu=fpv4-sp-d16")

# C/C++ only options
add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:-mabi=atpcs>")
add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:-mtune=cortex-m4>")

set(LINKER_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/nrf52833.ld")
set(MCU "nrf52833")
add_link_options("-T${LINKER_SCRIPT}")
