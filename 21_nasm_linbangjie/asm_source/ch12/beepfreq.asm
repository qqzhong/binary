; ******************** beepfreq.asm ********************
;
;     �v���ܴ��n���W�v, ���� CX �ȧY�i�����W�v
;
      ORG   0100H
      JMP   start
msg   DB    'beep for 61H, press Enter stop : ','$'
start:
      MOV   DX, msg         ;���msg�H��
      MOV   AH, 09H
      INT   21H
;
      IN    AL, 61H         ;AL=�q61H�𸹿�J�@�Ӧ줸��
      AND   AL, 11111100B   ;�N�줸0�Φ줸1�M����0��
begin:
      MOV   BX, 07FFFH
beep:
      XOR   AL, 00000010B   ;�줸1�ȳv���b0�P1������
      PUSH  AX              ;�NAL�ȫO�s�b���|����
      OUT   61H, AL         ;�NAL�ȿ�X��61H��,beep�n
      MOV   CX, BX          ;CX=�j�馸��
loop2:
      NOP                   ;�S��
      LOOP  loop2           ;�j��
;
      MOV   AH, 0BH         ;���o��L��J���A�\��
      INT   21H             ;AL=���o��L��J���A
      CMP   AL, 0FFH        ;����J��AL=0FFH
      POP   AX              ;���^���|���ݭ�O�s����
      JE    endjob          ;��Ente�䵲��
;
      DEC   BX              ;BX=BX-1
      JZ    begin           ;BX=0�ɱq�s�]�w
      JMP   beep            ;��L�S��J�ɭ���beep�n
endjob:
      MOV   AX, 4c00H
      INT   21H
