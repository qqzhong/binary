; ************************* repeat2.asm ********************
          ORG   0100H
          JMP   start
msg       DB    'please keyin a string: ', '$'
newline   DB    13, 10, '$'
msg2      DB    'the string you just keyin = '
array     TIMES 80 DB ' '
start:
          MOV   DX, msg              ;���msg�r��
          MOV   AH, 09H
          INT   21H
          MOV   SI, -1               ;�r����m
label:
          INC   SI                   ;���V�U�@�Ӧ줸��
          MOV   AH, 01H              ;�q��L��J�@�r����AL
          INT   21H
          MOV   BYTE [array+SI], AL  ;�N��J���r���s�Jarray
          CMP   AL, 0dH              ;�O�_��Enter��
          JNE   label                ;���O,�~��j��
next:
          MOV   BYTE [array+SI], '$' ;array�H'$'����
          MOV   DX, newline          ;���C
          MOV   AH, 09H
          INT   21H
          MOV   DX, msg2             ;��ܿ�J�r��
          MOV   AH, 09H
          INT   21H
          MOV   AX, 4c00H
          INT   21H
