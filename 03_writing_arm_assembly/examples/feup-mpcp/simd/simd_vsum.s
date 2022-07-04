.text
.global SIMD_VSUM
.type SIMD_VSUM, "function"

// Calculates the sum of two float vectors and stores it in a third vector using SIMD
// The number of elements of each vector must be a multiple of 4

SIMD_VSUM:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

loop:
			CBZ W3, end
			LDR Q0, [X0], #16
			LDR Q1, [X1], #16
			FADD V0.4S, V0.4S, V1.4S
			STR Q0, [X2], #16
			SUB W3, W3, #4
			B loop
end:
			LDP X29, X30, [SP], #16
			RET
