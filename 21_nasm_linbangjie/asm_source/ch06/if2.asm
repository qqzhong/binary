; ************************ if2.asm ***********************
        ORG   0100H
        JMP   start
msg     DB    'please keyin a character : ', '$'
newline DB    13, 10, '$'
msgchar DB    "the result character = '"
ch2     DB    ' ', "'", 13, 10, '$'
start:
        MOV   DX, msg               ;���msg�r��
        MOV   AH, 09H
        INT   21H
        MOV   AH, 01H               ;�q��L��J�@�r����AL
        INT   21H
        MOV   [ch2], AL             ;�NAL�r��������ch2�ܼ�
;
        MOV   DX, newline              ;���C
        MOV   AH, 09H
        INT   21H
;
        MOV   AL, [ch2]             ;����ch2�ܼƭȦ�AL
        CMP   AL, 'a'               ;AL���t�ȻP'a'���
        JNE   next                  ;���۵��ɸ���next
        MOV   BYTE [ch2], 'A'       ;�۵��ɱNch2�ഫ��'A'
next:
        MOV   DX, msgchar           ;�H�r���覡���ch2
        MOV   AH, 09H
        INT   21H
        MOV   AX, 4c00H
        INT   21H
