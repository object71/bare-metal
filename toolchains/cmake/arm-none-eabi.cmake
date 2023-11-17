set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_HOST_EXECUTABLE_SUFFIX "${CMAKE_EXECUTABLE_SUFFIX}" CACHE INTERNAL "The executable suffix on the host system")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_SYSTEM_NAME "Generic")
set(CMAKE_CROSSCOMPILING TRUE)

set(CMAKE_EXECUTABLE_SUFFIX_ASM ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX ".elf")

add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:-fno-builtin>")
add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:-ffreestanding>")
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>")
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>")
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:-fno-unwind-tables>")
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:-fno-use-cxa-atexit>")
add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:-fno-threadsafe-statics>")

add_link_options("$<$<COMPILE_LANGUAGE:C,CXX>:-nostdlib>")
add_link_options("$<$<COMPILE_LANGUAGE:C,CXX>:-nostartfiles>")

set(CMAKE_C_COMPILER_ID GNU)
set(CMAKE_C_COMPILER_FORCED TRUE)
find_program(CMAKE_C_COMPILER "arm-none-eabi-gcc${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")

set(CMAKE_CXX_COMPILER_ID GNU)
set(CMAKE_CXX_COMPILER_FORCED TRUE)
find_program(CMAKE_CXX_COMPILER "arm-none-eabi-g++${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")

find_program(CMAKE_ASM_COMPILER "arm-none-eabi-as${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")
find_program(CMAKE_OBJCOPY "arm-none-eabi-objcopy${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")
find_program(CMAKE_LINKER "arm-none-eabi-ld${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")
find_program(CMAKE_RANLIB "arm-none-eabi-ranlib${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")
find_program(CMAKE_AR "arm-none-eabi-ar${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")
find_program(CMAKE_SIZE "arm-none-eabi-size${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")
find_program(CMAKE_STRIP "arm-none-eabi-strip${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")
find_program(ARM_NONE_EABI_READELF "arm-none-eabi-readelf${CMAKE_HOST_EXECUTABLE_SUFFIX}" HINTS "${EABI_LOCATION}")




