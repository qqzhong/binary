// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s40.html
// Modified by Church.ZHONG
.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  // Compound boolean expressions
#if 0
   if (a <= x && x <= b)
    x = x + 1;
   else
    x = x - 1;
#endif

  vvvdprint(a,b,x)

  adr x1, x
  ldr x0, [x1]
  ldr x3, a

  cmp w3, w0
  bgt Else // branch to Else if a > x

  ldr x3, b
  cmp w0, w3
  bgt Else // branch to Else if x > b
Then:
  add x0, x0, #1
  str w0, [x1]
  B IfEnd
Else:
  sub x0, x0, #1
  str w0, [x1]

IfEnd:
  vvvdprint(a,b,x)


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
x: .4byte 15
a: .4byte 10
b: .4byte 20
  .end
