; *********************** pbcdadd.asm *******************
        ORG    0100H
        JMP    start
a       DB     00H, 56H, 43H, 21H
b       DB     00H, 45H, 68H, 54H
;
%include "../mymacro/showbyte.mac"
;
start:
      MOV     AL, BYTE [a+3]    ;�̧C�줸�լۥ[
      ADD     AL, BYTE [b+3]    ;�G�i��ۥ[
      DAA                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+3], AL    ;�s�^�ۥ[���G
;
      MOV     AL, BYTE [a+2]    ;�C�줸�լۥ[
      ADC     AL, BYTE [b+2]    ;�aCF�X�ЭȤ��G�i��ۥ[
      DAA                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+2], AL    ;�s�^�ۥ[���G
;
      MOV     AL, BYTE [a+1]    ;�̰��줸�լۥ[
      ADC     AL, BYTE [b+1]    ;�aCF�X�ЭȤ��G�i��ۥ[
      DAA                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+1], AL    ;�s�^�ۥ[���G
;
      JC      set1              ;�̰��줸�լۥ[�ᦳ�i��
      JNC     set0              ;�̰��줸�լۥ[��S���i��
set1:
      MOV     BYTE [a], 1
      JMP     next
set0:
      MOV     BYTE [a], 0
next:
      MOV     SI, 0
loop2:
      showbyte a+SI              ;���BCD�Ʀr
      INC      SI
      CMP      SI, 4             ;�@4���
      JNE      loop2
      MOV      AX, 4c00H
      INT      21H
