.section ".rodata"
msg:
.ascii "Hello, ARM64!\n"
len = . - msg

.section .text

.global _start

_start:
  /* syscall write(int fd, const void *buf, size_t count) */
  mov x0, #1
  ldr x1, =msg
  ldr x2, =len
  mov w8, #64   /* write is syscall #64 */
  svc #0        /* invoke syscall */

  /* syscall exit(int status) */
  mov x0, #0
  mov w8, #93   /* exit is syscall #93 */
  svc #0        /* invoke syscall */

/*
msg:
.ascii "Hello, ARM64!\n"
len = . - msg
*/
