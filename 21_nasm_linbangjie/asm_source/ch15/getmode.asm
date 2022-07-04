; ********************* getmode.asm ************************
;
        SEGMENT  code               ;�{���X���q
..start:                            ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX                 ;DS=data���q��}
        MOV  AX, mystack
        MOV  SS, AX                 ;DS=stack���q��}
        MOV  SP, stacktop           ;SP=���|���ݫ���
;
%include "..\mymacro\dispb.mac"
%include "..\mymacro\dispstr.mac"
;
       MOV      AH, 0fH             ;�Ǧ^Video���A
       INT      10H
;
       dispstr  mode
       MOV      BYTE [bmen], AL     ;mode
       dispb    bmen
;
       dispstr  cols
       MOV      BYTE [bmen], AH     ;columns
       dispb    bmen
;
       dispstr  pagenum
       MOV      BYTE [bmen], BH     ;current display page
       dispb    bmen
;
       MOV   AX, 4c00H
       INT   21H                    ;��^�@�~�t��
;-----------------------------------------------------------
        SEGMENT data                ;��Ƥ��q
bmen    DB   ' '
mode    DB   13, 10, "current mode = ", '$'
cols    DB   13, 10, "number of columns = ", '$'
pagenum DB   13, 10, "current display page = ", '$'
;-----------------------------------------------------------
        SEGMENT mystack stack       ;���|���q
        RESB  100H
stacktop:
;-----------------------------------------------------------
