
custom: 
	cc64 -t none --cpu 6502 hello.c
	ca65 --cpu 6502 fill.s
	lda65 -C config.cfg -m hello.map fill.o hello.o


nop: hello.c nop.s
	cl65 --start-addr 0x8000 --target none --cpu 6502 -o fill.bin hello.c nop.s

hello: hello.c fill.s
	cl65 --start-addr 0x8000 --target none --cpu 6502 -o fill.bin hello.c fill.s


# Burn ROM to EEPROM
install: fill.bin
	minipro -p AT28C256 -w fill.bin


clean:
	@$(DEL) hello 2>$(NULLDEV)
