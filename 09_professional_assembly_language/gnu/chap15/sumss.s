.file "sums.c"
.version "01.01"
gcc2_compiled.:
.text
.align 16
.globl sums
.type sums,@function
sums:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	movl $0, -8(%ebp)
	movl $1, -4(%ebp)
	.p2align 4,,7
.L3:
	movl -4(%ebp), %eax
	cmpl 8(%ebp), %eax
	jle .L6
	jmp .L4
	.p2align 4,,7
.L6:
	movl -4(%ebp), %eax
	leal -8(%ebp), %edx
	addl %eax, (%edx)
	leal -4(%ebp), %eax
	incl (%eax)
	jmp .L3
	.p2align 4,,7
.L4:
	movl -8(%ebp), %eax
	movl %eax, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe1:
.size sums,.Lfe1-sums
.section .rodata
.LC0:
.string "Value: %d Sum: %d\n"

.text
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	movl $10, -4(%ebp)
	subl $4, %esp
	subl $8, %esp
	pushl -4(%ebp)
	call sums
	addl $12, %esp
	movl %eax, %eax
	pushl %eax
	pushl -4(%ebp)
	pushl $.LC0
	call printf
	addl $16, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe2:
.size main,.Lfe2-main
.ident "GCC: (GNU) 2.96 20000731 (Linux-Mandrake 8.0 2.96-0.48mdk)"

