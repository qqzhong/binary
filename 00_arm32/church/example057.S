// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// CS255/juicy-example.html

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
  /* y[i + j] = z[ x[ k ] ] + head.value1 + head.next.value3; */
  /* ***********************************
    Get z[ x[k] ] in register r10
  *********************************** */
  // Get byte k
  movw   r0, #:lower16:k
  movt   r0, #:upper16:k       // r0 = addr(k)
  ldrsb  r0, [r0]              // r0 = k
  mov    r0, #0                // set r0 = 0

  // Get int x[k]
  movw   r1, #:lower16:x
  movt   r1, #:upper16:x       // r1 = base address of (int) array x

  add    r0, r0, r0            // r0 = 2k
  add    r0, r0, r0            // r0 = 4k (= offset to x[i])
  ldr    r0, [r1,r0]           // r0 = x[k]

  // Get byte z[ x[k] ] = z[ r0 ]
  movw   r1, #:lower16:z
  movt   r1, #:upper16:z       // r1 = base address of (byte) array z

  ldrsb  r10, [r1,r0]          // r10 = z[ x[k] ]

  /* ****************************************
    Get int head.value1 in register r9
  **************************************** */
  // Get pointer head
  movw   r0, #:lower16:head
  movt   r0, #:upper16:head    // r0 = addr(head)
  //ldr    r0, [r0]            // r0 = head
#if 1
  // Get int head.value1
  ldr    r9, [r0, #0]          // r9 = head.value1
  movw   r2, #:lower16:tp
  movt   r2, #:upper16:tp      // r2 = addr(tp)
  str    r9, [r2]
  iPrint(tp)
#endif
  add    r10, r10, r9          // r10 = z[ x[ k ] ] + head.value1

  /* ******************************************
    Get short head.next.value3 in register r9
  ****************************************** */
  // Get pointer head
  movw   r0, #:lower16:head
  movt   r0, #:upper16:head   // r0 = addr(head)
  //ldr    r0, [r0]             // r0 = head
#if 1
  // Get pointer head.next
  ldr    r0, [r0, #8]         // r0 = head.next
  //[church] r0 = p0's address

  // Get short head.next.value3
  ldrsh  r9, [r0, #6]         // r9 = head.next.value3
  movw   r2, #:lower16:tp
  movt   r2, #:upper16:tp      // r2 = addr(tp)
  strh   r9, [r2]
  iPrint(tp)
#endif
  add    r10, r10, r9         // r10 = z[ x[ k ] ] + head.value1 + head.next.value3

  /* *************************************
    Store r10 in short y[i + j]
  ************************************* */
  // Get int i
  movw   r0, #:lower16:i
  movt   r0, #:upper16:i      // r0 = addr(i)
  ldr    r0, [r0]             // r0 = i

  // Get short j
  movw   r1, #:lower16:j
  movt   r1, #:upper16:j      // r1 = addr(j)
  ldrsh  r1, [r1]             // r1 = j

  // Compute i+j
  add    r0, r0, r1           // r0 = r0 + r1

  // Get address of short y[i + j]   (base = y, offset = 2*(i+j)
  movw   r1, #:lower16:y
  movt   r1, #:upper16:y      // r1 = base address of array y

  add    r0, r0, r0           // r0 = 2*(i+j)  (offset)
                             // Address of short y[i+j] is ready !!!

  // Store r10 in y[i+j]
  strh   r10, [r1, r0]        // Stores r10 in base address + offset
                             // If you use str, you will also write the next array element !!!

  b Stop


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example057\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example057\n"
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

x: .skip 400
y: .skip 200
z: .skip 100
i: .4byte 0
j: .2byte 0

head: .4byte 1
      .2byte 2
      .2byte 3
      .4byte p0

p0:   .4byte 11
      .2byte 22
      .2byte 33
      .4byte 0

tp:   .4byte 255
  .end
