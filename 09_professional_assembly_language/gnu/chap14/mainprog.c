/* mainprog.c - An example of calling an assembly function */
#include <stdio.h>
void asmfunc();
int main() {
  printf("This is a test.\n");
  asmfunc();
  printf("Now for the second time.\n");
  asmfunc();
  printf("This completes the test.\n");
  return 0;
}
