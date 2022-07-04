
CC=gcc		# Compiler command
CFLAGS=-c       # Compiler options
OFLAG=-o        # Output flag

main: func5a.o func5b.o
	$(CC) $(OFLAG) main func5a.o func5b.o

%.o:  %.c  func5b.h
	$(CC) $(CFLAGS) $<
