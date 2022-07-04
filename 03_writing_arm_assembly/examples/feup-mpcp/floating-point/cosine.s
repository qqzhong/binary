.data
one:	.double 1.0
const1: .double 0.5
const2: .double 0.041666666666667
const3: .double 0.001388888888889
const4: .double 2.48015873015873e-5
const5: .double 2.75573192239859e-7

.text
.global COSINE
.type COSINE, "function"

// Approximates the cosine of an angle given in radians (0 to pi/2)

COSINE:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			LDR D1, const5
			LDR D2, const4
			FMUL D0, D0, D0
			FMSUB D1, D0, D1, D2

			LDR D2, const3
			FMSUB D1, D0, D1, D2

			LDR D2, const2
			FMSUB D1, D0, D1, D2

			LDR D2, const1
			FMSUB D1, D0, D1, D2

			LDR D2, one
			FMSUB D1, D0, D1, D2

			FMOV D0, D1

			LDP X29, X30, [SP], #16
			RET

