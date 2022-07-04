.file "asmtest.c"
.section .rodata
.LC0:
.string "The result is %d\n"
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
	movl $10, -4(%ebp)
	movl $20, -8(%ebp)
	movl -4(%ebp), %eax
	imull -8(%ebp), %eax
	movl %eax, -12(%ebp)
	#APP
	nop
	#NO_APP
	movl -12(%ebp), %eax
	movl %eax, 4(%esp)
	movl $.LC0, (%esp)
	call printf
	movl $0, %eax
	leave
	ret
.size main, .-main
.section .note.GNU-stack,"",@progbits
.ident "GCC: (GNU) 3.3.2 (Debian)"
