#include "asm.h"
/* bionic/libm/arm64/lrint.S */

ENTRY(lrint)
  frintX d0, d0
  fcvtzs x0, d0
  ret
END(lrint)

ENTRY(lrintf)
  frintX s0, s0
  fcvtzs x0, s0
  ret
END(lrintf)

// sizeof(long) and sizeof(long long) are the same for aarch64
ALIAS_SYMBOL(llrint, lrint);

ALIAS_SYMBOL(llrintf, lrintf);

