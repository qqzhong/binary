; ********************** lodsb.asm ***********************
        ORG   0100H
        JMP   start
len     DW    0
msg1    DB    'source string = '
str1    DB    'Good Morning!', '$'
msg2    DB    'destination string = '
str2    DB    'Good Night!  ', '$'
pos     DW    0
msg3    DB    'after LODSB and STOSB ', 13, 10, '$'
;
%include "..\mymacro\strlen.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        dispstr  msg1             ;��ܨӷ��r��str1
        newline                   ;���C
        dispstr  msg2             ;��ܥت��r��str2
        newline                   ;���C
;
        strlen   str1, '$', len   ;len=�ӷ��r��str1����
        MOV      CX, WORD [len]   ;CX=�ӷ��r��str1����
        MOV      SI, str1         ;�ӷ��r��str1��}
        MOV      DI, str2         ;�ت��r��str2��}
        CLD                       ;��V,�q���ܥk
loop2:
        LODSB                     ;SI�r����}���JAL
        STOSB                     ;AL�x�s��DI�r����}
        LOOP     loop2            ;�~��j��
;
        dispstr  msg3             ;���msg3�H��
        dispstr  msg2             ;��ܫ����᪺�r��
;
        MOV      AX, 4c00H
        INT      21H
