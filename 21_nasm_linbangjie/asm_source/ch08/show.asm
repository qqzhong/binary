; *********************** show.asm *******************
        ORG    0100H
        JMP    start
a       DB     12H
b       DW     1234H
c       DD     12345678H
space   DB     ' '
;
%include "..\mymacro\showbyte.mac"
%include "..\mymacro\dispchr.mac"
;
start:  showbyte a        ;a��}���t�H16�i��Ʀr���
        dispchr space     ;�Ť@��
        showbyte b        ;b��}���t�H16�i��Ʀr���
        showbyte b+1      ;b+1��}���t�H16�i��Ʀr���
        dispchr space     ;�Ť@��
        showbyte c        ;c��}���t�H16�i��Ʀr���
        showbyte c+1      ;c+1��}���t�H16�i��Ʀr���
        showbyte c+2      ;c+2��}���t�H16�i��Ʀr���
        showbyte c+3      ;c+3��}���t�H16�i��Ʀr���
        MOV      AX, 4c00H
        INT      21H
