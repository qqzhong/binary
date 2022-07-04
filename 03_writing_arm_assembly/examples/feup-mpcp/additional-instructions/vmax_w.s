.text
.global VMAX_W
.type VMAX_W, "function"

// Returns the maximum value in a vector of words

VMAX_W:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP
		LDR W9, [X0], #4
loop:
		SUB X1, X1, #1
		CBZ X1, end
		LDR W10, [X0], #4
		CMP W10, W9
		CSEL W9, W10, W9, GT
		B loop
end:
		MOV W0, W9
		LDP X29, X30, [SP], #16
		RET
