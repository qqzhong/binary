#include "asm.h"

#if 0
for(int i = 0; i < 10; i++)
{
  // insert loop body statements here
}
#endif

// Chapter 4: Data processing and other instructions

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack

  cout(enter, enterLen)

  mov w0, #0 // int i = 0;
loop:
  cmp w0, #10
  bge endloop // Exit loop if r0 > 10

  mov w6, w0
  // Insert loop body instructions here
  cout(zero, zeroLen)
  // cout(x, xLen)

  add w0, w6, #1 // i++
  b loop
endloop:
  cout(ten, tenLen)
  cout(msg, msgLen)

  cout(leave, leaveLen)
  exit(#0x0)
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test02\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test02\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

format: .string "data=%d\n"

x:
.asciz "x\n"
xLen = . - x

zero:
.asciz "zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero\n"
zeroLen = . - zero

one:
.asciz "one\n"
oneLen = . - one

two:
.asciz "two\n"
twoLen = . - two

three:
.asciz "three\n"
threeLen = . - three

ten:
.asciz "ten\n"
tenLen = . - ten

.end

// Modified by Church.ZHONG
