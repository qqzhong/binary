; *********************** pushpop.asm ************************
       ORG   0100H
       JMP   start
num    DW    1234H, 5678H
wmem   DW    0
;
%include "..\mymacro\showbyte.mac"
;
start: PUSH      WORD [num]   ;�Nnum��}�����t���|�J���|����
       PUSH      WORD [num+2] ;�Nnum+2��}�����t���|�J���|����
       POP       WORD [wmem]  ;�N���|���ݤ����|�X��wmem��}
       showbyte  wmem+1       ;�Nwmem+1�줸�դ��t�H16�i�����
       showbyte  wmem         ;�Nwmem�줸�դ��t�H16�i�����
       POP       WORD [wmem]  ;�N���|���ݤ����|�X��wmem��}
       showbyte  wmem+1       ;�Nwmem+1�줸�դ��t�H16�i�����
       showbyte  wmem         ;�Nwmem�줸�դ��t�H16�i�����
;
       MOV   AX, 4c00H        ;�{�������\��
       INT   21H              ;�{������
