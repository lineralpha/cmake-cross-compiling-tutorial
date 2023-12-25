cmake_minimum_required(VERSION 3.28.0 FATAL_ERROR)

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

project(HelloWorld VERSION 0.1.0 LANGUAGES C CXX)

# SDKROOT is set by environment-setup-core2-64-nilrt-linux.bat
# and is a path of Windows-format (using "\" as directory separator)
set(toolchainpath $ENV{SDKROOT}/sysroots)
string(REPLACE "\\"  "/" toolchainpath ${toolchainpath})

set(CMAKE_C_COMPILER ${toolchainpath}/x86_64-w64-mingw32/usr/bin/x86_64-nilrt-linux/x86_64-nilrt-linux-gcc.exe)
set(CMAKE_CXX_COMPILER ${toolchainpath}/x86_64-w64-mingw32/usr/bin/x86_64-nilrt-linux/x86_64-nilrt-linux-g++.exe)

set(CMAKE_SYSROOT ${toolchainpath}/core2-64-nilrt-linux)
set(CMAKE_<LANG>_STANDARD_INCLUDE_DIRECTORIES 
        ${toolchainpath}/core2-64-nilrt-linux/usr/include/c++/11.3.0 
        ${toolchainpath}/core2-64-nilrt-linux/usr/include/c++/11.3.0/x86_64-nilrt-linux)
set(CMAKE_<LANG>_FLAGS "-Wall -fmessage-length=0")
set(CMAKE_<LANG>_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_<LANG>_FLAGS_RELEASE "-O3")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(EXECUTABLE_OUTPUT_PATH bin)
add_executable(HelloWorld ./src/helloworld.c)

# include(CTest)
# enable_testing()

# set(CPACK_PROJECT_NAME ${PROJECT_NAME})
# set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
# include(CPack)
