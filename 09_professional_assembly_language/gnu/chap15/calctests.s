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
	subl $24, %esp
	movl $10, -4(%ebp)
	leal -4(%ebp), %eax
	addl $15, (%eax)
	movl -4(%ebp), %eax
	addl $200, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	addl -4(%ebp), %eax
	movl %eax, -12(%ebp)
	subl $8, %esp
	pushl -12(%ebp)
	pushl $.LC0
	call printf
	addl $16, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe1:
.size main,.Lfe1-main
.ident "GCC: (GNU) 2.96 20000731 (Linux-Mandrake 8.0 2.96-0.48mdk)"

// $ gcc –O3 –S –o calctest2.s calctest.c
