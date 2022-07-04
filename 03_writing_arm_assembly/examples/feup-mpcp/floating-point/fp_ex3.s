.data
const1: .float 1.5
const2: .float -12.5
const3: .float 7.0
startval: .float 0.0
step: .float 0.1

.text
.global FP_EX3
.type FP_EX3, "function"

// Calculates the polynomial 1.5x^3 - 12.5x + 7 for values (0, 0.1, 0.2, ..., 9.9, 10) storing them in a float array

FP_EX3:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP

		MOV X1, #101
		LDR S0, startval
		LDR S1, step
loop:
		CBZ X1, fim
		FMUL S2, S0, S0
		FMUL S2, S2, S0
		LDR S3, const1
		FMUL S2, S2, S3
		LDR S3, const2
		FMADD S2, S0, S3, S2
		LDR S3, const3
		FADD S2, S2, S3
		STR S2, [X0], #4
		FADD S0, S0, S1
		SUB X1, X1, #1
		B loop
fim:
		LDP X29, X30, [SP], #16
		RET
