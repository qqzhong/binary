; ************************ showcs.asm **********************
        ORG      0100H
        JMP      start
value   DW       123
csmsg   DB       'CS (in hex) = ', '$'
;
%include "../mymacro/showbyte.mac"
;
start:
        MOV      [value], CS  ;�NCS�s�Jvalue�O�����}
        MOV      DX, csmsg    ;���16�i��r��csstr
        MOV      AH, 09H
        INT      21H
        showbyte value+1      ;�H16�i�����value+1��}�����t
        showbyte value        ;�H16�i�����value��}�����t
        MOV      AX, 4c00H
        INT      21H 
