; ********************** setflag.asm ****************
        ORG      0100H
        JMP      start
flag    DW       0
msg     DB       'flag register (in hex) = ', '$'
;
%include "../mymacro/showword.mac"
;
start:
        SUB      AX, AX       ;�]�wZF�Ȭ�1
        STC                   ;�]�wCF�Ȭ�1
        STD                   ;�]�wDF�Ȭ�1
        STI                   ;�]�wIF�Ȭ�1
        PUSHFW                ;�N�X�мȦs���|�J���|
        POP      WORD [flag]  ;�|�X��flag�r��
        MOV      DX, msg      ;�Nmsg��}�s�JDX
        MOV      AH, 09H      ;��ܦr��\��
        INT      21H          ;��ܦr��msg
        showword flag         ;��ܺX�мȦs��(16�i��)
;
        MOV      AX, 4c00H    ;�����{���\��
        INT      21H          ;�����{��
