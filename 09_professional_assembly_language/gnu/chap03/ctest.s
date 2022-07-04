.file "ctest.c"
.version "01.01"
gcc2_compiled.:
.section .rodata
.LC0:
.string "Hello, world!\n"
.text
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	subl $12, %esp
	pushl $.LC0
	call printf
	addl $16, %esp
	subl $12, %esp
	pushl $0
	call exit
	.Lfe1:
	.size main,.Lfe1-main
	.ident "gcc (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0; Linux 5.3.0-050300-generic #201909152230"
