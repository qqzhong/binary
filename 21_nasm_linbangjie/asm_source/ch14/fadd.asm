; ****************** fadd.asm ****************
;
       ORG   0100H
       JMP   start
a      DD    1.5
b      DD    3.5
sum    DD    0.0
plus   DB    ' + ', '$'
equal  DB    ' = ', '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                 ;�B�I���|��l��
       FLD     DWORD [a]     ;TOS=a
       FADD    DWORD [b]     ;TOS=a+b
       FSTP    DWORD [sum]   ;sum=TOS
       dispf   a,  3         ;���a,�T��p��
       dispstr plus          ;�C�L '+'
       dispf   b,  3         ;���b,�T��p��
       dispstr equal         ;�C�L '='
       dispf   sum , 3       ;���sum,�T��p��
;
       MOV     AX, 4c00H
       INT     21H           ;��^�@�~�t��
