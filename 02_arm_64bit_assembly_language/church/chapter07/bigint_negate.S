Listing 7.10 AArch64 assembly implementation if the bigint_negate function.
.text
.type bigint_negate, %function
.global bigint_negate

bigint_negate:
stp x29, x30, [sp, #-32]! // Save FP & Link Register x30
stp x19, x20, [sp, #16] // Save non-volatile regs
mov x19, x0 // x19 = bigint b
ldr w20, [x19, #8] // w20 = b->size
// initialize bigint struct to hold result
mov w0, 0x10000000 // w0 = -MAX_INT
cmp w20, w0
cinc w20, w20, EQ // increment size if -MAX_INT
mov w0, w20
bl bigint_alloc // x0 = bigint_alloc(b->size)
str w20, [x0, #8] // new->size = b->size
ldr x3, [x19] // x3 = b->blks (src chunks)
ldr x4, [x0] // x4 = new->blks(dest chunks)
// loop from least significant chunk to most significant
cmp w20, wzr // for(w20=size; w20>0; w20--)
ble endloop
negs xzr, xzr // set carry flag to 1
loop:
#ifdef EIGHT_BIT
ldrsb w6, [x3], #1 // load chunk from source
mvn w6, w6 // complement it (1’s comp.)
adc w6, w6, wzr // add carry flag
tst w6, 0x10
cneg xzr, xzr, NE // set carry flag on overflow
strb w6, [x4], #1 // store chunk in destination
#else
#ifdef SIXTEEN_BIT
ldrsh w6, [x3], #2 // load chunk from source
mvn w6, w6 // complement it (1’s comp.)
adc w6, w6, wzr // add carry flag
tst w6, 0x10000
cneg xzr, xzr, NE // set carry flag on overflow
strh w6, [x4], #2 // store chunk in destination
#else
#ifdef THIRTYTWO_BIT
ldr w6, [x3], #4 // load chunk from source
mvn w6, w6 // complement it (1’s comp.)
adcs w6, w6, wzr // add carry flag, set flags
str w6, [x4], #4 // store chunk in destination
#else
#ifdef SIXTYFOUR_BIT
ldr x6, [x3], #8 // load chunk from source
mvn x6, x6 // complement it (1’s comp.)
adcs x6, x6, xzr // add carry flag, set flags
str x6, [x4], #8 // store chunk in destination
#else /* default to 32 bits */
ldr w6, [x3], #4 // load chunk from source
mvn w6, w6 // complement it (1’s comp.)

adcs w6, w6, wzr // add carry flag, set flags
str w6, [x4], #4 // store chunk in destination
#endif
#endif
#endif
#endif
sub w20, w20, #1
cbnz w20, loop
endloop:
// return address of new bigint is already in x0
ldp x19, x20, [sp, #16] // Restore non-volatile regs
ldp x29, x30, [sp], #32 // Restore FP & LR
ret
.size bigint_negate,(. - bigint_negate)
