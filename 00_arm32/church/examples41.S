// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s41.html
// Modified by Church.ZHONG
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

// Programming example with compound || condition
#if 0
   if (x <= a || x >= b)
      x = x + 1;
   else
      x = x - 1;
#endif
  // Test if ( x <= a )
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x   // r0 = addr(x)
  ldr     r0, [r0]    // r0 = x

  movw    r1, #:lower16:a
  movt    r1, #:upper16:a   // r1 = addr(a)
  ldr     r1, [r1]    // r1 = a

  cmp     r0, r1      // x <= a ?
  ble     then        // Branch to "then" if  x <= a

  // test if ( x >= b )
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x   // r0 = addr(x)
  ldr     r0, [r0]    // r0 = x

  movw    r1, #:lower16:b
  movt    r1, #:upper16:b   // r1 = addr(b)
  ldr     r1, [r1]    // r1 = b

  cmp     r0, r1      // x >= b ?
  blt     else        // Branch to "else" if  x < b

then:
  // x = x + 1
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x   // r0 = addr(x)

  ldr     r1, [r0]    // r1 = x
  add     r1, r1, #1        // r1 = x+1
  str     r1, [r0]    // x = x+1

  b       ifEnd       // ** SKIP over the else part !!! ***

else:
  // x = x - 1
  movw    r0, #:lower16:x
  movt    r0, #:upper16:x   // r0 = addr(x)

  ldr     r1, [r0]    // r1 = x
  sub     r1, r1, #1        // r1 = x-1
  str     r1, [r0]    // x = x-1

ifEnd:
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


  .data
x:      .4byte   5      // Try x: 10 < x < 20
a:      .4byte  10
b:      .4byte  20
  .end
