// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s38.html
// Modified by Church.ZHONG
// understand the effect of the combination of the cmp + blt assembler instructions

#if 0
 cmp  rN, #n  // compares rN with n
              // sets the flags according to comparison
 cmp  rN, rM  // compares rN with rM
              // sets the flags according to comparison

 beq  label   // if ( rN == {n or rM} ) branch to label
 bne  label   // if ( rN != {n or rM} ) branch to label
 blt  label   // if ( rN <  {n or rM} ) branch to label
 ble  label   // if ( rN <= {n or rM} ) branch to label
 bgt  label   // if ( rN >  {n or rM} ) branch to label
 bge  label   // if ( rN >= {n or rM} ) branch to label


  Comparison     Inverse
--------------------------------------------------
    x == y        x != y      !(x == y) => x != y
    x != y        x == y      !(x != y) => x == y

    x  < y        x >= y      !(x  < y) => x >= y
    x <= y        x >  y      !(x <= y) => x >  y

    x  > y        x <= y      !(x  > y) => x <= y
    x >= y        x <  y      !(x >= y) => x <  y
#endif

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

  iiPrint(x,y)

// More efficient solution - Example 2 on tranlating an if-statement
#if 0
   if ( x > y )
   {
    help = x;
    x = y;
    y = help;
   }
#endif

  movw  r0, #:lower16:x
  movt  r0, #:upper16:x  // r0 = addr(x)
  ldr   r1, [r0]     // r1 = copy of x

  movw  r2, #:lower16:y
  movt  r2, #:upper16:y  // r2 = addr(y)
  ldr   r3, [r2]     // r3 = copy of y

  cmp   r1, r3       // Compare x against y
  ble   IfEnd      // if ( x <= y ) branch to IfEnd

  // Swap x and y using copies of x and y in R1 and R3
  str   r3, [r0]     // var x in memory = copy of y in R3
  str   r1, [r2]     // var y in memory = copy of x in R1
IfEnd:
  iiPrint(x,y)


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
x:  .4byte   9   // x = 9   -- try a value smaller that 4
y:  .4byte   4   // y = 4

    .end
