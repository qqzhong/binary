#include <stdio.h>

int main() {
  printf("hello,c for arm!\n");

  unsigned int i = 0x003377ff;
  unsigned char *p;
  int j;
  p = (unsigned char *)&i;
  for (j = 0; j < 4; j++) {
    printf("Byte %d: %2x\n", j, p[j]);
  }
  return 0;
}
