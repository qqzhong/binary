; ************************ datetab.asm *******************
;
; �I�s 21H ���_�\�� AH=0aH �ɶǦ^�U�C�ȡG
;
;   AL = day of week (sunday=0) �P���Ѽ�(�P���鬰0��_)
;   CX = year (1980-2099)       �~��
;   DH = month (01-12)          ���
;   DL = day (01-31)            ���
;
          ORG   0100H
          JMP   start
lenmon    DW    3
montab    DB    'Jan', 'Feb', 'Mar', 'Apr'
          DB    'May', 'Jun', 'Jul', 'Aug'
          DB    'Sep', 'Oct', 'Nov', 'Dec'
month     DW    0
;
lenweek   DW    9
weektab   DB    'Sunday   ', 'Monday   ', 'Tuesday  ',
          DB    'Wednesday', 'Thursday ', 'Friday   '
          DB    'Saturday '
week      DW    0
year      DW    0
day       DW    0
;
msg       DB    'current date & time = ', '$'
monthstr  DB    '    ', '$'
weekstr   DB    '          ', '$'
blank     DB    ' $'
;
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\strncpy.mac"
%include "..\mymacro\dispi.mac"
;
start:
      MOV     AH, 2aH                ;�]�w���o����\��
      INT     21H                    ;���o���
      MOV     BYTE [week], AL        ;�N�P���Ʀs�Jweek
      MOV     WORD [year], CX        ;�N�~�Ʀs�Jyear
      MOV     BYTE [month], DH       ;�N����Ʀs�Jmonth
      MOV     BYTE [day], DL         ;�N��Ʀs�Jday
;
      MOV     AX, [month]            ;AX=�����
      DEC     AX                     ;�q0��_
      MOV     BX, [lenmon]           ;BX=����������
      MUL     BX                     ;AX=(�����-1)*�����
      MOV     BP, montab             ;BP=montab��}
      ADD     BP, AX                 ;BP=montab��}+AX
                                     ;�N��쪺����W��
      strncpy  monthstr, BP, lenmon  ;������monthstr�B
;
      MOV     AX, WORD [week]        ;AX=�P����(�q0��_)
      MOV     BX, WORD [lenweek]     ;BX=�P���������
      MUL     BX                     ;AX=(�P����-1)*�����
      MOV     BP, weektab            ;BP=weektab��}
      ADD     BP, AX                 ;BP=weektab��}+AX
                                     ;�N��쪺�P���W��
      strncpy  weekstr, BP, lenweek  ;������weekstr�B
      dispstr  msg                   ;���msg�H��
      dispstr  weekstr               ;�P���W��
      dispstr  monthstr              ;����W��
      dispi    day                   ;���
      dispstr  blank
      dispi    year                  ;�~��
      MOV      AX, 4c00H
      INT      21H
