.text
.global SIMD_VMSUB
.type SIMD_VMSUB, "function"

// Calculates P - k * Q, where P and Q are float vectors and k is a scalar, and stores it in a third vector.
// Number of elements in the vectors must be a multiple of 4.

SIMD_VMSUB:
			STP X29, X30, [SP, #-16]!
			MOV X29, SP

			// Store arguments in protected registers
			MOV X20, X0
			MOV X21, X1
			MOV X22, X2
			MOV W23, W3

			// Preparation for SIMD_VSCM subroutine (scalar multiplication)
			MOV X0, X21
			MOV W1, W23
			FNEG S0, S0

			BL SIMD_VSCM

			// Preparation for SIMD_VSUM subroutine (vector addition)
			MOV X0, X20
			MOV X1, X21
			MOV X2, X22
			MOV W3, W23

			BL SIMD_VSUM

			LDP X29, X30, [SP], #16
			RET
