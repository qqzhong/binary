; ************************ if4.asm ***********************
          ORG   0100H
          JMP   start
msg       DB    'please keyin a character (A-F) : ', '$'
ch2       DB    ' '
newline   DB    13, 10, '$'
msgA      DB    'score 90-100', 13, 10, '$'
msgB      DB    'score 80-89', 13, 10, '$'
msgC      DB    'score 70-79', 13, 10, '$'
msgD      DB    'score 60-69', 13, 10, '$'
msgE      DB    'score  0-59', 13, 10, '$'
start:
          MOV   DX, msg                     ;���msg�r��
          MOV   AH, 09H
          INT   21H
          MOV   AH, 01H         ;�q��L��J�@�r����AL
          INT   21H
          MOV   [ch2], AL       ;�NAL�r��������ch2�ܼ�
;
          MOV   DX, newline        ;���C
          MOV   AH, 09H
          INT   21H
;
          MOV   AL, [ch2]       ;����ch2�ܼƭȦ�AL
          CMP   AL, 'A'         ;AL���t�ȻP'A'���
          JE    labelA
          CMP   AL, 'B'         ;AL���t�ȻP'B'���
          JE    labelB
          CMP   AL, 'C'         ;AL���t�ȻP'C'���
          JE    labelC
          CMP   AL, 'D'         ;AL���t�ȻP'D'���
          JE    labelD
          JMP   labelE
labelA:
          MOV   DX, msgA        ;A�����90-100��
          MOV   AH, 09H
          INT   21H
          JMP   next
labelB:
          MOV   DX, msgB        ;B�����80-89��
          MOV   AH, 09H
          INT   21H
          JMP   next
labelC:
          MOV   DX, msgC        ;C�����70-79��
          MOV   AH, 09H
          INT   21H
          JMP   next
labelD:
          MOV   DX, msgD        ;D�����60-69��
          MOV   AH, 09H
          INT   21H
          JMP   next
labelE:
          MOV   DX, msgE        ;E�����0-59��
          MOV   AH, 09H
          INT   21H
next:
          MOV   AX, 4c00H
          INT   21H
