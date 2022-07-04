.text
.global COUNT_INTERVAL
.type COUNT_INTERVAL, "function"

// Counts the number of floating point numbers in an array that are within the given interval [a, b]

COUNT_INTERVAL:
				STP X29, X30, [SP, #-16]!
				MOV X29, SP
				MOV X9, #0
loop:
				CBZ X1, end
				LDR S2, [X0], #4
				FCMP S2, S0
				B.LT continue
				FCMP S2, S1
				CINC X9, X9, LE
continue:
				SUB X1, X1, #1
				B loop
end:
				MOV X0, X9
				LDP X29, X30, [SP], #16
				RET
