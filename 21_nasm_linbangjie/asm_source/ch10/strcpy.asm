; ****************** strcpy.asm *******************
        ORG   0100H
        JMP   start
result  DW    0
str1    DB    'Good Morning!', '$'
str2    DB    'Good Night!  ', '$'
;
%include "..\mymacro\strcpy.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        dispstr  str1             ;���str1
        newline                   ;���C
        dispstr  str2             ;���str2
        newline                   ;���C
        strcpy   str2, str1, '$'  ;����str1��str2
        dispstr  str2             ;���str2
;
        MOV      AX, 4c00H
        INT      21H
