; ****************** ubcddiv.asm ***********************
        ORG   0100H
        JMP   start
len     DW    2
a       DB    7, 8
b       DB    2
c       TIMES 80 DB 0
r       DB    0
;
%include "..\mymacro\dispubcd.mac"
;
start:
        MOV     CX, [len]   ;�Q���Ʀ줸�ռ�
        MOV     DL, [b]     ;����
        MOV     DI, c       ;�ӳ̰��줸�զ�}
        MOV     SI, a       ;�Q���Ƴ̰��줸�զ�}
        XOR     AH, AH      ;AH=0
begin:
        MOV     AL, [SI]    ;AL=�Q���Ʋ�SI�줸��
        INC     SI          ;�Q���ƤU�@�Ӧ줸��
        AAD                 ;���k�վ�
        DIV     DL          ;�۰�
        MOV     [DI], AL    ;�s�J�ӼƲ�DI�줸��
        INC     DI          ;�ӼƤU�@�Ӧ줸��
        LOOP    begin       ;�~��
;
        MOV     [r], AL     ;�l�Ʀs�Jr�ܼ�
;
        dispubcd c, len     ;��ܰӼ�,len���
        MOV      AX, 4c00H
        INT      21H
