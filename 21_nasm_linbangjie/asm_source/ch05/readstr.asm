; ********************** readstr.asm ********************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a string : ', '$'
msg2    DB    13, 10, 'the string you just keyin = ', '$'
s       TIMES 80 DB ' '
crlf    DB    13,10,'$'
;
%include "..\mymacro\readstr.mac"
;
start:
        MOV      DX, msg    ;���msg�H��
        MOV      AH, 09H
        INT      21H
        readstr  s          ;�q��LŪ�J�r��H'$'����
        MOV      DX, msg2   ;���msg2�H��
        MOV      AH, 09H
        INT      21H
        MOV      DX, s      ;��ܭ��Ū�J��s�r��
        MOV      AH, 09H
        INT      21H
        MOV      AX, 4c00H
        INT      21H
