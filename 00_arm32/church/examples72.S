// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s72.html
// Modified by Church.ZHONG
.section .text
.global main
.type main, % function
main:
  /* Function Prelude: complete the stack frame structure */
  push {lr}   // Save LR (return address)
  push {fp}   // Save FP (used by caller)
  mov  fp, sp  // Mark the stack top location before
      // allocating any local variables
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  iPrint(result)


  // First Recursive Function: Factorial
  /* -------------------------------------------------
    Pass parameter k (using stack)
    ------------------------------------------------- */
  movw   r0, #:lower16:k
  movt   r0, #:upper16:k
  ldr    r0, [r0]   // r0 = k
  push   {r0}       // Pass k using the program stack

  /* ------------------------------------------------------
    call fac(k)
    ------------------------------------------------------ */
  bl    fac

  add    sp, sp, #4    // Clean up the parameter k from the stack

  /* -----------------------------------------------------------------
    Assign return value (in r0) to variable result
    ----------------------------------------------------------------- */
  movw   r1, #:lower16:result  // Do NOT use r0 !!!
  movt   r1, #:upper16:result  // (Because r0 contains the return value)

  str    r0, [r1]     // This will store return value in result


  iPrint(result)


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp  // De-allocate local variables
  pop {fp}    // Restore FP
  pop {pc}    // Return to the caller
  .size main, (. - main)


fac:
  /* ==========================================================
    Function Prelude: complete the stack frame structure
    ========================================================== */
  push   {lr}    // Save LR (return address)
  push   {fp}    // Save FP (used by caller)
  mov    fp, sp   // Mark the stack top location before
          // allocating any local variables
  sub    sp, sp, #0    // Allocate 0 int variables on the stack
          // (I could omit this instruction....)

  /* ===============================================
    Now we can write the function body
    =============================================== */
  // if ( n == 0 )
  ldr    r0, [fp, #8]   // r0 = n

  cmp    r0, #0   // Check n == 0
  bne    else    // n != 0 --> Goto "else" part

  // return 1

  ///// put return value 1 in return location r0
  mov    r0, #1

  /* =============================================================
    Function Postlude: de-allocate local variable and restore FP
    ============================================================= */
  mov    sp, fp   // De-allocate local variables
  pop    {fp}    // Restore fp
  pop    {pc}    // Return to the caller

else:
  // Compute: n*fac(n-1)

  //// Compute fac(n-1) first
  ldr    r0, [fp, #8]   // r0 = n
  sub    r0, r0, #1    // r0 = n-1

  push   {r0}    // pass (n-1) to fac on stack
  bl    fac     // Calls:  fac( ) with parameter = (n-1) !!!
  add    sp, sp, #4    // Clean up parameter (n-1) from stack

  //// ** Right here and now: r0 = fac(n-1) !!!

  //// Compute n*fac(n-1) next
  ldr    r1, [fp, #8]   // r0 = n
  mul    r0, r1, r0    // r0 = n*fac(n-1)
          // NOTE: r0 has the correct return value !!!

  // return  - with  n*fac(n-1)  inside r0 !!!
  /* =============================================================
    Function Postlude: de-allocate local variable and restore FP
    ============================================================= */
  mov    sp, fp   // De-allocate local variables
  pop    {fp}    // Restore fp
  pop    {pc}    // Return to the caller


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


// ===========================================================
  .data
k:  .4byte  4
result: .4byte  0
  .end
