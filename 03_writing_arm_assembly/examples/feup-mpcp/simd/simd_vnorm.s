.data
zero: .double 0.0

.text
.global SIMD_VNORM
.type SIMD_VNORM, "function"

// Calculates the norm of a vector (floating point). Number of elements of the vector must be a multiple of 2.

SIMD_VNORM:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			LDR D9, zero
			LSR X1, X1, #1
loop:
			CBZ X1, end
			LDR Q0, [X0], #16
			FMUL V0.2D, V0.2D, V0.2D
			FADDP D10, V0.2D
			FADD D9, D9, D10
			SUB X1, X1, #1
			B loop
end:
			FSQRT D0, D9
			LDP X29, X30, [SP], #16
			RET
