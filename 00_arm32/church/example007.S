// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/array-asm.html

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
// ==================== I put an arbitrary value in reg r1
  mov     r1, #44   // Value to be stored

// ============================================================ A[3]
  movw    r0, #:lower16:A
  movt    r0, #:upper16:A   // r0 = base address of array A

          // Address of A[3] = base addr + 3*1
  strb    r1, [r0, #3]      // Store r1 into A[3] (byte)

// ============================================================ B[3]
  movw    r0, #:lower16:B
  movt    r0, #:upper16:B   // r0 = base address of array B

          // Address of B[3] = base addr + 3*2
  strh    r1, [r0, #6]      // Store r1 into B[3] (short)

// ============================================================ C[3]
  movw    r0, #:lower16:C
  movt    r0, #:upper16:C   // r0 = base address of array C

          // Address of C[3] = base addr + 3*4
  str     r1, [r0, #12]     // Store r1 into C[3] (int)
  b Stop


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


/* -------------------------------------------------------------
   Begin of the permanent program variables
   ------------------------------------------------------------- */
  .data
k:.4byte 22
bingo:.4byte 255
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
