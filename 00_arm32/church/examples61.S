// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s61.html
// Modified by Church.ZHONG
.section .text
.global main
.type main, % function
main:
  /* Function Prelude: complete the stack frame structure */
  push {lr}    // Save LR (return address)
  push {fp}    // Save FP (used by caller)
  mov  fp, sp  // Mark the stack top location before
         // allocating any local variables
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  iPrint(sum)

#if 0
   /* -------------------------------------------------------
      sumRange(A,a,b):  returns  (A[a] + A[a+1] + ... + A[b-1])
      ------------------------------------------------------- */
int sumRange(int[] A, int a, int b )
{
int i, s;

s = 0;
for (i = a, i < b; i++)
  s = s + A[i];
return(s);
}
#endif
  movw    r3, #:lower16:A
  movt    r3, #:upper16:A
  mov r0, r3
  mov r1, #0
  mov r2, #10
  bl sumRange

  movw    r1, #:lower16:sum
  movt    r1, #:upper16:sum
  str r0, [r1]


  iiiPrint(sum,iDebug,elementDebug)


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  .size main, (. - main)


sumRange:
  // When  sumRange  begins, we will have: r0 = A, r1 = a, r2 = b
  // We will use  r3  as local variable i  and  r4 as local variable s

  // s = 0;
  mov     r4, #0    // r4(=s) = 0

  // i = a;
  mov     r3, r1    // r3(=i) = r1(=a)

while:  // while (i < b)
  cmp     r3, r2    // r3 = i, r2 = b
  bge     whileEnd

  // s = s + A[i];

  ///// get A[i] in r10
  mov     r5, r3    // r5 = i (because r3 = i)
  add     r5, r5, r5      // r5 = 2*i
  add     r5, r5, r5      // r5 = 4*i   = offset used to access A[i]
  ldr     r10, [r0, r5]   // r10 = A[i] (r0=A(base), r5=offset)
  add     r4, r4, r10     // r4(=s) = r4(=s) + r10(=A[i])
  movw    r6, #:lower16:elementDebug
  movt    r6, #:upper16:elementDebug
  str     r10, [r6]

  // i++
  add     r3, r3, #1      // r3(=i) = r3(=i) + 1
  movw    r6, #:lower16:iDebug
  movt    r6, #:upper16:iDebug
  str     r3, [r6]

  b       while     // End of while body - loop back !!

whileEnd:
  // return(s)
  mov     r0, r4    // r0(return location) = r4(=s)
        // The return value is now in r0
  mov     pc, lr    // Return to the caller


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example001\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example001\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


/* --------------------------------------------------
   Begin of the permanent program variables
   -------------------------------------------------- */
  .data
A:      .4byte  4, 6, 7, 3, 8, 2, 9, 1, 5, 10      // int array (with 10 values)
sum:    .skip   4
iDebug:      .skip   4
elementDebug:.4byte  0
  .end
