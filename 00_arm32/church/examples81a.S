// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s81.html
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


  iPrint(k)

#if 0
/* ====================================================
   Function with a parameter that is passed by value
   ==================================================== */
void  f(int & a)  // Var a is passed by reference
{
   a = a + 1;
}

int main(int argc, char *argv[])
{
   int k = 7;

   f(k);
}
#endif
  /* =========================================
     Pass k to f( ) by reference
     ========================================= */
  movw    r0, #:lower16:k
  movt    r0, #:upper16:k   // r0 = address of k
  push    {r0}              // Pass k by reference (pass k's address)

  bl      f                 // Call function f
  add   sp, sp, #4          // Clean up parameters on the stack


  // print r0
  mov r1, r0
  ldr r0, =iFormat
  bl printf


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  .size main, (. - main)



f:
  /* ****************************************
     Prelude: build stack frame
     **************************************** */
  push    {lr}         // Save return address in LR
  push    {fp}         // Save Frame Pointer in FP
  mov     fp, sp       // Initialize my own FP
  sub     sp, sp, #0   // I create 0 local variable in stack

  /* =======================================
     Translating a = a + 1
     ======================================= */
  ldr     r0, [fp, #8] // r0 = address of parameter
  ldr     r1, [r0]     // Get the value through the address
  add     r1, r1, #1   // r0 = a + 1
  ldr     r0, [fp, #8] // r0 = address of parameter
  str     r1, [r0]     // Assign result to the variable through its address
  // return the value of parameter
  mov     r0, r1

  /* ************************************************
     Postlude: break down stack frame
     ************************************************ */
  mov     sp, fp       // De-allocate the local variables
  pop     {fp}         // Restore old FP
  pop     {pc}         // Return


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


/* ----------------------------------------------------- */
    .data
k:  .4byte  7                 // This is the variable k
    .end
