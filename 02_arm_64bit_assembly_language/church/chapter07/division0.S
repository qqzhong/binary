Listing 7.4 AArch64 assembly implementation of signed and unsigned 64-bit and 128-bit
division functions
### ----------------------------------------------------------------
### divide.S
### Author: Larry Pyeatt with William Ughetta
### Date: 10/16/2014. Revised: 07/31/2018.
###
### Division functions in AArch64 assembly language
### ----------------------------------------------------------------
.text
.align 2
.global udiv64
.type udiv64, %function
/* udiv64 divides the dividend in x0 by the divisor in x1. It
* returns the quotient in x0 and the remainder in x1. */
udiv64:
cbnz x1, endif1 // if (divisor == 0)
mov x0, #0 // return 0
mov x1, #0
ret
endif1:
clz x2, x1 // x2 = count
lsl x1, x1, x2 // divisor <<= count
mov x3, #0 // x3 = quotient
add x2, x2, #1 // x2 = count+1
divloop:
lsl x3, x3, #1 // Shift 0 into quotient LSB
cmp x0, x1
blo endif2 // if (dividend >= divisor)
orr x3, x3, #1 // Set LSB of quotient
sub x0, x0, x1 // dividend -= divisor
endif2:
sub x2, x2, #1 // Decrement count
lsr x1, x1, #1 // Shift divisor right
cbnz x2, divloop // while (count+1 != 0)
mov x1, x0 // remainder is the dividend
mov x0, x3 // return quotient
ret
.size udiv64, (. - udiv64)
### ----------------------------------------------------------------
.global sdiv64
.type sdiv64, %function
/* sdiv64 divides a signed 64-bit dividend in x0 with a signed
* 64-bit divisor in x1. Returns the quotient in x0 and the
* remainder in x1. Uses udiv64 to do the real work. */
sdiv64:
stp x29, x30, [sp, #-32]!

str x19, [sp, #16] // Push FP,LR,& Callee-saved
cmp x0, #0 // If dividend is negative
cneg x0, x0, lt // Complement
cset x19, lt // Set sign bit for result
cmp x1, #0 // If divisor is negative
cneg x1, x1, lt // Complement
eor x9, x19, #1
csel x19, x9, x19, lt // Complement sign bit
bl udiv64
cmp x19, #0 // Complement remainder if
cneg x0, x0, ne // sign bit is set
cneg x1, x1, ne
ldr x19, [sp, #16]
ldp x29, x30, [sp], #32 // Pop FP,LR,& Callee-saved
ret
.size sdiv64,(. - sdiv64)
### ----------------------------------------------------------------
.global udiv128
.type udiv128, %function
/* udiv128 divides the dividend in x0:x1 by the divisor in
* x2:x3. It returns the 128 bit result in x0:x1 and the
* remainder in x2:x3. x2 is low order bits (i.e. lo:hi). */
udiv128:
orr x9, x2, x3
cbnz x9, endif3 // if (divisor == 0)
mov x0, #0 // return 0
mov x1, #0
ret
endif3:
mov x4, #0 // x4:x5 = quotient
mov x5, #0
## Count leading zeroes
clz x6, x3 // count high order bits
cbnz x6, endif4 // if (divisorHigh == 0)
clz x6, x4 // count low order bits
add x6, x6, #64
endif4:
neg x7, x6 // x7 = -count
add x8, x6, #128 // x8 = 128 - count
add x9, x7, #64 // x9 = 64 - count
cmp x9, #0
csel x7, x8, x9, lt // x7 = (128 - count) % 64
## shift divisor x2:x3 << count
lsl x3, x3, x6 // divisorHigh <<= count
lsr x9, x2, x7 // tmp=Low >> (128-count)%64
orr x3, x3, x9 // divisorHigh |= tmp
lsl x2, x2, x6 // divisorLow <<= count
add x6, x6, #1 // x6 = count+1
divloop128:
lsl x5, x5, #1 // Shift 0 into quotient LSB
lsr x9, x4, #63 // tmp = Low >> 63
orr x5, x5, x9
lsl x4, x4, #1
cmp x1, x3
bne endif5
cmp x0, x2
endif5:
blo endif6 // if (dividend >= divisor)
orr x4, x4, #1 // Set LSB of quotient
sub x0, x0, x2 // dividend -= divisor
sub x1, x1, x3
endif6:
sub x6, x6, #1 // Decrement count
lsr x2, x2, #1 // Shift divisor right
lsl x9, x3, #63
orr x2, x2, x9
lsr x3, x3, #1
cbnz x6, divloop128 // while (count+1 != 0)
mov x2, x0 // remainder is the dividend
mov x3, x1
mov x0, x4 // return quotient
mov x1, x5
ret
.size udiv128,(. - udiv128)
### ----------------------------------------------------------------
/* sdiv128 divides the signed dividend in x0:x1 by the signed
* divisor in x2:x3. It returns the 128 bit result in x0:x1
* and the remainder in x2:x3. Uses udiv128. */
.global sdiv128
.type sdiv128, %function
sdiv128:
stp x29, x30, [sp, #-32]!
str x19, [sp, #16]
cmp x1, #0 // If dividendHigh < 0
bge endif7
mvn x0, x0 // Bitwise NOT
mvn x1, x1
adds x0, x0, #1 // Add 1 for 2’s complement
adc x1, x1, xzr
eor x19, x19, #1 // Keep track of sign
endif7:
cmp x3, #0 // If divisorHigh < 0
bge endif8
mvn x2, x2 // Bitwise NOT
mvn x3, x3
adds x2, x2, #1 // Add 1 for 2’s complement
adc x3, x3, xzr
eor x19, x19, #1 // Keep track of sign
endif8:
bl udiv128
// If sign bit is set, then complement the result
cmp x19, #0
bge endif8
mvn x0, x0 // Bitwise NOT
mvn x1, x1
adds x0, x0, #1 // Add 1 for 2’s complement
adc x1, x1, xzr
// return
ldr x19, [sp, #16]
ldp x29, x30, [sp], #32
ret
.size sdiv128,(. - sdiv128)

