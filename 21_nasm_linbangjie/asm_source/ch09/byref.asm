; ********************* byref.asm ********************
        ORG   0100H
        JMP   start
msg     DB    '3', '2', '1', '$'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        dispstr msg           ;�I�sprintmsg�{�Ǥ��e
        newline               ;���C
        MOV     BX, msg       ;msg��}��޼Ʀs�JBX
        CALL    printmsg      ;�I�sprintmsg�{��
        dispstr msg           ;�I�sprintmsg�{�Ǥ���
        newline               ;���C
        MOV     AX, 4c00H
        INT     21H
;-----------------------------------------------------
printmsg:
        PUSHA                 ;�x�s��ӼȦs�����
        MOV   BYTE [BX], '9'  ;�N'9'�h����BX�ҫ���}
        POPA                  ;��_��ӼȦs�����
        RET
