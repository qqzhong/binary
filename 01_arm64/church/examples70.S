// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s70.html
// Modified by Church.ZHONG
// result = square(3) + square(4)

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  sub sp, sp, #16      // make sure sp remains a multiple of 16

  mov     x0, #3
  bl      square
  str x0, [sp, #0]     // Save 32 in stack *** !!!

  mov x0, #4
  bl  square
  ldr x1, [sp, #0]     // Retrieve 32 from stack *** !!!

  add sp, sp, #16

  add x0, x0, x1       // Computes 32+ 42
  /* -------------------------------------------------
   Store in result
   ------------------------------------------------- */
  adr x1, result
  str x0, [x1]

  // print x0
  mov x1, x0
  adr x0, format
  bl printf

  // print result
  ldr x1, result
  adr x0, format
  bl printf

  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


square:
  mul x1, x0, x0
  mov x0, x1
  ret

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
result: .4byte   0
  .end
