; ************************* fbcd.asm *******************
        ORG   0100H
        JMP   start
fnum    DT    123456789123456789.0
fbcd    DT    0.0
msg     DB    '123456789123456789.0 convert to BCD = '
newline DB    13, 10, '$'
ascnum  DB    '                   ', '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\bcdtostr.mac"
;
start:
        FINIT                  ;�B�I���|��l��
        FLD     TWORD [fnum]   ;TOS=���fnum
        FBSTP   TWORD [fbcd]   ;TOS�ন�E��BCD��
;
        dispstr  msg           ;���msg
        bcdtostr fbcd, ascnum  ;�N�E��BCD���নASCII�Ʀr
        dispstr  ascnum        ;���ASCII�Ʀr
;
        MOV     AX, 4c00H
        INT     21H
