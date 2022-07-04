// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s61.html
// Modified by Church.ZHONG
// The sumRange( ) function in ARM assembler code
// Disadvantage:   sumRange( ) can not call another function (its parameters and local variables will be overwritten !!!)

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  adr x0, A
  mov x1, 0
  mov x2, 1
  bl sumRange

  // print x0
  mov x1, x0
  adr x0, format
  bl printf

  adr x0, A
  mov x1, 3
  mov x2, 6
  bl sumRange

  // print x0
  mov x1, x0
  adr x0, format
  bl printf

  adr x0, A
  mov x1, 0
  mov x2, 10
  bl sumRange

  // print x0
  mov x1, x0
  adr x0, format
  bl printf


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


sumRange:
  // When  sumRange  begins, we will have: x0 = A, x1 = a, x2 = b
  // We will use  x3  as local variable i  and  x4 as local variable s
  // s = 0;
  mov     x4, #0          // x4(=s) = 0
  // i = a;
  mov     x3, x1          // x3(=i) = x1(=a)

while:  // while (i < b)
  cmp     x3, x2          // x3 = i, x2 = b
  bge     whileEnd
  // s = s + A[i];
  ///// get A[i] in r10
  mov     x5, x3          // x5 = i (because x3 = i)
  add     x5, x5, x5      // x5 = 2*i
  add     x5, x5, x5      // x5 = 4*i   = offset used to access A[i]
  ldr     x10, [x0, x5]   // x10 = A[i] (r0=A(base), r5=offset)
  add     x4, x4, x10     // x4(=s) = x4(=s) + x10(=A[i])

  // i++
  add     x3, x3, #1      // x3(=i) = x3(=i) + 1

  b       while           // End of while body - loop back !!

whileEnd:
  // return(s)
  mov x0, x4        // r0(return location) = r4(=s)
                    // The return value is now in r0
  ret               // Return to the caller


.section ".rodata"
enter:
.ascii "[enter][arm 64bit assembly]example002\n"
enterLen = . - enter

leave:
.ascii "[leave][arm 64bit assembly]example002\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


#if 0
address(value field) = base address(list element) + 0
address(next field)  = base address(list element) + 4
#endif

vformat: .asciz "data=%d\n"
vvformat: .asciz "data=%d,%d\n"
vvvformat: .asciz "data=%d,%d,%d\n"

/* --------------------------------------------------
   Begin of the permanent program variables
   -------------------------------------------------- */
  .data
A:      .4byte  4, 6, 7, 3, 8, 2, 9, 1, 5, 10      // int array (with 10 values)
sum:    .skip   4
i:      .skip   4
element:.4byte  0
  .end
