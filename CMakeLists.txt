cmake_minimum_required(VERSION 3.28.0)

# cross-compiling toolchain
# set(CMAKE_TOOLCHAIN_FILE CrossCompile.cmake)
include(CrossCompile.cmake)

project(HelloWorld VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_<LANG>_STANDARD 17)
set(CMAKE_<LANG>_STANDARD_REQUIRED ON)

set(CMAKE_<LANG>_FLAGS "-Wall -fmessage-length=0")
set(CMAKE_<LANG>_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_<LANG>_FLAGS_RELEASE "-O3")

# On Linux, the following are stadnard directories for shared libraries:
#   - /lib/                 location for essential Linux OS libraries
#   - /usr/lib/             location for normal user mode libraries installed by package manager
#   - /usr/local/lib/       location for normal user mode libraries installed from source/manually
#   - /usr/include          similar to /usr/lib but for includes
#   - /usr/local/include    similar to /usr/local/lib but for includes
set(CMAKE_STAGING_PREFIX ${CMAKE_SYSROOT}/usr/local)
set(CMAKE_INSTALL_PREFIX /usr/local)

# move this to the toolchain file?
include_directories(
    ${toolchainpath}/core2-64-nilrt-linux/usr/inlcude
    ${toolchainpath}/core2-64-nilrt-linux/usr/local/inlcude)
        
add_subdirectory(src/sharedlib)
add_subdirectory(src/app)

# include(CTest)
# enable_testing()

# to pack binaries, run: cpack --config CPackConfig.cmake
# to pack source tree, run: cpack --config CPackSourceConfig.cmake
# both CPackConfig.cmake and CPackSourceConfig.cmake
# are auto generated from CPack.cmake.
set(CPACK_PROJECT_NAME "${PROJECT_NAME}")
set(CPACK_PROJECT_VERSION "${PROJECT_VERSION}")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_SOURCE_IGNORE_FILES
    /.git
    /build)
SET(CPACK_SOURCE_GENERATOR "TGZ")
include(CPack)
