; ********************** mul2word.asm ****************
        ORG    0100H
        JMP    start
a       DW     1234
b       DW     5678
f       DD     0
msg     DB     'f=a*b= '
fstr    DB     '          ', 13, 10, '$'
;
%include "../mymacro/ltostr.mac"
;
start:  MOV    AX, [a]      ;AX=a
        MUL    WORD [b]     ;DX:AX=a*b
        MOV    [f], AX      ;�N���n�C�r�զs�Jf�C�r��
        MOV    [f+2], DX    ;�N���n���r�զs�Jf���r��
        ltostr f, fstr, '$' ;�Nf���ন�Q�i��Ʀr
        MOV    DX, msg      ;���msg�r��(���tf��)
        MOV    AH, 09H
        INT    21H
        MOV    AX, 4c00H
        INT    21H
