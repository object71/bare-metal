project(bare_metal_init LANGUAGES ASM)

set(SOURCES)
list(APPEND SOURCES src/startup.asm)
list(APPEND SOURCES include/custom_intrinsics.h)

# Micro:bit V2
if ("${MCU}" STREQUAL "nrf52833")
    list(APPEND SOURCES src/nrf52833/vectors.asm)
endif()

add_library(${PROJECT_NAME} OBJECT ${SOURCES})



target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
