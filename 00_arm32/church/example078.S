// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/new-local-with-stack.html

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
     Pass parameter address of array A in reg r0
     ------------------------------------------------- */
  movw    r0, #:lower16:A
  movt    r0, #:upper16:A

  /* -------------------------------------------------
     Pass 2nd parameter value a in reg r1
     ------------------------------------------------- */
  movw    r1, #:lower16:a
  movt    r1, #:upper16:a
  ldr     r1, [r1]

  /* -------------------------------------------------
     Pass 3nd parameter value b in reg r2
     ------------------------------------------------- */
  movw    r2, #:lower16:b
  movt    r2, #:upper16:b
  ldr     r2, [r2]

  /* ----------------------------------------------------------------
     call sum = sumRange(A, a, b)
    agreed inputs:  r0 = addr of array A, r1 = a, r2 = b
    agreed return:  r0 = return value
     ---------------------------------------------------------------- */
  bl      sumRange


  /* -----------------------------------------------------------------
     Save return value (in r0) to variable sum (sum = sumRange(..))
     ----------------------------------------------------------------- */
  movw    r1, #:lower16:sum    // Do NOT use r0 !!!
  movt    r1, #:upper16:sum    // (Because r0 contains the return value)

  str     r0, [r1]       // This will store return value in sum

  iiiPrint(a,b,sum)

  b Stop


  /* ----------------------------------------------------------------
   Function sumRange(a,b):
  agreed inputs:  r0 = A, r1 = a, r2 = b
  agreed return:  r0 = return value

   Unused registers:   r3, r4, r5, r6, r7, r8, r9, r10

   Use these registers as local vars:  *** r3 = i, r4 = s ***

   Body of sumRange(A,a,b):

       s = 0;
       for (i = a, i < b; i++)
    s = s + A[i];
       return(s);
   ---------------------------------------------------------------- */

sumRange:
  // When  sumRange  begins, we will have: r0 = A, r1 = a, r2 = b

  // s = 0;
  mov     r4, #0    // r4(=s) = 0

  // i = a;
  mov     r3, r1    // r3(=i) = r1(=a)

while:  // while (i < b)

  cmp     r3, r2    // r3 = i, r2 = b
  bge     whileEnd

  // s = s + A[i];

  ///// get A[i] in r10
  mov     r5, r3    // r5 = i (because r3 = i)
  add     r5, r5, r5      // r5 = 2*i
  add     r5, r5, r5      // r5 = 4*i   = offset used to access A[i]

  ldr     r10, [r0, r5]   // r10 = A[i] (r0=A(base), r5=offset)

  add     r4, r4, r10     // r4(=s) = r4(=s) + r10(=A[i])


  // i++
  add     r3, r3, #1      // r3(=i) = r3(=i) + 1

  b       while     // End of while body - loop back !!

whileEnd:
  // return(s)

  mov     r0, r4    // r0(return location) = r4(=s)
        // The return value is now in r0
  mov     pc, lr    // Return to the caller


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example078\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example078\n"
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
B: .4byte 20,21,22,23,24,25,26,27,28,29
C: .4byte 30,31,32,33,34,35,36,37,38,39
sum: .4byte 0
a: .4byte 0
b: .4byte 10
/*
10+11+12+13+14+15+16+17+18+19=145
20+21+22+23+24+25+26+27+28+29=245
20+21+22+23+24=110
30+31+32+33+34+35+36+37+38+39=345
*/
  .end
