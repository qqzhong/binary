; ********************* beep.asm ***********************
      ORG   0100H
      JMP   start
msg   DB    'beep for 61H port, press Enter stop : ','$'
start:
      MOV   DX, msg         ;���msg�H��
      MOV   AH, 09H
      INT   21H
;
      IN    AL, 61H         ;AL=�q61H�𸹿�J�@�Ӧ줸��
      AND   AL, 11111100B   ;�N�줸0�Φ줸1�M����0��
beep:
      XOR   AL, 00000010B   ;�줸1�ȳv���b0�P1������
      PUSH  AX              ;�NAL�ȫO�s�b���|����
      OUT   61H, AL         ;�NAL�ȿ�X��61H��,beep�n
      MOV   CX, 0010H       ;CX=�j�馸��
loop2:
      NOP                   ;�S��
      LOOP  loop2           ;�j��
;
      MOV   AH, 0BH         ;���o��L��J���A�\��
      INT   21H             ;AL=���o��L��J���A
      CMP   AL, 00H         ;�S��J��AL=00H
;
      POP   AX              ;���^���|���ݭ�O�s����
      JE    beep            ;��L�S��J
;
      MOV   AX, 4c00H
      INT   21H
