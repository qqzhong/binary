	xdef Start, Stop, End
	xdef A, B

Start:
	move #1, d0
	move #2, d0
	bsr	A
	move #3, d0
	move #4, d0
	bsr	A
	move #5, d0
	
Stop:	nop

A:	
	move #11, d0
	move #12, d0
	bsr	B
	move #13, d0
	move #14, d0
	bsr	B
	move #15, d0
	move #16, d0
	rts

B:	
	move #21, d0
	move #22, d0
	rts

End:
	end

.gdbinit:
break start
break stop
disp/8wx 131040
disp/xw $sp
disp/i $pc
