; ******************* fsub.asm ******************
;
       ORG   0100H
       JMP   start
a      DD    1.5
b      DD    3.5
result DD    0.0
minus  DB    ' - ', '$'
equal  DB    ' = ', '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                   ;�B�I���|��l��
       FLD     DWORD [a]       ;TOS=a
       FSUB    DWORD [b]       ;TOS=a-b
       FSTP    DWORD [result]  ;result=TOS=a-b
       dispf   a,  3           ;���a,�T��p��
       dispstr minus           ;�C�L '-'
       dispf   b,  3           ;���b,�T��p��
       dispstr equal           ;�C�L '='
       dispf   result, 3       ;���result,�T��p��
       MOV     AX, 4c00H
       INT     21H             ;��^�@�~�t��
