; ********************** dumpbios.asm ********************
        SEGMENT  code         ;�{���X���q
;
%include "../mymacro/showbyte.mac"
%include "../mymacro/dispchr.mac"
%include "../mymacro/newline.mac"
;
..start:                      ;�}�l�����}
        MOV  AX, data
        MOV  DS, AX           ;DS=data���q��}
        MOV  AX, mystack
        MOV  SS, AX           ;DS=stack���q��}
        MOV  SP, stacktop     ;SP=���|���ݫ���
;
        MOV      BL, 16
        MOV      CX, 256      ;CX=256
        MOV      SI, 0        ;SI=0
        MOV      AX, 0040H    ;�O����BIOS��}
        MOV      ES, AX       ;ES=0040H
repeat:
        MOV      AX, SI
        DIV      BL
        CMP      AH, 0             ;16������?
        JNE      next              ;�_
        newline                    ;���C
        MOV      WORD [offset], SI
        showbyte offset
        dispchr  colon
        dispchr  space
next:
        showbyte ES:SI      ;mem+SI��}�����t�H16�i�����
        dispchr  space      ;��ܪťզr��
        INC      SI         ;SI=SI+1���V�U�@�Ӧ줸��
;
        DEC      CX
        JCXZ     endjob
        JMP      repeat     ;���ư���
endjob:
        MOV   AX, 4c00H         ;��^�@�~�t��
        INT   21H
;---------------------------------------------------------
        SEGMENT data            ;��Ƥ��q
offset  DW      0
colon   DB      ':'
space   DB      ' '
;---------------------------------------------------------
        SEGMENT mystack stack   ;���|���q
        RESB  64
stacktop:
;---------------------------------------------------------
