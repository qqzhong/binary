; ********************* movsb.asm ********************
        ORG   0100H
        JMP   start
msg1    DB    'source string = '
str1    DB    'Good Morning!', '$'
len     DW    0
msg2    DB    'destination string = '
str2    DB    '             ', '$'
msg3    DB    'length of destination string = ', '$'
;
%include "..\mymacro\strlen.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        strlen  str1, '$', len  ;�ӷ��r��str1����
        MOV     CX, WORD [len]  ;CX=str1�r�����
        MOV     SI, str1        ;�ӷ��r��str1��}
        MOV     DI, str2        ;�ت��r��str2��}
        CLD                     ;��V,�q���ܥk
loop2:
        MOVSB                   ;�줸�շh��
        LOOP    loop2           ;����CX��
        strlen  str2, '$', len  ;�ت��r��str2����
        dispstr msg1            ;���msg�r��(str1)
        newline                 ;���C
        dispstr msg2            ;���msg2�r��(str2)
        newline                 ;���C
        dispstr msg3            ;���msg3�r��
        dispi   len             ;���str2�r�����(len)
        MOV     AX, 4c00H
        INT     21H
