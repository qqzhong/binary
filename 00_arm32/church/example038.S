// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/hanoi.html

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
  /* -------------------------------------------------------
     Call Hanoi(4, 1, 3): move 4 disk from peg 1 to peg 3
     ------------------------------------------------------- */
  mov     r0, #3
  push    {r0}      // Pass peg2 = 3
  mov     r0, #1
  push    {r0}      // Pass peg1 = 1
  mov     r0, #4
  push    {r0}      // Pass ndisks = 4

  /* ----------------------------------------
     Call Hanoi(4, 1, 3)
     ---------------------------------------- */
  bl      Hanoi

  add     sp, sp, #12     // Pop parameters

  b Stop


/* ==========================================================
   Stack frame:

   SP ----> +------------+
      |  helpPeg   |   FP - 4
   FP ----> +------------+
      |  old FP    |
      +------------+
      | return addr|
      +------------+
      |   ndisks   |   FP + 8
      +------------+
      |   fromPeg  |   FP + 12
      +------------+
      |   toPeg    |   FP + 16
      +------------+
   ========================================================== */

Hanoi:
  // Prelude
  push    {lr}      // Save return address
  push    {fp}      // Save frame pointer
  mov     fp, sp    // Make base pointer
  sub     sp, sp, #4      // Local var  helpPeg

  // if (ndisk == 1 )
  ldr     r0, [fp, #8]    // r0 = ndisks
  cmp     r0, #1    // Check (ndisks == 1)
  bne     else

  // printf("Move disk from peg %d to peg %d\n", fromPeg, toPeg)
  movw    r0, #:lower16:Str
  movt    r0, #:upper16:Str

  ldr     r1, [fp, #12]   // r1 = fromPeg
  ldr     r2, [fp, #16]   // r2 = toPeg
  bl      printf

  b       ifEnd

else:
  // helpPeg = 6 - fromPeg - toPeg
  ldr     r0, [fp, #12]   // r0 = fromPeg
  rsb     r0, r0, #6      // r0 = 6 - fromPeg

  ldr     r1, [fp, #16]   // r1 = toPeg
  sub     r0, r0, r1      // r0 = 6 - fromPeg - toPeg

  str     r0, [fp, #-4]   // helpPeg = 6 - fromPeg - toPeg

  // Hanoi(ndisk-1, fromPeg, helpPeg)
  ldr     r0, [fp, #-4]
  push    {r0}      // Pass helpPeg

  ldr     r0, [fp, #12]
  push    {r0}      // Pass fromPeg

  ldr     r0, [fp, #8]
  sub     r0, r0, #1
  push    {r0}      // Pass ndisk-1

  /* ----------------------------------------
     Call Hanoi(ndisk-1, fromPeg, helpPeg)
     ---------------------------------------- */
  bl      Hanoi
  add     sp, sp, #12     // Pop parameters


  // printf("Move disk from peg %d to peg %d\n", fromPeg, toPeg)
  movw    r0, #:lower16:Str
  movt    r0, #:upper16:Str

  ldr     r1, [fp, #12]   // r1 = fromPeg
  ldr     r2, [fp, #16]   // r2 = toPeg
  bl      printf

  // Hanoi(ndisk-1, helpPeg, toPeg)
  ldr     r0, [fp, #16]
  push    {r0}      // Pass toPeg

  ldr     r0, [fp, #-4]
  push    {r0}      // Pass helpPeg

  ldr     r0, [fp, #8]
  sub     r0, r0, #1
  push    {r0}      // Pass ndisk-1

  /* ----------------------------------------
     Call Hanoi(ndisk-1, fromPeg, helpPeg)
     ---------------------------------------- */
  bl      Hanoi
  add     sp, sp, #12     // Pop parameters

ifEnd:
  // Return
  mov     sp, fp
  pop     {fp}
  pop     {pc}


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example038\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example038\n"
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

Str:    .asciz "Move a disk from peg %d to peg %d\n"
  .end
