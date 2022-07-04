; ******************** control.asm ***********************
;
          ORG   0100H
          JMP   start
f         DD    17.5
n         DD    0
ctrlword  DW    0
msg1      DB    'control word = ', '$'
msg2      DB    '  17.5 after rounded = ', '$'
msg3      DB    '  17.5 not   rounded = ', '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\showbits.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\newline.mac"
;
start:
    FINIT                      ;�B�I���|��l��
    FSTCW     WORD [ctrlword]  ;���o����r��(�n�ˤJ)
    dispstr   msg1
    showbits  ctrlword+1       ;��ܰ��줸��
    showbits  ctrlword         ;��ܧC�줸��
    newline                    ;���C
    FLD       DWORD [f]        ;TOS=f
    FISTP     DWORD [n]        ;n=TOS
    dispstr   msg2
    dispi     n                ;���n�ȡA4�Ӧ줸��
    newline                    ;���C
;
    AND      WORD [ctrlword], 03ffH  ;�NRC�줸�M��
    OR       WORD [ctrlword], 0400H  ;�]RC=01���ˤJ
    FLDCW    WORD [ctrlword]         ;�]�w����r��
    dispstr  msg1
    showbits ctrlword+1       ;��ܰ��줸��
    showbits ctrlword         ;��ܧC�줸��
    newline                   ;���C
    FLD      DWORD [f]        ;TOS=f
    FISTP    DWORD [n]        ;n=TOS
    dispstr  msg3
    dispi    n                ;���n�ȡA4�Ӧ줸��
;
    MOV      AX, 4c00H
    INT      21H              ;��^�@�~�t��
