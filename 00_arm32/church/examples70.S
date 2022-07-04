// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s70.html
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


// Using the stack to perserve values in registers
//Example:   result = square(3) + square(4);

  mov     r0, #3
  bl      square

  push    {r0}           // Save 32 in stack *** !!!
  mov     r0, #4
  bl      square
  pop     {r1}           // Retrieve 32 from stack *** !!!

  add  r0, r0, r1       // Computes 32+ 42

  /* -------------------------------------------------
     Store in result
     ------------------------------------------------- */
  movw    r1, #:lower16:result
  movt    r1, #:upper16:result
  str     r0, [r1]


  iPrint(result)

  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  .size main, (. - main)


square:
  /* ****************************************
     Prelude: build stack frame
     **************************************** */
  push    {lr}      // Save return address in LR
  push    {fp}      // Save Frame Pointer in FP
  mov     fp, sp    // Initialize my own FP

  mul r1, r0, r0
  mov r0, r1

  /* ************************************************
     Postlude: break down stack frame
     ************************************************ */
  mov     sp, fp    // De-allocate the local variables
  pop     {fp}      // Restore old FP
  pop     {pc}      // Return


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


// ===========================================================
  .data
result: .4byte  0
  .end
