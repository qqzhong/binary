; *********************** rnd.asm **********************
;
        ORG   0100H
        JMP   start
msg1    DB    13, 10, '1 occurs times = ', '$'
msg0    DB    13, 10, '0 occurs times = ', '$'
sum1    DW    0
sum0    DW    0
randnum DW    0
;
%include "..\mymacro\dispui.mac"
%include "..\mymacro\dispstr.mac"
%include "..\mymacro\randgen.mac"
;
start:
      MOV      CX, 40000            ;4�U��
loop2:
      randgen  randnum              ;�H����randnum
      MOV      AX, WORD [randnum]   ;AX=�H����randnum
      TEST     AL, 00000001B        ;���ղ�0�줸
      JZ       next0                ;0��
      INC      WORD [sum1]          ;1��,�ֿnsum1
      JMP      next
next0:
      INC      WORD [sum0]          ;0��,�ֿnsum0
next:
      LOOP     loop2                ;����
;
      dispstr  msg1                 ;���msg1
      dispui   sum1                 ;���sum1
      dispstr  msg0                 ;���msg0
      dispui   sum0                 ;���sum0
;
      MOV      AX, 4c00H
      INT      21H
