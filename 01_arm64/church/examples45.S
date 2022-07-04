// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s45.html
// Modified by Church.ZHONG
  // Find the maximum value stored in a linked list
#if 0
   max = first value in the serie
   for nextValue = 2nd, 3rd, ...., last value in serie do
   {
    if ( nextValue > max )
       max = nextValue;
   }
#endif

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  // max = head.value;  - always execute the RHS first !!!

  // Step 1: Get the LHS value (into a register)
  adr x1, head            // x1 = addr(head)
  ldr w1, [x1]            // x1 = head (value(head))
  ldr w1, [x1, #0]        // x1 = head.value

  // Step 2: Store value into RHS (max)
  adr x0, max             // x0 = addr(max)
  str w1, [x0]

  // Step 1: Get the LHS value (into a register)
  adr x1, head            // x1 = addr(head)
  ldr w1, [x1]            // x1 = head (value(head))
  ldr w1, [x1, #4]        // x1 = head.next

  // Step 2: Store value into RHS
  adr x2, ptr             // x2 = addr(ptr)
  str w1, [x2]            // ptr = head.next

While: // START of while loop
  // Test while condition  ptr != null
  ldr x1, [x2]
  cmp w1, #0
  beq WhileEnd        // If ptr == null: exit while loop

  /* ***********************************
  While body
  *********************************** */
  // if ( ptr.value > max )

  //// Get ptr.value  (use base + offset access technique !)
  ldr w1, [x2]
  ldr w1, [x1, #0]    // x1 = ptr.value

  //// Get max
  ldr w3, [x0]

  //// Compare  ptr.value (= x1) < max (= x3)
  cmp w1, w3
  ble IfEnd

  /* ********************************************
  Then-part: max = ptr.value
  ******************************************** */
  ldr w1, [x2]
  ldr w1, [x1, #0]    // x1 = ptr.value
  str w1, [x0]

IfEnd:
  // ptr = ptr.next
  ldr w1, [x2]
  ldr w1, [x1, #4]    // x1 = ptr.next
  str w1, [x2]

  // End of while body --- branch back to test !!
  b While

WhileEnd:
  // print max
  ldr x1, max
  adr x0, maxformat
  bl printf

  // print ptr
  ldr x1, ptr
  adr x0, rawformat
  bl printf

  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


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
ptr:    .skip 4
max:    .skip 4

head:   .4byte  p0
    // head contains the address of the first list elem
    // I created: head->[34]->[-9]->[99]->[78]->[55]

// list structure is: [value (int), next (link)]
p0: .4byte  34, p3      // p0 contains [34, p3]
p1: .4byte  99, p2      // p1 contains [99, p2]
p2: .4byte  78, p4      // p2 contains [78, p4]
p3: .4byte  -9, p1      // p3 contains [-9, p1]
p4: .4byte  55, 0       // p4 contains [55, null]
  .end
