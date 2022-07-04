; ************************ avg4num.asm ********************
        ORG   0100H
        JMP   start
msg     DB    13, 10, 'keyin an integer(-128..127) : ', '$'
s       TIMES 81 DB ' '
;
count   DB    4
num     DB    0
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
start:
        MOVSX   CX, BYTE [count] ;CX=count��
label:
        MOV     DX, msg          ;���msg�r��
        MOV     AH, 09H
        INT     21H
        readstr s                ;��J�@�Ӧr���s
        strtob  s, '$', num      ;�N�r��s�ഫ���ƭ�num
        MOVSX   AX, [num]        ;AX=num
        ADD     [sum], AX        ;sum=sum+num
        DEC     CX               ;CX=CX-1
        JCXZ    next             ;CX=0�ɸ��X
        JMP     label            ;����count��
next:
        itostr  sum, sumstr, '$' ;�Nsum�ন�Q�i��Ʀr
        MOV     DX, msgsum       ;���sum
        MOV     AH, 09H
        INT     21H
;
        MOV     AX, [sum]        ;AX=sum
        MOV     BL, BYTE [count] ;BL=count
        DIV     BL               ;sum/3
        MOV     [avg], AL        ;avg=sum/3
        btostr  avg, avgstr, '$' ;�Navg�ন�Q�i��Ʀr
        MOV     DX, msgavg       ;���avg
        MOV     AH, 09H
        INT     21H
        MOV     AX, 4c00H
        INT     21H
