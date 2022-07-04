  .text
  .type main, %function
  .global main
main:
  stp x19, x20, [sp, #-16]! // Store x19 and x20 on the stack
  stp x21, x22, [sp, #-16]! // Store x21 and x22 on the stack
  stp x23, x24, [sp, #-16]! // Store x23 and x24 on the stack
  stp x25, x26, [sp, #-16]! // Store x25 and x26 on the stack
  stp x27, x28, [sp, #-16]! // Store x27 and x28 on the stack
  stp x29, x30, [sp, #-16]! // Store x29 and x30 on the stack

  // The function can now use x19 through x30. If it calls another
  // function, then it is guaranteed that these registers will not
  // be modified by the function that was called.
  // INSERT FUNCTION BODY HERE
  ldp x29, x30, [sp], #16 // Restore x29 and x30
  ldp x27, x28, [sp], #16 // Restore x27 and x28
  ldp x25, x26, [sp], #16 // Restore x25 and x26
  ldp x23, x24, [sp], #16 // Restore x23 and x24
  ldp x21, x22, [sp], #16 // Restore x21 and x22
  ldp x19, x20, [sp], #16 // Restore x19 and x20
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
