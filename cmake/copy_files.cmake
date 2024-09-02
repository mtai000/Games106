macro(CopyShaders target_name)
    message("src:" ${PROJECT_SOURCE_DIR})
    add_custom_command(
        TARGET ${target_name} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${PROJECT_SOURCE_DIR}/shaders $<TARGET_FILE_DIR:${target_name}>/shaders)
endmacro(CopyShaders)

macro(CopyAssets target_name)
    message("src:" ${PROJECT_SOURCE_DIR})
    add_custom_command(
        TARGET ${target_name} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${PROJECT_SOURCE_DIR}/assets $<TARGET_FILE_DIR:${target_name}>/assets)
endmacro(CopyAssets)