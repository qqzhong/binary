; ********************** add2dw.asm *******************
        ORG    0100H
        JMP    start
a       DB     7
f       DD     123456789
g       DD     0
msg     DB     'g=a+f= '
gstr    DB     '         ', 13, 10, '$'
;
%include "../mymacro/ltostr.mac"
;
start:
        MOVSX  EAX, BYTE [a]
;       MOV    AL, [a]       ;AL=a
;       CBW                  ;�NAL���줸�X�i�ܾ��AH
;       CWDE                 ;�NAX���줸�X�i�ܾ��EAX
        ADD    EAX, [f]      ;EAX=a+f
        MOV    [g], EAX      ;g=a+f
        ltostr g, gstr, '$'  ;�Ng���ন�Q�i��Ʀr
        MOV    DX, msg       ;���msg�r��(���te��)
        MOV    AH, 09H
        INT    21H
        MOV    AX, 4c00H
        INT    21H
