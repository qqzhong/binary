// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/abc.html

/* -------------------------------------------------------------
   Define required labels for EGTAPI
   ------------------------------------------------------------- */
  .global Stop, CodeEnd
  .global DataStart, DataEnd
  .global k, bingo

/* -------------------------------------------------------------
   Begin of the program instructions
   ------------------------------------------------------------- */

.section .text
.global main
.type main, % function
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  b work

Stop:
CodeEnd:
  nop

  mov x0, #0 // return 0

  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


work:
  // Modified by Church.ZHONG
  // print a
  ldr x1, a
  adr x0, iFormat
  bl printf

  // print b
  ldr x1, b
  adr x0, iFormat
  bl printf

  // print c
  ldr x1, c
  adr x0, iFormat
  bl printf

  // c = a + b
  ldr x0, a
  ldr x1, b
  add w0, w0, w1 // 4bytes, 4bytes, 4bytes
  adr x1, c
  str w0, [x1] // Store the 4bytes from register w0 into memory location[x1].
  // print c
  ldr x1, c
  adr x0, iFormat
  bl printf

  // print length of x,y,z
  adr x0, iiiFormat
  ldr x1, =xLen
  ldr x2, =yLen
  ldr x3, =zLen
  bl printf

  // print value of x,y,z
  adr x2, x
  ldrsb x1, [x2]  // byte
  adr x0, bFormat
  bl printf

  adr x2, y
  ldrsh x1, [x2]  // 2bytes
  adr x0, sFormat
  bl printf

  ldr x1, z  // 4bytes
  adr x0, iFormat
  bl printf

  // x = y + z
  adr x1, y
  ldrsh x0, [x1] // 2bytes
  adr x2, z
  ldr x1, [x2] // 4bytes
  add w0, w0, w1
  adr x1, x
  strb w0, [x1] // Store the 1byte from register w0 into memory location[x1].
  // print x
  ldrsb x1, [x1]  // byte
  adr x0, bFormat // overflow
  bl printf

  // print value of x,y,z
  adr x2, x
  ldrsb x1, [x2]  // byte
  adr x0, bFormat
  bl printf

  adr x2, y
  ldrsh x1, [x2]  // 2bytes
  adr x0, sFormat
  bl printf

  ldr x1, z  // 4bytes
  adr x0, iFormat
  bl printf


  // z = x + y
  adr x1, x
  ldrsb x0, [x1]  // byte
  adr x2, y
  ldrsh x1, [x2]  // 2bytes
  add w0, w0, w1
  adr x1, z
  str w0, [x1] // Store the 4bytes from register w0 into memory location[x1].
  // print z
  ldr x1, z
  adr x0, iFormat
  bl printf

  b Stop


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]example001\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]example001\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


/* -------------------------------------------------------------
   Begin of the permanent program variables
   ------------------------------------------------------------- */
  .data
k: .4byte 22
bingo: .4byte 255

a:  .4byte  10  // a contains the value 10
b:  .4byte  11  // b contains the value 11
c:  .skip   4   // c is not initialized (will contain 0)

x:    .byte   4  // x contains the value 4 in 8  bits
    .align 1
xLen = . - x // xLen=2

y:    .2byte  5  // y contains the value 5 in 16 bits
    .align 2
yLen = . - y // yLen=2

z:    .4byte  256// z contains the value 256 in 32 bits
zLen = . - z // zLen=4
  .end
