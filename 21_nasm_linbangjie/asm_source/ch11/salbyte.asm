; ********************** salbyte.asm *******************
        ORG   0100H
        JMP   start
a       DB    11010101B
flag    DW    0
count   DW    8
msga    DB    '      a =', '$'
msg     DB    'SAL a,1 =', '$'
msgflag DB    '  flag reg =', '$'
;
%include "..\mymacro\disp8bit.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\dispstr.mac"
;
start:
        dispstr  msga             ;���msga�H��
        disp8bit a                ;���a���U�줸��
        newline                   ;���C
;
        MOV      CX, WORD [count] ;CX=count����(8)
loop2:
        SAL      BYTE [a], 1      ;a��N�����@�줸
        PUSHF
        POP      WORD [flag]
        dispstr  msg              ;���msg�H��
        disp8bit a                ;���a���U�줸��
        dispstr  msgflag          ;���msgflag�H��
        disp8bit flag             ;���flag���U�줸��
        newline                   ;���C
        DEC      CX
        JZ       endjob
        JMP      loop2            ;�~��
endjob:
        MOV      AX, 4c00H
        INT      21H
