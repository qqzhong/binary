// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/if-and.html

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
/* --------------------------------------------------
   if (a <= x and x <= b)
      x = x + 1;
   else
      x = x - 1;
   -------------------------------------------------- */
  iiiPrint(x,a,b)
  // Test if (a <= x )
  movw    r0, #:lower16:a
  movt    r0, #:upper16:a         // r0 = addr(a)
  ldr     r0, [r0]                // r0 = a

  movw    r1, #:lower16:x
  movt    r1, #:upper16:x         // r1 = addr(x)
  ldr     r1, [r1]                // r1 = x

  cmp     r0, r1                  // a <= x ?
  bgt     else                    // Branch to "else" if  a > x

  // test if ( x <= b )
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x         // r0 = addr(x)
  ldr     r0, [r0]                // r0 = x

  movw    r1, #:lower16:b
  movt    r1, #:upper16:b         // r1 = addr(b)
  ldr     r1, [r1]                // r1 = b

  cmp     r0, r1                  // x <= b ?
  bgt     else                    // Branch to "else" if  x > b

then:
  // x = x + 1
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x         // r0 = addr(x)

  ldr     r1, [r0]                // r1 = x
  add     r1, r1, #1              // r1 = x+1
  str     r1, [r0]                // x = x+1

  b       ifEnd                   // ** SKIP over the else part !!! ***

else:
  // x = x - 1
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x         // r0 = addr(x)

  ldr     r1, [r0]                // r1 = x
  sub     r1, r1, #1              // r1 = x-1
  str     r1, [r0]                // x = x-1

ifEnd:
  iiiPrint(x,a,b)

  b Stop


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example041\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example041\n"
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

x: .4byte  15        // Try x outside    10 ... 20
a: .4byte  10
b: .4byte  20
  .end
