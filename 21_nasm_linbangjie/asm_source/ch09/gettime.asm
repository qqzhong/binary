; ******************** gettime.asm *******************
        ORG     0100H
        CALL    Disptime
        MOV     AX, 4c00H
        INT     21H
;-----------------------------------------------------
Printub:
        PUSHA               ;�x�s��ӼȦs�����
        MOV     AH, 0       ;AH=0
        MOV     BL, 10      ;BL=���Ƭ�10(�Q�i��)
        DIV     BL          ;AX/10
        OR      AX, 3030H   ;�ഫ��ASCII�Ʀr
        PUSH    AX
        MOV     DL, AL      ;�Ӽ�,����
        MOV     AH, 02H     ;���
        INT     21H
        POP     AX
        MOV     DL, AH      ;�l��,�C��
        MOV     AH, 02H     ;���
        INT     21H
        POPA
        RET
;-----------------------------------------------------
Disptime:
        PUSHA               ;�x�s��ӼȦs�����
        MOV   AH, 2cH       ;���o�t�ήɶ�
        INT   21H
        MOV   AL, CH        ;�p��(00-23)
        CALL  Printub       ;��ܤp��
        MOV   DL, ':'       ;��ܫ_��(:)
        MOV   AH, 02H
        INT   21H
        MOV   AL, CL        ;����(00-59)
        CALL  Printub       ;��ܤ���
        MOV   DL, ':'       ;��ܫ_��(:)
        MOV   AH, 02H
        INT   21H
        MOV   AL, DH        ;���(00-59)
        CALL  Printub       ;��ܬ��
        POPA                ;��_��ӼȦs�����
        RET
