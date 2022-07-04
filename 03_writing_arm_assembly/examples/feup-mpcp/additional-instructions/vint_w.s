.text
.global VINT_W
.type VINT_W, "function"

// Returns the number of values in a vector that are in the interval [a, b]

VINT_W:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP
			MOV X9, #0
loop:
			CBZ X1, end
			LDR W10, [X0], #4
			CMP W10, W2
			B.LT continue
			CMP W10, W3
			B.GT continue
			ADD X9, X9, #1
continue:
			SUB X1, X1, #1
			B loop
end:
			MOV X0, X9
			LDP X29, X30, [SP], #16
			RET
