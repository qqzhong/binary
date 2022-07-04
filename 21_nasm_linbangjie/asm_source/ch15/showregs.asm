; ********************** showregs.asm ********************
;
        SEGMENT  code         ;�{���X���q
..start:                      ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX           ;DS=data���q��}
        MOV  AX, mystack
        MOV  SS, AX           ;DS=stack���q��}
        MOV  SP, stacktop     ;SP=���|���ݫ���
;
%include "../mymacro/showbyte.mac"
;
        MOV      [value], CS  ;�NCS�s�Jvalue�O�����}
        MOV      DX, csmsg    ;���16�i��r��csmsg
        CALL     show
;
        MOV      [value], DS  ;�NDS�s�Jvalue�O�����}
        MOV      DX, dsmsg    ;���16�i��r��dsmsg
        CALL     show
;
        MOV      [value], ES  ;�NES�s�Jvalue�O�����}
        MOV      DX, esmsg    ;���16�i��r��esmsg
        CALL     show
;
        MOV      [value], SS  ;�NSS�s�Jvalue�O�����}
        MOV      DX, ssmsg    ;���16�i��r��ssmsg
        CALL     show
;
        MOV      [value], SP  ;�NSP�s�Jvalue�O�����}
        MOV      DX, spmsg    ;���16�i��r��spmsg
        CALL     show
;
        MOV      AX, 4c00H
        INT      21H
show:
        MOV      AH, 09H
        INT      21H
        showbyte value+1    ;�H16�i�����value+1��}�����t
        showbyte value      ;�H16�i�����value��}�����t
        RET
;---------------------------------------------------------
        SEGMENT data            ;��Ƥ��q
value   DW       0
csmsg   DB       13, 10, 'CS (in hex) = ', '$'
dsmsg   DB       13, 10, 'DS (in hex) = ', '$'
esmsg   DB       13, 10, 'ES (in hex) = ', '$'
ssmsg   DB       13, 10, 'SS (in hex) = ', '$'
spmsg   DB       13, 10, 'SP (in hex) = ', '$'
;---------------------------------------------------------
        SEGMENT mystack stack   ;���|���q
        RESB  64
stacktop:
;---------------------------------------------------------
