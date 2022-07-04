# I'm assuming you're on an aarch64 box too. You should be..?
# TODO: Bother with defining $CROSS variable. Fine.
CC = gcc
AS = as

.PHONY: all clean

all:
	$(AS) ret.s -o ret.o
	$(CC) ret.o -o ret

	$(AS) add.s -o add.o
	$(CC) add.o -o add

	$(AS) argc.s -o argc.o
	$(CC) argc.s -o argc


	rm -rf ret.o
	rm -rf add.o
	rm -rf argc.o

clean:
	rm -rf ret add argc
