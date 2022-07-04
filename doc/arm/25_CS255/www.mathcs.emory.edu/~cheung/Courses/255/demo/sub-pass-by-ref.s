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
	move.l	#a, d0		; pass param 1 (address of a)
	move.l	#b, d1		; pass param 2 (address of b)

	bsr	func		; Call function

	move.l  d7, c		; Store return value in d7 into c
	nop

pause1:
******************************** k = func(i,j)
	move.l	#i, d0		; pass param 1 (address of i)
	move.l	#j, d1		; pass param 2 (address of j)

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
* Input: d0 = address of x (x = first integer parameter)
*	 d1 = address of y (x = second integer parameter)
* 
* 
func:
	MOVEA.L D0, A0    // D0 = address of variable x
	MOVE.L  (A0), D2  // Now D2 = value of variable x
	ADD.L   #1, D2	  // Computed x+1
	MOVE.L  D2, (A0)  // Stores: x = x + 1

	MOVEA.L D1, A0    // D1 = address of variable y
	MOVE.L  (A0), D2  // Now D2 = value of variable y
	ADD.L   #1, D2	  // Computed y+1
	MOVE.L  D2, (A0)  // Stores: y = y + 1

	MOVEA.L D0, A0    // D0 = address of variable x
	MOVE.L  (A0), D2  // Now D2 = value of variable x
        MULS    D2, D2    // D2 = x*x

	MOVEA.L D1, A0    // D0 = address of variable y
	MOVE.L  (A0), D3  // Now D3 = value of variable y
        MULS    D3, D3    // D2 = y*y

	ADD.L   D3, D2     // x*x + y*y

	MOVE.L  D2, D7     // Put return value in the agreed location

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
