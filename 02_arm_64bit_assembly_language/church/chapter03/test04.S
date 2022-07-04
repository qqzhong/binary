  .section .rodata
msg:
  .asciz "[arm64]Hello, world!\n" // Declare our message

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]! // push link register (and x30) to stack

  // printf("hello, world\n")
  // Note: the following call to printf will change the link
  // register, but we saved it on the stack.
  ldr x0, =msg
  bl printf // Branch and Link to printf

  mov w0, 0 // return 0
  ldp x29, x30, [sp], #16 // pop link register (and x30) from stack
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
