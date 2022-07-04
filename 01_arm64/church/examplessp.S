// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT
#include "asm.h"

// s61.html
// Modified by Church.ZHONG
// What the compiler will do when a variable is passed-by-value

.section .text
.global main
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  //  10+20+30+40+50+60+70+80+90+100+110=660
  sub     sp, sp, #32    // always keep sp a multiple of 16
  mov     x0, #90
  str     x0, [sp, #0]
  mov     x0, #100
  str     x0, [sp, #8]
  mov     x0, #110
  str     x0, [sp, #16]

  mov     x0, #10
  mov     x1, #20
  mov     x2, #30
  mov     x3, #40
  mov     x4, #50
  mov     x5, #60
  mov     x6, #70
  mov     x7, #80
  bl      sum1
  add     sp, sp, #32

  vdprint(x0)

  //  10+20+30+40+50+60+70+80+90=450
  // put the ninth parameter (#90) onto the stack first
  sub     sp, sp, #16  // always keep sp a multiple of 16
  mov     x0, #90
  str     x0, [sp, #0]
  // put the ninth parameter (#90) onto the stack first
  // load the other eight values into x0-x7
  mov     x0, #10
  mov     x1, #20
  mov     x2, #30
  mov     x3, #40
  mov     x4, #50
  mov     x5, #60
  mov     x6, #70
  mov     x7, #80
  bl      sum2
  add     sp, sp, #16

  vdprint(x0)


  //  10+20+30+40+50+60+70+80+90+100+110=660
  sub     sp, sp, #32    // always keep sp a multiple of 16
  mov     x0, #90
  str     x0, [sp, #0]
  mov     x0, #100
  str     x0, [sp, #8]
  mov     x0, #110
  str     x0, [sp, #16]

  mov     x0, #10
  mov     x1, #20
  mov     x2, #30
  mov     x3, #40
  mov     x4, #50
  mov     x5, #60
  mov     x6, #70
  mov     x7, #80
  bl      sum3
  add     sp, sp, #32

  vdprint(x0)


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
*           | parameter 9                |
*           +----------------------------+
*           | parameter 10               |
*           +----------------------------+
*           | parameter 11               |
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
sum1:
  mov x29, sp
  sub sp, sp, #32 // make sure sp remains a multiple of 16
  str x30, [sp, #0]
  add x0, x0, x1  // get the sum of x0 through x7
  add x2, x2, x3
  add x4, x4, x5
  add x6, x6, x7
  add x0, x0, x2
  add x4, x4, x6
  add x0, x0, x4
#if 1
  ldr x1, [sp, #32]   // parameter number 9 = 90
  ldr x2, [sp, #40]   // parameter number 10 = 100
  ldr x3, [sp, #48]   // parameter number 11 = 110
#else
  ldr x1, [x29, #0]   // parameter number 9 = 90
  ldr x2, [x29, #8]   // parameter number 10 = 100
  ldr x3, [x29, #16]  // parameter number 11 = 110
#endif
  add x1, x1, x2
  add x1, x1, x3
  add x0, x0, x1
  ldr x30, [sp, #0]
  add sp, sp, #32
  ret

/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
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
  mov x29, sp
  sub sp, sp, #16   // make sure sp remains a multiple of 16
  str x30, [sp, #0]
  add x0, x0, x1    // get the sum of x0 through x7
  add x2, x2, x3
  add x4, x4, x5
  add x6, x6, x7
  add x0, x0, x2
  add x4, x4, x6
  add x0, x0, x4
#if 0//OK
  ldr x1, [sp, #16] // parameter number 9
#else
  ldr x1, [x29, #0]
#endif
  add x0, x0, x1
  ldr x30, [sp, #0]
  add sp, sp, #16
  ret


/*****************************************
*           |                            |
*           | caller's stack frame       |
*           |                            |
*  sp       +----------------------------+
*           |saved return address(x30)   |
*           +----------------------------+
*           | variable 1 for sum         |
*  fp       +----------------------------+
*           | parameter 9                |
*           +----------------------------+
*           | parameter 10               |
*           +----------------------------+
*           | parameter 11               |
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
  mov x29, sp
  sub sp, sp, #16 // make sure sp remains a multiple of 16
  str x30, [sp, #0]
  add x0, x0, x1  // get the sum of x0 through x7
  add x2, x2, x3
  add x4, x4, x5
  add x6, x6, x7
  add x0, x0, x2
  add x4, x4, x6
  add x0, x0, x4
#if 1//OK
  ldr x1, [sp, #16]   // parameter number 9 = 90
  ldr x2, [sp, #24]   // parameter number 10 = 100
  ldr x3, [sp, #32]   // parameter number 11 = 110
#else
  ldr x1, [x29, #0]   // parameter number 9 = 90
  ldr x2, [x29, #8]   // parameter number 10 = 100
  ldr x3, [x29, #16]  // parameter number 11 = 110
#endif
  add x1, x1, x2
  add x1, x1, x3
  add x0, x0, x1
  ldr x30, [sp, #0]
  add sp, sp, #16
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
total: .4byte 0
  .end
