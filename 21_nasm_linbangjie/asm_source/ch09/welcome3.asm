; ***************** welcome3.asm *****************
        ORG   0100H
        JMP   start
;
%include "welcome.pro"            ;welcome�{����
;
start:
        CALL  welcome             ;�I�swelcome�{��
        MOV   AX, 4c00H
        INT   21H
