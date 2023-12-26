# glob for all c source files in current directory
file(GLOB SRC_FILES "*.c")
message(STATUS "src files: ${SRC_FILES}")

add_library(MyLib SHARED ${SRC_FILES})
set(LIBRARY_OUTPUT_PATH bin)

target_include_directories(MyLib
    INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>)


set_property(TARGET MyLib PROPERTY VERSION "1.0.0")
set_property(TARGET MyLib PROPERTY SOVERSION "1")

# EXPORT generates a CMake file containing code to  import all targets
# listed in the install command from the installation tree.
install(TARGETS MyLib
    EXPORT MyLibTargets
    DESTINATION lib)
install(FILES mylib.h DESTINATION include)

install(EXPORT MyLibTargets
    FILE MyLibTargets.cmake
    DESTINATION lib/cmake/mylib)
