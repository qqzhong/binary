; ********************** strlen.asm **********************
        ORG   0100H
        JMP   start
len     DW    0
msgstr  DB    'string = ', '$'
string  DB    'Good Morning!', '$'
msg     DB    'length of string = ', '$'
;
%include "..\mymacro\strlen.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\newline.mac"
;
start:
        dispstr  msgstr             ;���msgstr�H��
        dispstr  string             ;���string�r��
        strlen   string, '$', len   ;�p��string���צs�Jlen
        newline                     ;���C
        dispstr  msg                ;���msg�r��
        dispi    len                ;��ܦr�վ�ƭ�
        MOV      AX, 4c00H
        INT      21H
