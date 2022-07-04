// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/new-pass-with-stack2.html

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
  iiiPrint(a,b,sum)
  //  Java statement: sum = sumRange(A, a, b):
  /* -------------------------------------------------
     Pass 3nd parameter value b using the stack
     ------------------------------------------------- */
  movw    r0, #:lower16:b
  movt    r0, #:upper16:b
  ldr     r0, [r0]
  push    {r0}

  /* -------------------------------------------------
     Pass 2nd parameter value a using the stack
     ------------------------------------------------- */
  movw    r0, #:lower16:a
  movt    r0, #:upper16:a
  ldr     r0, [r0]
  push    {r0}

  /* -------------------------------------------------------
     Pass 1st parameter address of array A using the stack
     ------------------------------------------------------- */
  movw    r0, #:lower16:A
  movt    r0, #:upper16:A
  push    {r0}

  /* ----------------------------------------------------------------
     call sum = sumRange(A, a, b)
          agreed inputs:  r0 = addr of array A, r1 = a, r2 = b
          agreed return:  r0 = return value
     ---------------------------------------------------------------- */
  bl      sumRange
  add  sp, sp, #12       // Clean up the 3 int parameters off the stack

  /* -----------------------------------------------------------------
     Save return value (in r0) to variable sum (sum = sumRange(..))
     ----------------------------------------------------------------- */
  movw    r1, #:lower16:sum    // Do NOT use r0 !!!
  movt    r1, #:upper16:sum    // (Because r0 contains the return value)

  str     r0, [r1]             // This will store return value in sum
  iiiPrint(a,b,sum)

  b Stop


  /* ----------------------------------------------------------------
   Function sumRange(a,b):
        agreed inputs:  A, a, b   on stack
        agreed return:  r0 = return value

   Unused registers:   r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10

   Use stack to store local vars

   Body of sumRange(A,a,b):

       s = 0;
       for (i = a, i < b; i++)
          s = s + A[i];
       return(s);
   ---------------------------------------------------------------- */

sumRange:
  // When  sumRange  begins, we will have the parameters on the stack:



  /* ==========================================================
     Function Prelude: complete the stack frame structure
     ========================================================== */
  push    {lr}            // Save LR (return address)
  push    {fp}            // Save FP (used by caller)
  mov     fp, sp          // Mark the stack top location before
                          // allocating any local variables
  sub     sp, sp, #8      // Allocate 2 int variables on the stack




  /* ===============================================
     We completed the stack frame
     Now we can write the function body
     =============================================== */
  // s = 0
  mov     r0, #0          // offset(local var s) = -4 from FP
  str     r0, [fp, #-4]   // s = 0

  // i = a
  ldr     r0, [fp, #12]   // offset(param a) = 12 from FP
  str     r0, [fp, #-8]   // offset(loca var i) = -8 from FP

while:  // while (i < b)

  //// Get i into r0
  ldr     r0, [fp, #-8]   // offset(local var i) = -8 from FP

  //// Get b into r1
  ldr     r1, [fp, #16]   // offset(b) = 16 from FP

  //// Check for (i < b)
  cmp     r0, r1          // r0 = i, r1 = b
  bge     whileEnd        // Exit while loop if FALSE

  // s = s + A[i];

  ///// get A[i] into r10
  ldr     r0, [fp, #8]    // r0 = addr of array A

  ldr     r1, [fp, #-8]   // r1 = i
  add     r1, r1, r1      // r1 = 2*i
  add     r1, r1, r1      // r1 = 4*i   = offset used to access A[i]

  ldr     r10, [r0, r1]   // r10 = A[i] (r0=A(base), r1=offset)

  ///// get s into r0
  ldr     r0, [fp, #-4]   // r0 = s

  ///// compute s + A[i]
  add     r0, r0, r10     // r0 = s + A[i]

  ///// Save sum in memory variable s
  str     r0, [fp, #-4]   // s = s + A[i]

  // i++
  ldr     r0, [fp, #-8]   // r0 = i
  add     r0, r0, #1      // r0 = i+1
  str     r0, [fp, #-8]   // i = i+1

  b       while           // End of while body - loop back !!

whileEnd:

  // return(s)

  //// Put the return value in the agreed register (r0)
  ldr     r0, [fp, #-4]   // r0=s

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp          // De-allocate local variables
  pop     {fp}            // Restore fp
  pop     {pc}            // Return to the caller


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example083\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example083\n"
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

A: .4byte 10,11,12,13,14,15,16,17,18,19
sum: .4byte 0
a: .4byte 0
b: .4byte 10
  .end
