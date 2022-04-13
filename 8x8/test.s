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
    
    ldx #$0
loop:
    
    ; Cleanup the column
    lda #$ff
    sta COL_PORT
    
    lda #%00000001
    sta ROW_PORT ; Specify the row we are changing
    
    txa ; Transfer regX to regA
    eor #$ff ; Get the inverse of the current counter
    sta COL_PORT ; Write to the row

    lda #%00000000
    sta ROW_PORT ; Reset row spec

    inx ; increment regX
    jmp loop

; Bootloader type thing maybe
    .org $fffc
    .word reset
    .word $0000

; ETHAN: Left off figuring out the subroutines thing, it seems like they arent returning to from the subroutines


