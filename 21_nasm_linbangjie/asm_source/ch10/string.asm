; ********************* string.asm *******************
        ORG   0100H
        JMP   start
string  DB    'Good Morning!', '$'
char    DB    ' ', '$'
start:
        MOV   DX, string          ;DX=�r��string��}
        MOV   AH, 09H             ;�]�w��ܦr��\��
        INT   21H                 ;���string�r��
;
        MOV   DX, string+5        ;DX=�r��string��}
        MOV   AH, 09H             ;�]�w��ܦr��\��
        INT   21H                 ;���string�r��
;
        MOV   AL, BYTE [string+5] ;AL=string+5��}�r��
        MOV   BYTE [char], AL     ;char��}���t��AL
        MOV   DX, char            ;DX=�r��char��}
        MOV   AH, 09H             ;�]�w��ܦr��\��
        INT   21H                 ;���char�r��
        MOV   AX, 4c00H
        INT   21H
