Listing 7.3 AArch64 assembly code for multiplication with a 64 bit result without using
mul.
.section .rodata
x: .8byte 0x57
y: .8byte 0x75
msg: .asciz "%lx * %lx = %lx\n"
.text
.type main %function
.global main
main: stp x29, x30, [sp, #-16]!
mov x0, #0 // x0 is result
ldr x1, x // x1 is multiplicand
ldr x2, y // x2 is multiplier
loop: tst x2, 0x1 // check LSB
lsr x2, x2, #1 // shift multiplier right
add x3, x0, x1
csel x0, x3, x0, ne // Add if LSB was 1
lsl x1, x1, #1 // shift multiplicand left
cmp x2, xzr
bne loop // if (multiplier == 0), we are done
// printf("%lx * %lx = %lx\n")
mov x3, x0
ldr x2, x
ldr x1, y
adr x0, msg
bl printf
mov w0, #0 // return 0
ldp x29, x30, [sp], #16
ret
.size main,(. - main)
