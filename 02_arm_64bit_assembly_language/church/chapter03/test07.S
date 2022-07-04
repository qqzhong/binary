  .section .rodata
format: .string "[arm64]Hello, world!\n"

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!

  // printf("hello, world\n")
  adr x0, format // Load address of format string
  bl printf

  // return 0
  mov w0, 0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
