  .section .rodata
formatString:
  .string "char: %c\n"


  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!

  // w9 = getchar()
  bl getchar
  mov w9, w0

  // printf("char: %c\n", x9)
  ldr x0, =formatString
  mov w1, w9
  bl printf

  // return 0
  mov w0, 0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
