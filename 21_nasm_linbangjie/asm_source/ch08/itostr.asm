; ******************* itostr.asm *****************
        ORG   0100H
        JMP   start
a       DW    123
b       DW    -123
stra    DB    '        '
strb    DB    '        '
crlf    DB    13, 10, '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\itostr.mac"
;
start:
      itostr  a, stra, '$'  ;�Na�ƭ��ഫ��stra�r��
      dispstr stra          ;���stra�r��
      dispstr crlf          ;���C
      itostr  b, strb, '$'  ;�Nb�ƭ��ഫ��strb�r��
      dispstr strb          ;���strb�r��
      MOV     AX, 4c00H
      INT     21H
