; *********************** avgary.asm *********************
        ORG   0100H
        JMP   start
msg     DB    13, 10, 'keyin an integer(-128..127) : ', '$'
s       TIMES 81 DB ' '
;
number  DB    0
num     DB    0, 0, 0
avg     DB    0
sum     DW    0
numptr  DW    num
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
        MOV     CX, 3
        MOV     SI, 0
label:
        MOV     DX, msg           ;���msg�r��
        MOV     AH, 09H
        INT     21H
        readstr s                 ;��J�@�Ӧr���s
        strtob  s, '$', number    ;�r��s�ഫ�����
;
        MOV     AL, BYTE [number] ;AL=number
        MOV     BYTE [num+SI], AL ;�s�Jnum��SI�Ӽ�
        INC     SI                ;SI=SI+1
        DEC     CX                ;CX=CX-1
        JCXZ    next              ;CX=0�ɸ��X
        JMP     label             ;�~��j��
next:
        MOV     CX, 3             ;CX=3
        MOV     SI, 0             ;SI=0
loop3:
        MOVSX   AX, BYTE [num+SI] ;AX=num��SI�Ӽ�
        ADD     WORD [sum], AX    ;�֥[��sum
        INC     SI                ;SI=SI+1
        LOOP    loop3             ;�~��j��
;
        btostr  sum, sumstr, '$'  ;�Nsum�ন�Q�i��Ʀr
        MOV     DX, msgsum        ;���sum
        MOV     AH, 09H
        INT     21H
;
        MOV     AX, [sum]         ;AX=sum
        MOV     BL, 3             ;BL=3
        DIV     BL                ;sum/3
        MOV     [avg], AL         ;avg=sum/3
        btostr  avg, avgstr, '$'  ;�Navg�ন�Q�i��Ʀr
        MOV     DX, msgavg        ;���avg
        MOV     AH, 09H
        INT     21H
        MOV     AX, 4c00H
        INT     21H
