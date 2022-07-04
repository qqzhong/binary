********************************************************
* Subroutine: parameter pasing
*
* Using a simple technique: pass a copy in register
********************************************************
	xdef Start, Stop, End
	xdef a, b, c, i, j, k
	xdef pause1, func

Start:
******************************** c = func(a,b)
	move.l	a, d0		; pass param 1
	move.l	b, d1		; pass param 2

	bsr	func		; Call function

	move.l  d7, c		; Store return value in d7 into c
	nop

pause1:
******************************** k = func(i,j)
	move.l	i, d0		; pass param 1
	move.l	j, d1		; pass param 2

	bsr	func		; Call function

	move.l  d7, k		; Store return value in d7 into k
	
Stop:	nop

a:	dc.l 3
b:	dc.l 4
c:	dc.l 0
i:	dc.l 2
j:	dc.l 5
k:	dc.l 0


* ----------------------------------- You can use lines like this to show
* ----------------------------------- where a subroutine starts !!!!!!!!!
* ----------------------------------- (BTW, that's the only way :-)
* Subroutine func
* Input: d0 = x (first integer parameter)
*	 d1 = y (second integer parameter)
* 
* 
func:
	ADD.L  #1, D0    // x = x + 1
	ADD.L  #1, D1    // y = y + 1
       
	MULS   D0, D0    // x*x
	MULS   D1, D1    // y*y
	ADD.L  D1, D0    // x*x + y*y
	MOVE.L D0, D7    // Put return value in the agreed location

	RTS

End:
	end

.gdbinit:
break start
break stop
break pause1
disp/dw &k
disp/dw &j
disp/dw &i
disp/dw &c
disp/dw &b
disp/dw &a
disp/i $pc
