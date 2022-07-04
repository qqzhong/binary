; **************************** list.asm *********************
        ORG     0100H
        JMP     start
data    TIMES   100 DW 0
link    TIMES   100 DW 0
head    DW      0
tail    DW      0
msg     DB      'keyin a number (0-65535, Enter end) : ', '$'
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
        MOV     SI, 0               ;SI����C���ޭ�
        MOV     WORD [head], SI     ;��C�Y�`�I���ޭ�
        MOV     WORD [tail], SI     ;��C���`�I���ޭ�
        MOV     WORD [data], -1     ;��C�Y�`�I������
        MOV     WORD [link], SI     ;��C�Y�`�I�����
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
        MOV     AX, WORD [numval]
        MOV     WORD [data+SI], AX  ;SI�`�I������=numval
;
        MOV     BP, WORD [head]     ;BP=��C�Y�`�I���ޭ�
        MOV     BX, BP              ;BX=BP
comp:
        MOV     AX, [data+BP]       ;AX=BP�`�I�����
        CMP     WORD [numval], AX   ;numval<AX
        JL      less                ;�O
        MOV     BX, BP              ;BX=BP,��BP���e�@��
        MOV     BP, WORD [link+BP]  ;BP=�U�@��
        CMP     BP, 0               ;��C�����F��?
        JE      endList             ;�O
        JMP     comp                ;�_
less:
        MOV     WORD [link+SI], BP  ;SI�`�I���JBX�PBP
        MOV     WORD [link+BX], SI  ;  ��`�I����
        JMP     loop1               ;�~��
endList:
        MOV     WORD [link+SI], 0   ;SI�`�I�����=0
        MOV     DI, WORD [tail]     ;DI=���`�I���ޭ�
        MOV     WORD [link+DI], SI  ;����`�I�����=SI
        MOV     WORD [tail], SI     ;���`�I���ޭ�=SI
        JMP     loop1               ;�~��
endRead:
        newline                     ;��J����,���C
        MOV     BX, WORD [head]     ;BX=�Y�`�I���ޭ�
        MOV     BP, WORD [link+BX]  ;BP=�Y�`�I�����
loop2:
        dispi   data+BP             ;���BP�`�I��������
        dispstr blank
        MOV     BP, [link+BP]       ;BP=�U�@�Ӹ`�I���ޭ�
        CMP     BP, 0               ;�̫�@�Ӹ`�I��?
        JNZ     loop2               ;�_
        MOV     AX, 4c00H
        INT     21H
