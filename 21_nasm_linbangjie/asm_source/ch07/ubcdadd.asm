; ********************** ubcdadd.asm ********************
        ORG    0100H
        JMP    start
len     DW     4
a       DB     0, 3, 2, 1
b       DB     0, 4, 8, 5
;
%include "../mymacro/dispubcd.mac"
;
start:
      MOV     AL, BYTE [a+3]    ;�̧C�줸�լۥ[
      ADD     AL, BYTE [b+3]    ;�G�i��ۥ[
      AAA                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+3], AL    ;�s�^�ۥ[���G
;
      MOV     AL, BYTE [a+2]    ;�C�줸�լۥ[
      ADC     AL, BYTE [b+2]    ;�aCF�X�ЭȤ��G�i��ۥ[
      AAA                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+2], AL    ;�s�^�ۥ[���G
;
      MOV     AL, BYTE [a+1]    ;�̰��줸�լۥ[
      ADC     AL, BYTE [b+1]    ;�aCF�X�ЭȤ��G�i��ۥ[
      MOV     AH, 0             ;�u�n�i��
      AAA                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+1], AL    ;�s�^�ۥ[���G
;
      MOV     BYTE [a], AH      ;�̰��줸�եu�s�J�i��
;
      dispubcd a, len
      MOV      AX, 4c00H
      INT      21H
