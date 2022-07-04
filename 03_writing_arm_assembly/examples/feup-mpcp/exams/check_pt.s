.data
const1: .double 1.0

.text
.global CHECK_PT
.type CHECK_PT, "function"

// Checks if a point (x, y) is inside a region bound by x >= 0, y >= 0 and x^2 + y^2 <= 1. Returns 0 if outside, 1 if inside.

CHECK_PT:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			FCMP D0, #0.0
			B.LT outside
			FCMP D1, #0.0
			B.LT outside

			FMUL D2, D0, D0			// x^2
			FMADD D2, D1, D1, D2	// x^2 + y^2
			LDR D3, const1
			FCMP D2, D3
			B.GT outside

			MOV W0, #1
			B end
outside:
			MOV W0, #0
end:
			LDP X29, X30, [SP], #16
			RET
