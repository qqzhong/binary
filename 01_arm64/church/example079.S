// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/new-pass-with-regs1.html

.section .text
.global main
.type main, % function
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]example079\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]example079\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"

.end
