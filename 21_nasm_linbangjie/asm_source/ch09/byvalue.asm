; ********************* byvalue.asm ******************
        ORG   0100H
        MOV   AL, 'B'       ;�C�L�@��'B'�r��
        CALL  Printchr
        MOV   AL, 20H       ;�C�L�@�Ӫťզr��
        CALL  Printchr
        MOV   AL, 'y'       ;�C�L�@��'y'�r��
        CALL  Printchr
        MOV   AX, 4c00H
        INT   21H
;-----------------------------------------------------
Printchr:
        PUSHA               ;�x�s��ӼȦs�����
        MOV   DL, AL        ;DL=ASCII�r����
        MOV   AH, 02H       ;�]�w��ܦr���\��
        INT   21H           ;��ܦr��
        POPA                ;��_��ӼȦs�����
        RET
