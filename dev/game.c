#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


extern const char text[];       /* In text.s */

#define WIDTH 8
#define FULL '#'
#define EMPTY '_'


void print_state(unsigned char* state) {
    for (int row = 0; row < WIDTH; row++) {
        int mask = 1;
        for (int col = WIDTH - 1; col >= 0; col--)  {
            if (state[row] >> col & mask) {
                printf("%c", FULL);
            } else {
                printf("%c", EMPTY);
            }
        }
        printf("\n");
    }
}

void get_next_state(char* cur_state, char* next_state) {

    for(int r=0; r<WIDTH; r++){
        for(int c=0; c<WIDTH; c++){

        }
    }

}

int main(void) {

    unsigned char state[8] = {
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b11110000
    };

    unsigned int* next_state[8];

    print_state(state);

    while(True) {
        get_next_state(state, next_state);

        // copy over new state
        memcpy(state, next_state, 8);
        
        // zero out next_state
        memset(next_state, 0x00, 8);

    }



    return EXIT_SUCCESS;
}	
