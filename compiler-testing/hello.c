#include <stdio.h>
#include <stdlib.h>

extern void __fastcall__ io_fill();

int main (void) {
    /*printf ("Running fill");*/
    io_fill();
    /*printf ("After Running fill");*/
    io_fill();
    return EXIT_SUCCESS;
}

