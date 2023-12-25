add_library(MyLib SHARED mylib.c)
set(LIBRARY_OUTPUT_PATH bin)

target_include_directories(MyLib
    INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)


set_property(TARGET MyLib PROPERTY VERSION "1.0.0")
set_property(TARGET MyLib PROPERTY SOVERSION "1")
