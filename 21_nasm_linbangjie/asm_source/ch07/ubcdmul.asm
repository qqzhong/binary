; ********************** ubcdmul.asm ********************
        ORG   0100H
        JMP   start
len     DW    3
a       DB    0, 7, 8
b       DB    2
c       TIMES 80 DB 0
;
%include "..\mymacro\dispubcd.mac"
;
start:
        MOV     CX, WORD [len]    ;�Q���Ʀ줸�ռ�
        MOV     DL, BYTE [b]      ;����
        MOV     DI, WORD [len]    ;���n�̧C�줸�կ��ޭ�
        DEC     DI
        MOV     BYTE [c+DI], 00H  ;���n�̧C�줸��0��
        MOV     SI, WORD [len]
        DEC     SI                ;�Q���Ƴ̧C�줸�կ��ޭ�
begin:
        MOV     AL, [a+SI]      ;�Q���Ʋ�SI�줸��
        DEC     SI              ;�Q���ƤU�@�Ӧ줸�կ��ޭ�
        MUL     DL              ;�ۭ�
        AAM                     ;���k�վ㬰BCD�Ʀr
        ADD     AL, [c+DI]      ;�[�W�W�����i��
        AAA                     ;�[�k�վ㬰BCD�Ʀr
        MOV     [c+DI], AL      ;���G�s�J���n��DI�줸��
        DEC     DI              ;���n�U�@�Ӧ줸�կ��ޭ�
        MOV     [c+DI], AH      ;�i��s�J��DI�줸��
        LOOP    begin           ;�~��
;
        dispubcd c, len         ;��ܭ��n,len���
        MOV      AX, 4c00H
        INT      21H
