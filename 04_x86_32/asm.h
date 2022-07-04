// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT

/* bionic/libc/private/bionic_asm.h */

// #pragma once
#ifndef _ASM_H
#define _ASM_H
// This is for X86 32bit

#include "macro.h"

#define ENTRY(f)                                                               \
  .text;                                                                       \
  .globl f;                                                                    \
  .balign 16;                                                                  \
  .type f, @function;                                                          \
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

/* https://syscalls.w3challs.com/?arch=x86 */
#define exit(imm)                                                              \
  mov $1, % eax; /* exit is syscall #1 */                                      \
  mov $0, % ebx;                                                               \
  int $0x80; /* invoke syscall */

#define cout(msg, msgLen)                                                      \
  mov $4, % eax;      /* system call #4 is write */                            \
  mov $1, % ebx;      /* file handle 1 is stdout */                            \
  mov $msg, % ecx;    /* address of string to output */                        \
  mov $msgLen, % edx; /* number of bytes */                                    \
  int $0x80;          /* invoke syscall */

#define bPrint(var)                                                            \
  movzbl var, % eax;                                                           \
  push % eax;                                                                  \
  pushl $bFormat;                                                              \
  call printf;                                                                 \
  movl % ebp, % esp;

#define sPrint(var)                                                            \
  movzwl var, % eax;                                                           \
  push % eax;                                                                  \
  pushl $sFormat;                                                              \
  call printf;                                                                 \
  movl % ebp, % esp;

#define iPrint(var)                                                            \
  pushl var;                                                                   \
  pushl $iFormat;                                                              \
  call printf;                                                                 \
  movl % ebp, % esp;

#define iiPrint(var1, var2)                                                    \
  pushl var2;                                                                  \
  pushl var1;                                                                  \
  pushl $iiFormat;                                                             \
  call printf;                                                                 \
  movl % ebp, % esp;

#define iiiPrint(var1, var2, var3)                                             \
  pushl var3;                                                                  \
  pushl var2;                                                                  \
  pushl var1;                                                                  \
  pushl $iiiFormat;                                                            \
  call printf;                                                                 \
  movl % ebp, % esp;

#endif // _ASM_H
