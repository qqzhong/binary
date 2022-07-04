# ifthen.s
.file "ifthen.c"
.section .rodata
.LC0:
.string "The higher value is %d\n"
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
	movl $100, -4(%ebp)
	movl $25, -8(%ebp)
	movl -4(%ebp), %eax
	cmpl -8(%ebp), %eax
	jle .L2
	movl -4(%ebp), %eax
	movl %eax, 4(%esp)
	movl $.LC0, (%esp)
	call printf
	jmp .L3
.L2:
	movl -8(%ebp), %eax
	movl %eax, 4(%esp)
	movl $.LC0, (%esp)
	call printf
.L3:
	movl $0, (%esp)
	call exit
.size main, .-main
.section .note.GNU-stack,"",@progbits
.ident "GCC: (GNU) 3.3.2 (Debian)"
