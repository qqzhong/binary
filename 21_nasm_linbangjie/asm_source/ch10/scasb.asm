; ********************** scasb.asm *********************
        ORG   0100H
        JMP   start
len     DW    0
msg2    DB    'destination string = '
str2    DB    'Good Night!', '$'
char    DB    'N'
pos     DW    0
msgnf   DB    'N not found!', '$'
msgf    DB    'find N, at (count from 0) = ', '$'
;
%include "..\mymacro\strlen.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        strlen   str2, '$', len   ;�ت��r��str2����
        dispstr  msg2             ;��ܥت��r��str2
        newline                   ;���C
        MOV      AL, [char]       ;AL=�j�M�r��'N'
        MOV      CX, [len]        ;CX=�ت��r��str2����
        MOV      DI, str2         ;DI=�ت��r��str2��}
        CLD                       ;��V,�q���ܥk
loop2:
        SCASB                     ;���AL����۵���CX��
        PUSHF                     ;�|�J�X�мȦs��
        dispi    pos              ;��ܭ����r����m
        newline                   ;���C
        INC      WORD [pos]       ;��m�W�[�@
        POPF                      ;�|�X�X�мȦs��
        LOOPNE   loop2            ;�Y���۵���CX>0�h�~��
;
        CMP      CX, 0            ;CX�O�_��0
        JE       notfound         ;CX=0,����notfound
found:
        DEC      WORD [pos]       ;��m�ȴ�@,�q0�p��
        dispstr  msgf             ;��ܧ��H��
        dispi    pos              ;���pos�ƭ�
        JMP      next             ;����next
notfound:
        dispstr  msgnf            ;��ܧ䤣��H��
next:
        MOV      AX, 4c00H
        INT      21H
