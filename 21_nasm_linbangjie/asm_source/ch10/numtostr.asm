; ********************* numtostr.asm *********************
        ORG   0100H
        JMP   start
numi    DW    -12345               ;���
numl    DD    123456789            ;�����
numf    DD    -1234.567            ;�B�I��
stri    TIMES 30 DB ' '            ;��Ʀr��
strl    TIMES 30 DB ' '            ;����Ʀr��
strf    TIMES 30 DB ' '            ;�B�I�Ʀr��
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\itostr.mac"
%include "..\mymacro\ultostr.mac"
%include "..\mymacro\ftostr.mac"
;
start:
      FINIT                        ;�B�I���|��l��
      ftostr   numf, 3, strf       ;�B�I���নstrf�r��
      dispstr  strf                ;���strf�r��
      newline                      ;���C
      ultostr  numl, strl, '$'     ;�L��������নstrl�r��
      dispstr  strl                ;���strl�r��
      newline                      ;���C
      itostr   numi, stri, '$'     ;��������নstri�r��
      dispstr  stri                ;���stri�r��
      newline                      ;���C
;
      MOV      AX, 4c00H
      INT      21H
