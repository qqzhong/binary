.file "calctest.c"
.version "01.01"
gcc2_compiled.:
.section .rodata
.LC0:
.string "The result is %d\n"
.text
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
	pushl $250
	pushl $.LC0
	call printf
	addl $16, %esp
	movl %ebp, %esp
	xorl %eax, %eax
	popl %ebp
	ret
.Lfe1:
.size main,.Lfe1-main
.ident "GCC: (GNU) 2.96 20000731 (Linux-Mandrake 8.0 2.96-0.48mdk)"

