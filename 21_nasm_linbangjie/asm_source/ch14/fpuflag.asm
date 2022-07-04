; ********************** fpuflag.asm *******************
          ORG   0100H
          JMP   start
title     DB    '  B C3    ST    C2 C1 C0'
          DB    ' IR    PE UE OE ZE DE IE top',13,10,'$'
newline   DB    13, 10, '$'
space     DB    ' ', '$'
negnum    DD    -1.0
zeronum   DD    0.0
posnum    DD    1.0
fpuFlag   DW    0
;
%include  "..\mymacro\disptos.mac"
%include  "..\mymacro\dispstr.mac"
%include  "disp8bit.mac"
;
start:
          dispstr  title          ;��ܪ��Y
          FINIT                   ;�B�I���|��l��
          FTST                    ;���ݼȦs���ȻP0���
          CALL dispTOS            ;��ܪ��A�r��
          FLD  DWORD [negnum]     ;�|�Jnegnum
          FTST                    ;���ݼȦs���ȻP0���
          CALL dispTOS            ;��ܪ��A�r��
          FLD  DWORD [zeronum]    ;�|�Jzeronum
          FTST                    ;���ݼȦs���ȻP0���
          CALL dispTOS            ;��ܪ��A�r��
          FLD  DWORD [posnum]     ;�|�Jposnum
          FTST                    ;���ݼȦs���ȻP0���
          CALL dispTOS            ;��ܪ��A�r��
          RET
dispTOS:
          FSTSW    WORD [fpuFlag] ;�|�X���A�r��
          disp8bit fpuFlag+1      ;��ܰ�8�줸
          disp8bit fpuFlag        ;��ܧC8�줸
          dispstr  space          ;�Ť@��
          disptos  4              ;�p��4��
          dispstr  newline        ;���C
;
          MOV     AX, 4c00H
          INT     21H
