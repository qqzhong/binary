/*
Defining Data: DATA Section 1
static char c = 'a';
static short s = 12;
static int i = 345;
static long l = 6789;

Notes:
.section instruction (to announce DATA section)
label definition (marks a spot in RAM)
.byte instruction (1 byte)
.short instruction (2 bytes)
.word instruction (4 bytes)
.quad instruction (8 bytes)

*/

.section ".data"
c:
.byte 'a'
s:
.short 12
i:
.word 345
l:
.quad 6789
