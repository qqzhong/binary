; ******************** readestr.asm ********************
        ORG    0100H
        JMP    start
msg     DB     'keyin a string (end with Enter) : ', '$'
newline DB     13, 10, '$'
buf     DB     80
n       DB     0
s       TIMES  81  DB  ' '
space   DB     ' '
;
%include "..\mymacro\readestr.mac"
%include "..\mymacro\showbyte.mac"
%include "..\mymacro\dispchr.mac"
%include "..\mymacro\dispstr.mac"
;
start:  dispstr  msg        ;���msg�r��
        readestr 10, buf    ;�q��L��J�̦h10�Ӧr����buf
        dispstr  newline    ;���C
        MOV      CX, 10+3   ;13��(�h�Xbuf,n,0D�줸��)
        MOV      SI, 0      ;�U�@�Ӧ줸�զ�m
repeat:
        showbyte buf+SI     ;��ܤU�@�Ӧ줸�դ��t(16�i��)
        dispchr  space      ;�Ť@��
        INC      SI         ;���V�U�@�Ӧ줸��
        LOOP     repeat     ;���ư���@13��
        MOV      AX, 4c00H
        INT      21H
