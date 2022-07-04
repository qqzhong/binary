  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!

  // a programmed delay loop
  mov x0, #0x3fffffff // load loop counter
loop:
  nop
  nop
  nop
  nop
  sub x0, x0, #1 // decrement counter
  cmp w0, #0
  bgt loop

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
