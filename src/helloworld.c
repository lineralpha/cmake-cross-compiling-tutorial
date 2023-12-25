#include <stdio.h>
#include <stdlib.h>

#include "mylib.c"

int main(void) {
    int result = add(5, 3);
    puts("Hello, NI LinuxRT!");
    printf("Addition result is: %d\n", result);
    return EXIT_SUCCESS;
}
