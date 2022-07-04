#include "asm.h"

// exercise 3.4
//FIXME

.section .text
.global main
.type main, % function
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack

  cout(enter, enterLen)
  cout(msg, msgLen)

  iPrint(tenSize)
  adr x2, ten

  ldr x3, [x2, #32]
  mov x1, x3
  adr x0, iFormat
  bl printf

  iPrint(numsSize)

  adr x2, nums

  ldr x3, [x2, #0]
  mov x1, x3
  adr x0, iFormat
  bl printf

  adr x2, nums
  ldr x3, [x2, #4]
  mov x1, x3
  adr x0, iFormat
  bl printf

  adr x2, nums
  ldr x3, [x2, #8]
  mov x1, x3
  adr x0, iFormat
  bl printf

  adr x2, nums
  ldr x3, [x2, #12]
  mov x1, x3
  adr x0, iFormat
  bl printf

  cout(leave, leaveLen)

  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]example12\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]example12\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"

.data
#if 0
int nums[]={7,3,21,10};
a. Write the equivalent in GNU ARM assembly.
b. Write the ARM assembly instructions to load all four numbers into registers w3,
w5, w6, and w9, respectively, using:
i. two ldp instructions, and
ii. four ldr instructions.
#endif

ten: .word 1,2,3,4,5,6,7,8,9,0
.equ tenSize, (. - ten)/4
nums: .word 7,3,21,10
.equ numsSize, (. - nums)/4

.end

// Modified by Church.ZHONG
