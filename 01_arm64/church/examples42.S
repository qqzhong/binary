// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s42.html
// Modified by Church.ZHONG
  // Program flow of the example while-statement
#if 0
  // Computes: Q = A/B   and  R = A%B
  Q = 0;
  R = A;
  while ( R >= B )
  {
      Q = Q + 1;
      R = R - B;
  }
#endif

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  // print A and B
  ldr x1, A
  ldr x2, B
  adr x0, format
  bl printf

  // Q=0
  adr x0, Q // x0 = addr(Q)
  str wzr, [x0]

  // R=A
  ldr w2, A
  adr x1, R // x1 = addr(R)
  str w2, [x1]

  ldr w2, B  // x2 = B
While: // R >= B
  ldr w3, [x1] // x1 = R
  cmp w3, w2
  blt WhileEnd // branch to WhileEnd if R < B

  // While body
  // Q = Q + 1
  ldr w4, [x0]
  add x4, x4, #1
  str w2, [x0]

  // R = R - B
  sub w3, w3, w2
  str w3, [x1]
  // End of While body

  b While

WhileEnd:
  // print Q and R
  ldr x1, Q
  ldr x2, R
  adr x0, format
  bl printf

  // print A and B
  ldr x1, A
  ldr x2, B
  adr x0, format
  bl printf


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


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
A: .4byte 19 // Sample input
B: .4byte 4
Q: .skip 4 // Quotient
R: .skip 4 // Remainder
  .end

/*
Sample execution: A = 19, B = 4   (quotient A/B = 4, remainder A/B = 3)

   Initial values   Iter 1  Iter 2  Iter 3  Iter 4
   ---------------  ------  ------  ------  ------
  Q      0               1       2       3       4
  R     19 (A)          15      11       7       3
*/
