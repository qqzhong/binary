; ************************* writestr.pro *************************
;
; CALL writestr
;   �NBP�Ȧs���ҫ��r��ACX�r����סABL�ݩʡA�b�ثe��гB��ܥX�ӡC
;   BP : �n��ܪ��r��O�����}�C
;   CX : �r����סA�]�A 00H �����Ÿ��C
;   BL : �n��ܪ��r���ݩʡC�줸 7-4 �I���C��A0-3 �e���C��C
;
%ifndef WRITESTR_PRO
%define WRITESTR_PRO
;
writestr:
      PUSHA             ;�x�s��ӼȦs�����
      MOV  AH, 03H      ;���o��Ц�mDH�CDL��
      INT  10H
      MOV  BH, 00H             ;BH=current page
      MOV  AH, 13H             ;AH=13h�C�L�r��\��
      MOV  AL, 01H             ;�@�r�@�r�C�L
      INT  10H                 ;����C�L�r��\��
      POPA              ;��_��ӼȦs�����
      RET
%endif
