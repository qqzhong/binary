; ******************* starstr.asm ****************
        ORG   0100H
        JMP   start
starstr TIMES 36 DB '*'
        DB    '$'
start:
        MOV   DX, starstr     ;DX=�r��starstr��}
        MOV   AH, 09H         ;�]�w��ܦr��\��
        INT   21H             ;���starstr�r��
        MOV   AX, 4c00H
        INT   21H
