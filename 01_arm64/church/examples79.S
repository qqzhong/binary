// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s61.html
// Modified by Church.ZHONG
// This examples shows you the steps to build + tear down stack frame for 1 (non-leaf) subroutine

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  vdprint(x0)


      // head = Insert( head, ptr );

      // Pass parameter 2 (ptr) to Insert
      movw    r0, #:lower16:ptr
      movt    r0, #:upper16:ptr       // r0 = addr(ptr)
      ldr     r0, [r0]                // r0 = ptr
      push    {r0}                    // Pass ptr using stack


      // Pass parameter 1 (head) to Insert
      movw    r0, #:lower16:head
      movt    r0, #:upper16:head      // r0 = addr(head)
      ldr     r0, [r0]                // r0 = head
      push    {r0}                    // Pass head using stack

      bl      Insert
      add     sp, sp, #8              // Clean up parameters

      // Store return value in head
      movw    r1, #:lower16:head
      movt    r1, #:upper16:head      // r1 = addr(head)
      str     r0, [r1]

Stop:
      nop


  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)



Insert:
      /* =============================
         Prelude: build stack frame
         ============================= */
      push    {lr}
      push    {fp}
      mov     fp, sp
      sub     sp, sp, #0      // No local variables


      // if ( h == null )
      ldr     r0, [fp, #8]    // r0 = h
      cmp     r0, #0
      bne     else

      // e.next = null
      mov     r0, #0          // r0 = null
      ldr     r1, [fp, #12]   // r1 = e
      str     r0, [r1, #4]    // e.next = null

      // return e
      ldr     r0, [fp, #12]   // r0 = e (return value)

	b       postLude

else:
      // h.next = Insert( h.next, e );

      //// pass e
      ldr     r0, [fp, #12]   // r0 = e
      push    {r0}            // Pass e with stack

      //// pass h.next
      ldr     r0, [fp, #8]    // r0 = h
      ldr     r0, [r0, #4]    // r0 = h.next
      push    {r0}            // Pass h.next with stack

      bl      Insert
      add     sp, sp, #8      // Clean up 2 parameters

      ////  Assign return value (in r0) to h.next
      ldr     r1, [fp, #8]    // r1 = h - can't use r0!!
      str     r0, [r1, #4]    // h.next = Insert(h.next,e)

      // return( h );
      ldr     r0, [fp, #8]    // r0 = h (return value)

postLude:
      // Postlude - clean up and return to caller
      mov     sp, fp
      pop     {fp}
      pop     {pc}




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
ptr:    .word p9

p9: .4byte  99, 0       // p9 contains [99, 0]
head:   .word p0  // head contains the address of the first list elem
                // head->[11]->[22]->[33]->[44]->[55]

// list structure is: [int value, next]
p0: .4byte  11, p3      // p0 contains [11, p3]
p1: .4byte  33, p2      // p1 contains [33, p2]
p2: .4byte  44, p4      // p2 contains [44, p4]
p3: .4byte  22, p1      // p3 contains [22, p1]
p4: .4byte  55, 0       // p4 contains [55, 0]
  .end
