  .section .rodata
msg: .string "She Sells Sea Shells By The Sea Shore\n" // 39 bytes

  .text
  .type main, %function
  .global main
  // the following code asks the operating system
  // to write some characters to standard output
main:
  stp x29, x30, [sp, #-16]!

  mov x0, #1 // file descriptor 1 is stdout
  adr x1, msg // load address of data to write
  mov x2, #39 // load number of bytes to write
  mov x8, #64 // syscall #64 is the write() function
  svc #0 // invoke syscall

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.end

// Modified by Church.ZHONG
