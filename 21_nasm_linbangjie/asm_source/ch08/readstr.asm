; ********************* readstr.asm ********************
        ORG    0100H
        JMP    start
msg     DB     'keyin a string (end with Enter) : ', '$'
msg2    DB     'the string you just keyin = ', '$'
s       TIMES 80 DB ' '
crlf    DB     13,10,'$'
;
%include "..\mymacro\readstr.mac"
%include "..\mymacro\dispstr.mac"
;
start:
        dispstr  msg       ;���msg
        readstr  s         ;�q��L��J�r��
        dispstr  crlf      ;���C
        dispstr  msg2      ;���msg2
        dispstr  s         ;���s�r��
        MOV      AX, 4c00H
        INT      21H
