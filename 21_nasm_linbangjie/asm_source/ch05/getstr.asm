; ********************* getstr.asm *******************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a string : ', '$'
crlf    DB    13, 10, '$'
buf     DB    80
count   DB    0
s       TIMES 81 DB ' '
start:  MOV   DX, msg             ;���msg�r��
        MOV   AH, 09H
        INT   21H
        MOV   DX, buf             ;��J�@�Ӧr���buf
        MOV   AH, 0aH
        INT   21H
        MOV   BH, 0               ;�Ns��0dH�令'$'
        MOV   BL, [count]
        MOV   BYTE [BX+s], '$'
        MOV   DX, crlf            ;���C
        MOV   AH, 09H
        INT   21H
        MOV   DX, s               ;���s
        MOV   AH, 09H
        INT   21H
        MOV   AX, 4c00H
        INT   21H
