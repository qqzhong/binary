#include "asm.h"

// Listing 5.34 Initializing an array of integers in C.
#if 0
int x[100];
for(int i = 0; i < 100; i++)
x[i] = i;
#endif

// Listing 5.35 Initializing an array of integers in assembly.
  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!
  cout(enter, enterLen)


  sub sp, sp, #400 // int x[100]
  mov x0, #0 // x0 = i = 0
loop:
  str w0, [sp, x0, lsl #2] // x[i] = i
  add x0, x0, #1 // i++
  cmp x0, #100 // loop test
  blt loop // if (i < 100) goto loop
  add sp, sp, #400

  cout(msg, msgLen)
  cout(leave, leaveLen)

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)


  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test17\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test17\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

.end
