; ******************* dispenv.asm *****************
         ORG  0100H
         JMP  start
a        DD   1.5
b        DD   3.5
c        DD   5.5
msg0     DB   '  after FINIT', '$'
msg1     DB   '  after push ', '$'
msg2     DB   '  after pop  ', '$'
d        DD   0.0
;
%include "..\mymacro\dispenv.mac"
%include "..\mymacro\dispf.mac"
%include "..\mymacro\newline.mac"
%include "..\mymacro\dispstr.mac"
;
start:
         FINIT                    ;�B�I���|��l��
         dispstr     msg0
         newline
         dispenv                   ;�C�L���Ҧr��
         FLD      DWORD [a]       ;�|�Ja
         dispstr     msg1
         dispf     a, 1
         newline
         dispenv                   ;�C�L���Ҧr��
         FLD      DWORD [b]       ;�|�Jb
         dispstr     msg1
         dispf     b, 1
         newline
         dispenv                   ;�C�L���Ҧr��
         FLD      DWORD [c]       ;�|�Jc
         dispstr     msg1
         dispf     c, 1
         newline
         dispenv                   ;�C�L���Ҧr��
         FSTP     DWORD [d]       ;�|�X��d=c
         dispstr     msg2
         dispf     d, 1
         newline
         dispenv                   ;�C�L���Ҧr��
         FSTP     DWORD [d]       ;�|�X��d=b
         dispstr     msg2
         dispf     d, 1
         newline
         dispenv                   ;�C�L���Ҧr��
         FSTP     DWORD [d]       ;�|�X��d=a
         dispstr     msg2
         dispf     d, 1
         newline
         dispenv                   ;�C�L���Ҧr��
;
         MOV      AX, 4c00H
         INT      21H             ;��^�@�~�t��
