.data
c: .float 3.0

.text
.global FP_EX2A
.type FP_EX2A, "function"

FP_EX2A:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP
			FSUB S4, S0, S1
			FMUL S4, S4, S2
			FADD S5, S3, S0
			LDR S6, c
			FSUB S5, S5, S6
			FDIV S0, S4, S5
			LDP X29, X30, [SP], #16
			RET
