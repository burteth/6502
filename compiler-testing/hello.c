/*#include <stdio.h>*/
/*#include <stdlib.h>*/

extern void __fastcall__ io_fill();
extern void __fastcall__ io_init();
/*extern void __fastcall__ io_disp(char num, char idx);*/
extern void __fastcall__ io_disp(unsigned char num);

int main (void) {

    unsigned char counter;
    /*char row;*/
    /*int i;*/

    io_init();
    /*counter = 0b11110000;*/
    /*while (1==1) {*/
        /*io_disp(counter);*/
        /*counter = (counter + 0b1) % 256;*/
    /*}*/
    /*counter = 0b11110000;*/
    /*while (1==1) {*/
        /*io_disp(counter);*/
        /*counter = (counter + 0b1) % 256;*/
    /*}*/
    
    while (1==1) {

        io_disp(0b00000001);
        io_disp(0b00000010);
        io_disp(0b00000100);
        io_disp(0b00001000);
        io_disp(0b00010000);
        io_disp(0b00100000);
        io_disp(0b01000000);
        io_disp(0b10000000);

    }


    return 0;
}

