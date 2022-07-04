  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-32]! // Push FP and LR onto the stack

  str x19, [sp, #16]
  mov x19, #'A'
loop: // beginning of do-while loop
  // loop body does nothing
  bl getchar // call getchar to get next character in x0
  cmp x0, x19 // compare it to ’A’
  bne loop // repeat loop if the character is not equal to ’A’

  ldr x20, [sp, #16]

  ldp x29, x30, [sp], #32 // Pop FP and LR from the stack
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
