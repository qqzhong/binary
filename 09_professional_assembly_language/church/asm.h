// This file is generated automatically by example.sh
// @date: Tue 08 Feb 2022 01:08:05 PM HKT

/* bionic/libc/private/bionic_asm.h */

// #pragma once
#ifndef _ASM_H
#define _ASM_H
// This is for X86 64bit

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

/* https://syscalls.w3challs.com/?arch=x86_64 */
#define exit(imm)                                                              \
  movq $60, % rax; /* exit is syscall #60 */                                   \
  movq $0, % rbx;                                                              \
  int $0x80; /* invoke syscall */

#define cout(msg, msgLen)                                                      \
  movq $4, % rax;      /* system call #4 is write */                           \
  movq $1, % rbx;      /* file handle 1 is stdout */                           \
  movq $msg, % rcx;    /* address of string to output */                       \
  movq $msgLen, % rdx; /* number of bytes */                                   \
  int $0x80;           /* invoke syscall */

#define bPrint(var)                                                            \
  movzbq var, % rsi; /* Writing to ESI zero extends to RSI. */                 \
  lea bFormat(% rip), % rdi;                                                   \
  xor % rax, % rax; /* Zeroing EAX is efficient way to clear AL. */            \
  call printf;

#define sPrint(var)                                                            \
  movzwq var, % rsi; /* Writing to ESI zero extends to RSI. */                 \
  lea sFormat(% rip), % rdi;                                                   \
  xor % rax, % rax; /* Zeroing EAX is efficient way to clear AL. */            \
  call printf;

#define iPrint(var)                                                            \
  movq var, % rsi; /* Writing to ESI zero extends to RSI. */                   \
  lea iFormat(% rip), % rdi;                                                   \
  xor % rax, % rax; /* Zeroing EAX is efficient way to clear AL. */            \
  call printf;

#define iiPrint(var1, var2)                                                    \
  movq var1, % rsi; /* Writing to ESI zero extends to RSI. */                  \
  movq var2, % rdx; /* Writing to ESI zero extends to RSI. */                  \
  lea iiFormat(% rip), % rdi;                                                  \
  xor % rax, % rax; /* Zeroing EAX is efficient way to clear AL. */            \
  call printf;

#define iiiPrint(var1, var2, var3)                                             \
  movq var1, % rsi; /* Writing to ESI zero extends to RSI. */                  \
  movq var2, % rdx; /* Writing to ESI zero extends to RSI. */                  \
  movq var3, % rcx; /* Writing to ESI zero extends to RSI. */                  \
  lea iiiFormat(% rip), % rdi;                                                 \
  xor % rax, % rax; /* Zeroing EAX is efficient way to clear AL. */            \
  call printf;

#endif // _ASM_H
