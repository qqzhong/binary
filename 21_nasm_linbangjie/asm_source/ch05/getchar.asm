; ******************* getchar.asm **************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a character : ', '$'
msg2    DB    'the character you just keyin = '
char    DB    ' '
crlf    DB    13, 10, '$'
start:  MOV   DX, msg       ;���msg�r��
        MOV   AH, 09H
        INT   21H
        MOV   AH, 01H       ;��J�@�Ӧr����AL
        INT   21H
        MOV   [char], AL    ;�NAL�s�Jchar
        MOV   DX, crlf      ;���C
        MOV   AH, 09H
        INT   21H
        MOV   DX, msg2      ;���msg2�r��
        MOV   AH, 09H
        INT   21H
        MOV   AX, 4c00H
        INT   21H
