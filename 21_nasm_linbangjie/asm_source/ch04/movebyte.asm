; *********************** movebyte.asm ***********************
       ORG   0100H
       JMP   start
nasm   DB    'N', 'A', 'S', 'M'
start: MOV   DL, [nasm]           ;�h��nasm��}���t('N')��DL
       MOV   AH, 02H              ;���DL���t�\��
       INT   21H                  ;���DL���t'N'
;
       MOV   DL, [nasm+1]         ;�h��nasm+1��}���t('A')��DL
       MOV   AH, 02H              ;���DL���t�\��
       INT   21H                  ;���DL���t'A'
;
       MOV   DL, [nasm+2]         ;�h��nasm+2��}���t('S')��DL
       MOV   AH, 02H              ;���DL���t�\��
       INT   21H                  ;���DL���t'S'
;
       MOV   DL, [nasm+3]         ;�h��nasm+3��}���t('M')��DL
       MOV   AH, 02H              ;���DL���t�\��
       INT   21H                  ;���DL���t'M'
;
       MOV   AX, 4c00H            ;�{�������\��
       INT   21H                  ;�{������
