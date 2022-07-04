/* externtest.cpp - An example of using assembly language functions with C++ */
#include <stdio.h>

// extern "C" {
int square(int);
float areafunc(int);
char *cpuidfunc(void);
// }

int main() {
  int radius = 10;
  int radsquare = square(radius);
  printf("The radius squared is %d\n", radsquare);
  float result;
  result = areafunc(radius);
  printf("The area is %f\n", result);
  printf("The CPUID is %s\n", cpuidfunc());
  return 0;
}
