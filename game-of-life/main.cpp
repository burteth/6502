#include <iostream>


using namespace std;

const int WIDTH = 8;
const unsigned char FULL = '#';
const unsigned char EMPTY = ' ';

void print_state(unsigned char* state) {
    for (int i = 0; i < 10; i++)
        cout << '-';
    cout << endl;
    for (int row = 0; row < WIDTH; row++) {
        cout << '|';
        int mask = 1;
        for (int col = WIDTH - 1; col >= 0; col--)  {
            if (state[row] >> col & mask) {
                cout << FULL;
            } else {
                cout << EMPTY;
            }
        }
        cout <<  '|' << endl;
    }
    for (int i = 0; i < 10; i++)
        cout << '-';
    cout << endl;
}

int main() {

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

    print_state(state);
    unsigned int* next_state[8]; 




}
