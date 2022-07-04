// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/ll-insert-at-tail-ARM.html

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
  movw    r0, #:lower16:head
  movt    r0, #:upper16:head      // r0 = addr(head)
  push    {r0}                    // Pass head by reference (pass head's address)
  bl  dump
  add   sp, sp, #4                // Clean up parameters on the stack


  //  High level programming statement:
  //
  //     head = Insert(head, ptr)

  /* -------------------------------------------------
     Pass parameter ptr (using stack)
     ------------------------------------------------- */
  movw    r0, #:lower16:ptr
  movt    r0, #:upper16:ptr  // r0 = addr(ptr)
  //ldr     r0, [r0]           // r0 = ptr
  push    {r0}               // Pass ptr using the program stack

  /* -------------------------------------------------
     Pass parameter head (using stack)
     ------------------------------------------------- */
  movw    r0, #:lower16:head
  movt    r0, #:upper16:head  // r0 = addr(head)
  ldr     r0, [r0]            // r0 = addr(p0)
  push    {r0}    // Pass head using the program stack


  /* ------------------------------------------------------
     call Insert(k)
     ------------------------------------------------------ */
  bl      Insert

  add     sp, sp, #8      // Clean up the parameters

  /* -----------------------------------------------------------------
     Save return value (in r0) to variable searchValue
     ----------------------------------------------------------------- */
  movw    r1, #:lower16:head  // Do NOT use r0 !!!
  movt    r1, #:upper16:head  // (Because r0 contains the return value)

  str     r0, [r1]       // This will store return value in head


  movw    r0, #:lower16:head
  movt    r0, #:upper16:head      // r0 = addr(head)
  push    {r0}                    // Pass head by reference (pass head's address)
  bl  dump
  add   sp, sp, #4                // Clean up parameters on the stack

  b Stop


/* -----------------------------------------------------------------------
   Insert at tail - recursive function

    Algorithm:

List Insert( List h, List p )
{
   if ( h == null )
   {
      p.next = null;
      return p;
   }
   else
   {
      h.next = Insert( h.next, p );
      return h;
   }
}

    Stack frame of the Insert( ) method:

    SP
    FP -----> +---------------------+
        |  old Frame Pointer  |
        +---------------------+
        |  Return Address     |
        +---------------------+
        |   h     |  addr(n) = FP + 8
        +---------------------+
        |   p     |  addr(n) = FP + 12
        +---------------------+
   ----------------------------------------------------------------------- */

Insert:
  /* =============================
     Prelude: build stack frame
     ============================= */
  push    {lr}
  push    {fp}
  mov     fp, sp
  sub     sp, sp, #0      // No local variables

  // if ( h == null )
  ldr     r0, [fp, #8]
  cmp     r0, #0
  bne     else            // head != null, go to else

  // p.next = null
  ldr     r0, [fp, #12]
  mov     r1, #0    // null
  str     r1, [r0, #4]    // p.next = null

  // return p
  ldr     r0, [fp, #12]   // Set up r0 = return value (p)

  /* ==========================================
     Postlude - clean up and return to caller
     ========================================== */
  mov     sp, fp
  pop     {fp}
  pop     {pc}

else:
  // h.next = Insert( h.next, p );

  //// pass p
  ldr     r0, [fp, #12]   // r0 = p
  push    {r0}            // Pass p with stack

  //// pass h.next
  ldr     r0, [fp, #8]    // r0 = h
  ldr     r0, [r0, #4]    // r0 = h.next
  push    {r0}            // Pass h.next with stack

  bl      Insert
  add     sp, sp, #8      // Clean up 2 parameters

  ////  Store return value (in r0) in h.next
  ldr     r1, [fp, #8]    // r1 = h
  str     r0, [r1, #4]    // h.next = return value from Insert(h.next,p)

  // return( h );
  ldr     r0, [fp, #8]    // Set up r0 = return value (h)

  /* ===========================================
     Postlude - clean up and return to caller
     =========================================== */
  mov     sp, fp
  pop     {fp}
  pop     {pc}


dump:
  /* ****************************************
     Prelude: build stack frame
     **************************************** */
  push    {lr}            // Save return address in LR
  push    {fp}            // Save Frame Pointer in FP
  mov     fp, sp          // Initialize my own FP

  // We need to get the start of the list stored in the variable "head"
  //   1. Get the address of the variable "head"
  //movw    r0, #:lower16:head
  //movt    r0, #:upper16:head      // r0 = addr(head)
  ldr     r0, [fp, #8]              // r0 = head's address


  //   2. Get the value stored in the variable "head"
  ldr     r0, [r0]    // r0 = addr(first list elem)
          // r0 now has the base address of
          // the first list element !
  /*[church]*/cmp r0, #0;beq dumpEnd
  ldr     r1, [r0,#0]       // r1 = head.value
          // Note: you can also use "ldr r1, [r0]"
  /*[church]*/movw    r2, #:lower16:tp0
  /*[church]*/movt    r2, #:upper16:tp0
  /*[church]*/str     r1, [r2]

  ldr     r0, [r0,#4]       // r0 = head.next = addr(2nd list elem) !!!
          // r0 now has the base address of
          // the 2nd list element !
  /*[church]*/cmp r0, #0;beq dumpEnd
  ldr     r2, [r0,#0]       // r2 = head.next.value !!
  /*[church]*/movw    r3, #:lower16:tp1
  /*[church]*/movt    r3, #:upper16:tp1
  /*[church]*/str     r2, [r3]

  ldr     r0, [r0,#4]       // r0 = addr(3rd list elem) !!!
          // r0 now has the base address of
          // the 3rd list element !
  /*[church]*/cmp r0, #0;beq dumpEnd
  ldr     r3, [r0,#0]       // r3 = head.next.next.value !!
  /*[church]*/movw    r4, #:lower16:tp2
  /*[church]*/movt    r4, #:upper16:tp2
  /*[church]*/str     r3, [r4]

  ldr     r0, [r0,#4]       // r0 = addr(4th list elem) !!!
          // r0 now has the base address of
          // the 4th list element !
  /*[church]*/cmp r0, #0;beq dumpEnd
  ldr     r4, [r0,#0]       // r4 = head.next.next.next.value !!
          // And so on...
  /*[church]*/movw    r5, #:lower16:tp3
  /*[church]*/movt    r5, #:upper16:tp3
  /*[church]*/str     r4, [r5]

  ldr     r0, [r0,#4]       // r0 = addr(5th list elem) !!!
          // r0 now has the base address of
          // the 5th list element !
  /*[church]*/cmp r0, #0;beq dumpEnd
  ldr     r5, [r0,#0]       // r5 = head.next.next.next.next.value !!
  /*[church]*/movw    r6, #:lower16:tp4
  /*[church]*/movt    r6, #:upper16:tp4
  /*[church]*/str     r5, [r6]

  ldr     r0, [r0,#4]       // r0 = addr(6th list elem) !!!
          // r0 now has the base address of
          // the 6th list element !
  /*[church]*/cmp r0, #0;beq dumpEnd
  ldr     r6, [r0,#0]       // r6 = head.next.next.next.next.value !!
  /*[church]*/movw    r7, #:lower16:tp5
  /*[church]*/movt    r7, #:upper16:tp5
  /*[church]*/str     r6, [r7]
  b dumpEnd

dumpEnd:
  iiiPrint(tp0,tp1,tp2)
  iiiPrint(tp3,tp4,tp5)
  /* ************************************************
     Postlude: break down stack frame
     ************************************************ */
  mov     sp, fp          // De-allocate the local variables
  pop     {fp}            // Restore old FP
  pop     {pc}            // Return to the caller



.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example066\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example066\n"
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

ptr: .4byte  99, 0

head:   .word p0  // head contains the address of the first list elem
      // head->[11]->[22]->[33]->[44]->[55]

// list structure is: [int value, next]
p0: .4byte  11, p3      // p0 contains [11, p3]
p1: .4byte  33, p2      // p1 contains [33, p2]
p2: .4byte  44, p4      // p2 contains [44, p4]
p3: .4byte  22, p1      // p3 contains [22, p1]
p4: .4byte  55, 0       // p4 contains [55, 0]

tp0: .4byte 255
tp1: .4byte 255
tp2: .4byte 255
tp3: .4byte 255
tp4: .4byte 255
tp5: .4byte 255
  .end
