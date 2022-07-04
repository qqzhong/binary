/*
Defining Data: DATA Section 2
char c = 'a';
short s = 12;
int i = 345;
long l = 6789;

Notes:
Can place label on same line as next instruction
.global instruction

*/

.section ".data"
.global c
c: .byte 'a'
.global s
s: .short 12
.global i
i: .word 345
.global l
l: .quad 6789
