; ******************** sum.asm *********************
        ORG   0100H
        JMP   start
table   DW    1,3,5,7,9,11,13,15,17,19
sum     DW    0
msg     DB    'sum up all elements in table = '
sumdec  DB    '     ', 13, 10, '$'
;
%include "../mymacro/itostr.mac"
;
start:
        MOV    SI, 0            ;SI=0
        MOV    AX, 0            ;AX=0
        MOV    CX, 10           ;CX=10
label:
        ADD    AX, [SI+table]   ;AX=AX+(table��SI��)
        ADD    SI, 2            ;SI=SI+2
        LOOP   label            ;�~��j��
        MOV    [sum], AX        ;sum=AX
;
        itostr sum, sumdec, '$' ;sum�ন�r��
        MOV    DX, msg          ;���msg
        MOV    AH, 09H
        INT    21H
        MOV    AX, 4c00H
        INT    21H
