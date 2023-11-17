project(bare_metal_cpp LANGUAGES ASM CXX)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} PUBLIC bare_metal_init)
set_property(TARGET ${PROJECT_NAME} PROPERTY LINK_DEPENDS "${LINKER_SCRIPT}")

target_show_elf_header(${PROJECT_NAME})
target_build_hex(${PROJECT_NAME})
