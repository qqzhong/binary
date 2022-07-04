Listing 7.2 AArch64 assembly code for multiplication with a 128 bit result without umulh
or smulh.
.section .rodata
x: .8byte 0x57
y: .8byte 0x75
msg: .asciz "%lx * %lx = %016lx%016lx\n"
.text
.type main %function
.global main
/* Multiplies x and y by adding a series of partial products.
Shifts x (multiplicand) left and y (multiplier) right. Only
adds if the least significant bit of multiplier is 1. */
main: stp x29, x30, [sp, #-16]!
mov x0, #0 // resultLow = 0
mov x1, #0 // resultHigh = 0
adr x2, x // x2 = &x
ldr x2, [x2] // x2 = multiplicandLow
mov x3, #0 // x3 = multiplicandHigh
adr x4, y // x4 = &y
ldr x4, [x4] // x4 = multiplier
loop: tst x4, #1 // Only add if lowest bit of
beq endIf // multiplier is 1:
adds x0, x0, x2 // resultLow += multiplicandLow.
adc x1, x1, x3 // resultHigh +=
// multiplicandHigh + Carry
endIf: // shift 128-bit multiplicand left. Carry bit from lo to hi.
ands xzr, x2, 0x8000000000000000
lsl x2, x2, #1
lsl x3, x3, #1
cinc x3, x3, ne
// shift multiplier right
lsr x4, x4, #1
// if (y != 0) repeat loop
cmp x4, xzr
bne loop
// print results
mov x4, x0
mov x3, x1
adr x2, y
ldr x2, [x2]
adr x1, x
ldr x1, [x1]
adr x0, msg
bl printf
mov w0, #0 // return 0
ldp x29, x30, [sp], #16
ret
.size main,(. - main)
