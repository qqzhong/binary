#include "asm.h"

// Listing 5.41 Very efficient initialization in assembly.
  .equ i_red, 0
  .equ i_green, 1
  .equ i_blue, 2
  .equ i_size, 3
  .equ width, 100
  .equ height, 100
  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)

  // Call malloc to allocate the array of pixels
  mov x0, #(width*height*i_size) // calculate space needed
  bl malloc // allocate storage.
  cmp x0, #0 // if (image != NULL)
  bne endif // goto endif
  mov x0, #1 // else return 1
  b return
endif: mov x3, #0
  mov x4, #0
  mov x2, #(width*height*i_size) // w2=w * h *size
  add x2, x2, x0 // get pointer to end
  // move end addr back to quad boundary
  orr x1, x2, #0xF // get # of leftover bytes
  sub x2, x2, x1
  mov x9, x0 // x9 = i = image

loop: stp x3, x4, [x9], #16 // clear quadword and i+=16
  cmp x9, x2 // while (i < end-1)
  blt loop // goto loop

  // clear leftover bytes
loop2:
  strb w3, [x9], #1 // clear byte; i += 1
  subs x1, x1, #1
  blt loop2

done: bl free // free(image)

  mov x0, #0 // return 0
return:
  cout(msg, msgLen)
  cout(leave, leaveLen)
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test21\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test21\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

.end
