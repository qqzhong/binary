//Listing 5.32 String reversing in C using pointers.
#if 0
#include <stdio.h>
#include <string.h>
void reverse(char *left, char *right)
{
char tmp;
if(left <= right)
{
tmp = *left;
*left = *right;
*right = tmp;
reverse(left+1, right-1);
}
}
int main()
{
char str[] = "\nThis is the string to reverse\n";
printf(str);
reverse(str, str + strlen(str)-1);
printf(str);
return 0;
}
#endif


  // Listing 5.33 String reversing in assembly using pointers.
  .data // Storing in the data section instead of on the stack
str: .string "\nThis is the string to reverse\n"

  .text
  .type reverse, %function
  .global reverse
reverse:stp x29, x30, [sp, #-16]! // push FP and LR
  // if( left >= right) goto endif
  cmp x0, x1
  bge endif
  ldrb w2, [x0] // w2 = *left
  ldrb w3, [x1] // w3 = *right
  strb w3, [x0] // a[left] = w3
  strb w2, [x1] // a[right] = w2
  // reverse(a, left+1, right-1)
  add w0, w0, #1 // left += 1
  sub w1, w1, #1 // right -= 1
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

  // reverse(str, str + strlen(str)-1)
  adr x0, str
  bl strlen
  add x1, x0, #-1
  adr x0, str
  add x1, x1, x0
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
