; ************************ strfill.asm *********************
        ORG   0100H
        JMP   start
str2    DB    'Good Night!', '$'
msg2    DB    'call strfill macro after fill *', 13, 10, '$'
;
%include "..\mymacro\strfill.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        dispstr  str2             ;��ܦr��str2
        newline                   ;���C
        strfill  str2, '$', '*'   ;�񺡬P��
        dispstr  msg2             ;���msg2�H��
        dispstr  str2             ;��ܦr��str2
;
        MOV      AX, 4c00H
        INT      21H
