  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]! // Store x29 and x30 on the stack

  mov x29, #0x0 // change their contents
  mov x30, #0x0

  ldp x29, x30, [sp], #16 // Restore x29 and x30, and sp
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
