// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s69.html
// Modified by Church.ZHONG
// This examples shows you the steps to build + tear down stack frame for 1 (non-leaf) subroutine
// Advantage:   sumRange( ) can call another function (because its parameters and local variables will not be overwritten !!!)
//FIXME

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  sub sp, sp, #32
  //  Java statement: sum = sumRange(A, a, b):
  /* -------------------------------------------------
  Pass 3nd parameter value b using the stack
  ------------------------------------------------- */
  ldr x0, b
  str x0, [sp, #0]

  /* -------------------------------------------------
  Pass 2nd parameter value a using the stack
  ------------------------------------------------- */
  ldr x0, a
  str x0, [sp, #8]

  /* -------------------------------------------------------
  Pass 1st parameter address of array A using the stack
  ------------------------------------------------------- */
  adr x0, A
  str x0, [sp, #16]

  /* ----------------------------------------------------------------
  call sum = sumRange(A, a, b)
  agreed inputs:  x0 = addr of array A, x1 = a, x2 = b
  agreed return:  x0 = return value
  ---------------------------------------------------------------- */
  bl      sumRange
  add sp, sp, #32      // Clean up the 3 int parameters off the stack

  /* -----------------------------------------------------------------
  Assign return value (in x0) to variable sum (sum = sumRange(..))
  ----------------------------------------------------------------- */
  // Do NOT use x0 !!! (Because x0 contains the return value)
  adr x1, sum
  str x0, [x1]             // This will store return value in sum

  // print x0
  mov x1, x0
  adr x0, format
  bl printf

  ldr x1, sum
  adr x0, format
  bl printf

  ldr x1, aDebug
  adr x0, rawformat
  bl printf

  ldr x1, bDebug
  adr x0, rawformat
  bl printf

  ldr x1, sumDebug
  adr x0, rawformat
  bl printf

  ldr x1, aiDebug
  adr x0, rawformat
  bl printf

  ldr x1, iDebug
  adr x0, rawformat
  bl printf

  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*           +----------------------------+
*           | variable 3 for sum         |
*           +----------------------------+
*           | variable i for sum         |
*           +----------------------------+
*           | variable s for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter b                |
*           +----------------------------+
*           | parameter a                |
*           +----------------------------+
*           | parameter A                |
*           +----------------------------+
*           | padding                    |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
// ===========================================================
sumRange:
  // When  sumRange  begins, we will have the parameters on the stack:

  /* ==========================================================
  Function Prelude: complete the stack frame structure
  ========================================================== */
  // Save LR (return address)
  // Save FP (used by caller)
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack

  mov x29, sp          // Mark the stack top location before
  // allocating any local variables
  sub sp, sp, #32      // Allocate 2 int variables on the stack
  str x30, [sp, #0]

  /* ===============================================
  We completed the stack frame
  Now we can write the function body
  =============================================== */
  // s = 0
  mov x0, #0            // offset(local var s) = -8 from FP
  str x0, [x29, #-8]    // s = 0

  // i = a
  ldr x0, [x29, #24]    // offset(param a) = 24 from FP
  adr x2, aDebug
  str x0, [x2]
  str x0, [x29, #-16]   // offset(local var i) = -16 from FP

While:  // while (i < b)
  //// Get i into x0
  ldr x0, [x29, #-16]   // offset(local var i) = -16 from FP

  //// Get b into x1
  ldr x1, [x29, #16]    // offset(param b) = 16 from FP
  adr x2, bDebug
  str x1, [x2]

  //// Check for (i < b)
  cmp x0, x1          // x0 = i, x1 = b
  bge WhileEnd        // Exit while loop if FALSE

  // s = s + A[i];

  ///// get A[i] into x10
  ldr x0, [x29, #32]    // x0 = addr of array A

  ldr x1, [x29, #-16]   // x1 = i
  add x1, x1, x1      // x1 = 2*i
  add x1, x1, x1      // x1 = 4*i   = offset used to access A[i]

  ldr x10, [x0, x1]   // x10 = A[i] (x0=A(base), x1=offset)
  adr x2, aiDebug
  str x10, [x2]

  ///// get s into x0
  ldr x0, [x29, #-8]   // x0 = s

  ///// compute s + A[i]
  add x0, x0, x10     // x0 = s + A[i]

  ///// Save sum in memory variable s
  str x0, [x29, #-8]   // s = s + A[i]

  // i++
  ldr x0, [x29, #-16]   // x0 = i
  add x0, x0, #1        // x0 = i+1
  adr x2, iDebug
  str x0, [x2]
  str x0, [x29, #-16]   // i = i+1

  b   While           // End of while body - loop back !!

WhileEnd:
  // return(s)

  //// Put the return value in the agreed register (x0)
  ldr x0, [x29, #-8]   // x0=s

  /* =============================================================
  Function Postlude: de-allocate local variable and restore FP
  ============================================================= */
  ldr x30, [sp, #0]
  add sp, sp, #32
  mov sp, x29          // De-allocate local variables
  // Restore fp
  // Return to the caller
  ldp x29, x30, [sp], #16  // Pop FP and LR from the stack
  ret


// Key:   use FP + offset to access the parameters and local variables in the stack frame !

.section ".rodata"
enter:
.ascii "[enter][arm 64bit assembly]example002\n"
enterLen = . - enter

leave:
.ascii "[leave][arm 64bit assembly]example002\n"
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

vformat: .asciz "data=%d\n"
vvformat: .asciz "data=%d,%d\n"
vvvformat: .asciz "data=%d,%d,%d\n"

/* --------------------------------------------------
   Begin of the permanent program variables
   -------------------------------------------------- */
  .data
A:      .4byte  11, 12, 13, 14, 15, 16, 17, 18, 19, 20
a:      .4byte  1
b:      .4byte  3
sum:    .4byte  0
aDebug:.4byte   0
bDebug:.4byte   0
sumDebug:.4byte   0
aiDebug:.4byte   0
iDebug:.4byte   0
  .end
