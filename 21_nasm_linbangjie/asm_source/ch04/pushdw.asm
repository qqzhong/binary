; *********************** pushdw.asm ************************
       ORG   0100H
       JMP   start
num    DD    12345678H, 90123456H
dmem   DD    0
;
%include "..\mymacro\showSP.mac"
%include "..\mymacro\showdw.mac"
%include "..\mymacro\newline.mac"
;
start: showSP
       PUSH      DWORD [num]   ;�Nnum��}�����t���|�J���|����
       newline
       showSP
       PUSH      DWORD [num+4] ;�Nnum+4��}�����t���|�J���|����
       newline
       showSP
;
       POP       DWORD [dmem]  ;�N���|���ݦr���|�X��dmem
       newline
       showdw    dmem
       newline
       showSP
;
       POP       DWORD [dmem]  ;�N���|���ݦr���|�X��dmem
       newline
       showdw    dmem
       newline
       showSP
;
       MOV   AX, 4c00H        ;�{�������\��
       INT   21H              ;�{������
