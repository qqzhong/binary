; ************************* hextab.asm *******************
          ORG   0100H
          JMP   start
hextab    DB    '0123456789ABCDEF'
numbyte   DB    0
msghex    DB    'hexadecimal number = ', '$'
numchar   DB    ' '
msgin     DB    'keyin a number (0-15) : ', '$'
numstr    DB    '   '
;
%include "..\mymacro\readstr.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\strtob.mac"
%include "..\mymacro\dispchr.mac"
;
start:
        dispstr msgin                 ;���msgin�H��
        readstr numstr                ;��J�Ѹ�(0-15�Ʀr)
        newline                       ;���C
        strtob  numstr, '$', numbyte  ;�r���ഫ���ƭ�
;
        MOV BX, hextab                ;BX=16�i��Ʀr���}
        MOV AL, BYTE [numbyte]        ;AL=�Q�i��ƭ�
        AND AL, 00001111B             ;�u���k��|�줸
        XLATB                         ;AL=����16�i��Ʀr
        MOV BYTE [numchar], AL        ;�s�Jnumchar+1��}�B
        dispstr msghex                ;���msghex�H��
        dispchr numchar               ;��ܹ���16�i��Ʀr
        MOV     AX, 4c00H
        INT     21H
