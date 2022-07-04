#include <stdio.h>
long long int sum(long long int a, long long int b) { return a + b; }
int main() {
  long long int a = 10, b = 5, c = 0;
  c = sum(a, b);
  printf("%lld+%lld=%lld\n", a, b, c);
  return 0;
}
