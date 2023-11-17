function(target_build_hex TARGET_NAME)
    add_custom_command(TARGET "${TARGET_NAME}" POST_BUILD
            COMMAND "${CMAKE_OBJCOPY}" -O ihex "$<TARGET_FILE:${TARGET_NAME}>" "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.hex")
endfunction()

function(target_show_elf_header TARGET_NAME)
    add_custom_command(TARGET "${TARGET_NAME}" POST_BUILD
            COMMAND "${ARM_NONE_EABI_READELF}" "-h" "$<TARGET_FILE:${TARGET_NAME}>")
endfunction()