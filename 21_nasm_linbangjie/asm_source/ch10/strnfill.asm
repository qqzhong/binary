; ******************* strnfill.asm *******************
        ORG   0100H
        JMP   start
n       DW    5
str2    DB    'Good Night!', '$'
;
%include "..\mymacro\strnfill.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
      dispstr  str2                   ;��ܦr��str2
      newline                         ;���C
      strnfill str2+5, '$', n, '*'    ;��Jn�ӬP��
      dispstr  str2                   ;��ܦr��str2
;
      MOV      AX, 4c00H
      INT      21H
