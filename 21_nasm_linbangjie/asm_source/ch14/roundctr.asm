; ******************** roundctr.asm ***********************
;
          ORG   0100H
          JMP   start
n         DD    17.5
f         DD    0
ctrlword  DW    0    
;
%include "..\mymacro\disp8bit.mac"
%include "..\mymacro\dispul.mac"
%include "..\mymacro\newline.mac"
;
start:
    FINIT                             ;�B�I���|��l��
    FSTCW    WORD [ctrlword]          ;���o����r��(�n�ˤJ)
    disp8bit ctrlword+1               ;��ܰ��줸��
    disp8bit ctrlword                 ;��ܧC�줸��
    newline                           ;���C
    FLD     DWORD [n]                 ;TOS=n
    FISTP   DWORD [f]                 ;f=TOS
    dispul  f                         ;���f��
    newline                           ;���C
;
    AND      WORD [ctrlword], 03ffH   ;�NRC��PC�줸�M��
    OR       WORD [ctrlword], 0400H   ;�]RC=01���ˤJ
    FLDCW    WORD [ctrlword]          ;�]�w����r��
    disp8bit ctrlword+1               ;��ܰ��줸��
    disp8bit ctrlword                 ;��ܧC�줸��
    newline                           ;���C
    FLD     DWORD [n]                 ;TOS=n
    FISTP   DWORD [f]                 ;f=TOS
    dispul  f                         ;���f��
;
    MOV     AX, 4c00H
    INT     21H
