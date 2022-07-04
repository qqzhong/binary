; ********************** fpustack.asm ********************
         ORG  0100H
         JMP  start
title    DB   '  B C3    ST    C2 C1 C0'
         DB   ' IR    PE UE OE ZE DE IE top', 13,10,'$'
space    DB   ' ', '$'
a        DD   1.23
b        DD   4.56
fpuFlag  DW   0
;
%include  "..\mymacro\disptos.mac"
%include  "..\mymacro\dispstr.mac"
%include  "..\mymacro\newline.mac"
%include  "disp8bit.mac"
;
start:
         dispstr  title           ;��ܪ��Y
         FINIT                    ;�B�I���|��l��
         CALL     printTOS        ;��ܳ��ݯB�I�Ȧs����
         FLD      DWORD [a]       ;�|�Ja
         CALL     printTOS
         FLD      DWORD [b]       ;�|�Jb
         CALL     printTOS
         FSTP     DWORD [a]       ;�|�X��a
         CALL     printTOS
         FSTP     DWORD [b]       ;�|�X��b
         CALL     printTOS
         RET
printTOS:
         FSTSW    WORD [fpuFlag]  ;�|�X���A�r��
         disp8bit fpuFlag+1       ;��ܰ�8�줸
         disp8bit fpuFlag         ;��ܧC8�줸
         dispstr  space           ;�Ť@��
         disptos  4               ;�p��4��
         newline                  ;���C
;
         MOV      AX, 4c00H
         INT      21H
