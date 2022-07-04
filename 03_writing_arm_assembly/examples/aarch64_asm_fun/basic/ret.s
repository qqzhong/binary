// In contrast to the x86, we use this for comments?
.text

.globl main

// We need to specify a constant using the hashtag/pound/thing.
main:
	// On Aarch64, w0 is basically %eax on x86.
	mov w0, #2
	ret

