; ************************ avgbyte.asm ********************
        ORG   0100H
        JMP   start
msg     DB    13, 10, 'keyin an integer(-128..127) : ', '$'
s       TIMES 81 DB ' '
;
num1    DB    0
num2    DB    0
num3    DB    0
avg     DB    0
sum     DW    0
;
msgsum  DB    13, 10, 'sum = '
sumstr  DB    '       ', '$'
msgavg  DB    13, 10, 'average = '
avgstr  DB    '       ', '$'
;
%include "../mymacro/readstr.mac"
%include "../mymacro/strtob.mac"
%include "../mymacro/btostr.mac"
%include "../mymacro/itostr.mac"
;
start:  MOV     DX, msg          ;���msg�r��
        MOV     AH, 09H
        INT     21H
        readstr s
        strtob  s, '$', num1     ;�N�r��s�ഫ���ƭ�num1
;
        MOV     DX, msg          ;���msg�r��
        MOV     AH, 09H
        INT     21H
        readstr s
        strtob  s, '$', num2     ;�N�r��s�ഫ���ƭ�num2
;
        MOV     DX, msg          ;���msg�r��
        MOV     AH, 09H
        INT     21H
        readstr s
        strtob  s, '$',num3      ;�N�r��s�ഫ���ƭ�num3
;
        MOVSX   AX, [num1]       ;AX=num1
        ADD     [sum], AX        ;sum=sum+num1
        MOVSX   AX, [num2]       ;AX=num2
        ADD     [sum], AX        ;sum=sum+num2
        MOVSX   AX, [num3]       ;AX=num3
        ADD     [sum], AX        ;sum=sum+num3
        itostr  sum, sumstr, '$' ;�Nsum�ন�Q�i��Ʀr
        MOV     DX, msgsum       ;���sum
        MOV     AH, 09H
        INT     21H
;
        MOV     AX, [sum]        ;AX=sum
        MOV     BL, 3            ;BL=3
        DIV     BL               ;sum/3
        MOV     [avg], AL        ;avg=sum/3
        btostr  avg, avgstr, '$' ;�Navg�ন�Q�i��Ʀr
        MOV     DX, msgavg       ;���avg
        MOV     AH, 09H
        INT     21H
        MOV     AX, 4c00H
        INT     21H
