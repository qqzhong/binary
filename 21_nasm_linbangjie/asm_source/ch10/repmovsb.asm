; ********************** repmovsb.asm ********************
        ORG   0100H
        JMP   start
lenpat  DW    4
len     DW    44
strpat  DB    '*--*'
        TIMES 40 DB ' '
        DB    '$'
msgpat  DB    'pattern string : ', '$'
msgfill DB    'after fill pattern string : ', '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
      dispstr  msgpat             ;���msgpat�H��
      newline                     ;���C
      dispstr  strpat             ;��ܼ˪O�r��strpat
      newline                     ;���C
      MOV      CX, [len]          ;CX=�r��strpat����
      SUB      CX, WORD [lenpat]  ;��h�˦�����
      MOV      SI, strpat         ;SI=�ӷ��r��strpat��}
      MOV      DI, strpat         ;DI=�ت��r��strpat��}
      ADD      DI, WORD [lenpat]  ;���L�˦�
      CLD                         ;��V,�q���ܥk
      REP MOVSB                   ;���ƫ����˪O
      dispstr  msgfill            ;���msgfill�H��
      newline                     ;���C
      dispstr  strpat             ;��ܥت��r��strpat
      MOV      AX, 4c00H
      INT      21H
