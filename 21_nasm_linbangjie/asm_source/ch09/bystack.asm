; *********************** bystack.asm ********************
        ORG   0100H
        MOV   AX, 64      ;AX=64
        PUSH  AX          ;�|�J���|���ݷ�usestack��J�Ѽ�
        CALL  usestack    ;�I�susestack�{��
        POP   DX          ;�|�Xusestack���ݸ�ƶ���DX
        MOV   AH, 02H     ;���DL�r��
        INT   21H
        MOV   AX, 4c00H
        INT   21H
usestack:
        MOV   BP, SP      ;BP=SP
        PUSHA             ;�x�s��ӼȦs�����
        INC   WORD [BP+2] ;AX=AX+1
        POPA              ;��_��ӼȦs�����
        RET
