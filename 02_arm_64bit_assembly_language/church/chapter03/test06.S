  .section .rodata
format: .string "You entered an odd char: %c.\n"


  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!

  // do { c = getchar(); } while (c % 2 == 0)
loop:
  bl getchar

  tbz x0, #0, loop           // Test Bit and Branch if Zero

  // printf("You entered an odd char: %c\n", c)
  mov x1, x0
  ldr x0, =format
  bl printf

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
