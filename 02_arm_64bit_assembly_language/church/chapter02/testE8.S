#include "asm.h"

// exercise 2.8

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]! // Store x29 and x30 on the stack

  cout(txt, txtLen)

  mov w0, #0
  ldp x29, x30, [sp], #16 // Restore x29 and x30, and sp
  ret
  .size main, (. - main)

  .section ".rodata"
txt:
.string "The three goals of the mission are:\n" \
"1) Keep each line of code under 80 characters,\n" \
"2) Write readable comments,\n" \
"3) Learn a valuable skill for readability.\n" 
txtLen = . - txt

.end

// Modified by Church.ZHONG
