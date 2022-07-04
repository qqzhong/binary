.text
.global VMAX_D
.type VMAX_D, "function"

// Returns the maximum value in a vector of doublewords

VMAX_D:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP
		LDR X9, [X0], #8
loop:
		SUB X1, X1, #1
		CBZ X1, end
		LDR X10, [X0], #8
		CMP X10, X9
		CSEL X9, X10, X9, GT
		B loop
end:
		MOV X0, X9
		LDP X29, X30, [SP], #16
		RET
