.text
.global FP_EX1A
.type FP_EX1A, "function"

// Does the equivalent of -D1 * (D0 + D2)

FP_EX1A:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP
			FADD D0, D0, D2
			FNMUL D0, D0, D1
			LDP X29, X30, [SP], #16
			RET
