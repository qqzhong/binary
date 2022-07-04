; ******************** testbyte.asm *******************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a digit : ', '$'
char    DB    ' '
flag    DW    0
msgflag DB    'flag register : ', '$'
msgodd  DB    'you keyin an odd number!', '$'
msgeven DB    'you keyin an even number!', '$'
;
%include "..\mymacro\readchr.mac"
%include "..\mymacro\disp8bit.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
      dispstr  msg                ;���msg�H��
      readchr  char               ;�q��L��J�@��Ʀr
      newline                     ;���C
      TEST     BYTE [char], 01H   ;���լO�_�_��
      PUSHF
      POP      WORD [flag]        ;flag=�X�мȦs����
      dispstr  msgflag            ;���msgflag�H��
      disp8bit flag               ;��ܧC8�줸�X��
      newline                     ;���C
;
      PUSH     WORD [flag]
      POPF                        ;�X�мȦs����=flag��
      JNZ      oddNum             ;�O�_��
      JZ       evenNum            ;�O����
oddNum:
      dispstr  msgodd             ;��ܩ_�ƫH��
      JMP      next
evenNum:
      dispstr  msgeven            ;��ܰ��ƫH��
next:
        MOV      AX, 4c00H
        INT      21H
