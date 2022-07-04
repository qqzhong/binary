.text

.globl main
main:
	mov w0, #-4
	mov w1, #4
	add w0, w1, wzr
	ret

// Expect 4, since w0 will be overwritten.

