ARM GAS variable2.S page 1
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