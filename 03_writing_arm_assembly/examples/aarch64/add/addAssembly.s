 .data
 .align 3
a: .quad 0x0A
b: .quad 0x05
c: .quad 0
.LC0: .string "c=%lld\n"
 .align 2
 .text
 .global main
 .type main,%function
 .extern printf

main:
 sub sp,sp,16
 str x30,[sp]

 mov x9,0x05
 mov x10,0x0a

 add x11,x9,x10

 adrp x0, .LC0
 add x0, x0, :lo12:.LC0
 mov x1,x11
 bl printf

 ldr x30,[sp]
 add sp,sp,16

 ret
 .size main, .-main
