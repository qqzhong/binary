; ************************ strncpy.asm *******************
        ORG   0100H
        JMP   start
str2    DB    'Good Morning!', '$'
len     DW    0
n       DW    4
msg     DB    'after strncpy, n increase 1 each time', '$'
str1    DB    '             ', '$'
;
%include "..\mymacro\strlen.mac"
%include "..\mymacro\strncpy.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        dispstr  str2             ;���str2
        newline                   ;���C
        dispstr  msg              ;���msg
        newline                   ;���C
        strlen   str2, '$', len   ;len=str2����
        MOV      CX, WORD [len]   ;CX=str2����
        MOV      WORD [n], 1      ;n=1
loop2:
        strncpy  str1, str2, n    ;str2����n�Ӧr����str1
        dispstr  str1             ;���str1
        newline                   ;���C
        INC      WORD [n]         ;n=n+1
        LOOP     loop2            ;�~��j��
;
        MOV      AX, 4c00H
        INT      21H
