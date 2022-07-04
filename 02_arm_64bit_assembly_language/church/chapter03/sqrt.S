#include "asm.h"
/* bionic/libm/arm64/sqrt.S */

ENTRY(sqrt)
  fsqrt d0, d0
  ret
END(sqrt)

ENTRY(sqrtf)
  fsqrt s0, s0
  ret
END(sqrtf)
