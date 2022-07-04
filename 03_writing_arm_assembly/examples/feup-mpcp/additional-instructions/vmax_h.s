.text
.global VMAX_H
.type VMAX_H, "function"

// Returns the maximum value in a vector of halfwords

VMAX_H:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP
		LDRSH W9, [X0], #2
loop:
		SUB X1, X1, #1
		CBZ X1, end
		LDRSH W10, [X0], #2
		CMP W10, W9
		CSEL W9, W10, W9, GT
		B loop
end:
		MOV W0, W9
		LDP X29, X30, [SP], #16
		RET
