file(GLOB SRC_FILES "*.c")
message(STATUS "src files: ${SRC_FILES}")

add_library(MyLib SHARED ${SRC_FILES})
set(LIBRARY_OUTPUT_PATH bin)

target_include_directories(MyLib
    INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)


set_property(TARGET MyLib PROPERTY VERSION "1.0.0")
set_property(TARGET MyLib PROPERTY SOVERSION "1")

# On Linux, the following are stadnard directories for shared libraries:
#   - /lib/                 location for essential Linux OS libraries
#   - /usr/lib/             location for normal user mode libraries installed by package manager
#   - /usr/local/lib/       location for normal user mode libraries installed from source/manually
#   - /usr/include          similar to /usr/lib but for includes
#   - /usr/local/include    similar to /usr/local/lib but for includes