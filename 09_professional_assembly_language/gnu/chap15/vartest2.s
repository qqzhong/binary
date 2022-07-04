.file "vartest.c"
.version "01.01"
gcc2_compiled.:
.globl global1
.data
.align 4
.type global1,@object
.size global1,4
global1:
.long 10
.globl global2
.align 4
.type global2,@object
.size global2,4
global2:
.long 0x41a20000
.section .rodata
.LC1:
.string "The results are %d and %f\n"
.align 4
.LC0:
.long 0x43484000
.text
.align 16
.globl main
.type main,@function
main:
	flds global2
	pushl %ebp
	movl global1, %eax
	fadds .LC0
	movl %esp, %ebp
	addl $100, %eax
	subl $16, %esp
	fstpl (%esp)
	pushl %eax
	pushl $.LC1
	call printf
	addl $16, %esp
	movl %ebp, %esp
	xorl %eax, %eax
	popl %ebp
	ret
.Lfe1:
.size main,.Lfe1-main
.ident "GCC: (GNU) 2.96 20000731 (Linux-Mandrake 8.0 2.96-0.48mdk)"
