; ************************ sum.asm *********************
        ORG   0100H
        JMP   start
count   DW    8
ary     DW    18, 25, 13, 56, 44, 78, 99, 66
msg     DB    'sum of 8 numbers = ', '$'
sum     DW    0
;
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
;
start:
        MOV     AX, 0               ;AX=�ֿn�����
        MOV     SI, 0               ;SI=�}�C�������ު��
        MOV     CX, [count]         ;CX=�}�C�����Ӽ�
loop2:
        ADD     AX, WORD [ary+SI]   ;AX=AX+��SI������
        ADD     SI, 2               ;�U�@�Ӥ�������
        LOOP    loop2               ;�~��
        MOV     WORD [sum], AX      ;sum���`�M
        dispstr msg                 ;���msg�H��
        dispi   sum                 ;����`�M
        MOV     AX, 4c00H
        INT     21H
