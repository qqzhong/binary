.text
.global INCSAT
.type INCSAT, "function"

INCSAT:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP

		LSR W1, W1, #2
		DUP V1.4S, W2
loop:
		CBZ W1, end
		LDR Q0, [X0]
		SQADD V0.4S, V0.4S, V1.4S
		STR Q0, [X0], #16
		SUB W1, W1, #1
		B loop
end:
		LDP X29, X30, [SP], #16
		RET
