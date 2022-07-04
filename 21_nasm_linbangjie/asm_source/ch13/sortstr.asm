; ********************** sortstr.asm *********************
        ORG   0100H
        JMP   start
count   DW    8
lenkey  DW    7
array   DB    "Java   ", "C/C++  ", "Basic  ",
        DB    "NASM   ", "Ada    ", "VB     ",
        DB    "COBOL  ", "Delphi "
strptr  TIMES 8 DW 0
result  DW    0
;
%include "..\mymacro\dispnchr.mac"
%include "..\mymacro\strncmp.mac"
;
start:
        PUSH    WORD [count]           ;�s�J���|����
        MOV     CX, [count]            ;CX=�}�C�����Ӽ�
        MOV     BX, array              ;BX=�}�C������}
        MOV     SI, 0                  ;SI=0���ޭ�
loop1:
        MOV     [strptr+SI], BX        ;SI�ҫ�������(��})
        ADD     SI, 2                  ;�U�@�Ӥ���
        ADD     BX, [lenkey]           ;�U�@�Ӥ���������}
        LOOP    loop1                  ;�~��
loop3:
        MOV     CX, [count]            ;CX=�}�C�����Ӽ�
        DEC     CX                     ;�q0�p��
        MOV     BX, 0                  ;BX=0
        MOV     SI, [strptr+BX]        ;BX������}�ҫ����t
        MOV     DI, [strptr+BX+2]      ;BX+2�ҫ��������t
loop2:
        strncmp SI, DI, lenkey, result ;SI�PDI�����Ȥ��
        CMP     WORD [result], 0       ;SI�����ȸ��p?
        JL      less                   ;�O
        MOV     WORD [strptr+BX], DI   ;DI�P
        MOV     WORD [strptr+BX+2], SI ;SI�����Ȥ���
less:
        ADD     BX, 2                  ;BX=BX+2,�U�@��
        MOV     SI, [strptr+BX]        ;BX������}�ҫ����t
        MOV     DI, [strptr+BX+2]      ;BX+2�ҫ��������t
        LOOP    loop2                  ;�~��
;
        DEC     WORD [count]           ;count�ȴ�1
        CMP     WORD [count], 1        ;count��>1?
        JG      loop3                  ;�O
;
        POP     CX                     ;���^�����Ӽ�
        MOV     BX, [strptr]           ;BX=��0�Ӥ�����}
        MOV     SI, 0                  ;SI=0,����
loop4:
        dispnchr BX, lenkey            ;���BX�ҫ����t
        ADD     SI, 2                  ;SI=SI+2,�U�@��
        MOV     BX, [strptr+SI]        ;BX=�U�@�Ӥ�����}
        LOOP    loop4                  ;�~��
        MOV     AX, 4c00H
        INT     21H
