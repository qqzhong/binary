; ********************** ubcdsub.asm ********************
        ORG    0100H
        JMP    start
len     DW     4
a       DB     0, 5, 2, 1
b       DB     0, 4, 8, 4
;
%include "../mymacro/dispubcd.mac"
;
start:
      MOV     AL, BYTE [a+3]    ;�̧C�줸�լ۴�
      SUB     AL, BYTE [b+3]    ;�G�i��۴�
      AAS                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+3], AL    ;�s�^�۴�G
;
      MOV     AL, BYTE [a+2]    ;�C�줸�լ۴�
      SBB     AL, BYTE [b+2]    ;�aCF�X�ЭȤ��G�i��۴�
      AAS                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+2], AL    ;�s�^�ۥ[���G
;
      MOV     AL, BYTE [a+1]    ;�̰��줸�լ۴�
      SBB     AL, BYTE [b+1]    ;�aCF�X�ЭȤ��G�i��۴�
      AAS                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+1], AL    ;�s�^�۴�G
;
      dispubcd a, len
      MOV      AX, 4c00H
      INT      21H
