main: func5a.o \
      func5b.o
	gcc -o main func5a.o func5b.o

%.o:  %.c  func5b.h
	gcc -c $<
#
# Or:
#	gcc -c $*.c
