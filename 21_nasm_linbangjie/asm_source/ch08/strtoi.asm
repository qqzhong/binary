; ********************* strtoi.asm *********************
        ORG   0100H
        JMP   start
num2    DW    9876
str2    DB    '-123', '$'
str1    DB    '123', '$'
crlf    DB    13, 10, '$'
;
%include "..\mymacro\strtoi.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\showbyte.mac"
;
start:
      strtoi   str1, '$', num2   ;�r��str1�নnum2�ƭ�
      showbyte num2+1            ;���num2�����(16�i��)
      showbyte num2              ;���num2�����(16�i��)
      dispstr  crlf              ;���C
      strtoi   str2, '$', num2   ;�r��str2�নnum2�ƭ�
      showbyte num2+1            ;���num2�����(16�i��)
      showbyte num2              ;���num2�����(16�i��)
      MOV      AX, 4c00H
      INT      21H
