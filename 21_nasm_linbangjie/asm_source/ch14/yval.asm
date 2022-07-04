; ******************* yval.asm ******************
;
         ORG   0100H
         JMP   start
x        DD    1.0
deltax   DD    0.1
y        DD    0.0
c        DD    2.0
space    DB    '     ', '$'
title    DB    "    x       y=x*x-2", '$'
title2   DB    " -------   --------", '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\dispchr.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                 ;�B�I���|��l��
       CALL  heading         ;�C�L���Y
       MOV   CX, 11          ;�C�L15�C�����
loop2:
       CALL  yval            ;y=x*x-c
       CALL  prnline         ;�L�X�@�C
       CALL  xval            ;x=x+deltax
       LOOP  loop2
;
       MOV   AX, 4c00H
       INT   21H             ;��^�@�~�t��
xval:
       FLD   DWORD [x]       ;TOS=x
       FADD  DWORD [deltax]  ;TOS=x+deltax
       FSTP  DWORD [x]       ;x=x+deltax
       RET
yval:
       FLD   DWORD [x]       ;TOS=x
       FMUL  DWORD [x]       ;TOS=x*x
       FSUB  DWORD [c]       ;TOS=x*x-c
       FSTP  DWORD [y]       ;y=TOS=x*x-c
       RET
heading:
       dispstr  title           ;�C�L���Y
       newline
       dispstr  title2          ;�C�L���Y
       newline
       RET
prnline:
       dispf   x, 4          ;�C�Lx,�|��p��
       dispstr space         ;�ť�
       dispf   y, 4          ;�C�Lx,�|��p��
       newline               ;���C
       RET
