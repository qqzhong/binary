#include "asm.h"
// Listing 5.36 Initializing a structured data type in C.
#if 0
#include <string.h>
struct student {
char first_name[30];
char last_name[30];
unsigned char class;
int grade;
};
int main(void)
{
struct student newstudent; /* allocate struct on the stack */
strcpy(newstudent.first_name, "Sam");
strcpy(newstudent.last_name, "Smith");
newstudent.class = 2;
newstudent.grade = 88;
return 0;
}
#endif


  // Listing 5.37 Initializing a structured data type in AArch64 assembly.
  .data
sam: .asciz "Sam"
smith: .asciz "Smith"
  .text
  .equ s_first_name, 0
  .equ s_last_name, 30
  .equ s_class, 60
  .equ s_grade, 64
  .equ s_size, 68
  .equ s_size_aligned, 80
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #32]!
  str x19, [sp, #16] // Callee-saved save

  cout(enter, enterLen)

  // struct student newstudent
  sub sp, sp, #s_size_aligned
  mov x19, sp // x19=pointer to struct
  add x0, x19, #s_first_name // offset to first name
  adr x1, sam // load pointer to "Sam"
  bl strcpy // copy the string
  add x0, x19, #s_last_name // offset to last name
  adr x1, smith // load pointer to "Smith"
  bl strcpy // copy the string
  mov w1, #2 // load constant value of 2
  strb w1, [x19, #s_class] // store with offset
  mov w1, #88 // load value of 88
  str w1, [x19, #s_grade] // store with offset
  // use the struct

  // delete the struct
  add sp, sp, #s_size_aligned

  cout(msg, msgLen)
  cout(leave, leaveLen)

  // return 0
  mov w0, #0
  ldr x19, [sp, #16] // Callee-saved restore
  ldp x29, x30, [sp], #32
  ret
  .size main,(. - main)


  .section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]test18\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]test18\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

.end
