;
;  Copyright © 2017 Odzhan. All Rights Reserved.
;
;  Redistribution and use in source and binary forms, with or without
;  modification, are permitted provided that the following conditions are
;  met:
;
;  1. Redistributions of source code must retain the above copyright
;  notice, this list of conditions and the following disclaimer.
;
;  2. Redistributions in binary form must reproduce the above copyright
;  notice, this list of conditions and the following disclaimer in the
;  documentation and/or other materials provided with the distribution.
;
;  3. The name of the author may not be used to endorse or promote products
;  derived from this software without specific prior written permission.
;
;  THIS SOFTWARE IS PROVIDED BY AUTHORS "AS IS" AND ANY EXPRESS OR
;  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;  DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
;  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
;  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
;  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;  POSSIBILITY OF SUCH DAMAGE.
;
; -----------------------------------------------
; Chaskey-LTS Block Cipher in x86 assembly (Encryption only)
;
; size: 89 bytes
;
; global calls use cdecl conxention
;
; -----------------------------------------------

    bits 32

    global chaskey
    global _chaskey

    %define w0 eax
    %define w1 ebx
    %define w2 edx
    %define w3 ebp

chaskey:
_chaskey:
    pushad
    mov     edi, [esp+32+4]   ; edi = key
    mov     esi, [esp+32+8]   ; esi = data
    push    esi
    ; load plaintext
    lodsd
    xchg    eax, w3
    lodsd
    xchg    eax, w1
    lodsd
    xchg    eax, w2
    lodsd
    xchg    eax, w3
    ; pre-whiten
    xor     w0, [edi   ]
    xor     w1, [edi+ 4]
    xor     w2, [edi+ 8]
    xor     w3, [edi+12]
    push    16
    pop     ecx
L0:    
    ; x[0] += x[1];
    add     w0, w1           
    ; x[1]=ROTR32(x[1],27) ^ x[0];
    ror     w1, 27           
    xor     w1, w0
    ; x[2] += x[3];
    add     w2, w3
    ; x[3]=ROTR32(x[3],24) ^ x[2];
    ror     w3, 24
    xor     w3, w2
    ; x[2] += x[1];
    add     w2, w1
    ; x[0]=ROTR32(x[0],16) + x[3];
    ror     w0, 16
    add     w0, w3
    ; x[3]=ROTR32(x[3],19) ^ x[0];
    ror     w3, 19
    xor     w3, w0
    ; x[1]=ROTR32(x[1],25) ^ x[2];
    ror     w1, 25
    xor     w1, w2
    ; x[2]=ROTR32(x[2],16);
    ror     w2, 16
    loop    L0
    ; post-whiten
    xor     w0, [edi   ]
    xor     w1, [edi+ 4]
    xor     w2, [edi+ 8]
    xor     w3, [edi+12]
    pop     edi
    ; save ciphertext
    stosd
    xchg    eax, w1
    stosd
    xchg    eax, w2
    stosd
    xchg    eax, w3
    stosd
    popad
    ret
