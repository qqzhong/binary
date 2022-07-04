// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s39.html
// Modified by Church.ZHONG
  // max(x, y)
#if 0
   if ( x >= y )
    max = x;
   else
    max = y;
#endif

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  // print x and y
  ldr x1, x
  ldr x2, y
  adr x0, format
  bl printf
  ldr x1, max
  adr x0, rawformat
  bl printf

  adr x0, x
  ldr x1, [x0]
  adr x2, y
  ldr x3, [x2]
  adr x4, max

  cmp w1, w3
  blt Else // branch to Else if x < y
  str w1, [x4]  // max = x
  b IfEnd
Else:
  str w3, [x4]  // max = y
IfEnd:
  // print x and y
  ldr x1, x
  ldr x2, y
  adr x0, format
  bl printf
  ldr x1, max
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
x: .4byte 7
y: .4byte 10
max: .skip 4
  .end
