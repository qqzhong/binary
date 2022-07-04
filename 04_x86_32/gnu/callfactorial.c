/*
 * An application that illustrates calling the factorial function defined
 * elsewhere.
 */

#include <inttypes.h>
#include <stdio.h>
#include <assert.h>

uint64_t factorial(unsigned n);

uint64_t c_factorial(unsigned n) { return (n <= 1) ? 1 : n * factorial(n - 1); }

int main() {
  for (unsigned i = 0; i < 20; i++) {
    assert((factorial(i) == c_factorial(i)));
    printf("factorial(%2u) = %lu\n", i, factorial(i));
  }
}