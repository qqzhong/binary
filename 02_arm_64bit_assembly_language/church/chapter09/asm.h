// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT

/* bionic/libc/private/bionic_asm.h */

// #pragma once
#ifndef _ASM_H
#define _ASM_H
// This is for ARM 64bit

#define ENTRY(f)                                                               \
  .text;                                                                       \
  .globl f;                                                                    \
  .balign 16;                                                                  \
  .type f, % function;                                                         \
  f:;                                                                          \
  .cfi_startproc

#define END(f)                                                                 \
  .cfi_endproc;                                                                \
  .size f, .- f;

/* Like ENTRY, but with hidden visibility. */
#define ENTRY_PRIVATE(f)                                                       \
  ENTRY(f);                                                                    \
  .hidden f

#define CALL(sym) bl sym

#define ALIAS_SYMBOL(alias, original)                                          \
  .globl alias;                                                                \
  .equ alias, original

/* see: include/uapi/asm-generic/unistd.h */
#define exit(imm)                                                              \
  mov x0, #93; /* exit is syscall #93 */                                       \
  mov x1, imm;                                                                 \
  CALL(syscall); /* invoke syscall */

#define cout(msg, msgLen)                                                      \
  mov x0, #64; /* write is syscall #64 */                                      \
  mov x1, #1;                                                                  \
  ldr x2, = msg;                                                               \
  ldr x3, = msgLen;                                                            \
  CALL(syscall); /* invoke syscall */

#define bPrint(var)                                                            \
  ldrsb r1, = var;                                                             \
  ldr r0, = bFormat;                                                           \
  bl printf;

#define sPrint(var)                                                            \
  ldrsh r1, = var;                                                             \
  ldr r0, = sFormat;                                                           \
  bl printf;

#define iPrint(var)                                                            \
  ldr x1, = var;                                                               \
  ldr x0, = iFormat;                                                           \
  bl printf;

#define iiPrint(var1, var2)                                                    \
  ldr x1, = var1;                                                              \
  ldr x2, = var2;                                                              \
  ldr x0, = iiFormat;                                                          \
  bl printf;

#define iiiPrint(var1, var2, var3)                                             \
  ldr x1, = var1;                                                              \
  ldr x2, = var2;                                                              \
  ldr x3, = var3;                                                              \
  ldr x0, = iiiFormat;                                                         \
  bl printf;

#endif // _ASM_H
