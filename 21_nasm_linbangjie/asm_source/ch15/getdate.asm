; ********************** getdate.asm ************************
;
        SEGMENT  code         ;�{���X���q
..start:                      ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX           ;DS=data���q��}
        MOV  AX, mystack
        MOV  SS, AX           ;DS=stack���q��}
        MOV  SP, stacktop     ;SP=���|���ݫ���
;
%include "..\mymacro\dispb.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
;
        MOV   AH, 2aH
        INT   21H               ;Ū�����
        MOV   WORD [year], CX   ;�~
        MOV   BYTE [month], DH  ;��
        MOV   BYTE [day], DL    ;��
;
        dispstr  msg1
        dispi    year
        dispstr  msg2
        dispb    month
        dispstr  msg3
        dispb    day
;
        MOV   AX, 4c00H            ;��^�@�~�t��
        INT   21H
;--------------------------------------------------
        SEGMENT data          ;��Ƥ��q
msg1    DB    13, 10, 'year = ', '$'
msg2    DB    13, 10, 'month =  ', '$'
msg3    DB    13, 10, 'day = ', '$'
year    DW    0
month   DB    0
day     DB    0
;--------------------------------------------------
        SEGMENT mystack stack   ;���|���q
        RESB    256
stacktop:
;--------------------------------------------------
