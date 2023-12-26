# skip compiler check which will fail in cross-compiling scenario
# (executable not able to run on host)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

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

# how CMAKE_FIND_ROOT_PATH is used for each type of search
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
