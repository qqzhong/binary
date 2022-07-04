  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!

  ldr x0, =format
  mov x1, #97            // 97=1100001
  bl printf

  bl flipFlop            // 9=1001

  mov x1, x0
  ldr x0, =format
  bl printf

  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

  .type flipFlop, %function
flipFlop:
  // Tests for parity by setting the PSTATE flags to w0 AND 1
  tst w0, #1 // Z = ~(num & 1)
  add w1, w0, #-1 // w1 = w0 - 1
  csinc w0, w1, w0, ne // w0 = (num & 1 ? w1 : w0 + 1)
  ret // return w0


.section ".rodata"
format: .string "data=%d\n"

.end

// Modified by Church.ZHONG
