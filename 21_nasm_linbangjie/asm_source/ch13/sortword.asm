; ********************** sortword.asm ********************
        ORG   0100H
        JMP   start
count   DW    8
array   DW    18, 25, 13, 56, 44, 78, 99, 66
blank   DB    ' $'
;
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
;
start:
        MOV     BX, WORD [count]  ;BX=�}�C�����Ӽ�
begin:
        MOV     CX, [count]       ;CX=�}�C�����Ӽ�
        DEC     CX                ;�q0�p��
        MOV     SI, array         ;SI��0�Ӥ���������}
        MOV     DI, array+2       ;DI��1�Ӥ���������}
loop2:
        MOV     AX, WORD [SI]     ;AX=��SI�Ӥ�����
        MOV     DX, WORD [DI]     ;DX=��DI�Ӥ�����
        CMP     AX, DX            ;AX:DX
        JL      less              ;AX<DX
        XCHG    AX, DX            ;AX�PDX����
        MOV     WORD [SI], AX     ;��SI�Ӥ�����=AX
        MOV     WORD [DI], DX     ;��DI�Ӥ�����=DX
less:
        ADD     SI, 2             ;SI=SI-2
        ADD     DI, 2             ;DI=DI-2
        LOOP    loop2             ;�~��
;
        DEC     BX                ;BX=BX-1
        CMP     BX, 1             ;BX=1?
        JG      begin             ;�_
;
        MOV     CX, WORD [count]  ;CX=�}�C�����Ӽ�
        MOV     BX, array         ;BX=array�_�l��}
loop3:
        dispi   BX                ;���BX�ҫ��������t��
        dispstr blank
        ADD     BX, 2             ;BX���V�U�@�Ӥ���
        LOOP    loop3             ;�~��
        MOV     AX, 4c00H
        INT     21H
