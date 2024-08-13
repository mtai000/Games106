set(EXTVULKAN ../../../external/vulkan)
file(GLOB BASE_SRC ${EXTVULKAN}/base/*.cpp ${EXTVULKAN}/external/imgui/*.cpp)

add_library(libbase SHARED ${BASE_SRC})

include_directories(${EXTVULKAN})
include_directories(${EXTVULKAN}/external)
include_directories(${EXTVULKAN}/external/glm)
include_directories(${EXTVULKAN}/external/gli)
include_directories(${EXTVULKAN}/external/imgui)
include_directories(${EXTVULKAN}/external/tinygltf)
include_directories(${ANDROID_NDK}/sources/android/native_app_glue)

set(KTX_DIR ${EXTVULKAN}/external/ktx)
set(KTX_SOURCES
	${KTX_DIR}/lib/texture.c
	${KTX_DIR}/lib/hashlist.c
	${KTX_DIR}/lib/checkheader.c
	${KTX_DIR}/lib/swap.c
	${KTX_DIR}/lib/memstream.c
	${KTX_DIR}/lib/filestream.c
)
set(KTX_INCLUDE
	${KTX_DIR}/include
	${KTX_DIR}/lib
	${KTX_DIR}/other_include
)

add_library(libktx ${KTX_SOURCES})
target_include_directories(libktx PUBLIC ${KTX_INCLUDE})
set_property(TARGET libktx PROPERTY FOLDER "external")


target_link_libraries(
	libbase
	android
	log
	z
	libktx
)
