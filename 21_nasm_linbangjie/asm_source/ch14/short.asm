; ************* short.asm **************
         ORG  0100H
         JMP  start
a        DD   17.5
;
%include  "..\mymacro\showbits.mac"
;
start:
         showbits  a+3   ;�̰��줸��
         showbits  a+2
         showbits  a+1
         showbits  a      ;�̧C�줸��
;
         MOV      AX, 4c00H
         INT      21H
