// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s61.html
// Modified by Church.ZHONG
// This examples shows you the steps to build + tear down stack frame for 1 (non-leaf) subroutine

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


   /* -------------------------------------------------
    Pass parameters (using stack)
    ------------------------------------------------- */
   mov     r0, #5
   push    {r0}   // Pass 5 (param 2) using the program stack
   mov     r0, #2
   push    {r0}   // Pass 2 (param 1) using the program stack

   /* ------------------------------------------------------
    call f(2,5)
    ------------------------------------------------------ */
   bl      f

   add     sp, sp, #8  // Clean up the parameters 2,5 from the stack

   /* -----------------------------------------------------------------
    Assign return value (in r0) to variable result
    ----------------------------------------------------------------- */
   movw    r1, #:lower16:result  // Do NOT use r0 !!!
   movt    r1, #:upper16:result  // (Because r0 contains the return value)

   str     r0, [r1]             // This will store return value in result

  vdprint(x0)


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


f:
      // When  f begins, we will have: a,b  on the stack

      /* ==========================================================
         Function Prelude: complete the stack frame structure
         ========================================================== */
      push    {lr}            // Save LR (return address)
      push    {fp}            // Save FP (used by caller)
      mov     fp, sp          // Mark the stack top location before
                              // allocating any local variables
      sub     sp, sp, #8      // Allocate 2 int variables on the stack

      /* ===============================================
         We completed the stack frame
         Now we can write the function body
         =============================================== */
      // s = 0
      mov     r0, #0
      str     r0, [fp, #-4]   // assign 0 to s

      // i = a
      ldr     r0, [fp, #8]    // r0 = a
      str     r0, [fp, #-8]   // assign to i

while:
      // while ( i < b )
      ldr     r0, [fp, #-8]   // r0 = i
      ldr     r1, [fp, #12]   // r1 = b

      cmp     r0, r1          // i ? b
      bge     whileEnd        // Exit for loop

      // We CANNOT compute s + f(a+1, b-1) + 1 without the
      // value (= a number) for: f(a+1, b-1)

      // Compute f(a+1, b-1) first !
      ldr     r0, [fp, #12]   // r0 = b
      sub     r0, r0, #1      // r0 = b-1
      push    {r0}            // pass param2 (b-1)

      ldr     r0, [fp, #8]    // r0 = a
      add     r0, r0, #1      // r0 = a+1
      push    {r0}            // pass param1 (a+1) to f on stack

      bl      f
      add     sp, sp, #8      // Clean up parameter (n-1) from stack

      // We can now compute s + f(a+1, b-1) + 1

      ldr     r1, [fp, #-4]   // r1 = s
      add     r0, r0, r1      // r0 = s + f(a+1, b-1)
      add     r0, r0, #1      // r0 = s + f(a+1, b-1) + 1

      str     r0, [fp, #-4]   // Assign s + f(a+1, b-1) + 1  to s

      // i++
      ldr     r0, [fp, #-8]   // r0 = i
      add     r0, r0, #1      // r0 = i + 1
      str     r0, [fp, #-8]   // Assign i+1  to i

      b       while

whileEnd:
      // return   s  in r0
      ldr     r0, [fp, #-4]   // r0 = s

      /* =============================================================
         Function Postlude: de-allocate local variable and restore FP
         ============================================================= */
      mov     sp, fp          // De-allocate local variables
      pop     {fp}            // Restore fp
      pop     {pc}            // Return to the caller




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
element:.4byte   0
  .end
