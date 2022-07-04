// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/array-asm.html
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


// ============================================================ A[3]
  movw    r0, #:lower16:A
  movt    r0, #:upper16:A   // r0 = base address of array A

          // Address of A[3] = base addr + 3*1
  ldrsb   r2, [r0, #3]      // Load A[3] into r2

// ============================================================ B[3]
  movw    r0, #:lower16:B
  movt    r0, #:upper16:B   // r0 = base address of array B

          // Address of B[3] = base addr + 3*2
  ldrsh   r3, [r0, #6]      // Load B[3] into r3

// ============================================================ C[3]
  movw    r0, #:lower16:C
  movt    r0, #:upper16:C   // r0 = base address of array C

          // Address of C[3] = base addr + 3*4
  ldr     r4, [r0, #12]     // Load C[3] into r4


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example007\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example007\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


// **********************************************************************
// The .data segment
// **********************************************************************
  .data
A:      .byte   11, 12, 13, 14, 15     // byte typed initialzied array A

  .align 1
B:      .2byte  111, 112, 113, 114, 115 // short typed initialzied array B

  .align 2
C:      .4byte  1111, 1112, 1113, 1114, 1115 // int typed initialzied array C

.end
