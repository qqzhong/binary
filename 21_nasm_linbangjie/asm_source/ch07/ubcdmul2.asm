; ******************** ubcdmul2.asm ********************
        ORG    0100H
        JMP    start
len     DW     4
astr    TIMES  80 DB ' '
a       TIMES  80 DB 0
msg     DB     'keyin a number with leading zero: ', '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\readstr.mac"
%include "..\mymacro\str2ubcd.mac"
%include "..\mymacro\ubcdmul2.mac"
%include "..\mymacro\str2ubcd.mac"
%include "..\mymacro\dispubcd.mac"
%include "..\mymacro\newline.mac"
;
start:
      MOV      CX, -1            ;�û��j��
begin:
      dispstr  msg               ;���msg�H��
      readstr  astr              ;��J�Ʀr�r��
      newline                    ;���C
      CMP      BYTE [astr], '$'  ;Enter��?
      JNE      next              ;�_
      JMP      endjob            ;�O
next:
      str2ubcd astr, '$', a, len ;ASCII�Ʀr�নBCD
      ubcdmul2 a, len            ;a*2
      dispubcd a, len
      newline
      JMP      begin             ;�~��
endjob:
      MOV      AX, 4c00H
      INT      21H
