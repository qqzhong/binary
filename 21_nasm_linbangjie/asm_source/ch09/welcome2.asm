; ***************** welcome2.asm ****************
        ORG   0100H
        CALL  welcome           ;�I�swelcome�{��
        MOV   DX, welcome.msg   ;�ϰ��ܼ�.msg��}
        MOV   AH, 09H           ;�]�w��ܦr��\��
        INT   21H               ;���.msg�r��
        MOV   AX, 4c00H
        INT   21H
;------------------------------------------------
welcome:                      ;welcome�{��
        JMP   .begin
.msg    DB    'Welcome!!', 13, 10, '$'
.begin:
        PUSHA                 ;�O�s�Ҧ��Ȧs����
        MOV   DX, .msg        ;DX=.msg��}
        MOV   AH, 09H         ;�]�w��ܦr��\��
        INT   21H             ;���.msg�r��
        POPA                  ;��_�Ҧ��Ȧs����
        RET
