; ********************** strchr.asm **********************
        ORG   0100H
        JMP   start
pos     DW    0
str1    DB    'Good Morning!', '$'
;
%include "..\mymacro\strchr.mac"
%include "..\mymacro\dispi.mac"
;
start:
      strchr  str1, '$', 'M', pos  ;str1����'M'��m�s�Jpos
      dispi   pos                  ;���pos��m(�q0�p��)
;
      MOV     AX, 4c00H
      INT     21H
