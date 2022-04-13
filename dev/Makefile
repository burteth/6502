	
local: game.c 
	gcc -o game-local game.c

game: game.c IO.s
	cl65 -t c64 -o game.bin game.c IO.s

assembly: game.c 
	cc65 -Tdv --cpu 6502 -o game.s game.c 

clean:
	rm game.bin game.o IO.o
	#@rm game.s 2>$(NULLDEV)

# Ethan: use these flags when targeting system for 6502 binary
#cl65 --start-addr 0x8000 --target none --cpu 6502 -o game.bin game.c IO.s
