; *********************** divword.asm ******************
        ORG    0100H
        JMP    start
a       DD     65536
b       DW     12345
q       DW     0
r       DW     0
msgq    DB     'quotient  q=65536/12345= '
qstr    DB     '          ', 13, 10, '$'
msgr    DB     13, 10, 'remainder  r=65536%12345= '
rstr    DB     '          ', 13, 10, '$'
;
%include "../mymacro/itostr.mac"
;
start:  MOV    BX, a        ;�N���r���ܼ�a����}�s�JBX
        MOV    AX, [BX]     ;�N�ܼ�a���C�r�դ��t�s�JAX
        MOV    DX, [BX+2]   ;�N�ܼ�a�����r�դ��t�s�JDX
        DIV    WORD [b]     ;a/b
        MOV    [q], AX      ;q=a/b����
        MOV    [r], DX      ;r=a/b���l��
        itostr q, qstr, '$' ;�Nq���ন�Q�i��Ʀr
        MOV    DX, msgq     ;���msg�r��(���tq��)
        MOV    AH, 09H
        INT    21H
;
        itostr r, rstr, '$' ;�Nr���ন�Q�i��Ʀr
        MOV    DX, msgr     ;���msg�r��(���tr��)
        MOV    AH, 09H
        INT    21H
        MOV    AX, 4c00H
        INT    21H
