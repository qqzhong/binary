; ****************** ubcdadd1.asm ***************
        ORG    0100H
        JMP    start
len     DW     4
a       DB     0, 9, 9, 9
;
%include "..\mymacro\dispubcd.mac"
%include "..\mymacro\ubcdadd1.mac"
;
start:
      ubcdadd1 a, len       ;BCD�ܼ�a�[�@
      dispubcd a, len       ;���ASCII�Ʀr
      MOV      AX, 4c00H
      INT      21H
