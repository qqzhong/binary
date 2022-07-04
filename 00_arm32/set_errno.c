#include <errno.h>

// This function is called from our assembler syscall stubs.
// C/C++ code should just assign 'errno' instead.

// The return type is 'long' because we use the same routine in calls
// that return an int as in ones that return a ssize_t. On a 32-bit
// system these are the same size, but on a 64-bit system they're not.
// 'long' gives us 32-bit on 32-bit systems, 64-bit on 64-bit systems.

// Since __set_errno was mistakenly exposed in <errno.h> in the 32-bit
// NDK, use a differently named internal function for the system call
// stubs. This avoids having the stubs .hidden directives accidentally
// hide __set_errno for old NDK apps.

#ifdef __cplusplus
extern "C"{
#else
extern
#endif
// This one is for internal use only and used by both LP32 and LP64 assembler.
long __set_errno_internal(int n) {
  errno = n;
  return -1;
}
#ifdef __cplusplus
}
#endif
