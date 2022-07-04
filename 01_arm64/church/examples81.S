// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s81.html
// Modified by Church.ZHONG
// What the compiler will do when a variable is passed-by-value

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  vdprint(x0)


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


main:
  /* =========================================
     Pass k to f( ) by value
     ========================================= */
  movw    r0, #:lower16:k
  movt    r0, #:upper16:k   // r0 = address of k
  ldr     r0, [r0]          // r0 = value of k
  push    {r0}              // Pass k by value (pass k's value)

  bl      f                 // Call function f
  add   sp, sp, #4          // Clean up parameters on the stack


f:
   /* ****************************************
    Prelude: build stack frame
    **************************************** */
   push    {lr}            // Save return address in LR
   push    {fp}            // Save Frame Pointer in FP
   mov     fp, sp          // Initialize my own FP
   sub     sp, sp, #0      // I create 0 local variable in stack

   /* =======================================
    Translating a = a + 1
    ======================================= */
   ldr     r0, [fp, #8]    // a uses the parameter store location
   add     r0, r0, #1      // r0 = a + 1
   str     r0, [fp, #8]    // Assign result to parameter store location

   /* ************************************************
    Postlude: break down stack frame
    ************************************************ */
   mov     sp, fp          // De-allocate the local variables
   pop     {fp}            // Restore old FP
   pop     {pc}            // Return

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
k:  .4byte  7                 // This is the variable k
  .end
