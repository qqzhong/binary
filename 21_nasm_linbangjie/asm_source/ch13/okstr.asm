; ************************ okstr.asm *********************
      ORG   0100H
      JMP   start
okstr DB    'O', 'K', '$'
start:
      MOV   DL, BYTE [okstr]    ;okstr��������}�����t��
      MOV   AH, 02H             ;���DL���t�r��
      INT   21H
      MOV   DL, BYTE [okstr+1]  ;okstr+1��������}�����t��
      MOV   AH, 02H             ;���DL���t�r��
      INT   21H
      MOV   DL, BYTE [okstr+2]  ;okstr+2��������}�����t��
      MOV   AH, 02H             ;���DL���t�r��
      INT   21H
      MOV   AX, 4c00H
      INT   21H
