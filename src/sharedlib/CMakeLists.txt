# glob all c source files in current directory
# best practice: don't glob files?
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

# EXPORT generates a CMake file containing code to import all targets
# listed in the install command from the installation tree.
install(TARGETS MyLib
    EXPORT MyLibTargets
    DESTINATION lib)
install(FILES mylib.h DESTINATION include)

# put the above imported targets into the cmake file
# and install it
install(EXPORT MyLibTargets
    FILE MyLibTargets.cmake
    DESTINATION lib/cmake/mylib)

include(CMakePackageConfigHelpers)

# generate the config file that includes the exports
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/MyLibConfig.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/MyLibConfig.cmake"
    INSTALL_DESTINATION "lib/cmake/example"
    NO_SET_AND_CHECK_MACRO
    NO_CHECK_REQUIRED_COMPONENTS_MACRO)

# generate the versioning config file 
# so that find_package can have a version specified
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/MyLibConfigVersion.cmake"
    VERSION "${PROJECT_VERSION}"
    COMPATIBILITY AnyNewerVersion)

# install the generated config file
install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/MyLibConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/MyLibConfigVersion.cmake"
    DESTINATION lib/cmake/mylib)
      
# finally, export the targets from the build tree
export(EXPORT MyLibTargets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/MyLibTargets.cmake")