.data
pi: .double 3.141592653

.text
.global AREA_CIRCLE
.type AREA_CIRCLE, "function"

// Calculates the area of a circle with the given radius

AREA_CIRCLE:
				STP X29, X30, [SP, #-16]!
				MOV X29, SP

				FMUL D0, D0, D0
				LDR D1, pi
				FMUL D0, D0, D1

				LDP X29, X30, [SP], #16
				RET
