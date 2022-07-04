#include "asm.h"

// Listing 5.40 Improved initialization in assembly.
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
  stp x29, x30, [sp, #-16]!
  cout(enter, enterLen)


  // Call malloc to allocate the array of pixels
  mov x0, #(width*height*i_size) // calculate space needed
  bl malloc // allocate storage.
  cmp x0, #0 // if (image != NULL)
  bne endif // goto endif
  mov w0, #1 // else return 1
  b return
endif: mov w2, #(width*height*i_size) // w2 = w * h * size
  mov w3, #0 // w3 = 0
  mov w1, #0 // int i = 0
  loop: add x9, x1, x0 // x9 = image + i
  strb w3, [x9, #i_red] // image[i].red = 0
  strb w3, [x9, #i_green] // image[i].green = 0
  strb w3, [x9, #i_blue] // image[i].blue = 0
  add w1, w1, #3 // i += 3
  cmp w1, w2 // if(i<width*height*3)
  blt loop // repeat loop
  bl free // free(image)

  mov w0, #0 // return 0
return:
  cout(msg, msgLen)
  cout(leave, leaveLen)

  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)



  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test20\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test20\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

.end
