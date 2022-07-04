// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// x86 example

.section .text
.global main
.type main, @ function
main:
  FRAME_BEGIN

  cout(enter, enterLen)
  cout(msg, msgLen)
  bPrint(b)
  sPrint(s)
  iPrint(x)
  iiPrint(x,y)
  iiiPrint(x,y,z)
  cout(leave, leaveLen)

  FRAME_END
  movq $0, %rax
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][x86 64bit assembly]example01\n"
enterLen = . - enter

leave:
.asciz "[leave][x86 64bit assembly]example01\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"

.data
b: .byte 98
s: .2byte 254
x: .4byte 10000000
y: .4byte 10000001
z: .4byte 10000002
.end
