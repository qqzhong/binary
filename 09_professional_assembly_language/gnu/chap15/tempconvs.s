.file "tempconv.c"
.version "01.01"
gcc2_compiled.:
.section .rodata
.align 8
.LC0:
.long 0x0,0x40400000
.align 8
.LC1:
.long 0xcccccccd,0x3ffccccc
.text
.align 16
.globl convert
.type convert,@function
convert:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	fildl 8(%ebp)
	fldl .LC0
	fsubrp %st, %st(1)
	fldl .LC1
	fdivrp %st, %st(1)
	fstps -4(%ebp)
	flds -4(%ebp)
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe1:
.size convert,.Lfe1-convert
.section .rodata
.align 32
.LC3:
.string " Temperature Conversion Chart\n"
.LC4:
.string "Fahrenheit Celsius\n"
.LC5:
.string " %d %5.2f\n"
.text
.align 16
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	movl $0, -4(%ebp)
	subl $12, %esp
	pushl $.LC3
	call printf
	addl $16, %esp
	subl $12, %esp
	pushl $.LC4
	call printf
	addl $16, %esp
	movl $0, -4(%ebp)
	.p2align 4,,7
.L4:
	cmpl $229, -4(%ebp)
	jle .L7
	jmp .L5
	.p2align 4,,7
	.L7:
	subl $12, %esp
	pushl -4(%ebp)
	call convert
	addl $16, %esp
	fstps -8(%ebp)
	flds -8(%ebp)
	leal -8(%esp), %esp
	fstpl (%esp)
	pushl -4(%ebp)
	pushl $.LC5
	call printf
	addl $16, %esp
	leal -4(%ebp), %eax
	addl $10, (%eax)
	jmp .L4
	.p2align 4,,7
.L5:
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.Lfe2:
.size main,.Lfe2-main
.ident "GCC: (GNU) 2.96 20000731 (Linux-Mandrake 8.0 2.96-0.48mdk)"

// as –o tempconv.o tempconv2.s
// ld –dynamic-linker /lib/ld-linux.so.2 –lc –o tempconv tempconv.s
// gcc –o tempconv tempconv2.s
