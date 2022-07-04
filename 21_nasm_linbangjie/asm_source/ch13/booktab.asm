; ********************** booktab.asm ********************
        ORG     0100H
        JMP     start
lenkey  DW      5
lendata DW      16
lentab  DW      5
table   DB      '29033', 'Java programming',
        DB      '29034', 'JSP programming ',
        DB      '29009', 'C/C++Programming',
        DB      '29088', 'webpage design  ',
        DB      '31033', 'NASM programming'
;
result  DW      0
msgerr  DB      'book number not found!', '$'
msgdata DB      'book name = ',
data    DB      '                    ', '$'
msgkey  DB      'please keyin book number : ', '$'
key     DB      '     ', '$'
;
%include "..\mymacro\readstr.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\strncpy.mac"
%include "..\mymacro\strncmp.mac"
;
start:
        dispstr msgkey                  ;���msgkey�H��
        readstr key                     ;��J�Ѹ�(5��Ʀr)
        newline                         ;���C
;
        MOV     CX, [lentab]            ;CX=����`�O����
        MOV     BP, table               ;BP=table��}
loop2:
        strncmp key, BP, lenkey, result ;key�P�O������
        CMP     WORD [result], 0        ;�O�_�ۦP?
        JE      equal                   ;�O,����equal
        ADD     BP, [lenkey]            ;BP=BP+�����
        ADD     BP, [lendata]           ;BP=BP+��ƪ���
        LOOP    loop2                   ;�~��j��
notfound:
        dispstr msgerr                  ;�䤣��,��ܿ��~
        JMP     endjob                  ;����
equal:
        ADD     BP, [lenkey]            ;BP=BP+�����
        strncpy data, BP, lendata       ;�N��ƫ�����data
        dispstr msgdata                 ;��ܸ��
endjob:
        MOV     AX, 4c00H
        INT     21H
