; ******************* add2byte.asm *******************
        ORG    0100H
        JMP    start
a       DB     7
b       DB     -5
c       DB     0
msg     DB     'c=a+b= '
cstr    DB     '   ', 13, 10, '$'
;
%include "../mymacro/btostr.mac"
;
start:
        MOV    AL, [a]      ;AL=a
        ADD    AL, [b]      ;AL=a+b
        MOV    [c], AL      ;c=a+b
        btostr c, cstr, '$' ;�Nc���ন�����Q�i��Ʀr
        MOV    DX, msg      ;���msg�r��(���tc��)
        MOV    AH, 09H
        INT    21H
        MOV    AX, 4c00H
        INT    21H
