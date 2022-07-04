// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/new-pass-with-regs3.html

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
  iiiPrint(x,y,z)
  /* -------------------------------------------------
     Pass parameter x by copying its value in reg r0
     ------------------------------------------------- */
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x
  ldr     r0, [r0]

  /* -------------------------------------------------
     Pass parameter y by copying its value in reg r1
     ------------------------------------------------- */
  movw    r1, #:lower16:y
  movt    r1, #:upper16:y
  ldr     r1, [r1]

  /* ----------------------------------------------------------------
     call z = sumSquares(x,y):
          agreed inputs:  r0 = x, r1 = y
     ---------------------------------------------------------------- */
  bl      sumSquares          // Call sumSquares

  /* -----------------------------------------------------------------
     Agreed return location:  r0 = return value
     Save return value (in r0) to variable z (z = sumSquares(..))
     ----------------------------------------------------------------- */
  movw    r1, #:lower16:z    // Do NOT use r0 !!!
  movt    r1, #:upper16:z    // (Because r0 contains the return value)

  str     r0, [r1]           // This will store return value in z
  iiiPrint(x,y,z)

  b Stop


  /* ----------------------------------------------------------------
   Function sumSquares(a,b):
        agreed inputs:  r0 = a, r1 = b
        agreed return:  r0 = return value
   ---------------------------------------------------------------- */
sumSquares:
  // When  sumSquares begin, we will have: r0 = a, r1 = b
  mul     r2, r0, r0      // r2 = a*a (use r0 as var a)
  mul     r3, r1, r1      // r3 = b*b (use r1 as var b)

  add     r0, r2, r3      // r0 = a*a + b*b
                          // The return value is now in r0
  mov     pc, lr          // Return to the caller


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example081\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example081\n"
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

x:.4byte 3
y:.4byte 4
z:.4byte 0
  .end
