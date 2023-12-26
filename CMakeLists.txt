cmake_minimum_required(VERSION 3.28.0 FATAL_ERROR)

include(CrossCompile.cmake)

project(HelloWorld VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_<LANG>_STANDARD 17)
set(CMAKE_<LANG>_STANDARD_REQUIRED ON)

set(CMAKE_<LANG>_FLAGS "-Wall -fmessage-length=0")
set(CMAKE_<LANG>_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_<LANG>_FLAGS_RELEASE "-O3")

set(CMAKE_STAGING_PREFIX ${CMAKE_SYSROOT}/usr/local)
set(CMAKE_INSTALL_PREFIX /usr/local)

include_directories(
        ${toolchainpath}/core2-64-nilrt-linux/usr/inlcude
        ${toolchainpath}/core2-64-nilrt-linux/usr/local/inlcude)
        
add_subdirectory(src/sharedlib)
add_subdirectory(src/app)

# include(CTest)
# enable_testing()

# set(CPACK_PROJECT_NAME ${PROJECT_NAME})
# set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
# include(CPack)
