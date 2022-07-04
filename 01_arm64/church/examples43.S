// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s43.html
// Modified by Church.ZHONG
  // Example of translation a for-statement
#if 0
  sum = 0;
  i = 0;
  while ( i < 10 ) {
      sum = sum + A[i];
      i++;
  }
#endif

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  // print sum
  ldr x1, sum
  adr x0, sumformat
  bl printf

  // i=0
  adr x0, i // x0 = addr(i)
  str wzr, [x0]
  // sum=0
  adr x1, sum // x1 = addr(sum)
  str wzr, [x1]
  // x2 = addr(A)
  adr x2, A

While: // i < 10
  ldr w3, [x0] // x3 = i
  cmp w3, #10
  bge WhileEnd // branch to WhileEnd if i >= 10

  // While body
  // sum = sum + A[i]
  ldr x4, [x1] // x4 = sum
  // i = i * 4
  add x3, x3, x3
  add x3, x3, x3
  ldr x5, [x2, x3] // x5 = A[i]
  adr x6, element
  str w5, [x6]
  add x4, x4, x5   // sum += A[i]
  str w4, [x1]

  // i++
  ldr x3, [x0] // x3 = i
  add x3, x3, #1
  str w3, [x0]
  // End of While body

  b While

WhileEnd:
  // print sum
  ldr x1, sum
  adr x0, sumformat
  bl printf

  // print i
  ldr x1, i
  adr x0, rawformat
  bl printf

  // print element
  ldr x1, element
  adr x0, rawformat
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
A:      .4byte  4, 6, 7, 3, 8, 2, 9, 1, 5, 10      // int array (with 10 values)
sum:    .skip   4
i:      .skip   4
element:.4byte   0
  .end
