; ******************* strtof.asm ****************
;
       ORG   0100H
       JMP   start
str1   DB    "-1.25", '$'
str2   DB    "1.25", '$'
fnum1  DD    0.0
fnum2  DD    0.0
msg    DB    "  string convert to float = ", '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\strtof.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       dispstr  str1
       dispstr  msg
       strtof   str1, fnum1    ;�r���ন�B�I��
       dispf    fnum1 , 6      ;���fnum, 6��p��
       newline                 ;���C
;
       dispstr  str2
       dispstr  msg
       strtof   str2, fnum2    ;�r���ন�B�I��
       dispf    fnum2 , 6      ;���fnum, 6��p��
       newline                 ;���C
;
       MOV   AX, 4c00H
       INT   21H               ;��^�@�~�t��
