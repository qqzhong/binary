; ******************* setpixel.asm ************************
;
        SEGMENT  code            ;�{���X���q
..start:                         ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX              ;DS=data���q��}
        MOV  AX, mystack
        MOV  SS, AX              ;DS=stack���q��}
        MOV  SP, stacktop        ;SP=���|���ݫ���
;
       MOV   AX, 13H             ;�]�w��ܼҦ���AL=13H
       INT   10H                 ;  320x200 256��ϧμҺA
       MOV   AX, 0A000H          ;�]�w�ù���}
       MOV   ES, AX              ;  ES=0a00H
       MOV   DI, 10 * 320 + 30   ;�C��*�ù��e��+���
       MOV   CX, 100             ;�]�w100��
loop2:
       MOV   BYTE [ES:DI], 09H   ;�]�w�Ŧ�G�I
       INC   DI                  ;�U�@�Ӧ�m
       LOOP  loop2               ;�~��100��(CX)
       MOV   AH, 10H
       INT   16H                 ;���ݫ���
       MOV   AX, 3
       INT   10H                 ;�^�_����Ҧ�
       MOV   AX, 4c00H
       INT   21H                 ;��^�@�~�t��
;----------------------------------------------------------
        SEGMENT data             ;��Ƥ��q
;----------------------------------------------------------
        SEGMENT mystack stack    ;���|���q
        RESB  100H
stacktop:
;----------------------------------------------------------
