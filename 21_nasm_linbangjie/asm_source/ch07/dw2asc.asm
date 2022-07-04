; *********************** dw2asc.asm *******************
        ORG    0100H
        JMP    start
len     DW     10
a       TIMES  10 DB 0
b       DD     0FFFFFFFFH
;
%include "..\mymacro\ubcdadd1.mac"
%include "..\mymacro\ubcdmul2.mac"
%include "..\mymacro\dispubcd.mac"
;
start:
      MOV      CX, 32         ;CX=���r�զ@32�Ӧ줸
loop2:
      ubcdmul2 a, len         ;BCD�ܼ�a�@len�Ӧ줸��*2
      SHL      DWORD [b], 1   ;b�����@�Ӧ줸
      JNC      next           ;�S��CF
      ubcdadd1 a, len         ;a�[�WCF��1��
next:
      DEC      CX             ;CX=CX-1
      JCXZ     next2          ;�YCX=0�h����next2
      JMP      loop2          ;�~��j��
next2:
      dispubcd a, len         ;���BCD��a�Ʀr
      MOV      AX, 4c00H
      INT      21H
