Listing 7.6 AArch64 assembly code for division of a variable by a constant without using
a multiply instruction.
// The following code will calculate w2/23
// It will leave the quotient in x0 and does
// not calculate a remainder
sxtw x2, w2 // Sign extend w2
mov x0, x2 // Copy into x0
// calculate 2^6x+2^4x+2^3x+2^0x
add x3, x2, x0, lsl #3
add x3, x3, x0, lsl #4
add x3, x3, x0, lsl #6
// now perform three 64-bit shift-add operations
lsl x3, x3, #2

add x0, x0, x3
lsl x3, x3, #11 // shift 11 + 2 = 13
add x0, x0, x3
lsl x3, x3, #11 // shift 11 + 13 = 24
add x0, x0, x3
asr x1, x0, #35
sub x0, x1, x0, asr #63 // subtract sign of dividend
