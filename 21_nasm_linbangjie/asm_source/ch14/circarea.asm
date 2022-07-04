; ******************* circarea.asm ****************
         ORG  0100H
         JMP  start
msg      DB   'circle area (r=10.0) = ', '$'
r        DD   10.0
area     DD   0.0
;
%include  "..\mymacro\dispf.mac"
%include  "..\mymacro\dispstr.mac"
;
start:
       FINIT                    ;�B�I���|��l��
       FLD      DWORD [r]       ;TOS=r
       FMUL     DWORD [r]       ;TOS=r*r
       FLDPI                    ;TOS=�k, ST1=r*r
       FMUL     ST1             ;TOS=TOS*ST1=�k*r*r
       FSTP     DWORD [area]    ;area=�k*r*r
       dispstr  msg
       dispf    area, 6         ;�L�X�ꭱ�n,6��p��
;
       MOV      AX, 4c00H
       INT      21H             ;��^�@�~�t��
