; ************* printchr.pro ************
;
; CALL printchr
;   �NAL���r����ܩ�ù�
;   ��J�Ѽ� AL : �r����
;
%ifndef PRINTCHR_PRO
%define PRINTCHR_PRO
printchr:
      PUSHA          ;�x�s��ӼȦs�����
      MOV   DL, AL   ;DL=�r��
      MOV   AH, 02H  ;�]�w��ܦr���\��
      INT   21H      ;��ܦr��
      POPA           ;��_��ӼȦs�����
      RET
%endif
