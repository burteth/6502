.export _init, _io_fill, _io_disp, _io_init
.import _main
;.zeropage
;_line_data:     .res 2 ; Reserve a local zero page pointer

.export   __STARTUP__ : absolute = 1        ; Mark as startup

; ---------------------------------------------------------------------------

.segment "STARTUP"

_init:    LDX     #$FF                 ; Initialize stack pointer to $01FF
          TXS
          CLD                          ; Clear decimal mode
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
          nop
          nop
          nop
          nop
          JSR   _main

; ---------------------------------------------------------------------------

.segment "CODE"

PORTB = $6000 ; Column Data
COL_PORT = $6000 ; Column Data
PORTA = $6001 ; Row Data
ROW_PORT = $6001 ; Row Data
DDRB  = $6002
DDRA  = $6003

    ;.org $8000


_io_init:

    ; Initialize IO chip
    lda #%11111111 ; Set all pins on port B to output
    sta DDRB

    lda #%11111111 ; Set all pins on port A to output
    sta DDRA

    rts


_io_fill:
;reset:
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
    rts
    
 
; (char line_data, char row_index)
_io_disp:
    
    ;tay ; transfer a to y (line_data)
    tax

    ;; Steps:
    ;;  1) Set column data
    ;;  2) Set which row
    ;;  3) Wait
    ;;  3) Set row (PORTA) to 0x00

    ;ldx #$0

    ; Cleanup the column
    lda #$ff
    sta COL_PORT
    
    ;txa ; transfer row_index to regA
    lda #%00000001
    sta ROW_PORT ; Specify the row we are changing

    txa
    eor #$ff ; Get the inverse of the current counter
    sta COL_PORT ; Write to the row

    lda #%00000000
    sta ROW_PORT ; Reset row spec

    ;nop
    ;nop
    ;nop
    ;nop
    ;nop
    ;nop
    ;nop
    ;nop
    ;nop

    ;;txa
    ;;eor #$ff ; Get the inverse of the current counter

    ;lda #%11111111
    ;sta COL_PORT ; Write to the row

    ;lda #%00000000
    ;sta ROW_PORT ; Reset row spec

    ;inx ; increment regX
    
    ;rts ; return from subroutines
    rts
    ;jmp loop

;; Bootloader type thing maybe
    ;;.org $fffc
    ;;.word reset
    ;;.word $0000

;; ETHAN: Left off figuring out the subroutines thing, it seems like they arent returning to from the subroutines
