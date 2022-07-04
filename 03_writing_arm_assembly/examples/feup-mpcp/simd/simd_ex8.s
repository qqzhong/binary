.text
.global SIMD_EX8
.type SIMD_EX8, "function"

SIMD_EX8:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			LSR W2, W2, #2
			DUP V3.4S, V0.S[0]
loop:
			CBZ W2, end
			LDR Q1, [X0], #16
			LDR Q2, [X1]
			FABS V1.4S, V1.4S
			FMUL V1.4S, V3.4S, V1.4S
			FSUB V2.4S, V2.4S, V1.4S
			STR Q2, [X1], #16
			SUB W2, W2, #1
			B loop
end:
			LDP X29, X30, [SP], #16
			RET
