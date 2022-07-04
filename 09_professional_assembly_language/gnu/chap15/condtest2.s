.file "condtest.c"
.version "01.01"
gcc2_compiled.:
.section .rodata
.LC0:
.string "The result is %d\n"
.text
.align 16
.globl conditiontest
.type conditiontest,@function
conditiontest:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %edx
	movl 12(%ebp), %ecx
	movl %edx, %eax
	cmpl %ecx, %edx
	jg .L19
	xorl %eax, %eax
	cmpl %ecx, %edx
	setge %al
	decl %eax
	andl %ecx, %eax
.L19:
	popl %ebp
	ret
.Lfe1:
.size conditiontest,.Lfe1-conditiontest
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
	pushl $30
	pushl $.LC0
	call printf
	addl $16, %esp
	movl %ebp, %esp
	xorl %eax, %eax
	popl %ebp
	ret
.Lfe2:
.size main,.Lfe2-main
.ident "GCC: (GNU) 2.96 20000731 (Linux-Mandrake 8.0 2.96-0.48mdk)"
