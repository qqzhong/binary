; *********** disp.asm ***********
       ORG 0100H
       JMP start
msg    DB  'keyin char: ','$'
msg2   DB  13,10,'disp char= ','$'
char   DB  ' '
;
%include "..\mymacro\readchr.mac"
%include "..\mymacro\dispchr.mac"
%include "..\mymacro\dispstr.mac"
;
start: dispstr  msg  ;���msg�r��
       readchr  char ;Ū�Jchar�r��
       dispstr  msg2 ;���msg2�r��
       dispchr  char ;���char�r��
;
       MOV      AX, 4c00H
       INT      21H
