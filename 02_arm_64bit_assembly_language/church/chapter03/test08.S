#include "asm.h"
/*
  .bss
closeBy:
  .word 0x00000000
  .skip 4000000000
farFarAway:
  .word 0xffffffff
*/


  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]!

  cout(zero, zeroLen)
  cout(one, oneLen)
  cout(two, twoLen)
  cout(three, threeLen)

#if 0
  adrp x0, farFarAway
  add x0, x0, #:lo12:farFarAway
#endif

  // return 0
  mov w0, 0
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
