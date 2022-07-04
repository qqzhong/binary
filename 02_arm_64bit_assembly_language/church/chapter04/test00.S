// The equivalent AArch64 assembly program is as follows:
  .data
fmt: .asciz "The sum is %d\n"
  .align 2
x: .word 5
y: .word 8

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack

  // sum = x + y
  adr x14, x // Calculate address of x
  adr x15, y // Calculate address of y
  ldr x4, [x14] // Load x
  ldr x5, [x15] // Load y
  add x1, x4, x5 // x1 = x4 + x5

  // printf("The sum is %d\n", sum)
  adr x0, fmt // Calculate address of fmt
  bl printf // Call the printf function

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret // Return from main
  .size main,(. - main)

.end

// Modified by Church.ZHONG
