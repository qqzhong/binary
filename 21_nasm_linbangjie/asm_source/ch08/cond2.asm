; ********************* cond2.asm ******************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a character : ', '$'
newline DB    13, 10, '$'
msg2    DB    'the character = '
ch2     DB    ' ', '$'
;
%include "..\mymacro\readchr.mac"
%include "..\mymacro\dispchr.mac"
%include "..\mymacro\dispstr.mac"
;
start: dispstr  msg       ;���msg�r��
       readchr  ch2       ;Ū�J�@�r����ch2
       dispstr  newline   ;���C
       %if 0
          dispchr ch2     ;�o�ӥ������Q��Ķ(���ե�)
       %endif
       dispstr  msg2      ;���msg2�r��
       MOV      AX, 4c00H
       INT      21H
