main: func5a.o func5b.o
	gcc -o main func5a.o func5b.o

func5a.o:  func5a.c
	gcc -c func5a.c

func5b.o:  func5b.c
	gcc -c func5b.c

func5a.c: func5b.h
	touch func5a.c

func5b.c: func5b.h
	touch func5b.c

