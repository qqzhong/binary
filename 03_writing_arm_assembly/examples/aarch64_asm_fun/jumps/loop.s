.data
count:
	// Word is 32-bits.
	.word 0x00000000


.text
.global main
b main
loop:
	mov x2, #0
inloop:
	add x2, x2, #1
	cmp x2, #6
	bne inloop
main:
	// Exit cleanly (on linux, at least...)
	mov x0, x2
	mov x8, #93
	svc #0
