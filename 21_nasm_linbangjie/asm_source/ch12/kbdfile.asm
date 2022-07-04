; *********************** kbdfile.asm ********************
          ORG   0100H
          JMP   start
KEYBOARD  EQU   0000H
buffer    TIMES 80 DB ' '
lenbuf    EQU   $-buffer
byteread  DW    0
filename  DB    "kbdfile.txt", 00H
handle    DW    0
msg       DB    'please keyin a string : ', '$'
errmsg    DB    'keyin error!!', '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        MOV     CX, 0020H           ;Archive��
        MOV     DX, filename        ;�ɮ׸��|
        MOV     AH, 3cH             ;�إߤ@���ɮץN���\��
        INT     21H                 ;�إߤ@���ɮץN��
        MOV     [handle], AX        ;�Ǧ^�ɮץN��handle
keyin:
        dispstr msg                 ;���msg��J�H��
        MOV     BX, KEYBOARD        ;��L�ɮץN��KEYBOARD
        MOV     CX, lenbuf          ;�w�ľ�����
        MOV     DX, buffer          ;�w�ľ���}
        MOV     AH, 3fH             ;��LŪ�J�\��
        INT     21H                 ;��LŪ�J
        JC      kbdErr              ;���~��
        MOV     [byteread], AX      ;���Ū�J����
        CMP     WORD [byteread], 0  ;�ɧ���?CtrlZ
        JE      endjob              ;�O
        MOV     BX, [handle]        ;�ɮץN��
        MOV     CX, [byteread]      ;��ƪ���
        MOV     DX, buffer          ;�w�ľ���}
        MOV     AH, 40H             ;�g�J�ɮץ\��
        INT     21H                 ;�g�J�ɮ�
        JMP     keyin               ;�~��q��L��J
kbdErr:
        dispstr errmsg              ;�����L���~�H��
endjob:
        MOV     BX, [handle]        ;�ɮץN��
        MOV     AH, 3eH             ;�����ɮץ\��
        INT     21H                 ;�����ɮ�
;
        MOV   AX, 4c00H
        INT   21H
