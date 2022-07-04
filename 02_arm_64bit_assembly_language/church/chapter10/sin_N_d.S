Listing 10.2 Advanced SIMD implementation of the sin x function using double
precision.
// sin_N_d implements the sine function using Advanced SIMD
// double precision vector instructions. It computes sine by
// summing the first 11 terms of the Taylor series.
// --------------------------------------------------------------
  .data
  // The following is a table of constant coefficients used in
  // the Taylor series approximation for sine
.align 8 // Align to cache (256-byte boundary)
ctab: .dword 0xBFC5555555555555 // -0.1666666666666666574 -1/3!
  .dword 0x3F81111111111111 // 0.0083333333333333332 1/5!
  .dword 0xBF2A01A01A01A01A // -0.0001984126984126984 -1/7!
  .dword 0x3EC71DE3A556C734 // 0.0000027557319223986 1/9!
  .dword 0xBE5AE64567F544E4 // -0.0000000250521083854 -1/11!
  .dword 0x3DE6124613A86D09 // 0.0000000001605904384 1/13!
  .dword 0xBD6AE7F3E733B81F // -0.0000000000007647164 -1/15!
  .dword 0x3CE952C77030AD4A // 0.0000000000000028115 1/17!
  .dword 0xBC62F49B46814157 // -0.0000000000000000082 -1/19!
  .dword 0x3BD71B8EF6DCF572 // 0.0000000000000000000 1/21!
// --------------------------------------------------------------
  .text
  .align 2
  .global sin_N_d
sin_N_d:// Use vectors of length 2
  // 1) Load the entire coefficient table into v16-v20
  // 2) Create vectors for powers of x as needed
  // 3) Multiply powers of x by coefficients
  // 4) Accumulate the results
  ldr x0,=ctab // load pointer to table
  fmul d1,d0,d0 // Put x^2 in d1
  ld1 {v16.2d},[x0],#16// load first part
  fmul d2,d1,d1 // Put x^4 in d2
  ld1 {v17.2d},[x0],#16// load second part of table
  fmul d4,d0,d1 // Put x^3 in d4
  ld1 {v18.2d},[x0],#16// load third part of table
  mov v2.2d[1],v2.2d[0] // make vector of x^4
  fmul d3,d4,d1 // Put x^5 in d3
  ld1 {v19.2d},[x0],#16// load fourth part of table
  mov v4.2d[1],v3.2d[0] // Copy x^5 to v4[1]
  ld1 {v20.2d},[x0],#16// load fifth part of table
  // We have a vector containing x^3 and x^5 in v4,
  // Start creating remaining powers, two at a time,
  // multiplying the powers by the coefficients, and
  // accumulating the results.
  fmul v5.2d,v4.2d,v2.2d // get x^7 and x^9
  fmul v4.2d,v4.2d,v16.2d // get terms 2 and 3
  fmul v6.2d,v5.2d,v2.2d // get x^11 and x^13
  fmla v4.2d,v5.2d,v17.2d // accumulate terms 4 and 5
  fmul v7.2d,v6.2d,v2.2d // get x^14 and x^15
  fmla v4.2d,v6.2d,v18.2d // accumulate terms 6 and 7
  fmul v5.2d,v7.2d,v2.2d // get x^16 and x^17
  fmla v4.2d,v7.2d,v19.2d // accumulate terms 8 and 9
  fmla v4.2d,v5.2d,v20.2d // accumulate terms 11 and 13
  faddp d2,v4.2d // add terms 2-7 together
  fadd d0,d0,d2 // add result to term 1
  ret
