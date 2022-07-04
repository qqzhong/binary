// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s72.html
// Modified by Church.ZHONG
// Coding the fac( ) (recursive) functio

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  // main:
  sub sp, sp, #16
  /* -------------------------------------------------
   Pass parameter k (using stack)
   ------------------------------------------------- */
  ldr     x0, k            // x0 = k
  str    x0, [sp, #0]                // Pass k using the program stack

  /* ------------------------------------------------------
   call fac(k)
   ------------------------------------------------------ */
  bl      fac

  add     sp, sp, #16      // Clean up the parameter k from the stack

  /* -----------------------------------------------------------------
   Assign return value (in r0) to variable result
   ----------------------------------------------------------------- */
  // Do NOT use x0 !!! // (Because x0 contains the return value)
  adr x1, result  
  str x0, [x1]             // This will store return value in result


  vdprint(result)


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*           +----------------------------+
*           | variable 3 for sum         |
*           +----------------------------+
*           | variable i for sum         |
*           +----------------------------+
*           | variable s for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter b                |
*           +----------------------------+
*           | parameter a                |
*           +----------------------------+
*           | parameter A                |
*           +----------------------------+
*           | padding                    |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
fac:
  /* ==========================================================
     Function Prelude: complete the stack frame structure
     ========================================================== */
  // Save LR (return address)
  // Save FP (used by caller)
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  mov     x29, sp          // Mark the stack top location before
                          // allocating any local variables
  sub     sp, sp, #16      // Allocate 0 int variables on the stack
                          // (I could omit this instruction....)
  str x30, [sp, #0]

  /* ===============================================
     Now we can write the function body
     =============================================== */
  // if ( n == 0 )
  ldr     x0, [x29, #16]    // x0 = n

  cmp     x0, #0          // Check n == 0
  bne     Else            // n != 0 --> Goto "else" part

  // return 1

  ///// put return value 1 in return location r0
  mov     x0, #1

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  ldr x30, [sp, #0]
  add     sp, sp, #16
  // De-allocate local variables
  mov     sp, x29
  // Restore fp
  // Return to the caller
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack


Else:
  // Compute: n*fac(n-1)

  //// Compute fac(n-1) first
  ldr     x0, [x29, #16]    // x0 = n
  sub     x0, x0, #1      // x0 = n-1

  str    x0, [sp, #0]            // pass (n-1) to fac on stack
  bl      fac             // Calls:  fac( ) with parameter = (n-1) !!!
  add     sp, sp, #8      // Clean up parameter (n-1) from stack

  //// ** Right here and now: r0 = fac(n-1) !!!

  //// Compute n*fac(n-1) next
  ldr     x1, [x29, #8]    // x0 = n
  mul     x0, x1, x0      // x0 = n*fac(n-1)
                          // NOTE: x0 has the correct return value !!!

  // return  - with  n*fac(n-1)  inside x0 !!!
  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  ldr x30, [sp, #0]
  add     sp, sp, #16
  // De-allocate local variables
  mov     sp, x29
  // Restore fp
  // Return to the caller
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack


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
k:      .4byte   10
result: .4byte   0
  .end
