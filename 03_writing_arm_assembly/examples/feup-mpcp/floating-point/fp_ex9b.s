.data
const180: .double 180.0
const100: .double 100.0
const50: .double 50.0
pi: .double 3.141592653

.text
.global FP_EX9B
.type FP_EX9B, "function"

// Calculates the value of the expression 100 + 50 * cos(x), using the COSINE subroutine (x in degrees, has to be converted)

FP_EX9B:
			STP X29, X30, [SP], #-16
			MOV X29, SP

			LDR D1, const180
			LDR D2, pi

			FDIV D0, D0, D1
			FMUL D0, D0, D2

			BL COSINE

			LDR D1, const100
			LDR D2, const50
			FMADD D0, D0, D2, D1

			LDP X29, X30, [SP], #16
			RET

