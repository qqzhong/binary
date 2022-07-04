// Listing 5.8 Unconditional loop in AArch64 assembly.
  .section .rodata
hstr: .string "Hello World\n"

  .text
  .type main, %function
  .global main
main:
  loop: adr x0,hstr // load pointer to "Hello World\n\0"
  bl printf // print "Hello World\n"
  b loop // repeat main unconditionally
  .size main, (. - main)

.end
