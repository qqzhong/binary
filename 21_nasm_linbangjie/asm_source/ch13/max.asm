; ********************** max.asm ********************
        ORG   0100H
        JMP   start
count   DW    8
array   DW   18, 25, 13, 56, 44, 78, 99, 66
msg     DB   'max element in array is = ', '$'
;
%include "..\mymacro\dispi.mac"
%include "..\mymacro\dispstr.mac"
;
start:
        MOV     CX, [count]     ;CX=�}�C�����Ӽ�
        DEC     CX              ;�q0�p��
        MOV     SI, array       ;SI��0�Ӥ���������}
        MOV     DI, array+2     ;DI��1�Ӥ���������}
loop2:
        MOV     AX, WORD [SI]   ;AX=��SI�Ӥ�����
        MOV     DX, WORD [DI]   ;DX=��DI�Ӥ�����
        CMP     AX, DX          ;AX:DX
        JL      less            ;AX<DX
        XCHG    AX, DX          ;AX�PDX����
        MOV     WORD [SI], AX   ;��SI�Ӥ�����=AX
        MOV     WORD [DI], DX   ;��DI�Ӥ�����=DX
less:
        ADD     SI, 2           ;SI=SI-2
        ADD     DI, 2           ;DI=DI-2
        LOOP    loop2           ;�~��
;
        dispstr msg             ;���msg
        dispi   SI              ;��̤ܳj������
        MOV     AX, 4c00H
        INT     21H
