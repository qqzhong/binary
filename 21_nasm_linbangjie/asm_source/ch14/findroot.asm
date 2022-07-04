; ***************** findroot.asm ******************
;
         ORG   0100H
         JMP   start
x1       DD    1.0             ;�]�wx1��Ȭ�1.0
x        DD    1.0             ;x=x1
deltax   DD    0.001
y1       DD    0.0
y        DD    0.0
c        DD    2.0
work     DD    0.0
space    DB    '     ', '$'
title    DB    "    x        y=x*x-2", '$'
title2   DB    "-------     --------", '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\dispchr.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                   ;�B�I���|��l��
       CALL    yval            ;y=x*x-c
       FLD     DWORD [y]
       FSTP    DWORD [y1]      ;y1=y=x*x-c
;
       MOV     CX, 30000       ;����CX�ӭ�
loop2:
       CALL    xval            ;x=x+deltax
       CALL    yval            ;y=x*x-c
       FLD     DWORD [y1]      ;TOS=y
       FMUL    DWORD [y]       ;TOS=y*y1
       FTST                    ;TOS�P0���
       FSTSW   AX              ;AX=���A�r��
       TEST    AH, 01H         ;�t��?
       JNZ     negative        ;�O
       FLD     DWORD [x]
       FSTP    DWORD [x1]      ;x1=x
       FLD     DWORD [y]
       FSTP    DWORD [y1]      ;y1=y
       FSTP    DWORD [work]
       LOOP    loop2
negative:
       CALL    result
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
result:
       dispstr  title           ;�C�L���Y
       newline
       dispstr  title2          ;�C�L���Y
       newline
       dispf    x1, 3           ;�C�Lx,�T��p��
       dispstr  space           ;�ť�
       dispf    y1, 4           ;�C�Lx,�|��p��
       newline                  ;���C
       dispf    x, 3            ;�C�Lx,�T��p��
       dispstr  space           ;�ť�
       dispf    y, 4            ;�C�Lx,�|��p��
       newline                  ;���C
       RET
