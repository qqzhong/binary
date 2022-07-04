// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s68a.html
// Modified by Church.ZHONG
// This examples shows you the steps to build + tear down stack frame for 2 (non-leaf) subroutines

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  sub sp, sp, #16         // reserve 16 bytes (four 64-bit words), multiple of 16
  mov x0, #2222           // Pass 2222 as parameter 2 on stack
  str x0, [sp, #0]        // push {x0}
  // adr x1, p1 // debug here
  // str x0, [x1] // debug here

  mov x0, #1111           // Pass 1111 as parameter 1 on stack
  str x0, [sp, #8]        // push {x0}
  // adr x1, p2 // debug here
  // str x0, [x1] // debug here


  bl Func                 // Call function Func
  add sp, sp, #16         // Clean up parameters on the stack

  // When A returns, you will see the return value in r0 = 9999

  // print x0
  mov x1, x0
  adr x0, format
  bl printf

  ldr x1, p1
  adr x0, rawformat
  bl printf

  ldr x1, p2
  adr x0, rawformat
  bl printf

  ldr x1, p3
  adr x0, rawformat
  bl printf

  ldr x1, p4
  adr x0, rawformat
  bl printf

  ldr x1, p5
  adr x0, rawformat
  bl printf

  ldr x1, enterFP
  adr x0, hexformat
  bl printf

  ldr x1, enterLR
  adr x0, hexformat
  bl printf

  ldr x1, leaveFP
  adr x0, hexformat
  bl printf

  ldr x1, leaveLR
  adr x0, hexformat
  bl printf


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
*           | variable 2 for sum         |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter 2222             |
*           +----------------------------+
*           | parameter 1111             |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
/* ==============================================
   Function Func: param and locals in stack
   ============================================== */
Func:
  // When run in EGTAPI - you will see {1111, 2222} on stack

  // This is a leaf function.
  /* ****************************************
  Prelude: build stack frame
  **************************************** */
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack

  mov x29, sp               // Initialize my own FP
  sub sp, sp, #32           // I create 3 local variable in stack
  str x30, [sp, #0]

  // How to to access parameters and local variables
  // stored in the program stack

  ldr x0, [x29, #16]         // Get parameter 1 = 1111
  str x0, [x29, #-24]        // Store in local variable 1
  adr x1, p1 // debug here
  str x0, [x1] // debug here

  ldr x1, [x29, #24]         // Get parameter 2 = 2222
  str x1, [x29, #-16]        // Store in local variable 2
  adr x2, p2 // debug here
  str x1, [x2] // debug here

  nop                       // These instructions in A( ) can use stack
  nop                       // to access parameters and local variables

#if 1
  /* =========================================
  Call B( ) with 3 parameters
  ========================================= */
  mov x0, #5555             // Pass 5555 as parameter 3 on stack
  str x0, [sp, #0]          // push {x0}
  mov x0, #4444             // Pass 4444 as parameter 2 on stack
  str x0, [sp, #8]          // push {x0}
  mov x0, #3333             // Pass 3333 as parameter 1 on stack
  str x0, [sp, #16]         // push {x0}

  bl B                      // Call function B
#endif

  nop                // We are back in A( )
  nop                // We will now return to main( )


  /* ====================================================
  We can use a register to return the return value
  ==================================================== */
  mov x0, #9999            // Pass return value in register r0

  /* ************************************************
  Postlude: break down stack frame
  ************************************************ */
  //mov sp, x29              // De-allocate the local variables
  ldr x30, [sp, #0]
  add sp, sp, #32            // Clean up parameters on the stack
  ldp x29, x30, [sp], #16  // Pop FP and LR from the stack
  ret                      // Return

/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*  fp       +----------------------------+
*           | FP(x29)                    | B
*           +----------------------------+
*           | LR(x30)                    | B
*           +----------------------------+
*           | variable 3 for sum         |
*           +----------------------------+
*           | variable 2 for sum         |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter 2222             |
*           +----------------------------+
*           | parameter 1111             |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
B:
  // This is a leaf function.

  /* ****************************************
  Prelude: build stack frame
  **************************************** */
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack

  mov x29, sp
  str x30, [sp, #0]

  ldr x0, [x29, #16]         // Get parameter 5555
  adr x1, p3 // debug here
  str x0, [x1] // debug here

  ldr x1, [x29, #24]         // Get parameter 4444
  adr x2, p4 // debug here
  str x1, [x2] // debug here

  ldr x1, [x29, #32]         // Get parameter 3333
  adr x2, p5 // debug here
  str x1, [x2] // debug here

  /* ************************************************
  Postlude: break down stack frame
  ************************************************ */
  ldr x30, [sp, #0]
  mov sp, x29
  ldp x29, x30, [sp], #16  // Pop FP and LR from the stack
  ret


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
element:.4byte  0
p1:     .4byte  0
p2:     .4byte  0
p3:     .4byte  0
p4:     .4byte  0
p5:     .4byte  0
enterFP:.8byte  0
enterLR:.8byte  0
leaveFP:.8byte  0
leaveLR:.8byte  0
  .end
