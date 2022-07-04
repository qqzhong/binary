.text
.global HORNER
.type HORNER, "function"

// Calculates the value of a polynomial using the Horner method

HORNER:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			CMP W1, #1				// Tests if polynomial has a single coefficient (degree 0)
			B.EQ single_coef

			MOV W9, #8
			SMADDL X0, W1, W9, X0	// Moves pointer to end of the coefficient array
			SUB X0, X0, #8			// Ensures we are pointing to the last element and not beyond the array

			FMOV D3, D0
			LDR D1, [X0], #-8		// a(n-1)
			LDR D2, [X0], #-8		// a(n-2)
			SUB W1, W1, #2
			FMADD D0, D1, D3, D2	// a(n-1) * x + a(n-2)
loop:
			CBZ W1, end
			LDR D1, [X0], #-8
			SUB W1, W1, #1
			FMADD D0, D0, D3, D1
			B loop
single_coef:
			LDR D0, [X0]
end:
			LDP X29, X30, [SP], #16
			RET
