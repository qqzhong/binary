#include "asm.h"

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!
  cout(enter, enterLen)

// Listing 5.13 Guarded loop in AArch64 assembly.

  mov x0, #1
  mov x1, #0
do:
  cmp x0, x1
  blt loopEnd // if (x0 < x1) goto loopEnd
loop:
  // body of loop
  cout(body, bodyLen)
  cmp x0, x1
  bge do // if (x0 >= x1) goto loop
loopEnd:

  cout(msg, msgLen)
  cout(leave, leaveLen)

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)


  .data
format: .string "data=%d\n"
x: .quad 0x0
y: .quad 0x1
a: .quad 0x2
b: .quad 0x3
c: .quad 0x4

  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test07\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test07\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

lessthan:
.asciz "x0 < x1\n"
lessthanLen = . - lessthan

greatthan:
.asciz "x0 > x1\n"
greatthanLen = . - greatthan

lessequal:
.asciz "x0 <= x1\n"
lessequalLen = . - lessequal

greatequal:
.asciz "x0 >= x1\n"
greatequalLen = . - greatequal

body: .asciz "body of loop\n" // Define null-terminated string
bodyLen = . - body

.end
