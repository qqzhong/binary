// Error: alignment not a power of 2
.data
.align 4
temp:  .quad 0

.section .text
.align 2
.type sum, %function
.global sum
sum:
 add x0, x0, x1
 ret
