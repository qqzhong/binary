; ********************* fsqrt.asm ****************
        ORG   0100H
        JMP   start
num     DD    3
sqrt    DD    0
factor  DD    10000
intpart DD    0
frapart DD    0
point   DB    '.', '$'
msg     DB    'square root of 3 = ', '$'
;
%include "..\mymacro\dispul.mac"
%include "..\mymacro\dispstr.mac"
;
start:
        FINIT                     ;�B�I���|��l��
        FILD     DWORD [num]      ;TOS=���num
        FSQRT                     ;TOS=TOS�������
        FIMUL    DWORD [factor]   ;TOS=TOS*factor
        FISTP    DWORD [sqrt]     ;sqrt=TOS
        MOV      EDX, 0           ;EDX=0
        MOV      EAX, [sqrt]      ;EAX=sqrt
        MOV      EBX, [factor]    ;EBX=factor
        DIV      EBX              ;EDX:EAX/EBX
        MOV      [intpart], EAX   ;intpart=��
        MOV      [frapart], EDX   ;frapart=�l��
        dispstr  msg              ;���msg
        dispul   intpart          ;��ܾ�Ƴ���
        dispstr  point            ;��ܤp���I
        dispul   frapart          ;��ܤp�Ƴ���
;
        MOV      AX, 4c00H
        INT      21H
