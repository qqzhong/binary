; *********************** pushword.asm ************************
       ORG   0100H
       JMP   start
num    DW    1234H, 5678H
wmem   DW    0
;
%include "..\mymacro\showSP.mac"
%include "..\mymacro\showword.mac"
%include "..\mymacro\newline.mac"
;
start: showSP
       PUSH      WORD [num]   ;�Nnum��}�����t���|�J���|����
       newline
       showSP
       PUSH      WORD [num+2] ;�Nnum+2��}�����t���|�J���|����
       newline
       showSP
;
       POP       WORD [wmem]  ;�N���|���ݦr���|�X��wmem
       newline
       showword  wmem
       newline
       showSP
;
       POP       WORD [wmem]  ;�N���|���ݦr���|�X��wmem
       newline
       showword  wmem
       newline
       showSP
;
       MOV   AX, 4c00H        ;�{�������\��
       INT   21H              ;�{������
