; *********** dispi.asm ************
        ORG   0100H
        JMP   start
a       DW    123
b       DW    -123
;
%include "..\mymacro\dispi.mac"
%include "..\mymacro\newline.mac"
;
start:
      dispi  a          ;���a�ƭ�
      newline           ;���C
      dispi  b          ;���b�ƭ�
      MOV    AX, 4c00H
      INT    21H
