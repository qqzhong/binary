.text
.global MIN_BITS
.type MIN_BITS, "function"

// Returns the minimum number of bits required to represent a number in two's complement

MIN_BITS:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP
			CLS W9, W0
			SUB W9, W9, #32
			NEG W9, W9
			MOV W0, W9
			LDP X29, X30, [SP], #16
			RET
