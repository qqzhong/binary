; ********************** dumpmem.asm ********************
        ORG      0100H
        JMP      start
mem     DB       12H            ;�r�����t12H
        DW       1234H          ;�r�դ��t1234H
        DD       12345678H      ;���r�դ��t12345678H
        DB       'ABC123abc+'   ;�r�ꤺ�tABC123abc+
space   DB       ' '            ;�ťզr��
;
%include "../mymacro/showbyte.mac"      ;����showbyte
%include "../mymacro/dispchr.mac"       ;����dispchar
;
start:
        MOV      CX, 17     ;CX=17
        MOV      SI, 0      ;SI=0
repeat:
        showbyte mem+SI     ;mem+SI��}�����t�H16�i�����
        dispchr  space      ;��ܪťզr��
        INC      SI         ;SI=SI+1���V�U�@�Ӧ줸��
        LOOP     repeat     ;���ư���17��(CX=17)
        MOV      AX, 4c00H
        INT      21H
