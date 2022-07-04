; ************************* qw2asc.asm *******************
        ORG    0100H
        JMP    start
len     DW     18
a       TIMES  18 DB 0
num1    DD     12345678H
num2    DD     9ABCDEF0H
lownum  DD     0
hinum   DD     0
;
%include "..\mymacro\dispubcd.mac"
%include "..\mymacro\ubcdadd1.mac"
%include "..\mymacro\ubcdmul2.mac"
;
start:
      MOV      EAX, DWORD [num1]    ;EAX=num1��
      MUL      DWORD [num2]         ;EDX:EAX=num1��*num2��
      MOV      DWORD [lownum], EAX  ;lownum���n�C���
      MOV      DWORD [hinum], EDX   ;hinum���n�����
;
      MOV      BH, 32             ;BH=32�줸
      MOV      BL, 32             ;BL=32�줸
loop2:
      ubcdmul2 a, len             ;BCD�ܼ�a*2
      SHL      DWORD [hinum], 1   ;hinum�����@�Ӧ줸
      JNC      next2              ;CF?�_,����next2
      ubcdadd1 a, len             ;�O,a�[�WCF
next2:
      DEC      BH                 ;BH=BH-1
      JZ       loop3              ;���Xloop2�i�Jloop3
      JMP      loop2              ;�~��j��
loop3:
      ubcdmul2 a, len             ;BCD�ܼ�a*2
      SHL      DWORD [lownum], 1  ;lownum�����@�Ӧ줸
      JNC      next3              ;CF?�_,����next3
      ubcdadd1 a, len             ;�O,a�[�WCF
next3:
      DEC      BL                 ;BL=BL-1
      JZ       next               ;���Xloop3�i�Jnext
      JMP      loop3              ;�~��j��
next:
      dispubcd a, len             ;���ASCII�Ʀr
      MOV      AX, 4c00H
      INT      21H
