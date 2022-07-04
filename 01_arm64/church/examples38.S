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
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  iPrint(x)

// Example translating an if-statement
#if 0
   if ( x < 0 )
     x = -x;
#endif

  ldr     w1, x                // x1 = x
  cmp     w1, #0                  // Compare x against 0
  bge     IfEnd                   // if (x >= 0) branch to IfEnd

  // x = -x;  (1) compute RHS
  adr     x0, x                // x0 = addr(x)
  neg     x1, x1                  // x1 = 0 - x1 (negate)
  // x = -x;  (2) store r1 into LHS
  str     x1, [x0]                // Update x with -x in x0

IfEnd:
  iPrint(x)


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]example001\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]example001\n"
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
