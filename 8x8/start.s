PORTB = $6000 ; Column Data
COL_PORT = $6000 ; Column Data
PORTA = $6001 ; Row Data
ROW_PORT = $6001 ; Row Data

DDRB  = $6002
DDRA  = $6003

    .org $8000

reset:

    ; Initialize the stack pointer
    ldx #$ff
    txs

    ; Initialize IO chip
    lda #%11111111 ; Set all pins on port B to output
    sta DDRB

    lda #%11111111 ; Set all pins on port A to output
    sta DDRA
    
    ;; Steps:
    ;;  1) Set column data
    ;;  2) Set which row
    ;;  3) Wait
    ;;  3) Set row (PORTA) to 0x00

    ldx #$0 ; counter var
iter_rows:
    
    ; Cleanup the column
    lda #$00
    sta COL_PORT

    txa ; transfer regX to regA
    sta ROW_PORT ; Specify the row we are changing
    

    ldy #$0 ; counter var for iter_clear_cols
iter_clear_cols:
    

    ; Check end condition of loop
    iny
    cpy #$8
    bne iter_clear_cols

    ; Set column data to alternating
    lda #$55
    sta PORTB

    ; Set row to be first
    lda #%00000001
    sta PORTA
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    ; Set row to 0x00
    lda #$00
    sta PORTB


    ; Set column to alternating
    lda #$aa
    sta PORTA 

    ; Set row to be first
    lda #%00000010
    sta PORTB
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    ; Set row to 0x00
    lda #$00
    sta PORTB

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    ; Check end condition of loop
    inx
    cpx #$8
    bne iter_rows



; Subroutines

set_pixel:

        

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


