; *********************** test.asm ***********************
       ORG   0100H
       JMP   start
nasm   DW    3132H, 3334H, "NA", "SM"
%include "..\mymacro\dispchr.mac"
start:
       dispchr   nasm
       dispchr   nasm+1
       dispchr   nasm+2
       dispchr   nasm+3
;
       MOV   DX, [nasm]          ;�h��nasm��}���t('NA')��DX
       MOV   AH, 02H             ;���DL���t�\��
       INT   21H                 ;���DL���t'N'
       XCHG  DH, DL              ;DH�PDL���t�Ȥ���
       MOV   AH, 02H             ;���DL���t�\��
       INT   21H                 ;���DL���t'A'
;
       MOV   DX, [nasm+2]        ;�h��nasm+1��}���t('SM')��DX
       MOV   AH, 02H             ;���DL���t�\��
       INT   21H                 ;���DL���t'S'
       XCHG  DH, DL              ;DH�PDL���t�Ȥ���
       MOV   AH, 02H             ;���DL���t�\��
       INT   21H                 ;���DL���t'M'
;
       MOV   AX, 4c00H           ;�{�������\��
       INT   21H                 ;�{������
