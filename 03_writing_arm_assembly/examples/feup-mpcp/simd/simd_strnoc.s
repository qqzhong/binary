.text
.global SIMD_STRNOC
.type SIMD_STRNOC, "function"

SIMD_STRNOC:
				STP X29, X30, [SP, #-16]!
				MOV X29, SP

				MOV X9, #0
				LSR X1, X1, #4
				DUP V1.16B, W2
loop:
				CBZ X1, end
				LDR Q0, [X0], #16
				CMEQ V2.16B, V0.16B, V1.16B
				ADDV B3, V2.16B
				SMOV X10, V3.B[0]
				NEG X10, X10
				ADD X9, X9, X10
				SUB X1, X1, #1
				B loop
end:
				MOV X0, X9
				LDP X29, X30, [SP], #16
				RET
