// Okay, we should *properly* exit now.
.global main
.text
main:
	// Write is 64.
	mov x8, #64
	// Give the string to use...
	adr x1, hellostr
	// x2 needs to string length.
	mov x2, #14
	// x0 needs to be file number. In this case, stdout, which is 1.
	mov x0, 1
	svc 0

	// 93 is the syscall number for exit.
	mov x8, #93
	svc 0

.data
hellostr:
	.ascii "Hello, world!\n"
