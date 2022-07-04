// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/traverse-lists.html

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
  // sum = 0;  - always execute the RHS first !!!
  mov     r0, #0                  // r0 = 0 - ready to save it

  movw    r1, #:lower16:sum
  movt    r1, #:upper16:sum       // r1 = addr(sum)
  str     r0, [r1]                // sum = 0;

  // ptr(r10) = head;
  movw    r0, #:lower16:head
  movt    r0, #:upper16:head      // r0 = addr(head)
  ldr     r10, [r0]               // r10 = head

while:  // START of while loop

  // Test while condition  ptr (r10) != null
  cmp     r10, #0                 // Check:  ptr (r10) != null

  beq     whileEnd                // If ptr(r10) == null: exit while loop

  /* ***********************************
     While body
     *********************************** */
  // sum = sum + ptr(r10).value

  //// Get sum
  movw    r0, #:lower16:sum
  movt    r0, #:upper16:sum       // r0 = addr(sum)
  ldr     r1, [r0]                // r1 = sum;


  //// Get ptr(r10).value  (use base + offset !)
  ldr     r2, [r10, #0]           // r2 = ptr(r10).value

  //// compute   sum + ptr(r10).value
  add     r1, r1, r2              // r1 = sum + ptr(r10).value

  //// Store result in sum (in memory)
  movw    r0, #:lower16:sum
  movt    r0, #:upper16:sum       // r0 = addr(sum)
  str     r1, [r0]                // sum = sum + ptr(r10).value

  // ptr = ptr.next
  ldr     r10, [r10, #4]          // ptr(r10) = ptr(r10).next

  // End of while body --- branch back to test !!
  b       while

whileEnd:

  b Stop


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example106\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example106\n"
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

sum:    .skip   4

head:   .4byte  p0        // head contains the address of the first list elem
                        // head->[34]->[-9]->[99]->[78]->[55]

// list structure is: [int value, next]
p0: .4byte  34, p3      // p0 contains [34, p3]
p1: .4byte  59, p2      // p1 contains [99, p2]
p2: .4byte  66, p4      // p2 contains [78, p2]
p3: .4byte  -9, p1      // p3 contains [-9, p2]
p4: .4byte  50, 0       // p4 contains [55, p2]
  .end
