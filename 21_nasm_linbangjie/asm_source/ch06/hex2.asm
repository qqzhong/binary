; *********************** hex2.asm ********************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a character : ', '$'
ch2     DB    ' '
msghex  DB    13, 10, 'hex number = ', '$'
;
%include "../mymacro/showbyte.mac"
;
start:  MOV      DX, msg         ;���msg�r��
        MOV      AH, 09H
        INT      21H
        MOV      AH, 01H         ;�q��L��J�@�r����AL
        INT      21H
        MOV      [ch2], AL       ;�NAL�r��������ch2�ܼ�
;
        MOV      DX, msghex      ;���msghex
        MOV      AH, 09H
        INT      21H
        showbyte ch2             ;ch2�H16�i�����
        MOV      AX, 4c00H
        INT      21H
