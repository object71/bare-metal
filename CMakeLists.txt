cmake_minimum_required(VERSION 3.26)
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/toolchains/cmake/arm-none-eabi.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/toolchains/cmake/embedded-utilities.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/toolchains/cmake/nrf52833/nrf52833.cmake")

project(bare_metal)

add_subdirectory(bare-metal-init)
add_subdirectory(bare-metal-asm)
add_subdirectory(bare-metal-c)
add_subdirectory(bare-metal-cpp)
