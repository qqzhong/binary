.section .data
packedvalue1:
.byte 10, 20, -30, 40, 50, 60, -70, 80
packedvalue2:
.short 10, 20, 30, 40
packedvalue3:
.int 10, 20
.section .text
.globl _start
_start:
	movq packedvalue1, %mm0
	movq packedvalue2, %mm1
	movq packedvalue3, %mm2

