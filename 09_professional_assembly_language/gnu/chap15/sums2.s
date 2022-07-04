.file "sums.c"
.version "01.01"
gcc2_compiled.:
.section .rodata
.LC0:
.string "Value: %d Sum: %d\n"
.text
.align 16
.globl sums
.type sums,@function
sums:
	pushl %ebp
	movl $1, %edx
	movl %esp, %ebp
	xorl %eax, %eax
	movl 8(%ebp), %ecx
	cmpl %ecx, %edx
	jg .L30
	.p2align 4,,7
.L21:
	addl %edx, %eax
	incl %edx
	cmpl %ecx, %edx
	jle .L21
.L30:
	popl %ebp
	ret
.Lfe1:
.size sums,.Lfe1-sums
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	xorl %edx, %edx
	movl %esp, %ebp
	movl $1, %eax
	subl $12, %esp
	.p2align 4,,7
.L26:
	addl %eax, %edx
	incl %eax
	cmpl $10, %eax
	jle .L26
	pushl %edx
	pushl $10
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
