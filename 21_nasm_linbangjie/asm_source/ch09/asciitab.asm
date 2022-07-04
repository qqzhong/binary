; ********************* ascii.asm ********************
        ORG   0100H
        JMP   start
;
%include "printchr.pro"
;
start:
        MOV   BL, 16        ;BL=16,�C�C16�r��
        MOV   CL, 32        ;CL=32,�q�i�L�r���}�l
loop2:
        MOVZX AX, CL        ;AX=CL
        DIV   BL            ;AX/BL
        CMP   AH, 0         ;�Ӽ�AH��0��?
        JNZ   next          ;�_,�@�C�٬��L��
        MOV   AL, 0dH       ;�L�XCarriageReturn
        CALL  printchr      ;�C�L�r�Y��^
        MOV   AL, 0aH       ;�L�XLineFeed
        CALL  printchr      ;�C�L�r�Y���U�@�C
next:
        MOV   AL, ' '       ;�C�L�@�Ӫťզr��
        CALL  printchr
        MOV   AL, CL        ;�C�LAL��ASCII�X
        CALL  printchr
        INC   CL            ;CL=�U�@��ASCII�X��
        CMP   CL, BYTE 128  ;CL�P128���
        JNZ   loop2         ;���۵����~��
        MOV   AX, 4c00H
        INT   21H
