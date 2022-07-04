; *********************** pbcdsub.asm *******************
        ORG    0100H
        JMP    start
a       DB     00H, 56H, 43H, 21H
b       DB     00H, 45H, 68H, 54H
msg     DB     'BCD error in subtraction!!', 13, 10, '$'
;
%include "../mymacro/showbyte.mac"
%include "../mymacro/dispstr.mac"
;
start:
      MOV     AL, BYTE [a+3]    ;�̧C�줸�լ۴�
      SUB     AL, BYTE [b+3]    ;�G�i��۴�
      DAS                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+3], AL    ;�s�^�۴�G
;
      MOV     AL, BYTE [a+2]    ;�C�줸�լ۴�
      SBB     AL, BYTE [b+2]    ;�aCF�X�ЭȤ��G�i��۴�
      DAS                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+2], AL    ;�s�^�۴�G
;
      MOV     AL, BYTE [a+1]    ;�̰��줸�լ۴�
      SBB     AL, BYTE [b+1]    ;�aCF�X�ЭȤ��G�i��۴�
      DAS                       ;�վ㬰ASCII�Ʀr
      MOV     BYTE [a+1], AL    ;�s�^�۴�G
;
      JC      suberr            ;���~�o��
      JNC     next
suberr:
      dispstr msg               ;��ܿ��~�H��
      JMP     endjob
next:
      MOV     SI, 0
loop2:
      showbyte a+SI              ;���BCD�Ʀr
      INC      SI
      CMP      SI, 4             ;�@4���
      JNE      loop2
endjob:
      MOV      AX, 4c00H
      INT      21H
