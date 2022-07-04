; ******************* xsquare.asm ******************
;
         ORG   0100H
         JMP   start
x        DD    1.0
deltax   DD    0.1
y        DD    0.0
space    DB    '    ', '$'
title    DB    "    x        x*x ", '$'
title2   DB    " -------    ------", '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\dispchr.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       dispstr title           ;�C�L���Y
       newline
       dispstr title2          ;�C�L���Y
       newline
;
       FINIT                   ;�B�I���|��l��
       MOV     CX, 11          ;�C�L11�C�����
loop2:
       FLD     DWORD [x]       ;TOS=x
       FMUL    DWORD [x]       ;TOS=x*x
       FSTP    DWORD [y]       ;y=TOS=x*x
       dispf   x, 4            ;�C�Lx,�|��p��
       dispstr space           ;�ť�
       dispf   y, 4            ;�C�Lx,�|��p��
       newline                 ;���C
       FLD     DWORD [x]       ;TOS=x
       FADD    DWORD [deltax]  ;TOS=x+deltax
       FSTP    DWORD [x]       ;x=x+deltax
       DEC     CX              ;CX=CX-1
       CMP     CX, 0           ;CX=0?
       JE      next            ;�O
       JMP     loop2           ;�_
next:
       MOV     AX, 4c00H
       INT     21H             ;��^�@�~�t��
