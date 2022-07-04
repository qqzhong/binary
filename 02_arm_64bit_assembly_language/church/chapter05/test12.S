#include "asm.h"
// Listing 5.25 A function call using the stack in C.
#if 0
#include <stdio.h>
static int i = -1, j = 2, k = -3, l = 4, m = -5, n = 6, o = -7,
p = 8, q = -9, r = 10;
int main(void)
{
printf("Results: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n",
i, j, k, l, m, n, o, p, q, r);
return 0;
}
#endif

// Listing 5.26 A function call using the stack in AArch64 assembly.
  .section .rodata
format: .asciz "Results: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n"
  // give variable i a label, and let j, k, l, m, n, o, p,
  // q, and r follow it.
i: .word -1, 2, -3, 4, -5, 6, -7, 8, -9, 10
enter:
.asciz "[enter][arm 64bit assembly]test12\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test12\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg



  .text
  .type main, %function
  .global main
main: stp x29, x30, [sp, #-32]! // push FP & LR
  cout(enter, enterLen)

  str x19, [sp, #16] // save x19
  adr x19, i // x19 = &i
  // load the eight register parameters
  adr x0, format // x0 = &format
  ldr w1, [x19, #(4*0)] // w1 = i
  ldr w2, [x19, #(4*1)] // w2 = j
  ldr w3, [x19, #(4*2)] // w3 = k
  ldr w4, [x19, #(4*3)] // w4 = l
  ldr w5, [x19, #(4*4)] // w5 = m
  ldr w6, [x19, #(4*5)] // w6 = n
  ldr w7, [x19, #(4*6)] // w7 = o
  // marshal params on stack in reverse order - p at bottom
  ldr w9, [x19, #(4*7)] // w9 = p
  ldr w10, [x19, #(4*8)] // w10 = q
  ldr w11, [x19, #(4*9)] // w11 = r
  add sp, sp, #-32
  str w11, [sp, #16] // 8 bytes per parameter
  str w10, [sp, #8]
  str w9, [sp]
  // call printf
  bl printf
  // pop p, q, and r from the stack
  add sp, sp, #32

  cout(msg, msgLen)
  cout(leave, leaveLen)

  // return 0
  mov w0, #0
  ldr x19, [sp, #16] // restore x19
  ldp x29, x30, [sp], #32 // pop FP & LR
  ret
  .size main, (. - main)

.end
