#include "asm.h"

  .text
  .global main
main:
  stp x29, x30, [sp, #-16]!
  mov w0, #0xFF
  // mov w0, #0x0
  // if (w0 = 0) goto endif1
  cmp w0, wzr
  beq endif1
  // w0 = 1
  mov w0, #1
  cout(one, oneLen)
endif1:
  cout(zero, zeroLen)
  // return w0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.section ".rodata"
zero:
.asciz "zero\n"
zeroLen = . - zero

one:
.asciz "one\n"
oneLen = . - one

two:
.asciz "two\n"
twoLen = . - two

three:
.asciz "three\n"
threeLen = . - three

.end

// Modified by Church.ZHONG
