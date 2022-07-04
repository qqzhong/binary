#include "asm.h"

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!
  cout(enter, enterLen)


// Listing 5.17 for loop re-written as a post-test loop in C.
#if 0
int i = 0;
do {
printf("Hello World - %d\n", i);
i++;
} while(i < 10);
#endif


// Listing 5.18 Post-test loop in AArch64 assembly

  ldr x4, #0 // x4 = i = 0
loop:
  adr x0, str // load pointer to format string
  mov x1, x4 // copy i into x1
  bl printf // printf("Hello World - %d\n", i);
  add x4, x4, #1 // i++
  cmp x4, #10 // perform comparison
  blt loop // continue if i < 10

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
.asciz "[enter][arm 64bit assembly]test09\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test09\n"
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

str: .string "Hello World - %d\n"

.end
