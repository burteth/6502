PORTB = $6000 ; Data
PORTA = $6001 ; RS/RW/E (only top 3 bits)
DDRB  = $6002
DDRA  = $6003

E  = %10000000
RW = %01000000
RS = %00100000

    .org $8000

reset:
    ; Initialize the stack pointer
    ldx #$ff
    txs

    ; Initialize IO chip
    lda #%11111111 ; Set all pins on port B to output
    sta DDRB

    lda #%11100000 ; Set top 3 pins on port A to output
    sta DDRA


    ; Initialize LCD screen
    lda #%00111000 ; Set 8-bit mode; 2-line display; 5x8 font
    jsr lcd_instr

    ; Turn display on
    lda #%00001111 ; Turn on display and cursor, and sets it to blinking
    jsr lcd_instr

    ; Set entry mode
    lda #%00000110 ; Set mode to increment the address by one and shift cursor
    jsr lcd_instr

    ; Print out hello world
    lda #"H"
    jsr print_char

    lda #"e"
    jsr print_char

    lda #"l"
    jsr print_char

    lda #"l"
    jsr print_char

    lda #"o"
    jsr print_char

    lda #","
    jsr print_char

    lda #" "
    jsr print_char

    lda #"W"
    jsr print_char

    lda #"o"
    jsr print_char

    lda #"r"
    jsr print_char

    lda #"l"
    jsr print_char

    lda #"d"
    jsr print_char

; Stall
loop:
    jmp loop


; Subroutines

lcd_instr:
    sta PORTB
    lda #0          ; Clear RS/RW/E bits
    sta PORTA
    lda #E          ; Set E bit to send instruction
    sta PORTA   
    lda #0          ; Clear RS/RW/E bits
    sta PORTA       
    rts

print_char:
    sta PORTB
    lda #RS          ; Set RS
    sta PORTA
    lda #(RS | E)    ; Set enable bit in order to send instruction
    sta PORTA
    lda #RS          ; Set RS
    sta PORTA
    rts

; Bootloader type thing maybe
    .org $fffc
    .word reset
    .word $0000

; ETHAN: Left off figuring out the subroutines thing, it seems like they arent returning to from the subroutines


