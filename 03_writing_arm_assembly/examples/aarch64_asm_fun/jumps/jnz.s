.text

.globl main

hello:
	mov x0, #0
	ret

main:
	// mov rax, 1
	mov x0, #1
	// sub rax, 1
	add x0, x0, #-1
	// jz hello
	cmp x0, #0
	beq hello
	ret
