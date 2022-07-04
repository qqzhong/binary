// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// Chapter 1: Introduction
// Modified by Church.ZHONG

.section .text
.global main
.type main, % function
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  sub sp, sp, #16
  mov x0, #64   /* write is syscall #64 */
  mov x1, #1
  ldr x2, =enter
  ldr x3, =enterLen
  CALL(syscall)        /* invoke syscall */
  add sp, sp, #16


  stp x29, x30, [sp,#-16]!
  mov x0, #64   /* write is syscall #64 */
  mov x1, #1
  ldr x2, =msg
  ldr x3, =msgLen
  CALL(syscall)        /* invoke syscall */
  ldp x29, x30, [sp],#16


  sub sp, sp, #16
  mov x0, #64   /* write is syscall #64 */
  mov x1, #1
  ldr x2, =leave
  ldr x3, =leaveLen
  CALL(syscall)        /* invoke syscall */
  add sp, sp, #16


  sub sp, sp, #16
  mov x0, #64   /* write is syscall #64 */
  mov x1, #1
  ldr x2, =enter
  ldr x3, =enterLen
  CALL(syscall)        /* invoke syscall */
  add sp, sp, #16

  sub sp, sp, #16
  mov x0, #64   /* write is syscall #64 */
  mov x1, #1
  ldr x2, =msg
  ldr x3, =msgLen
  CALL(syscall)        /* invoke syscall */
  add sp, sp, #16

  sub sp, sp, #16
  mov x0, #64   /* write is syscall #64 */
  mov x1, #1
  ldr x2, =leave
  ldr x3, =leaveLen
  CALL(syscall)        /* invoke syscall */
  add sp, sp, #16


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]example01\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]example01\n"
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
