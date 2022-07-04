# I'm assuming you're on an aarch64 box too. You should be..?
# TODO: Bother with defining $CROSS variable. Fine.
CC = gcc
AS = as

.PHONY: all clean

all:
	$(AS) jnz.s -o jnz.o
	$(CC) jnz.o -o jnz

	$(AS) loop.s -o loop.o
	$(CC) loop.o -o loop


	rm -rf jnz.o
	rm -rf loop.o
clean:
	rm -rf jnz loop
