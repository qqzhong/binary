; ********************** strtonum.asm ********************
         ORG      0100H
         JMP      start
stri     DB       '987', '$'          ;��Ʀr��
strl     DB       '-987654321', '$'   ;����Ʀr��
strf     DB       '9876.5', '$'      ;�B�I�Ʀr��
numi     DW       0
numl     DD       0
numf     DD       0.0
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\strtoi.mac"
%include "..\mymacro\strtol.mac"
%include "..\mymacro\strtof.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\displ.mac"
%include "..\mymacro\dispf.mac"
;
start:
      FINIT
      strtoi   stri, '$', numi    ;��Ʀr���ন�ƭ�numi
      dispi    numi               ;���numi
      newline                     ;���C
      strtol   strl, '$', numl    ;����Ʀr���ন�ƭ�numl
      displ    numl               ;���numl
      newline                     ;���C
      strtof   strf, numf         ;�B�I�Ʀr���ন�ƭ�numf
      dispf    numf, 2            ;���numf
      newline                     ;���C
;
      MOV      AX, 4c00H
      INT      21H
