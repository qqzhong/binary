#ifndef _MACRO_H
#define _MACRO_H

/* kernel/arch/x86/include/asm/frame.h */
.macro FRAME_BEGIN
  pushl %ebp
  movl %esp, %ebp
.endm

.macro FRAME_END
  popl %ebp
.endm

#endif // _MACRO_H
