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


  iPrint(x)

// Optimized example of the same if-statement
// I do not recommend/require that you optimize (because it is more error prone)
#if 0
   if ( x < 0 )
     x = -x;
#endif

  movw    r0, #:lower16:x
  movt    r0, #:upper16:x         // r0 = addr(x)
  ldr     r1, [r0]                // r1 = x

  cmp     r1, #0                  // Compare x ? 0
  bge     IfEnd                   // Branch to "IfEnd" if  x >= 0

  // (We dont need to fetch x, since r1 = x !
  neg     r1, r1                  // r1 = 0 - r1 (negate)

  // Note: r0 still contains addr(x) !
  str     r1, [r0]                // Update x with -x in r0
IfEnd:
  iPrint(x)


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
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
x:      .4byte  -4  // x = -4   -- try +4 also
        .end
