; ***************** hello.asm *******************
        SEGMENT  code           ;�{���X���q
..start:                        ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX             ;DS=data���q��}
        MOV  AX, mystack
        MOV  SS, AX             ;DS=stack���q��}
        MOV  SP, stacktop       ;SP=���|���ݫ���
;
        MOV   DX, msg           ;DX=msg������}
        MOV   AH, 9
        INT   21H               ;���msg�H��
;
        MOV   AX, 4c00H         ;��^�@�~�t��
        INT   21H
;------------------------------------------------
        SEGMENT data            ;��Ƥ��q
msg     DB    'Hello, world!', 13, 10, '$'
;------------------------------------------------
        SEGMENT mystack stack   ;���|���q
        RESB  64
stacktop:
;------------------------------------------------
