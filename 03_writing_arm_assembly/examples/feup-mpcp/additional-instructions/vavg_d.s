.text
.global VAVG_D
.type VAVG_D, "function"

// Returns the average value of a vector of doublewords

VAVG_D:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP
		MOV X9, #0
		MOV X10, X1
loop:
		CBZ X1, end
		LDR X11, [X0], #8
		ADD X9, X9, X11
		SUB X1, X1, #1
		B loop
end:
		SDIV X0, X9, X10
		LDP X29, X30, [SP], #16
		RET
