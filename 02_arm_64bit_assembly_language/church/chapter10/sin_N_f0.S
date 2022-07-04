Listing 10.1 Advanced SIMD implementation of the sin x function using single precision.
// sin_N_f implements the sine function using NEON single
// precision floating point. It computes sine by summing
// the first 8 terms of the Taylor series.
// --------------------------------------------------------------
  .data
  // The following is a table of constants used in the
  // Taylor series approximation for sine
  .align 8 // Align to cache (256-byte boundary)
ctab: .word 0x3F800000 // 1.000000000000000 1/1!
  .word 0xBE2AAAAB // -0.166666671633720 -1/3!
  .word 0x3C088889 // 0.008333333767951 1/5!
  .word 0xB9500D01 // -0.000198412701138 -1/7!
  .word 0x3638EF1D // 0.000002755731884 1/9!
  .word 0xB2D7322B // -0.000000025052108 -1/11!
  .word 0x2F309231 // 0.000000000160590 1/13!
  .word 0xAB573F9F // -0.000000000000765 -1/15!
// --------------------------------------------------------------
  .text
  .align 2
  .global sin_N_f
sin_N_f:// Use vectors of length 4
  // 1) Load the entire coefficient table into v16,v17
  // 2) Calculate powers of x as vectors in v0,v1
  // 3) Multiply powers of x by coefficients
  // 4) Sum the results
  fmul s1,s0,s0 // Put x^2 in s1
  ldr x0,=ctab // load pointer to table
  fmul s2,s1,s1 // Put x^4 in s2
  fmul s4,s0,s1 // Put x^3 in s4
  ld1 {v16.4s},[x0],#16 // load first half of table
  mov v2.2s[1],v2.2s[0] // make vector of x^4,x^4
  mov v0.2s[1],v4.2s[0] // make vector of x^3,x
  ld1 {v17.4s},[x0] // load second half of table
  fmul s5,s2,s2 // put x^8 in s5
  fmul v3.2s,v0.2s,v2.2s // make vector of x^7, x^5
  dup v2.4s,v5.4s[0] // make vector of x^8,x^8,x^8,x^8
  mov v0.2d[1],v3.2d[0] // make vector of x^7,x^5,x^3,x
  fmul v1.4s,v0.4s,v2.4s // make vector of x^15,x^13,x^11,x^9
  fmul v0.4s,v0.4s,v16.4s // calculate first four terms
  fmla v0.4s,v1.4s,v17.4s // accumulate last four terms
  faddp v0.4s,v0.4s,v0.4s // add terms pairwise
  faddp s0,v0.2s // add terms pairwise
  ret
