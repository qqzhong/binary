.text
.global DISTANCE
.type DISTANCE, "function"

// Calculates the distance between two points (x1, y1) and (x2, y2)

DISTANCE:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			FSUB D4, D0, D2
			FMUL D4, D4, D4
			FSUB D5, D1, D3
			FMADD D4, D5, D5, D4
			FSQRT D0, D4

			LDP X29, X30, [SP], #16
			RET
