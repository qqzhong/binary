; ********************* wordstr.asm *********************
        ORG   0100H
        JMP   start
wordstr DW    'Good Morning!', '$'
char    DW    '  ', '$'
start:
        MOV   DX, wordstr          ;DX=�r��wordstr��}
        MOV   AH, 09H              ;�]�w��ܦr��\��
        INT   21H                  ;���wordstr�r��
;
        MOV   DX, wordstr+5        ;DX=�r��wordstr+5��}
        MOV   AH, 09H              ;�]�w��ܦr��\��
        INT   21H                  ;���wordstr+5�r��
;
        MOV   AX, WORD [wordstr+5] ;AX=wordstr+5��}�r��
        MOV   WORD [char], AX      ;char��}���t��AX
        MOV   DX, char             ;DX=�r��char��}
        MOV   AH, 09H              ;�]�w��ܦr��\��
        INT   21H                  ;���char�r��
        MOV   AX, 4c00H
        INT   21H
