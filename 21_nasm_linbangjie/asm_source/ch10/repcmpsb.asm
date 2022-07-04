; *********************** repcmpsb.asm ********************
        ORG   0100H
        JMP   start
len     DW    0
msg1    DB    'source string = '
str1    DB    'Good Morning!', '$'
msg2    DB    'destination string = '
str2    DB    'Good Night!', '$'
pos     DW    0
msge    DB    'equal', '$'
msgne   DB    'not equal, position (count from 0) = ', '$'
;
%include "..\mymacro\strlen.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\dispi.mac"
;
start:
        strlen   str1, '$', len   ;�ӷ��r��str1����
        dispstr  msg1             ;���msg1�ӷ��r��
        newline                   ;���C
        dispstr  msg2             ;���msg2�ت��r��
        newline                   ;���C
;
        MOV      CX, WORD [len]   ;CX=�ӷ��r��str1����
        MOV      SI, str1         ;SI=�ӷ��r��str1��}
        MOV      DI, str2         ;DI=�ت��r��str2��}
        CLD                       ;��V,�q���ܥk
        MOV      WORD [pos], 0    ;pos=0
        REPE CMPSB                ;������۵���CX��
        JE       equal            ;�O,����equal
        SUB      SI, str1         ;��m�p��
        DEC      SI               ;��m�p�ƴ�@,�q0�p��
        MOV      WORD [pos], SI   ;pos=��m(�q0�p��)
        dispstr  msgne            ;��ܤ��۵��H��
        dispi    pos              ;  ���pos�ƭ�
        JMP      next             ;  ����next
equal:
        dispstr  msge             ;��ܬ۵��H��
next:
        MOV      AX, 4c00H
        INT      21H
