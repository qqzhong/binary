// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s60.html
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


  iPrint(z)

  // Example: passing parameters and return values using register
  // sumSquares(a,b):  returns  (a*a + b*b)
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

  /* ---------------------------------------------------------
     call z = sumSquares(x,y):
    agreed inputs:  r0 = x, r1 = y


     --------------------------------------------------------- */
  bl      sumSquares    // Call sumSquares

  /* ----------------------------------------------------------
     Agreed return location:  r0 = return value



     Save return value (in r0) to z (z = sumSquares(..))
     --------------------------------------------------- */
  movw    r1, #:lower16:z    // Do NOT use r0 !!!
  movt    r1, #:upper16:z    // (r0 contains the return value)

  str     r0, [r1]     // This will store return value in z

  iPrint(z)


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  .size main, (. - main)


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

  mov     pc, lr    // Return to the caller


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


#if 0
address(value field) = base address(list element) + 0
address(next field)  = base address(list element) + 4
#endif


/* --------------------------------------------------
   Begin of the permanent program variables
   -------------------------------------------------- */
  .data
x: .4byte  4
y: .4byte  7
z: .4byte 0
  .end
