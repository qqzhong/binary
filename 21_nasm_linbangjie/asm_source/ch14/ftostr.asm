; ******************* ftostr.asm *******************
;
       ORG   0100H
       JMP   start
fnum   DD    -1234.5
fnum2  DD    9876.5
msg    DB    ' convert to string = '
fstr   TIMES 80 DB ' '
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\ftostr.mac"
%include "..\mymacro\dispstr.mac"
;
start:
     ftostr  fnum, 2, fstr  ;�B�I���ন2��p�Ƥ��r��
     dispf   fnum , 1       ;���fnum, 1��p��
     dispstr msg
     newline                ;���C
;
     ftostr  fnum2, 2, fstr ;�B�I���ন2��p�Ƥ��r��
     dispf   fnum2 , 1      ;���fnum, 1��p��
     dispstr msg
     newline                ;���C
;
     MOV   AX, 4c00H
     INT   21H              ;��^�@�~�t��
