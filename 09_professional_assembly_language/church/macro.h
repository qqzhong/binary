#ifndef _MACRO_H
#define _MACRO_H

/* kernel/arch/x86/include/asm/frame.h */
.macro FRAME_BEGIN
  pushq %rbp
  movq %rsp, %rbp
.endm

.macro FRAME_END
  popq %rbp
.endm

#endif // _MACRO_H
