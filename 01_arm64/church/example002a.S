// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/access-linked-list.html
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

#if 0
public class List
{
  int  value1;  // int typed variable takes up 4 bytes
  short value2;  // short typed variable takes up 2 bytes
  short value3;  // short typed variable takes up 2 bytes
  List next;   // reference variable contains an address, also 4 bytes  

  // instance methods omitted - not relevant for discussion
}
address(value1 field) = base address(list element) + 0
address(value2 field) = base address(list element) + 4 
address(value3 field) = base address(list element) + 6 (= 4+2)
address(next  field) = base address(list element) + 8 (= 4+2+2)

#endif

  movw   r0, #:lower16:head
  movt   r0, #:upper16:head    // r0 = addr(head)
  ldr    r0, [r0]   // r0 = head.next = addr(1st list elem)

  ldr    r1, [r0,#0]     // r1 = head.value1
  ldrsh  r2, [r0,#4]     // r2 = head.value2
  ldrsh  r3, [r0,#6]     // r3 = head.value3

  ldr    r0, [r0,#8]     // r0 = head.next = addr(2nd list elem) !!!

  ldr    r4, [r0,#0]     // r4 = head.next.value1
  ldrsh  r5, [r0,#4]     // r5 = head.next.value2
  ldrsh  r6, [r0,#6]     // r6 = head.next.value3

  ldr    r0, [r0,#8]     // r0 = head.next.next = addr(3rd list elem) !!!     

  ldr    r7, [r0,#0]     // r7 = head.next.next.value1
  ldrsh  r8, [r0,#4]     // r8 = head.next.next.value2
  ldrsh  r9, [r0,#6]     // r9 = head.next.next.value3


  // Assignment example 1 with linked list
  // head.next.value2 = 999;
  // Get the RHS first
  mov   r0, #999           // r0 = 999

  // Store r0 into LHS
  movw  r1, #:lower16:head
  movt  r1, #:upper16:head    // r0 = addr(head)
  ldr   r1, [r1]           // r0 = head
  ldr   r1, [r1, #8]        // r0 = head.next

  strh  r0, [r1, #4]        // head.next.value2 = r0 = 999  


  // Assignment example 2 with linked list
  // head.value1 = head.next.next.value3; 
   // Get the RHS first
   movw   r0, #:lower16:head
   movt   r0, #:upper16:head      // r0 = addr(head)
   ldr    r0, [r0]                // r0 = head
   ldr    r0, [r0, #8]            // r0 = head.next
   ldr    r0, [r0, #8]            // r0 = head.next.next
   ldrsh  r0, [r0, #6]            // r0 = head.next.next.value3        

   // Store r0 into LHS
   movw   r1, #:lower16:head
   movt   r1, #:upper16:head      // r0 = addr(head)
   ldr    r1, [r1]                // r0 = head

   str    r0, [r1, #0]            // head.value1 = r0 
                                  //  = head.next.next.value3



  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp  // De-allocate local variables
  pop {fp}    // Restore FP
  pop {pc}    // Return to the caller
  exit(#0)
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example002\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example002\n"
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

.data
head:  .word p0  // head contains the address of the first list elem
    // head->[11]->[22]->[33]->[44]->[55]

// list structure is: [int value, next]
p0: .4byte  111
   .2byte 21
   .2byte 31
   .4byte p3    // p0 contains [11, p3]
p1: .4byte  333
   .2byte 23
   .2byte 33
   .4byte p2    // p1 contains [33, p2]
p2: .4byte  444
   .2byte 24
   .2byte 34
   .4byte p4    // p2 contains [44, p4]
p3: .4byte  222
   .2byte 22
   .2byte 32
   .4byte p1    // p3 contains [22, p1]
p4: .4byte  555
   .2byte 25
   .2byte 35
   .4byte 0     // p4 contains [55, 0]
.end
