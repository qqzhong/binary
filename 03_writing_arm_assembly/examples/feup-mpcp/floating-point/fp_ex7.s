.data
pi: .double 3.141592653
const1: .double 1.0
const4: .double 4.0

.text
.global FP_EX7
.type FP_EX7, "function"

// Calculates the piecewise function sqrt((x + pi)^3) for x >= 0 and 1/sqrt(4 - x) for x < 0

FP_EX7:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP

		FCMP D0, #0.0
		B.LT func2

		LDR D1, pi
		FADD D0, D0, D1
		FMUL D1, D0, D0
		FMUL D0, D0, D1
		FSQRT D0, D0
		B end
func2:
		LDR D1, const1
		LDR D2, const4
		FSUB D0, D2, D0
		FSQRT D0, D0
		FDIV D0, D1, D0
end:
		LDP X29, X30, [SP], #16
		RET
