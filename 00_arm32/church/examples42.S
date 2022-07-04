// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s42.html
// Modified by Church.ZHONG
.section .text
.global main
.type main, % function
main:
  /* Function Prelude: complete the stack frame structure */
  push {lr}    // Save LR (return address)
  push {fp}    // Save FP (used by caller)
  mov  fp, sp  // Mark the stack top location before
         // allocating any local variables
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  iiPrint(Q,R)

#if 0
   Q = 0;
   R = A;

   while ( R >= B )
   {
      Q = Q + 1;
      R = R - B;
   }
Sample execution: A = 19, B = 4   (quotient A/B = 4, remainder A/B = 3)

     Initial values   Iter 1  Iter 2  Iter 3  Iter 4
     ---------------  ------  ------  ------  ------
  Q      0         1       2       3       4
  R     19 (A)    15      11       7       3
#endif
// Assembler code for the example while-statement
  // Q = 0;
  movw    r0, #:lower16:Q
  movt    r0, #:upper16:Q   // r0 = addr(Q)
  mov     r1, #0

  str     r1, [r0]    // Q = 0;

  // R = A;
  movw    r0, #:lower16:A
  movt    r0, #:upper16:A   // r0 = addr(A)
  ldr     r1, [r0]    // r1 = A;

  movw    r0, #:lower16:R
  movt    r0, #:upper16:R   // r0 = addr(R)
  str     r1, [r0]    // R = A;

while:
  // test  R >= B
  movw    r0, #:lower16:R
  movt    r0, #:upper16:R   // r0 = addr(R)
  ldr     r1, [r0]    // r1 = R;

  movw    r0, #:lower16:B
  movt    r0, #:upper16:B   // r0 = addr(B)
  ldr     r2, [r0]    // r2 = B;

  cmp     r1, r2      // Check:  R >= B
  blt     whileEnd    // If R < B: exit while loop

  /* ***********************************
     While body
     *********************************** */
  // Q = Q + 1
  movw    r0, #:lower16:Q
  movt    r0, #:upper16:Q   // r0 = addr(Q)
  ldr     r1, [r0]    // r1 = Q;
  add     r1, r1, #1        // r1 = Q+1
  str     r1, [r0]    // Q = Q+1;

  // R = R - B
  movw    r0, #:lower16:R
  movt    r0, #:upper16:R   // r0 = addr(R)
  ldr     r1, [r0]    // r1 = R;

  movw    r0, #:lower16:B
  movt    r0, #:upper16:B   // r0 = addr(B)
  ldr     r2, [r0]    // r2 = B;

  sub     r1, r1, r2        // r1 = R - B

  movw    r0, #:lower16:R
  movt    r0, #:upper16:R   // r0 = addr(R)
  str     r1, [r0]    // R = R - B;

  // End of while body --- branch back to test !!
  b       while

whileEnd:
  iiPrint(Q,R)

Stop:
  nop


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example001\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example001\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


/* --------------------------------------------------
   Begin of the permanent program variables
   -------------------------------------------------- */
  .data

A:    .4byte  37  // Sample input
B:    .4byte  7
Q:    .skip   4   // Quotient
R:    .skip   4   // Remainder

  .end
