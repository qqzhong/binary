; **************** define3.asm *****************
        ORG      0100H
        JMP      start
%define sum(a,b) a+b           ;�w�q��C����sum
start:  MOV      DL, sum(64,1) ;�N64+1�s�JDL
        MOV      AH, 02H       ;�]�w��ܦr���\��
        INT      21H           ;��ܦs��DL���r��
        MOV      AX, 4c00H
        INT      21H
