//Listing 5.23 A larger function call in C.
#if 0
#include <stdio.h>
static int i = 120;
static int k = 122;
int main(void)
{
int j = 121;
printf("The results are: %d %d %d\n",i,j,k);
return 0;
}
#endif

// Listing 5.24 A larger function call in AArch64 assembly.
  .section .rodata
format:
  .asciz "The results are: %d %d %d\n"
i: .word 120
k: .word 122

  .text
  .type main, %function
  .global main
main:
  stp x29, x30, [sp, #-16]! // push FP & LR

  mov w6, #121 // j is in w6
  // printf("The results are: %d %d %d\n", i, j, k)
  adr x0, format // x0 = &format
  adr x1, i // x1 = &i
  ldr w1, [x1] // w1 = i
  mov w2, w6 // w2 = j
  adr x3, k // x3 = &k
  ldr x3, [x3] // w3 = k
  bl printf // call printf

  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16 // pop FP & LR
  ret
  .size main, (. - main)

.end
