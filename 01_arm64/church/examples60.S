// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s60.html
// Modified by Church.ZHONG
.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  adr x0, x
  ldr w0, [x0]
  adr x1, y
  ldr w1, [x1]
  bl sumSquares  // Call sumSquares

  // print x0
  mov x1, x0
  adr x0, format
  bl printf


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


/* ----------------------------------------------------------------
   Function sumSquares(a,b):
      agreed inputs:  x0 = a, x1 = b
      agreed return:  x0 = return value
   ---------------------------------------------------------------- */

sumSquares:
  // When  sumSquares begin, we will have: x0 = a, x1 = b
  mul     w2, w0, w0      // x2 = a*a (use x0 as var a)
  mul     w3, w1, w1      // x3 = b*b (use x1 as var b)
  add     w0, w2, w3      // x0 = a*a + b*b
  // The return value is now in r0
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
x: .4byte  4
y: .4byte  7
  .end
