#include "asm.h"

  .text
  .type main, %function
  .global main
main:
  // Save values of registers x29, x30 to the stack
  stp x29, x30, [sp, #-16]!

  // Program code
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  // Restore values of registers x29, x30 from the stack
  ldp x29, x30, [sp], #16
  // Return from subroutine to address in x30
  ret x30 /* The return instruction ret x30 is the same as just ret */
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test03\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test03\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

.end

// Modified by Church.ZHONG
