; ******************* dispf.asm ***************
;
       ORG   0100H
       JMP   start
fnum   DD    123.00678
fnum2  DD    -789.01234
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\newline.mac"
;
start:
       dispf  fnum , 0      ;���fnum,�s��p��
       newline               ;���C
       dispf  fnum , 1      ;���fnum,�@��p��
       newline               ;���C
       dispf  fnum , 2      ;���fnum,�G��p��
       newline               ;���C
       dispf  fnum , 3      ;���fnum,�T��p��
       newline               ;���C
       dispf  fnum , 4      ;���fnum,�|��p��
       newline               ;���C
;
       dispf  fnum2 , 0     ;���fnum,�s��p��
       newline               ;���C
       dispf  fnum2 , 1     ;���fnum,�@��p��
       newline               ;���C
       dispf  fnum2 , 2     ;���fnum,�G��p��
       newline               ;���C
       dispf  fnum2 , 3     ;���fnum,�T��p��
       newline               ;���C
       dispf  fnum2 , 4     ;���fnum,�|��p��
       newline               ;���C
;
       MOV   AX, 4c00H
       INT   21H           ;��^�@�~�t��
