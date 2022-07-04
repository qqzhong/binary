# for.s
.file "for.c"
.section .rodata
.LC0:
.string "The answer is %d\n"
.text
.globl main
.type main, @function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
	andl $-16, %esp
	movl $0, %eax
	subl %eax, %esp
	movl $0, -4(%ebp)
	movl $0, -4(%ebp)
.L2:
	cmpl $999, -4(%ebp)
	jle .L5
	jmp .L3
.L5:
	movl -4(%ebp), %edx
	movl %edx, %eax
	sall $2, %eax
	addl %edx, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl %eax, 4(%esp)
	movl $.LC0, (%esp)
	call printf
	leal -4(%ebp), %eax
	incl (%eax)
	jmp .L2
.L3:
	movl $0, (%esp)
	call exit
.size main, .-main
.section .note.GNU-stack,"",@progbits
.ident "GCC: (GNU) 3.3.2 (Debian)"
