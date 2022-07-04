.text
.global COUNT_LOWER
.type COUNT_LOWER, "function"

COUNT_LOWER:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			MOV X9, #0
			LSR X1, X1, #2
			DUP V1.4S, V0.S[0]
loop:
			CBZ X1, end
			LDR Q2, [X0], #16
			SUB X1, X1, #1
			FCMGT V0.4S, V1.4S, V2.4S
			ADDV S0, V0.4S
			SMOV X10, V0.S[0]
			SUB X9, X9, X10				// Since X10 is negative (or zero)
			B loop
end:
			MOV X0, X9
			LDP X29, X30, [SP], #16
			RET
