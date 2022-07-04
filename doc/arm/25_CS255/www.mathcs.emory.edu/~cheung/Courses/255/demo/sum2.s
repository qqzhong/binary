    xdef Start, Stop, End
    xdef i, s
    xdef sum, A


* *****************************************************************
* main:
*       sum = SumArray(A, 10)
*
Start:

        move.l #A, d0
        move.l #10, d1
        bsr    SumArray
        move.l d0, sum

Stop: nop

A:     dc.l     10, 12, 1, 2, 3, 12, 1, 9, 8, 1
sum:   ds.l  1

* *****************************************************************
*
* SumArray(int a[], int n)
* { int i, s;
*   s = 0;
*   for (i = 0; i < n; i++)
*      s = s + a[i];
*   return(s);
*
* Passing: int array a by reference in d0
*          int n by value in d1
* Return value s in d0
*
****************************************
* Local variables as memory variables
****************************************
SumArray:
            MOVE.L #0, i                ; i
            MOVE.L #0, s                ; s

   WStart:
	    MOVE.L i, d2		;; Get i in D2
            CMP.L d1, d2                ; compares n (d1) and i (d2)
            BGE    WEnd                 ; if (i >= n) exit while loop

            MOVE.L d0, a0               ; get base addr of array in a0
            MOVE.L i, d4                ; d4 = i
            MULS   #4, d4		; d4 = offset in array

            MOVE.L 0(a0, d4.w), d4	; d4 = a[i]
	    MOVE.L s,  d3
            ADD.L  d4, d3               ; 
	    MOVE.L d3, s		; s = s + a[i]

            MOVE.L i, d2                ; d2 = i
            ADD.L  #1, d2               ; d2 = i + 1
            MOVE.L d2, i                ; i = i + 1

            BRA WStart

     WEnd:
            MOVE.L d3, d0               ; return(s) [ in agreed place d0 ]
            RTS

i:          ds.l 1                  ; local variable i
s:          ds.l 1                  ; local variable s

End: 	nop
       end

break Start
break Stop
disp/10dw &A
disp/dw &sum
