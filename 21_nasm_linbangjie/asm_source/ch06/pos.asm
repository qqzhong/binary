; ********************* pos.asm ***********************
        ORG   0100H
        JMP   start
table   DW    1,3,5,7,9,11,13,15,17,19
pos     DW    0
msg     DB    'element 11 at position in table = '
posdec  DB    '     ', 13, 10, '$'
;
%include "../mymacro/itostr.mac"
;
start:  MOV     SI, 0           ;SI=0
        MOV     CX, 10          ;CX=10
label:
        MOV     AX, [SI+table]  ;AX=table��SI������
        ADD     SI, 2           ;SI=SI+2
        INC     WORD [pos]      ;pos���t��+1
        CMP     AX, 11          ;AX:11?
        LOOPNE  label           ;���۵���CX>0���~��j��
;
        itostr  pos, posdec, '$'  ;pos���t���ন�r��
        MOV     DX, msg           ;���msg
        MOV     AH, 09H
        INT     21H
        MOV     AX, 4c00H
        INT     21H
