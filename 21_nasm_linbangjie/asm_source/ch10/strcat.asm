; ******************** strcat.asm ******************
        ORG   0100H
        JMP   start
result  DW    0
str1    DB    'Good Morning!', '$'
        TIMES 80 DB ' '
str2    DB    'Good Night!  ', '$'
;
%include "..\mymacro\strcat.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        dispstr  str1             ;���str1
        newline                   ;���C
        dispstr  str2             ;���str2
        newline                   ;���C
        strcat   str1, str2, '$'  ;str2����str1����
        dispstr  str1             ;���str1
;
        MOV      AX, 4c00H
        INT      21H
