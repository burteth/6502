

code = bytearray([

    # Set each pin of the Register "B" to output (1 == OUTPUT)
    0xa9, 0xff,         # lda #$ff
    0x8d, 0x02, 0x60,   # sta $6002

    0xa9, 0x55,         # lda #$55
    0x8d, 0x00, 0x60,   # sta $6000

    0xa9, 0xaa,         # lda #$aa
    0x8d, 0x00, 0x60,   # sta $6000
    
    # Start the loop over again
    0x4c, 0x05, 0x80    # jmp $8005
    ])

rom = code + bytearray([0xea] * (32768 - len(code)))


# Jump to address 0x8000 initially
rom[0x7ffc] = 0x00
rom[0x7ffd] = 0x80

with open("rom.bin", "wb") as out_file:
    out_file.write(rom)
