; ********************* fdiv.asm *******************
;
         ORG   0100H
         JMP   start
a        DD    1.5
b        DD    3.5
quotient DD    0.0
slash    DB    ' / ', '$'
equal    DB    ' = ', '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                    ;�B�I���|��l��
       FLD     DWORD [a]        ;TOS=a
       FDIV    DWORD [b]        ;TOS=a/b
       FSTP    DWORD [quotient] ;quotient=TOS=a/b
       dispf   a,  3            ;���a,�T��p��
       dispstr slash            ;�C�L '/'
       dispf   b,  3            ;���b,�T��p��
       dispstr equal            ;�C�L '='
       dispf   quotient, 6      ;���quotient,����p��
;
       MOV     AX, 4c00H
       INT     21H           ;��^�@�~�t��
