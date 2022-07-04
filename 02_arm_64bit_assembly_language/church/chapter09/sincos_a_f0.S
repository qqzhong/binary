//Listing 9.1 Simple scalar implementation of the sin x function using IEEE single precision.
//*************************************************************
// Name: sincos_a_f.S
// Author: Larry Pyeatt
// Date: 2/22/2018
//*************************************************************
// This is a version of the sin functions that uses single
// precision floating point with the FP/NEON instruction set.
// --------------------------------------------------------------
  .data
  // The following is a table of constants used in the
  // Taylor series approximation for sine
  .align 5 // Align to cache
ctab: .word 0xBE2AAAAA // -1.666666e-01
  .word 0x3C088889 // 8.333334e-03
  .word 0xB9500D00 // -1.984126e-04
  .word 0x3638EF1D // 2.755732e-06
  .word 0xB2D7322A // -2.505210e-08
  .equ TERMS,((. - ctab)/4)
// --------------------------------------------------------------
  .text
  .align 2
  // float sin_a_f(x)
  // sin_a_f implements the sine function using IEEE single
  // precision floating point. It computes sine by summing
  // the first six terms of the Taylor series.
  .global sin_a_f
sin_a_f:// register s0 contains x
  // initialize variables
  fmul s1,s0,s0 // s1 <- x^2
  fmov s3,s0 // s3 <= x
  ldr x0,=ctab // load pointer to coefficients
  mov x3,#TERMS // load loop counter
  // loop over table
loop: fmul s3,s1,s3 // s3 <- x^(2n+1)
  ldr s4,[x0],#4 // load coefficient and increment pointer
  subs x3,x3,#1 // decrement and test loop count
  fmadd s0,s3,s4,s0 // s0 += next term
  bne loop // loop five times
  ret
