add_executable(HelloWorld helloworld.c)
set(EXECUTABLE_OUTPUT_PATH bin)

target_link_libraries(HelloWorld PUBLIC MyLib)


install(TARGETS HelloWorld DESTINATION bin)