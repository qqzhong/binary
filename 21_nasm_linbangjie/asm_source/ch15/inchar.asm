; ***************** inchar.asm *****************
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
        MOV   AH, 01H
        INT   21H             ;��J�@�Ӧr����AL
;
        MOV   BYTE [ch2], AL
        MOV   DX, msg2        ;DX=msg������}
        MOV   AH, 9
        INT   21H             ;���msg�H��
;
        MOV   AX, 4c00H       ;��^�@�~�t��
        INT   21H
;----------------------------------------------
        SEGMENT data          ;��Ƥ��q
msg     DB    'keyin a char Y or N : ', '$'
msg2    DB    13, 10, 'you just keyin '
ch2     DB    ' '
        DB    13, 10 , '$'
;----------------------------------------------
        SEGMENT mystack stack   ;���|���q
        RESB  256
stacktop:
