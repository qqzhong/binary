; *********************** pushflag.asm ************************
       ORG   0100H
       JMP   start
wmem   DW    0
;
%include "..\mymacro\showword.mac"
;
start: PUSHFW                 ;�N�X�Цr���|�J���|����
       POP       WORD [wmem]  ;�N���|���ݤ����|�X��wmem��}
       showword  wmem         ;�Nwmem�줸�դ��t�H16�i�����
;
       MOV   AX, 4c00H        ;�{�������\��
       INT   21H              ;�{������
