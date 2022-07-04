.globl main
// text should be implied here

main:
	// argc is stored in w0. Give back number of arguments (program name is 1, so subtract 1.)
	add w0, w0, -1
	ret
