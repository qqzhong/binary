/* bionic/libc/arch-x86_64/bionic/syscall.S */

/*
 * Generic syscall call.
 * Upon entry:
 *   %rax: system call number
 *   %rdi: arg0 to system call
 *   %rsi: arg1
 *   %rdx: arg2
 *   %rcx: arg3 - syscall expects it at %r10
 *   %r8: arg4
 *   %r9: arg5
 */

#include "asm.h"
#define MAX_ERRNO 4095  /* For recognizing system call error returns. */

ENTRY(syscall)
  # All arguments are passed via registers.
  # (Not all will be valid, depending on the syscall.)
  mov     %edi, %eax
  mov     %rsi, %rdi
  mov     %rdx, %rsi
  mov     %rcx, %rdx
  mov     %r8,  %r10
  mov     %r9,  %r8
  mov     8(%rsp), %r9

  # Make the system call.
  syscall
  cmpq    $-MAX_ERRNO, %rax
  jb      1f
  negl    %eax
  movl    %eax, %edi
  call    __set_errno_internal
1:
  ret
END(syscall)
