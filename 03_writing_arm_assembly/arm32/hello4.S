.text
.global _start

_start:
  mov r2, #13 @ strlen
  mov r1, pc  @ load pc
  add r1, #24 @ add str offset from pc
  mov r0, #1  @ stdout
  mov r7, #4  @ nr_write
  svc 0       @ syscall

  mov r0, #0  @ exit_success
  mov r7, #1  @ nr_exit
  svc 0       @ syscall

.asciz "hello,ARM32!\n"    @ null terminated string
