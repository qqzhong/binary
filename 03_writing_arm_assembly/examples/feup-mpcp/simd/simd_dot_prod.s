.text
.global SIMD_DOT_PROD
.type SIMD_DOT_PROD, "function"

// Calculates the dot product between two vectors using SIMD. Number of elements in the vectors must be a multiple of 4.

SIMD_DOT_PROD:
				STP X29, X30, [SP, #-16]
				MOV X29, SP

				MOV X9, #0
loop:
				CBZ W2, end
				LDR Q0, [X0], #16
				LDR Q1, [X1], #16
				MUL V2.4S, V0.4S, V1.4S
				ADDV S3, V2.4S
				SMOV X10, V3.S[0]
				ADD X9, X9, X10
				SUB W2, W2, #4
				B loop
end:
				MOV X0, X9
				LDP X29, X30, [SP], #16
				RET
