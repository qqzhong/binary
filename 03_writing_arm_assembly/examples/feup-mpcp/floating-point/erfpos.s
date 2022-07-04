.data
const_a1: .double 0.278393
const_a2: .double 0.230389
const_a3: .double 0.000972
const_a4: .double 0.078108
const1: .double 1.0

.text
.global ERFPOS
.type ERFPOS, "function"

// Calculates the erf(x) function for a positive value of x

ERFPOS:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP

		LDR D1, const1

		LDR D2, const_a1
		FMADD D2, D2, D0, D1	// 1 + a1 * x

		LDR D3, const_a2
		FMUL D3, D3, D0			// a2 * x
		FMADD D2, D3, D0, D2	// 1 + a1 * x + a2 * x^2

		LDR D3, const_a3
		FMUL D3, D3, D0			// a3 * x
		FMUL D3, D3, D0			// a3 * x^2
		FMADD D2, D3, D0, D2	// 1 + a1 * x + a2 * x^2 + a3 * x^3

		LDR D3, const_a4
		FMUL D3, D3, D0			// a4 * x
		FMUL D3, D3, D0			// a4 * x^2
		FMUL D3, D3, D0			// a4 * x^3
		FMADD D2, D3, D0, D2	// 1 + a1 * x + a2 * x^2 + a3 * x^3 + a4 * x^4

		FMUL D2, D2, D2
		FMUL D2, D2, D2
		FDIV D2, D1, D2
		FSUB D0, D1, D2

		LDP X29, X30, [SP], #16
		RET

