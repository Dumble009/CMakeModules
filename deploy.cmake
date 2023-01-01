function(deploy_headers DIR_NAME LIB_NAME)

file(GLOB HEADER_FILES "*.h")

foreach(HEADER_FILE ${HEADER_FILES})

# フォルダ名、拡張子を除いたファイル名を変数TEMP_TARGETに代入
get_filename_component(TEMP_TARGET ${HEADER_FILE} NAME_WE)
# TEMP_TARGETの頭にcopy_header_を追加
set(TEMP_TARGET "copy_header_${TEMP_TARGET}")

# コピー対象のフォルダ名を除いた拡張子込みのファイル名を取得
get_filename_component(FNAME ${HEADER_FILE} NAME)

add_custom_target(
    ${TEMP_TARGET}
    COMMAND 
    ${CMAKE_COMMAND} -E copy "${HEADER_FILE}" "C:/MyLib/${DIR_NAME}/include/${FNAME}"
)

add_dependencies(${LIB_NAME} ${TEMP_TARGET})

endforeach(HEADER_FILE ${HEADER_FILES})

endfunction()