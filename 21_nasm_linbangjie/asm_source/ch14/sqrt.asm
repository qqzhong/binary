; ********************** sqrt.asm ****************
        ORG   0100H
        JMP   start
num     DD    2
sqrt    DD    0
msg     DB    'square root of 2 = ', '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\dispf.mac"
;
start:
        FINIT                     ;�B�I���|��l��
        FILD     DWORD [num]      ;TOS=num
        FSQRT                     ;TOS=num�������
        FSTP     DWORD [sqrt]     ;sqrt=TOS
        dispstr  msg              ;��ܰT��
        dispf    sqrt, 6          ;���3�������
        MOV      AX, 4c00H
        INT      21H              ;��^�@�~�t��
