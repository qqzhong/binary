; **************** welcome.pro ******************
;
; CALL welcome
;   ��� Welcome!! �H��
;
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
