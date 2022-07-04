.file "globaltest.c"
.globl a
.data
.align 4
.type a, @object
.size a, 4
a:
.long 10
.globl b
.align 4
.type b, @object
.size b, 4
b:
.long 20
.section .rodata
.LC0:
.string "The result is %d\n"
.text
.globl main
.type main, @function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	andl $-16, %esp
	movl $0, %eax
	subl %eax, %esp
	#APP
	pusha
	movl a, %eax
	movl b, %ebx
	imull %ebx, %eax
	movl %eax, result
	popa
	#NO_APP
	movl result, %eax
	movl %eax, 4(%esp)
	movl $.LC0, (%esp)
	call printf
	movl $0, %eax
	leave
	ret
.size main, .-main
.comm result,4,4
.section .note.GNU-stack,"",@progbits
.ident "GCC: (GNU) 3.3.2 (Debian)"
