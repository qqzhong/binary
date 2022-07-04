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
.align 8
.LC0:
.long 0xf01b866e,0x400921f9
.text
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
	movl $100, -4(%ebp)
	movl $0x43484000, -8(%ebp)
	movl -4(%ebp), %eax
	addl global1, %eax
	movl %eax, -12(%ebp)
	flds global2
	fadds -8(%ebp)
	fstps -16(%ebp)
	flds -16(%ebp)
	leal -8(%esp), %esp
	fstpl (%esp)
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
