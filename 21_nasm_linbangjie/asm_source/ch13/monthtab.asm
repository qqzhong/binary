; ********************** monthtab.asm *******************
        ORG     0100H
        JMP     start
lenkey  DW      3
table   DB      'Jan', 'Feb', 'Mar', 'Apr'
        DB      'May', 'Jun', 'Jul', 'Aug'
        DB      'Sep', 'Oct', 'Nov', 'Dec'
monnum  DW      10
msg     DB      'keyin month number (1-12) : ', '$'
monstr  DB      '    ', '$'
msg2    DB      'name of month is = '
monname DB      '    ', '$'
;
%include "..\mymacro\readstr.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\strncpy.mac"
%include "..\mymacro\strtoi.mac"
;
start:
        dispstr msg                 ;���msg�H��
        readstr monstr              ;��J����ƭ�
        newline                     ;���C
        strtoi  monstr, '$', monnum ;�r���ഫ�ƭ�monnum
;
        MOV     AX, [monnum]        ;AX=�����
        DEC     AX                  ;�q0��_
        MUL     WORD [lenkey]       ;AX=(�����-1)*�����
        ADD     AX, table           ;AX=AX+table��}
        MOV     BP, AX              ;BP=AX
                                    ;�N��쪺����W��
        strncpy monname, BP, lenkey ;������monname�B
        dispstr msg2                ;��ܤ���W��
        MOV     AX, 4c00H
        INT     21H
