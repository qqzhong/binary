; ************************* min.asm **********************
        ORG   0100H
        JMP   start
count   DW    8
ary     DB    18, 25, 13, 56, 44, 78, 99, 66
msg     DB    'minimum number is = ', '$'
min     DB    0
;
%include "..\mymacro\dispb.mac"
%include "..\mymacro\dispstr.mac"
;
start:
        MOV     AL, BYTE [ary]      ;���]��0�Ӥ����Ȭ��̤p
        MOV     SI, 1               ;SI=�}�C��1�Ӥ�������
        MOV     CX, [count]         ;CX=�}�C�����Ӽ�
        DEC     CX
loop2:
        CMP     AL, BYTE [ary+SI]   ;AL:��SI������
        JL      next                ;AL���p
        XCHG    AL, BYTE [ary+SI]   ;����
next:
        INC     SI                  ;�U�@�Ӥ�������
        LOOP    loop2               ;�~��
        MOV     BYTE [min], AL      ;min���̤p��
        dispstr msg                 ;���msg�H��
        dispb   min                 ;��̤ܳp��
        MOV     AX, 4c00H
        INT     21H
