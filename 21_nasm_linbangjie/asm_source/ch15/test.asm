; ******************* test.asm ************************
;
        SEGMENT  code              ;�{���X���q
..start:                           ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX                ;DS=data���q��}
        MOV  ES, AX
        MOV  AX, mystack
        MOV  SS, AX                ;DS=stack���q��}
        MOV  SP, stacktop          ;SP=���|���ݫ���
;
        MOV  AH, 03H               ;���o��Ц�mDH�CDL��
        INT  10H
;
        MOV  BP, msg               ;[ES:BP]����msg��}
        MOV  CX, msglen            ;CX=msg����
        MOV  BL, 7cH               ;BL=�թ�(7)���r(c)
        MOV  BH, 00H               ;BH=current page
        MOV  AH, 13H               ;AH=13h�C�L�r��\��
        MOV  AL, 01H               ;�@�r�@�r�C�L
        INT  10H                   ;����C�L�r��\��
;
        MOV  AX, 4c00H
        INT  21H                   ;��^�@�~�t��
;----------------------------------------------------------
        SEGMENT data               ;��Ƥ��q
msg     DB      'Hello, World', 0
msglen  EQU     $ - msg
;----------------------------------------------------------
        SEGMENT mystack stack      ;���|���q
        RESB  100H
stacktop:
;----------------------------------------------------------
