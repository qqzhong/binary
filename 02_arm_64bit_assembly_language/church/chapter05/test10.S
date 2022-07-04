// Listing 5.20 Calling scanf and printf in AArch64 assembly.
  .data
str1: .asciz "%d"
str2: .asciz "You entered %d\n"
n: .word 0

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]! // push FP, LR onto stack

  adr x0, str1 // x0 = &str1
  adr x1, n // x1 = &n
  bl scanf // scanf("%d",&n)
  adr x0, str2 // x0 = &str2
  adr x1, n // x1 = &n
  ldr w1, [x1] // w1 = n
  bl printf // print message

  mov w0, #0 // load return value
  ldp x29, x30, [sp], #16 // pop FP, LR from stack
  ret // return from main
  .size main, (. - main)

.end
