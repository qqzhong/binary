.text
.global SIMD_VSCM
.type SIMD_VSCM, "function"

// Multiplies a vector of floats by a given float scalar k
// The number of elements of each vector must be a multiple of 4

SIMD_VSCM:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP
loop:
			CBZ W1, end
			LDR Q1, [X0]
			FMUL V1.4S, V1.4S, V0.4S[0]
			STR Q1, [X0], #16
			SUB W1, W1, #4
			B loop
end:
			LDP X29, X30, [SP], #16
			RET
