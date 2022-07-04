; Simple ARM syntax example
;
; Iterate round a loop 10 times, adding 1 to a register each time.

      AREA ||.text||, CODE, READONLY, ALIGN=2

main PROC
      MOV      w5,#0x64      ; W5 = 100
      MOV      w4,#0         ; W4 = 0
      B        test_loop     ; branch to test_loop
loop
      ADD      w5,w5,#1      ; Add 1 to W5
      ADD      w4,w4,#1      ; Add 1 to W4
test_loop
      CMP      w4,#0xa       ; if W4 < 10, branch back to loop
      BLT      loop
      ENDP

      END
