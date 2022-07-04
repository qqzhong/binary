funct1:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
	movl %ebx, -8(%ebp)
	movl 12(%ebp), %ecx
	movl 8(%ebp), %ebx
	movl %esi, -4(%ebp)
	movl $1717986919, %esi
	imull %ebx, %ecx
	movl $.LC0, (%esp)
	movl %ecx, %eax
	imull %esi
	movl $500, %eax
	movl %ecx, 4(%esp)
	movl %edx, %ebx
	movl %ecx, %edx
	sarl $31, %edx
	sarl %ebx
	subl %edx, %ebx
	movl %ebx, 8(%esp)
	cltd
	idivl %ecx
	movl %eax, 12(%esp)
	call printf
	movl -8(%ebp), %ebx
	movl -4(%ebp), %esi
	movl %ebp, %esp
	popl %ebp
	ret

