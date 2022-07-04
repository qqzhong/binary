#include "asm.h"
#define MAX_ERRNO 4095  /* For recognizing system call error returns. */

/* bionic/libc/arch-arm64/bionic/syscall.S */
ENTRY(syscall)
  mov     ip, sp
  stmfd   sp!, {r4, r5, r6, r7}
  .cfi_def_cfa_offset 16
  .cfi_rel_offset r4, 0
  .cfi_rel_offset r5, 4
  .cfi_rel_offset r6, 8
  .cfi_rel_offset r7, 12
  mov     r7, r0
  mov     r0, r1
  mov     r1, r2
  mov     r2, r3
  ldmfd   ip, {r3, r4, r5, r6}
  swi     #0
  ldmfd   sp!, {r4, r5, r6, r7}
  .cfi_def_cfa_offset 0
  cmn     r0, #(MAX_ERRNO + 1)
  bxls    lr
  neg     r0, r0
  b       __set_errno_internal
END(syscall)
