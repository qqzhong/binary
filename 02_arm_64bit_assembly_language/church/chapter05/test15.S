// Listing 5.30 A C program that uses recursion to reverse a string.
#if 0
#include <stdio.h>
#include <string.h>
void reverse(char *a, int left, int right)
{
if(left < right)
{
char tmp = a[left];
a[left] = a[right];
a[right] = tmp;
reverse(a, left+1, right-1);
}
}
int main()
{
char str[] = "\nThis is the string to reverse\n";
printf(str);
reverse(str, 0, strlen(str)-1);
printf(str);
return 0;
}
#endif

// Listing 5.31 AArch64 assembly implementation of the reverse function.
  .data // Declare static data
str: .string "\nThis is the string to reverse\n"

  .text
  .type reverse, %function
  .global reverse
reverse:
  stp x29, x30, [sp, #-16]! // push FP and LR
  // if( left >= right) goto endif
  cmp x1, x2
  bge endif
  ldrb w3, [x0, x1] // w3 = a[left]
  ldrb w4, [x0, x2] // w4 = a[right]
  strb w4, [x0, x1] // a[left] = w4
  strb w3, [x0, x2] // a[right] = w3
  // reverse(a, left+1, right-1)
  add w1, w1, #1 // left += 1
  sub w2, w2, #1 // right -= 1
  bl reverse
endif: ldp x29, x30, [sp], #16 // pop FP and LR
  ret
  .size reverse, (. - reverse)

  .type main, %function
  .global main
main: stp x29, x30, [sp, #-16]!

  // printf(str)
  adr x0, str
  bl printf
  // reverse(str, 0, strlen(str)-1)
  adr x0, str
  bl strlen
  add w0, w0, #-1
  mov w2, w0
  mov w1, wzr
  adr x0, str
  bl reverse
  // printf(str)
  adr x0, str
  bl printf
  // return 0
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret
  .size main, (. - main)

.end
