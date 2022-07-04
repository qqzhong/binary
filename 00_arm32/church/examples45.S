// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s45.html
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


  iPrint(max)

  //Find the maximum value stored in a linked list

  // max = head.value;  - always execute the RHS first !!!

  // Step 1: Get the LHS value (into a register)
  movw    r1, #:lower16:head
  movt    r1, #:upper16:head  // r1 = addr(head)
  ldr     r1, [r1]      // r1 = head (value(head))
  ldr     r1, [r1, #0]  // r1 = head.value

  // Step 2: Store value into RHS (max)
  movw    r0, #:lower16:max
  movt    r0, #:upper16:max
  str     r1, [r0]

  // Step 1: Get the LHS value (into a register)
  movw    r1, #:lower16:head
  movt    r1, #:upper16:head  // r1 = addr(head)
  ldr     r1, [r1]      // r1 = head (value(head))
  ldr     r1, [r1, #4]  // r1 = head.next

  // Step 2: Store value into RHS
  movw    r0, #:lower16:ptr
  movt    r0, #:upper16:ptr
  str     r1, [r0]



while:  // START of while loop

  // Test while condition  ptr != null
  movw    r0, #:lower16:ptr
  movt    r0, #:upper16:ptr
  ldr     r0, [r0]
  cmp     r0, #0

  beq     whileEnd    // If ptr == null: exit while loop

  /* ***********************************
     While body
     *********************************** */
  // if ( ptr.value > max )

  //// Get ptr.value  (use base + offset access technique !)
  movw    r0, #:lower16:ptr
  movt    r0, #:upper16:ptr
  ldr     r0, [r0]
  ldr     r0, [r0, #0]    // r0 = ptr.value

  //// Get max
  movw    r1, #:lower16:max
  movt    r1, #:upper16:max  // r1 = addr(max)
  ldr     r1, [r1]

  //// Compare  ptr.value (= r0) < max (= r2)
  cmp     r0, r1
  ble     ifEnd


  /* ********************************************
     Then-part: max = ptr.value
     ******************************************** */
  movw    r0, #:lower16:ptr
  movt    r0, #:upper16:ptr
  ldr     r0, [r0]
  ldr     r0, [r0, #0]    // r0 = ptr.value

  movw    r1, #:lower16:max
  movt    r1, #:upper16:max
  str     r0, [r1]

ifEnd:

  // ptr = ptr.next
  movw    r0, #:lower16:ptr
  movt    r0, #:upper16:ptr   // r0 = addr(ptr)
  ldr     r1, [r0]

  ldr     r1, [r1, #4]    // r1 = ptr.next
  str     r1, [r0]


  // End of while body --- branch back to test !!
  b       while

whileEnd:
  iPrint(max)


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

ptr:    .skip   4
max:    .skip   4

head:   .4byte  p0      // head contains the address of the first list elem
      // head->[34]->[-9]->[99]->[78]->[55]

// list structure is: [int value, next]
p0: .4byte  34, p3      // p0 contains [34, p3]
p1: .4byte  59, p2      // p1 contains [99, p2]
p2: .4byte  66, p4      // p2 contains [78, p4]
p3: .4byte  -9, p1      // p3 contains [-9, p1]
p4: .4byte  50, 0       // p4 contains [55, null]

  .end
