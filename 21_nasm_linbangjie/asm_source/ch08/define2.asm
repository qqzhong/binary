; *************** define2.asm **************
        ORG    0100H
        JMP    start
%define CHARA  'A'        ;�w�q��C����CHARA
start:  MOV    DL, CHARA  ;�NCHARA�s�JDL
        MOV    AH, 02H    ;�]�w��ܦr���\��
        INT    21H        ;��ܦs��DL���r��
        MOV    AX, 4c00H
        INT    21H
