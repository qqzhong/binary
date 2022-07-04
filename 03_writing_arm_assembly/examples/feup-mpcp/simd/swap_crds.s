.text
.global SWAP_CRDS
.type SWAP_CRDS, "function"

// Given an array of 2n floats {x1, y1, x2, y2, ..., xn, yn} representing coordinates of n points, swaps the x and y coordinates
// for each point.

SWAP_CRDS:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			LSR W1, W1, #2
loop:
			CBZ W1, end
			LDR Q0, [X0]
			REV64 V0.4S, V0.4S
			STR Q0, [X0], #16
			SUB W1, W1, #1
			B loop
end:
			LDP X29, X30, [SP], #16
			RET
