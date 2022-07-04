//Listing 9.2 Simple scalar implementation of the sin x function using IEEE double precision.
//*************************************************************
// Name: sincos_a_f.S
// Author: Larry Pyeatt
// Date: 2/22/2018
//*************************************************************
// This is a version of the sin functions that uses double
// precision floating point with the FP/NEON instruction set.
// ---------------------------------------------------------------
  .data
  // The following is a table of constants used in the
  // Taylor series approximation for sine
  .align 6 // Align for efficient caching
ctab: .word 0x55555555, 0xBFC55555 // -1.666666666666667e-01 (-1/3!)
  .word 0x11111111, 0x3F811111 // 8.333333333333333e-03 (1/5!)
  .word 0x1A01A01A, 0xBF2A01A0 // -1.984126984126984e-04 (-1/7!)
  .word 0xA556C734, 0x3EC71DE3 // 2.755731922398589e-06 (1/9!)
  .word 0x67F544E4, 0xBE5AE645 // -2.505210838544172e-08
  .word 0x13A86D09, 0x3DE61246 // 1.605904383682161e-10
  .word 0xE733B81F, 0xBD6AE7F3 // -7.647163731819816e-13
  .word 0x7030AD4A, 0x3CE952C7 // 2.811457254345521e-15
  .word 0x46814157, 0xBC62F49B // -8.220635246624329e-18
  .equ TERMS,((. - ctab)/8)
// ---------------------------------------------------------------
  .text
  .align 2
// double sin_a_d(double x)
// sin_a_f_d implements the sine function using IEEE
// double precision floating point. It computes sine
// by summing the first ten terms of the Taylor series.
  .global sin_a_d
sin_a_d:// d0 contains x
  ldr x0,=ctab // load pointer to coefficient table
  // initialize variables
  fmul d1,d0,d0 // d1 <- x^2
  fmov d3,d0 // d3 <- x
  mov x3,#TERMS // load loop counter
  // loop over table
loop: fmul d3,d1,d3 // d4 <- x^(2n+1)
  ldr d4,[x0],#8 // load coefficient and increment pointer
  subs x3,x3,#1 // decrement and test loop counter
  fmadd d0,d3,d4,d0 // d0 += next term
  bne loop // loop nine times
  ret
