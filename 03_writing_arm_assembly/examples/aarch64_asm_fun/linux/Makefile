# I'm assuming you're on an aarch64 box too. You should be..?
# TODO: Bother with defining $CROSS variable. Fine.
CC = gcc
AS = as

.PHONY: all clean

all:
	$(AS) puts.s -o puts.o
	$(CC) puts.o -o puts

	rm -rf puts.o
clean:
	rm -rf puts
