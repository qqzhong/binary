; **************** hi.asm **************
     ORG   0100H
     CALL  hi        ;�I�shi�{��
     CALL  hi        ;�I�shi�{��
     MOV   AX, 4c00H
     INT   21H
hi:                  ;hi�{��
     PUSHA           ;�O�s�Ҧ��Ȧs����
     MOV   DL, 'H'   ;DL='H'
     MOV   AH, 02H   ;�]�w��ܦr���\��
     INT   21H       ;���DL���t�r��
     MOV   DL, 'i'   ;DL='i'
     MOV   AH, 02H   ;�]�w��ܦr���\��
     INT   21H       ;���DL���t�r��
     POPA            ;��_�Ҧ��Ȧs����
     RET
