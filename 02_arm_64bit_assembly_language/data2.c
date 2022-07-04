ARM GAS variable3.S page 1
line addr value code
1 .data
2 0000 00000000 i: .word 0
3 0004 01000000 j: .word 1
4 0008 48656C6C fmt: .asciz "Hello\n"
4 6F0A00
5 000f 414200 ch: .byte ’A’,’B’,0
6 0012 0000 .align 2
7 0014 00000000 ary: .word 0,1,2,3,4
7 01000000
7 02000000
7 03000000
7 04000000
8 .equ arysize,(. - ary)/4
9
DEFINED SYMBOLS
variable3.S:2 .data:0000000000000000 i
variable3.S:3 .data:0000000000000004 j
variable3.S:4 .data:0000000000000008 fmt
variable3.S:5 .data:000000000000000f ch
variable3.S:6 .data:0000000000000012 $d
variable3.S:7 .data:0000000000000014 ary
variable3.S:8 *ABS*:0000000000000005 arysize
NO UNDEFINED SYMBOLS


A is >= 93.3333
A- is >= 90.0
B+ is >= 86.6666
B is >= 83.3333
B- is >= 80.0
C+ is >= 76.6666
C is >= 73.3333
C- is >= 70.0
D+ is >= 65.0
D is >= 60.0
