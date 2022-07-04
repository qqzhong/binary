#include "asm.h"

// Listing 5.27 A function call using stp to push arguments on the stack.
  .section .rodata
format: .asciz "Results: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n"
  // give variable i a label, and let j, k, l, m, n, o, p,
  // q, and r follow it.
i: .word -1, 2, -3, 4, -5, 6, -7, 8, -9, 10
enter:
.asciz "[enter][arm 64bit assembly]test13\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test13\n"
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

  // marshaling onto the stack.
  ldr w9, [x19, #(4*7)] // w9 = p
  ldr w10, [x19, #(4*8)] // w10 = q
  ldr w11, [x19, #(4*9)] // w11 = r
  stp x9, x10, [sp, #-32]! // 8 bytes per parameter
  str x11, [sp, #16]
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
