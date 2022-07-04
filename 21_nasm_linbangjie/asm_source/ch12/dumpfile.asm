; ************************ dumpfile.asm *******************
         ORG   0100H
         JMP   start
char     DB    ' '
count    DW    0
byteread DW    0
RW       EQU   02H
filename TIMES 36 DB ' '
handle   DW    0
space    DB    ' ', '$'
msg      DB    'please keyin file name : ', '$'
;
%include "..\mymacro\readzstr.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\showbyte.mac"
;
start:
        dispstr  msg              ;���msg�H��
        readzstr filename         ;�q��L��J�ɦWASCIIZ�r��
        newline                   ;���C
;
        MOV   AL, RW              ;�}��Ū�g��
        MOV   DX, filename        ;��J���ɦW
        MOV   AH, 3dH             ;�}���ɮץ\��
        INT   21H                 ;�}���ɮ�
        MOV   [handle], AX        ;�Ǧ^�ɮץN��
;
readbyte:
        MOV   BX, [handle]        ;�qhandle��Ū�J�@�Ӧr��
        MOV   CX, 1               ;�@�Ӧr��
        MOV   DX, char            ;�r���s���}
        MOV   AH, 3fH             ;�qhandle��Ū�J�\��
        INT   21H                 ;�qhandle��Ū�J
        MOV   [byteread], AX      ;�r���Ӽ�
        CMP   WORD [byteread], 0  ;�ɧ���?
        JE    endjob              ;�O
;
        showbyte char             ;�H16�i�����Ū�J�r��
        dispstr  space            ;�ť�
        INC      WORD [count]     ;count��=count��+1
        MOV      AX, WORD [count] ;AX=count��
        MOV      BL, 16           ;BL=16
        DIV      BL               ;AX/16
        CMP      AH, 0            ;�l��0?
        JNE      next             ;�_
        newline                   ;���C
next:
        JMP   readbyte            ;�~��Ū�U�@�Ӧr��
endjob:
        MOV   BX, [handle]        ;������J��
        MOV   AH, 3eH
        INT   21H
;
        MOV   AX, 4c00H
        INT   21H
