; ***************** putchar.asm ****************
        ORG   0100H
        MOV   DL, 'A'    ;���'A'�r��
        MOV   AH, 02H
        INT   21H
        MOV   DL, 13     ;���CarriageReturn�r��
        MOV   AH, 02H
        INT   21H
        MOV   DL, 10     ;���LineFeed�r��
        MOV   AH, 02H
        INT   21H
        MOV   DL, 'B'    ;���'B'�r��
        MOV   AH, 02H
        INT   21H
        MOV   DL, 7      ;���Beep�r��
        MOV   AH, 02H
        INT   21H
        MOV   AX, 4c00H  ;End Process Function
        INT   21H 
