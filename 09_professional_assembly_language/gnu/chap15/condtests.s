.file "condtest.c"
.version "01.01"
gcc2_compiled.:
.text
.align 16
.globl conditiontest
.type conditiontest,@function
conditiontest:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl 8(%ebp), %eax
	cmpl 12(%ebp), %eax
	jle .L3
	movl 8(%ebp), %eax
	movl %eax, -4(%ebp)
	jmp .L4
	.p2align 4,,7
.L3:
	movl 8(%ebp), %eax
	cmpl 12(%ebp), %eax
	jge .L5
	movl 12(%ebp), %eax
	movl %eax, -4(%ebp)
	jmp .L4
	.p2align 4,,7
.L5:
	movl $0, -4(%ebp)
.L4:
	movl -4(%ebp), %eax
	movl %eax, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe1:
.size conditiontest,.Lfe1-conditiontest
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
	subl $8, %esp
	movl $10, -4(%ebp)
	movl $30, -8(%ebp)
	subl $8, %esp
	pushl -8(%ebp)
	pushl -4(%ebp)
	call conditiontest
	addl $8, %esp
	movl %eax, %eax
	pushl %eax
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

