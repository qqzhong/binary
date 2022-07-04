#include "asm.h"

// Chapter 5: Structured programming

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]!
  cout(enter, enterLen)

// Listing 5.4 Selection in AArch64 assembly using branch instructions.
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
if:
  cmp x0, x1 // compare them
  bge else // if a >= b then skip forward
  cout(lessthan, lessthanLen)           //x0 < x1
  mov x0, #1 // THEN section - load 1 into x0
  b endif // skip the else section
else:
  cout(greatequal, greatequalLen)           //x0 >= x1
  mov x0, #0 // ELSE section - load 0 into x0
endif:
  adr x1, x // load pointer to x
  str x0, [x1] // store x0 in x

  // FIXME
  adr x0, format
  mov x1, #99
  bl printf
  mov w0, #0 // load return value

  cout(msg, msgLen)
  cout(leave, leaveLen)

  exit(#0x0)
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

  .data
x: .quad 0x0
a: .quad 0x2
b: .quad 0x1

  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test01\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test01\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

format: .string "data=%x\n"


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

