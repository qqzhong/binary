; *************************** stack.asm ********************
        ORG     0100H
        JMP     start
data    TIMES   100 DW 0
link    TIMES   100 DW 0
top     DW      0
msg     DB      'keyin number (0-65535, Enter end) : ', '$'
numstr  TIMES   80 DB ' '
numval  DW      0
blank   DB      ' $'
;
%include "..\mymacro\readstr.mac"
%include "..\mymacro\strtoi.mac"
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
;
start:
        MOV     SI, 0               ;SI�����|���ޭ�
        MOV     WORD [top], SI      ;���|�����Y�`�I���ޭ�
loop1:
        dispstr msg                 ;��ܿ�J�H��
        readstr numstr              ;��J�@�Ӿ�Ʀr��
        CMP     BYTE [numstr], '$'  ;��J������?
        JNE     next                ;�_
        JMP     endRead             ;�O
next:
        newline                     ;���C
        strtoi  numstr, '$', numval ;��Ʀr���ন�ƭ�
;
        ADD     SI, 2               ;���o�U�@�ӥi�θ`�I
        MOV     BX, WORD [top]
        MOV     AX, WORD [numval]
        MOV     WORD [data+SI], AX  ;SI�`�I������=numval
        MOV     WORD [link+SI], BX  ;SI�`�I�����=top
        MOV     WORD [top], SI      ;top=SI
        JMP     loop1               ;�~��
endRead:
        newline                     ;��J����,���C
        MOV     BP, WORD [top]      ;BX=top
loop2:
        dispi   data+BP             ;���BP�`�I��������
        dispstr blank
        MOV     BP, [link+BP]       ;BP=�U�@�Ӹ`�I���ޭ�
        CMP     BP, 0               ;�̫�@�Ӹ`�I��?
        JNZ     loop2
        MOV     AX, 4c00H
        INT     21H
