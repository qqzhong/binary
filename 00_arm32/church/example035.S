// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/fib-ARM.html

/* -------------------------------------------------------------
   Define required labels for EGTAPI
   ------------------------------------------------------------- */
  .global Stop, CodeEnd
  .global DataStart, DataEnd
  .global k, bingo

/* -------------------------------------------------------------
   Begin of the program instructions
   ------------------------------------------------------------- */

.section .text
.global main
.type main, % function
main:
  /* Function Prelude: complete the stack frame structure */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  iiPrint(k, bingo)
  movw    r0, #:lower16:k
  movt    r0, #:upper16:k // r0 = address of k
  /*ldr     r0, [r0]*/    // Pass k by reference (pass k's address)
  /* -------------------------------------------------------------
     Pass parameter k (using stack)
     ------------------------------------------------------------- */
  push    {r0}            // Pass k using the program stack
  /* -------------------------------------------------------------
     call byRef(k)
     ------------------------------------------------------------- */
  bl      byRef
  add     sp, sp, #4      // Clean up the parameter k
  iiPrint(k, bingo)


  movw    r0, #:lower16:k
  movt    r0, #:upper16:k // r0 = address of k
  ldr     r0, [r0]        // r0 = value of k
                          // Pass k by value (pass k's value)
  /* -------------------------------------------------------------
     Pass parameter k (using stack)
     ------------------------------------------------------------- */
  push    {r0}            // Pass k using the program stack
  /* -------------------------------------------------------------
     call byVal(k)
     ------------------------------------------------------------- */
  bl      byVal
  add     sp, sp, #4      // Clean up the parameter k
  iiPrint(k, bingo)


  b work


Stop:
CodeEnd:
  nop


  /* Function Postlude: de-allocate local variable and restore FP */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller
  .size main, (. - main)


byRef:
  /* =============================================================
     Function Prelude: complete the stack frame structure
     ============================================================= */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  sub     sp, sp, #0      // I create 0 local variables in stack

  ldr     r0, [fp, #8]    // r0 = address of k
  mov     r1, #33
  str     r1, [r0]        // k = r1

  /* -------------------------------------------------------------
     Assign return value (in r0) to variable result
     ------------------------------------------------------------- */
  // This will store return value in result

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller


byVal:
  /* =============================================================
     Function Prelude: complete the stack frame structure
     ============================================================= */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  sub     sp, sp, #0      // I create 0 local variables in stack

  ldr     r0, [fp, #8]         // r0 = address of k
  movw    r1, #:lower16:bingo
  movt    r1, #:upper16:bingo  // r1 = address of bingo
  str     r0, [r1]             // bingo = k

  /* -------------------------------------------------------------
     Assign return value (in r0) to variable result
     ------------------------------------------------------------- */
  // This will store return value in result

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller


work:
  // Modified by Church.ZHONG
  iiPrint(k,result)
  //  High level programming statement:
  //
  //     result = fib(k)

  /* -------------------------------------------------
     Pass parameter k (using stack)
     ------------------------------------------------- */
  movw    r0, #:lower16:k
  movt    r0, #:upper16:k
  ldr     r0, [r0]      // r0 = k
  push    {r0}    // Pass k using the program stack

  /* ------------------------------------------------------
     call result = fib(k)
     ------------------------------------------------------ */
  bl      fib

  add     sp, sp, #4      // Clean up the parameter k

  /* -----------------------------------------------------------------
     Save return value (in r0) to variable result
     ----------------------------------------------------------------- */
  movw    r1, #:lower16:result  // Do NOT use r0 !!!
  movt    r1, #:upper16:result  // (Because r0 contains the return value)

  str     r0, [r1]       // This will store return value in sum
  iiPrint(k,result)

  b Stop


/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter k                |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
/* ----------------------------------------------------------------
   Function int fib(int n)

  Stack frame structure:

    old FP   <--------------------------------- FP
    old LR (ret addr)
      n         +8

   Body of fib(n)

  if ( n == 0 )
     return 1;
  if ( n == 1 )
     return 1;
  else
     return ( fib(n-1) + fib(n-2) );
   ---------------------------------------------------------------- */

fib:
  // When  fib  begins, we will have: parameter  n  on the stack

  /* ==========================================================
     Function Prelude: complete the stack frame structure
     ========================================================== */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
        // allocating any local variables
  sub     sp, sp, #0      // Allocate 0 int variables on the stack
        // (I could omit this instruction....)


  /* ===============================================
     We have completed the stack frame
     Now we can write the function body
     =============================================== */
  // if ( n == 0 )
  ldr     r0, [fp, #8]    // r0 = n

  cmp     r0, #0    // Check n == 0
  bne     else1     // n != 0 --> Goto "else1" part

  // return 1

  ///// put return value 1 in return location r0
  mov     r0, #1

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore fp
  pop     {pc}      // Return to the caller

else1:
  // if ( n == 1 )
  ldr     r0, [fp, #8]    // r0 = n

  cmp     r0, #1    // Check n == 1
  bne     else2     // n != 1 --> Goto "else2" part

  // return 1

  ///// put return value 1 in return location r0
  mov     r0, #1

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore fp
  pop     {pc}      // Return to the caller


else2:
  // Compute: fib(n-1) + fib(n-2)

  //// Compute fib(n-1) first
  ldr     r0, [fp, #8]    // r0 = n
  sub     r0, r0, #1      // r0 = n-1

  push    {r0}      // pass (n-1) to fib on stack
  bl      fib       // Calls:  fib( ) with parameter = (n-1) !!!
  add     sp, sp, #4      // Clean up parameter (n-1) from stack

  //// ** Right now, r0 = fib(n-1)  --- we can't lose this value !!!
  //// ** But we can't compute  fib(n-1) + fib(n-2)  without fib(n-2)
  //// ** We will call fib to compute fib(n-2)
  //// ** We MUST save r0 on the STACK !!!

  push    {r0}      // Save fib(n-1)  on the stack

  //// Compute fib(n-2)
  ldr     r0, [fp, #8]    // r0 = n
  sub     r0, r0, #2      // r0 = n-2

  push    {r0}      // pass (n-2) to fib on stack
  bl      fib
  add     sp, sp, #4      // Clean up parameter (n-2) from stack

  //// ** Right now, r0 = fib(n-2) - we can now compute fib(n-1)+fib(n-2)

  pop     {r1}      // Retrieve fib(n-1)  from the stack

  add     r0, r1, r0      // r0 = fib(n-1) + fib(n-2)
        // NOTE: r0 has the correct return value !!!

  // return   fib(n-1)+fib(n-2)  in r0

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore fp
  pop     {pc}      // Return to the caller


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example035\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example035\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


/* -------------------------------------------------------------
   Begin of the permanent program variables
   ------------------------------------------------------------- */
  .data
k:.4byte 22
bingo:.4byte 255
result: .4byte 0
  .end
