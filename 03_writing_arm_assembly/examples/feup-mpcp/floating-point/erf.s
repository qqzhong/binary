.text
.global ERF
.type ERF, "function"

// By taking advantage of the fact that the erf function is odd, calculates it for any value of x using the ERFPOS subroutine

ERF:
		STP X29, X30, [SP, #-16]!
		MOV X29, SP

		FCMP D0, #0.0
		B.LT neg
		BL ERFPOS
		B end
neg:
		FABS D0, D0
		BL ERFPOS
		FNEG D0, D0
end:
		LDP X29, X30, [SP], #16
		RET
