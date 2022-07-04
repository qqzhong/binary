  .text
  /* longMul takes two unsigned longs as input on x0 and x1 and
  returns a 128-bit product with the lower half "lo" in x0
  and the higher half "hi" in x1. */
  .type longMul, %function
longMul:
  mul x9, x0, x1
  umulh x1, x0, x1
  mov x0, x9
  ret

  .type main, %function
  .global main
  /* Reads two unsigned longs from stdin and prints the resulting
  product on stdout. */
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  stp x19, x20, [sp, #16] // Callee-saved

  // printf("Enter a number in hex: ")
  adr x0, prompt
  bl printf

  // scanf("%ld", &x)
  adr x0, fmtScan
  adr x1, dataIn
  bl scanf
  adr x1, dataIn
  ldr x19, [x1] // x

  // printf("Enter a number in hex: ")
  adr x0, prompt
  bl printf

  // scanf("%ld", &y)
  adr x0, fmtScan
  adr x1, dataIn
  bl scanf
  adr x1, dataIn
  ldr x20, [x1] // y

  // longMul(x, y)
  mov x0, x19
  mov x1, x20
  bl longMul

  // printf("%18lx * %18lx = %18lx%18lx\n", x, y, hi, lo)
  mov x4, x0 // lo
  mov x3, x1 // hi
  mov x2, x20 // y
  mov x1, x19 // x
  adr x0, fmtResult
  bl printf

  // return 0
  mov w0, #0
  ldp x19, x20, [sp, #16] // Callee-saved
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)

  .data
dataIn:
  .skip 8

  .section .rodata
prompt:
  .string "Enter a number in hex: "
fmtScan:
  .string "%lx"
fmtResult:
  .string "%016lx * %016lx = %016lx%016lx\n"

.end

// Modified by Church.ZHONG
