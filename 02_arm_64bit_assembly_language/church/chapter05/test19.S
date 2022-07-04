#include "asm.h"

// Listing 5.38 Initializing an array of structured data in C.
#if 0
#include <stdio.h>
#include <stdlib.h>
/* image size */
const int width = 100;
const int height = 100;
/* define structure for a pixel */
struct pixel {
unsigned char red;
unsigned char green;
unsigned char blue;
};
int main(void)
{
// allocate image
struct pixel *image = malloc(width * height * sizeof(struct pixel));
if (image == NULL) {
fprintf(stderr, "Error: Out of memory.\n");
return 1;
}
// initialize all pixels in the image to black
for (int j = 0; j < height; j++) {
for (int i = 0; i < width; i++) {
image[j*width+i].red = 0;
image[j*width+i].blue = 0;
image[j*width+i].green = 0;
}
}
// delete the image
free(image);
return 0;
}
#endif

  //Listing 5.39 Initializing an array of structured data in assembly.
  .equ i_red, 0
  .equ i_green, 1
  .equ i_blue, 2
  .equ i_size, 3
  .equ width, 100
  .equ height, 100
  .text
  .type main, %function
  .global main
main: stp x29, x30, [sp, #-16]!

  cout(enter, enterLen)

  // Call malloc to allocate the array of pixels
  mov x0, #(100*100*3) // precompute w*h*size
  bl malloc // allocate storage.
  cmp x0, xzr // if (image != NULL)
  bne endif // goto endif
  mov w0, #1 // else return 1
  b return
endif: mov w3, #100 // w3 = width
  mov w4, #100 // w4 = height
  mov w5, #0 // w5 = 0
  mov w1, #0 // int j = 0
loop1: mov w2, #0 // int i = 0
loop2: madd x9, x1, x3, x2 // x9 = j * width + i
  add x9, x9, x0 // x9 += image address
  strb w5, [x9, #i_red] // image[j*w+i].red = 0
  strb w5, [x9, #i_green] // image[j*w+i].green = 0
  strb w5, [x9, #i_blue] // image[j*w+i].blue = 0
  add w2, w2, #1 // i++
  cmp w2, w3 // if (i < width) goto loop2
  ble loop2 // end of loop2
  add w1, w1, #1 // j++
  cmp w1, w4 //if (j < height) goto loop1
  ble loop1 // end of loop1
  bl free // free(image)

  cout(msg, msgLen)
  cout(leave, leaveLen)

  mov w0, #0 // return 0
  return: ldp x29, x30, [sp], #16
  ret
  .size main,(. - main)


  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test19\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test19\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

.end
