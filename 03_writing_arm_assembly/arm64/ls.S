/*
# Sections
.data: read-write
.rodata: read-only
.bss: read-write, initialized to zero
.text: read-only, program code
Stack and heap work differently!


# Declaring data
“Labels” for locations in memory
.word: 32-bit integer


# Global symbol
Declare “main” to be a
globally-visible label


# Generating addresses
adr instruction stores address of
a label in a register


# Load and store
Use “pointer” in x0 to load from
and store to memory


# Return value
Passed in register w0

# Return to caller
ret instruction


*/


.section .data
length: .word 1
width: .word 2
perim: .word 0
.section .text
.global main
main:
  adr x0, length  /**/
  ldr w1, [x0]    /**/
  adr x0, width   /**/
  ldr w2, [x0]    /**/
  add w1, w1, w2  /**/
  lsl w1, w1, 1   /**/
  adr x0, perim   /**/
  str w1, [x0]    /**/
  mov w0, 0       /* Return value, Passed in register w0 */
  ret             /* Return to caller, ret instruction */
