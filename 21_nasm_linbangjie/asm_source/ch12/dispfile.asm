; *********************** dispfile.asm *******************
         ORG   0100H
         JMP   start
buffer   TIMES 255 DB ' '
lenbuf   EQU   $-buffer
byteread DW    0
RW       EQU   02H
filename DB    "kbdfile.txt", 00H
handle   DW    0
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        MOV   AL, RW                ;�}��Ū�g��
        MOV   DX, filename          ;��J���ɦW
        MOV   AH, 3dH               ;�}���ɮץ\��
        INT   21H                   ;�}���ɮ�
        MOV   [handle], AX          ;�Ǧ^�ɮץN��
;
readline:
        MOV   BX, [handle]          ;�qhandle��Ū�J���
        MOV   CX, lenbuf            ;lenbuf�Ӧr��
        MOV   DX, buffer            ;�w�ľ���}
        MOV   AH, 3fH               ;�qhandle��Ū�J�\��
        INT   21H                   ;�qhandle��Ū�J
        MOV   [byteread], AX        ;Ū�J�r���Ӽ�
        CMP   WORD [byteread], 0    ;�ɧ���?
        JE    endjob                ;�O
;
        MOV   BX, [byteread]        ;BX=Ū�J�r���Ӽ�
        MOV   BYTE [buffer+BX], '$' ;���[�@�Ӧr�굲���Ÿ�
        dispstr buffer              ;���Ū�J���
        newline                     ;���C
;
        JMP   readline              ;Ū�U�@�����
endjob:
        MOV   BX, [handle]         ;������J��
        MOV   AH, 3eH
        INT   21H
;
        MOV   AX, 4c00H
        INT   21H
