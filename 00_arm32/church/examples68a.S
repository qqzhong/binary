// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s68.html
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


  iiPrint(p1,p2)
  iiiPrint(p3,p4,p5)

// Assembler code for the skeletal example
  mov   r0, #2222    // Pass 2222 as parameter 2 on stack
  push  {r0}

  mov   r0, #1111    // Pass 1111 as parameter 1 on stack
  push  {r0}

  bl    A      // Call function A
  add   sp, sp, #8   // Clean up parameters on the stack

  // When A returns, you will see the return value in r0 = 9999

  nop
  nop
Stop:
  nop

  iiPrint(p1,p2)
  iiiPrint(p3,p4,p5)


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
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
*           | variable 2 for sum         |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter 2222             |
*           +----------------------------+
*           | parameter 1111             |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
/* ==============================================
   Function A: param and locals in stack
   ============================================== */
A:
  // When run in EGTAPI - you will see {1111, 2222} on stack

  /* ****************************************
     Prelude: build stack frame
     **************************************** */
  push    {lr}      // Save return address in LR
  push    {fp}      // Save Frame Pointer in FP
  mov     fp, sp    // Initialize my own FP
  sub     sp, sp, #12     // I create 3 local variable in stack

  nop         // These instructions in A( ) can use stack
  nop         // to access parameters and local variables

  ldr     r0, [fp, #8]    // Get parameter 1 = 1111
  movw    r2, #:lower16:p1
  movt    r2, #:upper16:p1
  str     r0, [r2]

  ldr     r1, [fp, #12]   // Get parameter 2 = 2222
  movw    r2, #:lower16:p2
  movt    r2, #:upper16:p2
  str     r1, [r2]


  /* =========================================
     Call B( ) with 3 parameters
     ========================================= */
  mov   r0, #5555    // Pass 5555 as parameter 3 on stack
  push  {r0}



  mov   r0, #4444    // Pass 4444 as parameter 2 on stack
  push  {r0}

  mov   r0, #3333    // Pass 3333 as parameter 1 on stack
  push  {r0}

  bl    B      // Call function B
  add   sp, sp, #12  // Clean up parameters on the stack

  nop    // We are back in A( )
  nop    // We will now return to main( )




  /* ====================================================
     We can use a register to return the return value
     ==================================================== */
  mov   r0, #9999   // Pass return value in register r0

  /* ************************************************
     Postlude: break down stack frame
     ************************************************ */
  mov     sp, fp    // De-allocate the local variables
  pop     {fp}      // Restore old FP

  pop     {pc}      // Return


/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*           +----------------------------+
*           | variable 3 for sum         |
*           +----------------------------+
*           | variable 2 for sum         |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter 2222             |
*           +----------------------------+
*           | parameter 1111             |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
B:
  /* ****************************************
     Prelude: build stack frame
     **************************************** */
  push    {lr}      // Save return address in LR
  push    {fp}      // Save Frame Pointer in FP
  mov     fp, sp    // Initialize my own FP


  ldr     r0, [fp, #8]    // Get parameter 3333
  movw    r1, #:lower16:p3
  movt    r1, #:upper16:p3
  str     r0, [r1]

  ldr     r0, [fp, #12]    // Get parameter 4444
  movw    r1, #:lower16:p4
  movt    r1, #:upper16:p4
  str     r0, [r1]

  ldr     r0, [fp, #16]    // Get parameter 5555
  movw    r1, #:lower16:p5
  movt    r1, #:upper16:p5
  str     r0, [r1]


  /* ====================================================
     We can use a register to return the return value
     ==================================================== */
  mov   r0, #9999   // Pass return value in register r0

  /* ************************************************
     Postlude: break down stack frame
     ************************************************ */
  mov     sp, fp    // De-allocate the local variables
  pop     {fp}      // Restore old FP

  pop     {pc}      // Return to the caller


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


  .data
p1: .4byte 0
p2: .4byte 0
p3: .4byte 0
p4: .4byte 0
p5: .4byte 0
  .end
