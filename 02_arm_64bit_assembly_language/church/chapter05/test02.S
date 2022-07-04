#include "asm.h"

// Chapter 5: Structured programming

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]!
  cout(enter, enterLen)

  // Listing 5.5 Selection in AArch64 assembly using a conditional instruction.
#if 0
static int a,b,x;
if ( a < b )
{x = 1;}
else
{x = 0;}
#endif
  adr x0, a // load pointer to a
  adr x1, b // load pointer to b
  ldr x0, [x0] // load a
  ldr x1, [x1] // load b
  cmp x0, x1 // compare them
  cset x0, lt // Conditionally set x0 to 1 if a
  adr x1, x // load pointer to x
  str x0, [x1] // store x0 in x

  mov x1, #99
  ldr x0, =format
  bl printf
  // return 0
  mov w0, #0

  cout(msg, msgLen)
  cout(leave, leaveLen)

  exit(#0x0)
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

  .data
format: .string "data=%d\n"
x: .quad 0x0
a: .quad 0x2
b: .quad 0x3

  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test02\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test02\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg


lessthan:
.asciz "x0 < x1\n"
lessthanLen = . - lessthan

greatthan:
.asciz "x0 > x1\n"
greatthanLen = . - greatthan

lessequal:
.asciz "x0 <= x1\n"
lessequalLen = . - lessequal

greatequal:
.asciz "x0 >= x1\n"
greatequalLen = . - greatequal

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

ten:
.asciz "ten\n"
tenLen = . - ten

.end
