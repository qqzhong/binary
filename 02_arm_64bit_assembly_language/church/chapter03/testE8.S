#include "asm.h"

// exercise 3.8

#if 0
a. x[i] = j;
b. x[j] = x[i];
c. x[i] = x[j*2];
#endif

x: .word 1,2,3,4,5,6,7,8,9,0
.equ xSize, (. - x)/4

.section .text
.global main
.type main, % function
main:
  stp x29, x30, [sp, #-16]!

  cout(enter, enterLen)
  cout(msg, msgLen)

  mov x1, #99
  adr x0, format
  bl printf

  cout(leave, leaveLen)

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
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

format: .asciz "data=%d\n"

.end

// Modified by Church.ZHONG
