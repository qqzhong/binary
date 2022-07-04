// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s43.html
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
sum = 0;
i = 0;
while ( i < 10 )
{
  sum = sum + A[i];
  i++;
}
#endif

// Example of translation a for-statement
  // sum = 0;  - always execute the RHS first !!!
  mov     r0, #0      // r0 = 0 - ready to save it

  movw    r1, #:lower16:sum
  movt    r1, #:upper16:sum       // r1 = addr(sum)
  str     r0, [r1]    // sum = 0;

  // i = 0;
  mov     r0, #0      // r0 = 0 - ready to save it
          // (not necessary, because r0 is already = 0...)

  movw    r1, #:lower16:i
  movt    r1, #:upper16:i   // r1 = addr(i)
  str     r0, [r1]    // i = 0;

while:  // START of while loop

  // Test while condition  i < 10
  movw    r0, #:lower16:i
  movt    r0, #:upper16:i   // r0 = addr(i)
  ldr     r1, [r0]    // r1 = i;

  cmp     r1, #10     // Check:  i < 10
  bge     whileEnd    // If i >= 10: exit while loop

  /* ***********************************
     While body
     *********************************** */
  // sum = sum + A[i]

  //// Get sum
  movw    r0, #:lower16:sum
  movt    r0, #:upper16:sum       // r0 = addr(sum)
  ldr     r2, [r0]    // r2 = sum;


  //// Get A[i]  (use base + offset access technique !)
  movw    r0, #:lower16:A
  movt    r0, #:upper16:A   // r0 = addr(sum)  --- Base address

  movw    r1, #:lower16:i
  movt    r1, #:upper16:i   // r1 = addr(i)
  ldr     r1, [r1]    // r1 = i     --- index

  add     r1, r1, r1        // r1 = 2*i
  add     r1, r1, r1        // r1 = 4*i   --- Offset !

  ldr     r3, [r0,r1]       // r3 = A[i]

  //// compute   sum + A[i]
  add     r2, r2, r3        // r2 = sum + A[i]

  //// Store result in sum (in memory)
  movw    r0, #:lower16:sum
  movt    r0, #:upper16:sum       // r0 = addr(sum)
  str     r2, [r0]    // sum = sum + A[i]

  // i = i + 1
  movw    r0, #:lower16:i
  movt    r0, #:upper16:i   // r0 = addr(i)
  ldr     r2, [r0]    // r2 = i;

  add     r2, r2, #1        // r2 = i + 1

  str     r2, [r0]    // i = i + 1;

  // End of while body --- branch back to test !!
  b       while

whileEnd:
  iPrint(sum)


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  .size main, (. - main)


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
i:      .skip   4
  .end
