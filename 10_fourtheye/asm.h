// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT

/* bionic/libc/private/bionic_asm.h */

// #pragma once
#ifndef _ASM_H
#define _ASM_H
// This is for ARM 32bit

#define ENTRY(f)                                                               \
  .text;                                                                       \
  .globl f;                                                                    \
  .balign 0;                                                                   \
  .type f, % function;                                                         \
  f:                                                                           \
  .fnstart;                                                                    \
  .cfi_startproc

#define END(f)                                                                 \
  .cfi_endproc;                                                                \
  .size f, .- f;                                                               \
  .fnend

/* Like ENTRY, but with hidden visibility. */
#define ENTRY_PRIVATE(f)                                                       \
  ENTRY(f);                                                                    \
  .hidden f

#define CALL(sym) bl sym

#define ALIAS_SYMBOL(alias, original)                                          \
  .globl alias;                                                                \
  .equ alias, original

/* https://syscalls.w3challs.com/?arch=arm_thumb */
#define exit(imm)                                                              \
  mov r0, #1; /* exit is syscall #1 */                                         \
  mov r1, imm;                                                                 \
  CALL(syscall); /* invoke syscall */

#define cout(msg, msgLen)                                                      \
  mov r0, #4; /* write is syscall #4 */                                        \
  mov r1, #1;                                                                  \
  ldr r2, = msg;                                                               \
  ldr r3, = msgLen;                                                            \
  CALL(syscall); /* invoke syscall */

#define bPrint(var)                                                            \
  movw r0, # : lower16 : var;                                                  \
  movt r0, # : upper16 : var; /* r0 = addr(var) */                             \
  ldrsb r1, [r0];                                                              \
  ldr r0, = bFormat;                                                           \
  bl printf;

#define sPrint(var)                                                            \
  movw r0, # : lower16 : var;                                                  \
  movt r0, # : upper16 : var; /* r0 = addr(var) */                             \
  ldrsh r1, [r0];                                                              \
  ldr r0, = sFormat;                                                           \
  bl printf;

#define iPrint(var)                                                            \
  movw r0, # : lower16 : var;                                                  \
  movt r0, # : upper16 : var; /* r0 = addr(var) */                             \
  ldr r1, [r0];                                                                \
  ldr r0, = iFormat;                                                           \
  bl printf;

#define iiPrint(var1, var2)                                                    \
  movw r0, # : lower16 : var1;                                                 \
  movt r0, # : upper16 : var1; /* r0 = addr(var1) */                           \
  ldr r1, [r0];                                                                \
  movw r0, # : lower16 : var2;                                                 \
  movt r0, # : upper16 : var2; /* r0 = addr(var2) */                           \
  ldr r2, [r0];                                                                \
  ldr r0, = iiFormat;                                                          \
  bl printf;

#define iiiPrint(var1, var2, var3)                                             \
  movw r0, # : lower16 : var1;                                                 \
  movt r0, # : upper16 : var1; /* r0 = addr(var1) */                           \
  ldr r1, [r0];                                                                \
  movw r0, # : lower16 : var2;                                                 \
  movt r0, # : upper16 : var2; /* r0 = addr(var2) */                           \
  ldr r2, [r0];                                                                \
  movw r0, # : lower16 : var3;                                                 \
  movt r0, # : upper16 : var3; /* r0 = addr(var3) */                           \
  ldr r3, [r0];                                                                \
  ldr r0, = iiiFormat;                                                         \
  bl printf;

#endif // _ASM_H
