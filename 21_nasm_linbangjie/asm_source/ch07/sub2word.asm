; ******************** sub2word.asm ****************
        ORG    0100H
        JMP    start
b       DB     -5
d       DW     3
e       DW     0
msg     DB     'e=b-d= '
estr    DB     '   ', 13, 10, '$'
;
%include "../mymacro/itostr.mac"
;
start:  MOV    AL, [b]      ;AL=b
        CBW                 ;�NAL���줸�X�i�ܾ��AH
        SUB    AX, [d]      ;AX=b-d
        MOV    [e], AX      ;e=b-d
        itostr e, estr, '$' ;�Ne���ন�Q�i��Ʀr
        MOV    DX, msg      ;���msg�r��(���te��)
        MOV    AH, 09H
        INT    21H
        MOV    AX, 4c00H
        INT    21H
