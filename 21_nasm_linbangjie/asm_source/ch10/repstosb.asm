; ***************** repstosb.asm ****************
        ORG   0100H
        JMP   start
str2    TIMES 80 DB ' '
        DB    '$'
;
%include "..\mymacro\dispstr.mac"
;
start:
        MOV       AL, '='   ;AL='='
        MOV       CX, 36    ;CX=�ӷ��r��str1����
        MOV       DI, str2  ;�ت��r��str2��}
        CLD                 ;��V,�q���ܥk
        REP STOSB           ;AL�x�s��DI�r����}
        dispstr   str2      ;���str2�H��
;
        MOV       AX, 4c00H
        INT       21H
