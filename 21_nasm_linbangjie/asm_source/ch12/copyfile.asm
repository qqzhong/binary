; *********************** copyfile.asm *******************
          ORG   0100H
          JMP   start
buffer    TIMES 80 DB ' '
lenbuf    EQU   $-buffer
byteread  DW    0
RW EQU    02H
infile    DB    "kbdfile.txt", 00H
inhand    DW    0
outfile   DB    "diskfile.txt", 00H
outhand   DW    0
start:
          MOV   AL, RW              ;�}��Ū�g��
          MOV   DX, infile          ;��J���ɦW
          MOV   AH, 3dH             ;�}���ɮץ\��
          INT   21H                 ;�}���ɮ�
          MOV   [inhand], AX        ;�Ǧ^�ɮץN��
;
          MOV   CX, 0020H           ;Archive��
          MOV   DX, outfile         ;�ɮ׸��|
          MOV   AH, 3cH             ;�إߤ@���ɮץN���\��
          INT   21H                 ;�إߤ@���ɮץN��
          MOV   [outhand], AX       ;�Ǧ^�ɮץN��
readline:
          MOV   BX, [inhand]        ;�qinhand��Ū�J
          MOV   CX, lenbuf          ;lenbuf�Ӧr��
          MOV   DX, buffer          ;�w�ľ���}
          MOV   AH, 3fH             ;�qinhand��Ū�J�\��
          INT   21H                 ;�qhandle��Ū�J
          MOV   [byteread], AX      ;Ū�J�r���Ӽ�
          CMP   WORD [byteread], 0  ;�ɧ���?
          JE    endjob              ;�O
;
          MOV   BX, [outhand]       ;�_,�g�Jouthand��X��
          MOV   CX, [byteread]      ;�r���Ӽ�
          MOV   DX, buffer          ;�w�ľ���}
          MOV   AH, 40H             ;�g�Jouthand��X�ɥ\��
          INT   21H                 ;�g�Jouthand��X��
;
          JMP   readline            ;Ū���U�@�����
endjob:
          MOV   BX, [inhand]       ;������J��
          MOV   AH, 3eH
          INT   21H
          MOV   BX, [outhand]       ;������X��
          MOV   AH, 3eH
          INT   21H
;
          MOV   AX, 4c00H
          INT   21H
