; ************************ hex.asm ***********************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a character : ', '$'
ch2     DB    ' '
msghex  DB    13, 10, 'hex number = ', '$'
;
start:  MOV   DX, msg               ;���msg�r��
        MOV   AH, 09H
        INT   21H
        MOV   AH, 01H               ;�q��L��J�@�r����AL
        INT   21H
        MOV   [ch2], AL             ;�NAL�r��������ch2�ܼ�
;
        MOV   DX, msghex            ;���msghex�r��
        MOV   AH, 09H
        INT   21H
;
        MOV   DL, [ch2]             ;���ch2����(16�i���)
        MOV   CL, 4
        SHR   DL, CL
        CMP   DL, 10
        JL    high
        ADD   DL, 7
high:   ADD   DL, 30H
        MOV   AH, 02H
        INT   21H
;
        MOV   DL, [ch2]             ;���ch2�C��(16�i���)
        AND   DL, 0fH
        CMP   DL, 10
        JL    low
        ADD   DL, 7
low:    ADD   DL, 30H
        MOV   AH, 02H
        INT   21H
;
        MOV   AX, 4c00H
        INT   21H
