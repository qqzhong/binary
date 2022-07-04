// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

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


  //  10+20+30+40+50+60+70+80=360
  mov     r0, #50
  push    {r0}
  mov     r0, #60
  push    {r0}
  mov     r0, #70
  push    {r0}
  mov     r0, #80
  push    {r0}

  mov     r0, #10
  mov     r1, #20
  mov     r2, #30
  mov     r3, #40
  bl      sum1
  add     sp, sp, #16

  mov r1, r0
  ldr r0, =iFormat
  bl printf

  //  10+20+30+40+50+60+70+80=150
  // put the ninth parameter (#90) onto the stack first
  sub     sp, sp, #8
  mov     r0, #50
  str     r0, [sp, #0]
  // put the ninth parameter (#90) onto the stack first
  // load the other eight values into x0-x7
  mov     r0, #10
  mov     r1, #20
  mov     r2, #30
  mov     r3, #40
  bl      sum2
  add     sp, sp, #8

  mov r1, r0
  ldr r0, =iFormat
  bl printf


  //  10+20+30+40+50+60+70+80=360
  sub     sp, sp, #32
  mov     r0, #50
  str     r0, [sp, #0]
  mov     r0, #60
  str     r0, [sp, #4]
  mov     r0, #70
  str     r0, [sp, #8]
  mov     r0, #80
  str     r0, [sp, #12]

  mov     r0, #10
  mov     r1, #20
  mov     r2, #30
  mov     r3, #40
  bl      sum3
  add     sp, sp, #32

  mov r1, r0
  ldr r0, =iFormat
  bl printf


  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller
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
*           | parameter 50               |
*           +----------------------------+
*           | parameter 60               |
*           +----------------------------+
*           | parameter 70               |
*           +----------------------------+
*           | parameter 80               |
*           +----------------------------+
*           | FP(x29)                    | main
*           +----------------------------+
*           | LR(x30)                    | main
*           +----------------------------+
*           | stack bottom               |
*           +----------------------------+
******************************************/
sum1:
  /* Function Prelude: complete the stack frame structure */
  push {lr}    // Save LR (return address)
  push {fp}    // Save FP (used by caller)
  mov  fp, sp  // Mark the stack top location before
     // allocating any local variables

  sub sp, sp, #16
  add r0, r0, r1  // get the sum of r0 through r3
  add r2, r2, r3
  add r0, r0, r2
#if 1
  ldr r1, [sp, #24]   // parameter number 50
  ldr r2, [sp, #28]   // parameter number 60
  ldr r3, [sp, #32]   // parameter number 70
  ldr r4, [sp, #36]   // parameter number 80
#else
  ldr r1, [fp, #8]   // parameter number 50
  ldr r2, [fp, #12]   // parameter number 60
  ldr r3, [fp, #16]   // parameter number 70
  ldr r4, [fp, #20]   // parameter number 80
#endif
  add r1, r1, r2
  add r4, r4, r3
  add r1, r1, r4
  add r0, r0, r1

  add sp, sp, #16
  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller

/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter 9                |
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
sum2:
  /* Function Prelude: complete the stack frame structure */
  push {lr}    // Save LR (return address)
  push {fp}    // Save FP (used by caller)
  mov  fp, sp  // Mark the stack top location before
     // allocating any local variables

  sub sp, sp, #8
  add r0, r0, r1    // get the sum of r0 through r3
  add r2, r2, r3
  add r0, r0, r2
#if 0//OK
  ldr r1, [sp, #16] // parameter number 9
#else
  ldr r1, [fp, #8]
#endif
  add r0, r0, r1

  add sp, sp, #8
  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller


/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
*           | FP(x29)                    | sum
*           +----------------------------+
*           | LR(x30)                    | sum
*           +----------------------------+
*           | parameter 50               |
*           +----------------------------+
*           | parameter 60               |
*           +----------------------------+
*           | parameter 70               |
*           +----------------------------+
*           | parameter 80               |
*           +----------------------------+
*           | padding                    |
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
sum3:
  /* Function Prelude: complete the stack frame structure */
  push {lr}    // Save LR (return address)
  push {fp}    // Save FP (used by caller)
  mov  fp, sp  // Mark the stack top location before
     // allocating any local variables

  sub sp, sp, #8
  add r0, r0, r1  // get the sum of r0 through r3
  add r2, r2, r3
  add r0, r0, r2
#if 0//OK
  ldr r1, [sp, #16]   // parameter number 50
  ldr r2, [sp, #20]   // parameter number 60
  ldr r3, [sp, #24]   // parameter number 70
  ldr r4, [sp, #28]   // parameter number 80
#else
  ldr r1, [fp, #8]    // parameter number 50
  ldr r2, [fp, #12]   // parameter number 60
  ldr r3, [fp, #16]   // parameter number 70
  ldr r4, [fp, #20]   // parameter number 80
#endif
  add r1, r1, r2
  add r4, r4, r3
  add r1, r1, r4
  add r0, r0, r1

  add sp, sp, #8
  /* Function Postlude: de-allocate local variable and restore FP */
  mov sp, fp   // De-allocate local variables
  pop {fp}     // Restore FP
  pop {pc}     // Return to the caller


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

.end
