; ************* long.asm **************
         ORG  0100H
         JMP  start
a        DQ   17.5
;
%include  "..\mymacro\showbyte.mac"
;
start:
         showbyte a+7      ;�̰��줸��
         showbyte a+6
         showbyte a+5
         showbyte a+4
         showbyte a+3
         showbyte a+2
         showbyte a+1
         showbyte a        ;�̧C�줸��
;
         MOV      AX, 4c00H
         INT      21H       ;��^�@�~�t��
