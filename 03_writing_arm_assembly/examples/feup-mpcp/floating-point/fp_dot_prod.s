.data
zero: .double 0.0

.text
.global FP_DOT_PROD
.type FP_DOT_PROD, "function"

// Calculates the dot product of two floating point vectors

FP_DOT_PROD:
				STP X29, X30, [SP, #-16]!
				MOV X29, SP
				LDR D0, zero
loop:
				CBZ W2, end
				LDR S1, [X0], #4
				LDR S2, [X1], #4
				SUB W2, W2, #1
				FCVT D1, S1
				FCVT D2, S2
				FMADD D0, D1, D2, D0
				B loop
end:
				LDP X29, X30, [SP], #16
				RET
