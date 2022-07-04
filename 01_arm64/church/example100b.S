// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/skel-pass-with-stack.html
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


        
        mov   r0, #2222    // Pass 2222 as parameter 2 on stack
        push  {r0}

        mov   r0, #1111    // Pass 1111 as parameter 1 on stack
        push  {r0}

        bl    A            // Call function A
        add   sp, sp, #8   // Clean up parameters on the stack

        // When A returns, you will see the return value in r0 = 9999
        nop
        nop
Stop:
        nop


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
  exit(#0)
  .size main, (. - main)


A:
        // When run in EGTAPI - you will see {1111, 2222} on stack

        /* ****************************************
           Prelude: build stack frame
           **************************************** */
        push    {lr}            // Save return address in LR
        push    {fp}            // Save Frame Pointer in FP
        mov     fp, sp          // Initialize my own FP
        sub     sp, sp, #12     // I create 3 local variable in stack      

        // How to to access parameters and local variables
        // stored in the program stack

        ldr     r0, [fp, #8]    // Get parameter 1 = 1111
        str     r0, [fp, #-12]  // Store in local variable 1
        ldr     r1, [fp, #12]   // Get parameter 2 = 2222
        str     r1, [fp, #-8]   // Store in local variable 2
        add     r0, r0, r1
        str     r0, [fp, #-4]   // Store sum in local variable 3

       /* =================================================
           We can use a register to return the return value
           ================================================= */
        mov   r0, #9999         // Pass return value in register r0

        /* ************************************************
           Postlude: break down stack frame
           ************************************************ */
        mov     sp, fp
        pop     {fp}

        pop     {pc}            // Return


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example100\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example100\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"

.end

#if 0
   /* ---------------------------------
      Prelude code: build stack frame
      --------------------------------- */
   push {lr}            // Save return address
   push {fp}            // Save old FP
   mov  fp, sp          // Initial function's own FP
   sub  sp, sp, #N      // Allocate N bytes on stack for local vars    


   /* -------------------------------------------
      Postlude code: break down the stack frame
                     and return to caller
      ------------------------------------------- */
   mov  sp, fp          // De-allocate stack space of local vars
   pop  {fp}		// Restore old FP
   pop  {pc}		// Return to caller
#endif
