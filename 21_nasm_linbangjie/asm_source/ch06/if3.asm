; *********************** if3.asm ***********************
          ORG   0100H
          JMP   start
msg       DB    'please keyin a char (A-F) : ', '$'
ch2       DB    ' '
newline   DB    13, 10, '$'
pass      DB    'pass', 13, 10, '$'
notpass   DB    'fail', 13, 10, '$'
start:
          MOV   DX, msg         ;���msg�r��
          MOV   AH, 09H
          INT   21H
          MOV   AH, 01H         ;�q��L��J�@�r����AL
          INT   21H
          MOV   [ch2], AL       ;�NAL�r��������ch2�ܼ�
;
          MOV   DX, newline     ;���C
          MOV   AH, 09H
          INT   21H
;
          MOV   AL, [ch2]       ;����ch2�ܼƭȦ�AL
          CMP   AL, 'D'         ;AL���t�ȻP'D'���
          JA    above           ;����'D'�ɸ���above
notabove:
          MOV   DX, pass        ;A/B/C/D���pass�r��,�ή�
          MOV   AH, 09H
          INT   21H
          JMP   next
above:
          MOV   DX, notpass     ;E/F���fail�r��,���ή�
          MOV   AH, 09H
          INT   21H
next:
          MOV   AX, 4c00H
          INT   21H
