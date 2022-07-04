.file "cfunctest.c"
.version "01.01"
gcc2_compiled.:
.section .rodata
.align 8
.LC0:
.long 0xf01b866e,0x400921f9

.text
.align 16
.globl circumf
.type circumf,@function
circumf:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl 8(%ebp), %eax
	addl %eax, %eax
	pushl %eax
	fildl (%esp)
	popl %eax
	fldl .LC0
	fmulp %st, %st(1)
	fstps -4(%ebp)
	flds -4(%ebp)
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe1:
.size circumf,.Lfe1-circumf

.section .rodata
.align 8
.LC2:
.long 0xf01b866e,0x400921f9

.text
.align 16
.globl area
.type area,@function
area:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl 8(%ebp), %eax
	imull 8(%ebp), %eax
	pushl %eax
	fildl (%esp)
	popl %eax
	fldl .LC2
	fmulp %st, %st(1)
	fstps -4(%ebp)
	flds -4(%ebp)
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe2:
.size area,.Lfe2-area

.section .rodata
.LC4:
.string "Radius: %d\n"
.LC5:
.string "Circumference: %f\n"
.LC6:
.string "Area: %f\n"

.text
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	movl $10, -4(%ebp)
	subl $8, %esp
	pushl -4(%ebp)
	pushl $.LC4
	call printf
	addl $16, %esp
	subl $4, %esp
	subl $8, %esp
	pushl -4(%ebp)
	call circumf
	addl $12, %esp
	leal -8(%esp), %esp
	fstpl (%esp)
	pushl $.LC5
	call printf
	addl $16, %esp
	subl $4, %esp
	subl $8, %esp
	pushl -4(%ebp)
	call area
	addl $12, %esp
	leal -8(%esp), %esp
	fstpl (%esp)
	pushl $.LC6
	call printf
	addl $16, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe3:
.size main,.Lfe3-main
.ident "GCC: (GNU) 2.96 20000731 (Linux-Mandrake 8.0 2.96-0.48mdk)"
