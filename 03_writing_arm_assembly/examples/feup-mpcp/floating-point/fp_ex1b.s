.text
.global FP_EX1B
.type FP_EX1B, "function"

FP_EX1B:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP
			FSQRT D0, D0
			SCVTF D1, W0
			FADD D0, D0, D1
			LDP X29, X30, [SP], #16
			RET
