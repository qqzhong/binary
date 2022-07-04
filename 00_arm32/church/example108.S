// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/while.html

/* -------------------------------------------------------------
   Define required labels for EGTAPI
   ------------------------------------------------------------- */
  .global Stop, CodeEnd
  .global DataStart, DataEnd
  .global k, bingo

/* -------------------------------------------------------------
   Begin of the program instructions
   ------------------------------------------------------------- */

.section .text
.global main
.type main, % function
main:
  /* Function Prelude: complete the stack frame structure */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  iiPrint(k, bingo)
  movw    r0, #:lower16:k
  movt    r0, #:upper16:k // r0 = address of k
  /*ldr     r0, [r0]*/    // Pass k by reference (pass k's address)
  /* -------------------------------------------------------------
     Pass parameter k (using stack)
     ------------------------------------------------------------- */
  push    {r0}            // Pass k using the program stack
  /* -------------------------------------------------------------
     call byRef(k)
     ------------------------------------------------------------- */
  bl      byRef
  add     sp, sp, #4      // Clean up the parameter k
  iiPrint(k, bingo)


  movw    r0, #:lower16:k
  movt    r0, #:upper16:k // r0 = address of k
  ldr     r0, [r0]        // r0 = value of k
                          // Pass k by value (pass k's value)
  /* -------------------------------------------------------------
     Pass parameter k (using stack)
     ------------------------------------------------------------- */
  push    {r0}            // Pass k using the program stack
  /* -------------------------------------------------------------
     call byVal(k)
     ------------------------------------------------------------- */
  bl      byVal
  add     sp, sp, #4      // Clean up the parameter k
  iiPrint(k, bingo)


  b work


Stop:
CodeEnd:
  nop


  /* Function Postlude: de-allocate local variable and restore FP */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller
  .size main, (. - main)


byRef:
  /* =============================================================
     Function Prelude: complete the stack frame structure
     ============================================================= */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  sub     sp, sp, #0      // I create 0 local variables in stack

  ldr     r0, [fp, #8]    // r0 = address of k
  mov     r1, #33
  str     r1, [r0]        // k = r1

  /* -------------------------------------------------------------
     Assign return value (in r0) to variable result
     ------------------------------------------------------------- */
  // This will store return value in result

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller


byVal:
  /* =============================================================
     Function Prelude: complete the stack frame structure
     ============================================================= */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  sub     sp, sp, #0      // I create 0 local variables in stack

  ldr     r0, [fp, #8]         // r0 = address of k
  movw    r1, #:lower16:bingo
  movt    r1, #:upper16:bingo  // r1 = address of bingo
  str     r0, [r1]             // bingo = k

  /* -------------------------------------------------------------
     Assign return value (in r0) to variable result
     ------------------------------------------------------------- */
  // This will store return value in result

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller


work:
  // Modified by Church.ZHONG
  // Q = 0;
  movw    r0, #:lower16:Q
  movt    r0, #:upper16:Q         // r0 = addr(Q)
  mov     r1, #0

  str     r1, [r0]                // Q = 0;

  // R = A;
  movw    r0, #:lower16:A
  movt    r0, #:upper16:A         // r0 = addr(A)
  ldr     r1, [r0]                // r1 = A;

  movw    r0, #:lower16:R
  movt    r0, #:upper16:R         // r0 = addr(R)
  str     r1, [r0]                // R = A;

while:
  // test  R >= B
  movw    r0, #:lower16:R
  movt    r0, #:upper16:R         // r0 = addr(R)
  ldr     r1, [r0]                // r1 = R;

  movw    r0, #:lower16:B
  movt    r0, #:upper16:B         // r0 = addr(B)
  ldr     r2, [r0]                // r2 = B;

  cmp     r1, r2                  // Check:  R >= B
  blt     whileEnd                // If R < B: exit while loop

  /* ***********************************
     While body
     *********************************** */
  // Q = Q + 1
  movw    r0, #:lower16:Q
  movt    r0, #:upper16:Q         // r0 = addr(Q)
  ldr     r1, [r0]                // r1 = Q;
  add     r1, r1, #1              // r1 = Q+1
  str     r1, [r0]                // Q = Q+1;

  // R = R - B
  movw    r0, #:lower16:R
  movt    r0, #:upper16:R         // r0 = addr(R)
  ldr     r1, [r0]                // r1 = R;

  movw    r0, #:lower16:B
  movt    r0, #:upper16:B         // r0 = addr(B)
  ldr     r2, [r0]                // r2 = B;

  sub     r1, r1, r2              // r1 = R - B

  movw    r0, #:lower16:R
  movt    r0, #:upper16:R         // r0 = addr(R)
  str     r1, [r0]                // R = R - B;

  // End of while body --- branch back to test !!
  b       while

whileEnd:

  b Stop


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example108\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example108\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


/* -------------------------------------------------------------
   Begin of the permanent program variables
   ------------------------------------------------------------- */
  .data
k:.4byte 22
bingo:.4byte 255

A:    .4byte  37
B:    .4byte  7
Q:    .skip   4         // Quotient
R:    .skip   4         // Remainder
  .end
