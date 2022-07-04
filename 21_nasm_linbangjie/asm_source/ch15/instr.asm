; ********************** instr.asm ************************
;
        SEGMENT  code         ;�{���X���q
..start:                      ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX           ;DS=data���q��}
        MOV  AX, mystack
        MOV  SS, AX           ;DS=stack���q��}
        MOV  SP, stacktop     ;SP=���|���ݫ���
;
        MOV   DX, msg         ;DX=msg������}
        MOV   AH, 9
        INT   21H             ;���msg�H��
;
        MOV   BX, 0             ;BX=���ޭ�
again:
        MOV   AH, 01H
        INT   21H               ;��J�@�Ӧr����AL
        CMP   AL, 0dH           ;�PCR(Carriage Return)���
        JE    next              ;�OCR�r��
        MOV   BYTE [buf+BX], AL ;���OCR,�s�Jbuf��BX��m
        CMP   BX, 79            ;buf���Y?
        JE    next              ;�O
        INC   BX                ;�_
        JMP   again
next:
        MOV   AL, '$'
        MOV   BYTE [buf+BX+1], AL  ;buf�H$����
;
        MOV   DX, msg2             ;DX=msg������}
        MOV   AH, 9
        INT   21H                  ;���msg�H��
;
        MOV   AX, 4c00H            ;��^�@�~�t��
        INT   21H
;--------------------------------------------------
        SEGMENT data          ;��Ƥ��q
msg     DB    'keyin a string : ', '$'
msg2    DB    13, 10, 'you just keyin '
buf     TIMES 81 DB ' '
;--------------------------------------------------
        SEGMENT mystack stack   ;���|���q
        RESB  256
stacktop:
;--------------------------------------------------
