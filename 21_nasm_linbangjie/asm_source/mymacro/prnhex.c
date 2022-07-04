; ********************* prnhex.mac *******************
;
; prnhex cmem, byteCountValue
; �Ncmem�O����}�l�A�@byteCountValue�Ӥ��t�ȥH�Q���i��
; �Φ���ܩ�ù�
;   cmem           : �r���Ҧs��O�����} (�ǧ})
;   byteCountValue : �@byteCountValue�Ӧ줸�� (�ǭ�)
;
%ifndef PRNHEX_MAC
%define PRNHEX_MAC
%MACRO prnhex 2             ;�G�ӰѼ�
       PUSHA                ;�x�s��ӼȦs�����
       MOV    CX, %2        ;�r����
       MOV    BP, 0         ;�Ĥ@�Ӧr��
%%loop2:
        MOV   AL, [%+BP]   ;AL=�n��ܪ��r��
        MOV   BL, 16       ;����BL=16
        MOV   AH, 0        ;AH=0
        DIV   BL         ;AX/BL
        MOV   DH, AH     ;DH=�C���
        MOV   DL, AL     ;DL=�����
        CMP   DL, 10     ;�����<10?
        JL    %%less10H  ;�O,����%%less10H
        ADD   DL, 7      ;10��15��DL=DL+7
%%less10H:
        ADD   DL, 30H    ;�ƭ��ഫ���Ʀr
        MOV   AH, 02H    ;�]�w��ܦr���\��
        INT   21H        ;��ܦr��
        MOV   DL, DH     ;DL=�C���
        CMP   DL, 10     ;�C���<10?
        JL    %%less10L  ;�O,����%%less10L
        ADD   DL, 7      ;10��15��DL=DL+7
%%less10L:
        ADD   DL, 30H    ;�ƭ��ഫ���Ʀr
        MOV   AH, 02H    ;�]�w��ܦr���\��
        INT   21H        ;��ܦr��
       INC    BP            ;�U�@�Ӧr��
       LOOP   %%loop2       ;�~��
       POPA                 ;��_��ӼȦs�����
%ENDMACRO
%endif
