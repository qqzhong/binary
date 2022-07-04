    .section .rodata // Read-only data section
mesg: .asciz "Hello World\n" // Define null-terminated string

    .text // Text section
    .global main
/*
* Prints "Hello World\n" and returns 0.
*/
main:
  stp x29, x30, [sp, #-16]!

  // printf("Hello World\n")
  adr x0, mesg
  bl printf

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret
  .size main,(. - main)

/* gcc -o hello hello.S */
