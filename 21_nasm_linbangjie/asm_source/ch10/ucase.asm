; *********************** ucase.asm ********************
        ORG   0100H
        JMP   start
len     DW    0
str1    DB    'Good Morning!', '$'
msg     DB    'after LODSB, lower change to upper case,'
        DB    ' then STOSB', '$'
;
%include "..\mymacro\strlen.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        strlen   str1, '$', len  ;len=�ӷ��r��str1����
        dispstr  str1            ;��ܨӷ��r��str1
        newline                  ;���C
;
        MOV      CX, WORD [len]  ;�ӷ��r��str1����
        MOV      SI, str1        ;�ӷ��r��str1��}
        MOV      DI, str1        ;�ت��r��str1��}
        CLD                      ;��V,�q���ܥk
loop2:
        LODSB                    ;SI�r����}���JAL
        CMP      AL, 'a'         ;AL='a'?
        JB       next            ;AL<'a',next
        CMP      AL, 'z'         ;AL='z'?
        JA       next            ;AL>'z',next
a2z:
        SUB      AL, 20H         ;AL�ন�^��j�g�r��
next:
        STOSB                    ;AL�x�s��DI�r����}
        LOOP     loop2           ;�~��j��
;
        dispstr  msg             ;���msg�H��
        newline                  ;���C
        dispstr  str1            ;����ഫ�᪺str1�r��
;
        MOV      AX, 4c00H
        INT      21H
