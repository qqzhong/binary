#include "asm.h"

// Chapter 5: Structured programming

.section .text
.global main
main:
  cout(enter, enterLen)
  cout(msg, msgLen)

  // FIXME
  bl doit
  mov x1, x0
  adr x0, format
  bl printf

  cout(leave, leaveLen)

  exit(#0x0)
  ret
  .size main, (. - main)


// Listing 5.28 A small C function with a register variable.
#if 0
int doit(void)
{
int x[20];
register int i; /* try to keep i in a register */
for(i = 0; i < 20; i++)
x[i] = i;
return i;
}
#endif


  // Listing 5.29 Automatic variables in AArch64 assembly.
  .type doit, %function
  .global doit
doit:
  sub sp, sp, #80 // int x[20];
  mov w2, #0 // w2 is i
loop:
  cmp w2, #20 // pre-test loop
  bge done // if (i >= 20) goto done
  str w2, [sp, x2, lsl #2] // x[i] = i;
  add w2, w2, #1 // i++
  b loop // go back to loop test
done:
  mov w0, w2 // return i
  add sp, sp, #80 // destroy automatic variable
  ret // return from function
  .size doit, (. - doit)



.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test14\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test14\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

  .data
format: .string "data=%d\n"

.end
