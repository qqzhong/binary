// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s73.html
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

// Second Recursive Function
#if 0
int f(int a, int b)
{
  int i, s;

  s = 0;
  for (i = a; i < b; i++)
  {
    s = s + f(a+1, b-1) + 1;
  }
  return s;
}
#endif
/* -------------------------------------------------
    Pass parameters (using stack)
    ------------------------------------------------- */
  mov    r0, #5
  push   {r0}  // Pass 5 (param 2) using the program stack
  mov    r0, #2
  push   {r0}  // Pass 2 (param 1) using the program stack

  /* ------------------------------------------------------
    call f(2,5)
    ------------------------------------------------------ */
  bl    f

  add    sp, sp, #8  // Clean up the parameters 2,5 from the stack

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


f:
  // When  f begins, we will have: a,b  on the stack

  /* ==========================================================
    Function Prelude: complete the stack frame structure
    ========================================================== */
  push   {lr}    // Save LR (return address)
  push   {fp}    // Save FP (used by caller)
  mov    fp, sp   // Mark the stack top location before
          // allocating any local variables
  sub    sp, sp, #8    // Allocate 2 int variables on the stack

  /* ===============================================
    We completed the stack frame
    Now we can write the function body
    =============================================== */
  // s = 0
  mov    r0, #0
  str    r0, [fp, #-4]  // assign 0 to s

  // i = a
  ldr    r0, [fp, #8]   // r0 = a
  str    r0, [fp, #-8]  // assign to i

while:
  // while ( i < b )
  ldr    r0, [fp, #-8]  // r0 = i
  ldr    r1, [fp, #12]  // r1 = b

  cmp    r0, r1   // i ? b
  bge    whileEnd  // Exit for loop

  // We CANNOT compute s + f(a+1, b-1) + 1 without the
  // value (= a number) for: f(a+1, b-1)

  // Compute f(a+1, b-1) first !
  ldr    r0, [fp, #12]  // r0 = b
  sub    r0, r0, #1    // r0 = b-1
  push   {r0}    // pass param2 (b-1)

  ldr    r0, [fp, #8]   // r0 = a
  add    r0, r0, #1    // r0 = a+1
  push   {r0}    // pass param1 (a+1) to f on stack

  bl    f
  add    sp, sp, #8    // Clean up parameter (n-1) from stack

  // We can now compute s + f(a+1, b-1) + 1

  ldr    r1, [fp, #-4]  // r1 = s
  add    r0, r0, r1    // r0 = s + f(a+1, b-1)
  add    r0, r0, #1    // r0 = s + f(a+1, b-1) + 1

  str    r0, [fp, #-4]  // Assign s + f(a+1, b-1) + 1  to s

  // i++
  ldr    r0, [fp, #-8]  // r0 = i
  add    r0, r0, #1    // r0 = i + 1
  str    r0, [fp, #-8]  // Assign i+1  to i

  b     while

whileEnd:
  // return  s  in r0
  ldr    r0, [fp, #-4]  // r0 = s

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
