Listing 7.5 AArch64 assembly code for division by constant 193.
// The following code will calculate w2/193
// It will leave the quotient in x0 and
// the remainder in x1
ldr x3, =0x54E42524 // x3 = (1/193 << 38)
smull x4, w2, w3 // x * m
asr x0, x4, #38
sub x0, x0, x4, asr #63 // subtract sign of dividend
// calculate remainder in x1
mov x1, #193 // x1 = divisor
mul x1, x1, x0 // multiply divisor by product
sub x1, x2, x1 // subtract that from numerator
