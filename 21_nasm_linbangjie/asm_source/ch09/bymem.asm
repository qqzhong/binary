; ********************** bymem.asm *********************
        ORG   0100H
        JMP   start
ary     DW    1, 3, 5, 7, 9     ;ary�}�C�t���Ӥ���
aryptr  DW    ary               ;ary�}�C��}
count   DW    5                 ;ary�}�C�����Ӽ�
sum     DW    0                 ;ary�}�C�����`�M
;
%include "..\mymacro\dispui.mac"
;
start:
        MOV     BX, aryptr      ;BX=�Ѽư_�l��}
        CALL    usemem          ;�I�susemem�{��
        dispui  sum             ;��ܰ}�Cary�U�����`�M
        MOV     AX, 4c00H
        INT     21H
usemem:
        PUSHA                   ;�x�s��ӼȦs�����
        MOV     BP, [BX]        ;�Nary�}�C��}�s�JBP
        MOV     CX, [BX+2]      ;CX=ary�}�C�����Ӽ�
        MOV     AX, 0           ;AX=0
        MOV     SI, 0           ;SI=0
.loop2:
        ADD     AX, [BP+SI]     ;ary�}�C��SI�����Ȳֿn��AX
        INC     SI              ;SI=SI+1
        INC     SI              ;SI=SI+1,���ަܤU�@����
        LOOP    .loop2          ;�~��
        MOV     WORD [BX+4], AX ;sum=AX
        POPA                    ;��_��ӼȦs�����
        RET
