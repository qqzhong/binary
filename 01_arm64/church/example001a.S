// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/abc.html
// Modified by Church.ZHONG
/* --------------------------------------------------
   Define required labels for EGTAPI
   -------------------------------------------------- */
  .global Stop, CodeEnd
  .global DataStart, DataEnd
  .global a, b, c

/* --------------------------------------------------
   Begin of the program instructions
   -------------------------------------------------- */


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


  bPrint(a)
  sPrint(b)
  iPrint(c)
  // Move a into r1
  movw    r0, #:lower16:a   // Moves the address of memory
  movt    r0, #:upper16:a   // variable a into register r0
  ldrsb   r1,[r0]     // Move byte value from var into r1
          // ldrsb also sign-extend to int for computation !!

  // Move b into r2
  movw    r0, #:lower16:b   // Moves the address of memory
  movt    r0, #:upper16:b   // variable b into register r0
  ldrsh   r2,[r0]     // Move short value from var into r2
          // ldrsh also sign-extend to int for computation !!

  // Add them up
  add     r2, r1, r2        // r2 = a + b

  // Move sum in r2 to c
  movw    r0, #:lower16:c   // Moves the address of memory
  movt    r0, #:upper16:c   // variable c into register r0
  str     r2,[r0]     // Move sum in r2 to int var c
  bPrint(a)
  sPrint(b)
  iPrint(c)

Stop:
CodeEnd:
  nop


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  exit(#0)
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
DataStart:
a:    .byte   4        // a contains the value 4 in 8  bits
      .align 1
b:    .2byte  5        // b contains the value 5 in 16 bits
      .align 2
c:    .4byte  256      // c contains the value 256 in 32 bits
DataEnd:
  .end

/*
Data type        Load instruction     Store instruction
   -------------    ------------------   -------------------       
      int                ldr                 str
      short              ldrsh               strh
      byte               ldrsb               strb
*/