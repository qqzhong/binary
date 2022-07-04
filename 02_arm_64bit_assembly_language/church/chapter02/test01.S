#include "asm.h"

// Chapter 2: GNU assembly syntax

.section .text
.global main
.type main, % function
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)

  mov x0, #0                     // loop initialization
loop:
  cmp x0, #5                     // condition
  b.gt done
  bl printf                      // loop body
  add x0, x0, #1                 // increment
  b loop                         // loop
done:

  cout(leave, leaveLen)

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

// Listing 2.6 Defining a symbol for the number of elements in an array.
// variable3.S


  .data
i: .word 0
j: .word 1
fmt: .asciz "Hello\n"
ch: .byte 'A','B',0
  .align 2
ary: .word 0,1,2,3,4
.equ arysize, (. - ary)/4

.end

// Modified by Church.ZHONG
