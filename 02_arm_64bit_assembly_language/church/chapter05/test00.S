#include "asm.h"

// Chapter 5: Structured programming

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]!

  cout(enter, enterLen)

// Listing 5.2 if statement in AArch64 assembly.

  mov x0, #1
  mov x1, #2
if: cmp x0, x1 // perform test
  blt endif // if (x < y) goto endif
// if statement body
  cout(greatthan, greatthanLen)           //x0 > x1
endif:
  cout(lessthan, lessthanLen)           //x0 < x1

  cout(msg, msgLen)
  cout(leave, leaveLen)

  exit(#0x0)
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test00\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test00\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

lessthan:
.asciz "x0 < x1\n"
lessthanLen = . - lessthan

greatthan:
.asciz "x0 > x1\n"
greatthanLen = . - greatthan

zero:
.asciz "zero\n"
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
