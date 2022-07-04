#include "asm.h"

// Listing 5.7 Complex selection in AArch64 assembly.
  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!

  cout(enter, enterLen)

  // calculate addresses
  adr x0, a // x0 = &a
  adr x1, b // x1 = &b
  adr x2, c // x2 = &c
  // load from memory
  ldr x0, [x0] // x0 = a
  ldr x1, [x1] // x1 = b
  ldr x2, [x2] // x2 = c
if: // if ((a < b) && (a < c))
  cmp x0, x1 // compare a and b
  bge elseif // if (a >= b) goto elseif
  cmp x0, x2 // compare a and c
  bge elseif // if (a >= c) goto elseif
  b endif // x0 = a
elseif:
  cmp x1, x2 // compare b and c
  csel x0, x1, x2, lt // x0 = (b < c ? b : c)
endif:
  adr x9, y // x9 = &y
  str x0, [x9] // *y = x0

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
.asciz "[enter][arm 64bit assembly]test03\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test03\n"
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

.end
