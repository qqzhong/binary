; *********************** xlatb.asm **********************
        ORG   0100H
        JMP   start
htab    DB    '0123456789ABCDEF'    ;�Q���i��Ʀr��
num     DB    12
char    DB    ' '
;
%include "..\mymacro\dispchr.mac"
;
start:
        MOV      BX, htab           ;BX=htab������}
        MOV      AL, BYTE [num]     ;AL=���ޭ�
        XLATB                       ;AL=�ഫ��htab�����r��
        MOV      BYTE [char], AL    ;AL�h����char
        dispchr  char               ;�Nchar��X
;
        MOV      AX, 4c00H
        INT      21H
