.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\msvcrt.lib

.data
    Str1  db   "Move disk from peg %d to peg %d", 13, 10, 0
    n     dd   4


.code
start:


    push    n
    pushd   1
    pushd   3
    call   hanoi
    add    esp, 4

    invoke ExitProcess, 0
 



;; --------------------------------------

hanoi:
    push  ebp		;; Save frame pointer
    mov   ebp, esp	;; Make my own frame pointer
    sub   esp, 4        ;; One local

;; +---------+ [ebp - 4]
;; | local   |
;; +---------+ [ebp]
;; |    fp   |
;; +---------+ [ebp + 4]
;; | ret addr|
;; +---------+ [ebp + 8]
;; | targetP |
;; +---------+ [ebp + 12]
;; | srcPeg  |
;; +---------+ [ebp + 16]
;; |  ndisk  |
;; +---------+

    mov   eax, [ebp + 16]	;; Get n in eax
    cmp   eax, 1		;; test n == 0

    jne   else1

    ;; Print "move disk from peg SrcPeg to targetPeg"

    mov   eax, [ebp + 8]
    push  eax			;; Push targetP
    mov   eax, [ebp + 12]
    push  eax			;; Push srcPeg
    mov   eax, offset Str1
    push  eax			;; Push print string
    call  crt_printf
    add   esp, 12

    mov   esp, ebp	;; De-allocate local variable (if any)
    pop   ebp		;; Restore frame pointer for caller
    ret			;; return

else1:

    ;; helpPeg = 6 - srcPeg - targetPeg
    mov   eax, 6
    sub   eax, [ebp + 12]
    sub   eax, [ebp + 8]
    mov   [ebp - 4], eax

    ;; Hanoi( ndisk-1, srcPeg, helpPeg)
    mov   eax, [ebp + 16]
    sub   eax, 1
    push  eax
    pushd [ebp + 12]
    pushd [ebp - 4]
    call  hanoi
    add   esp, 12

    ;; Print "move disk from peg SrcPeg to targetPeg"
    mov   eax, [ebp + 8]
    push  eax			;; Push targetP
    mov   eax, [ebp + 12]
    push  eax			;; Push srcPeg
    mov   eax, offset Str1
    push  eax			;; Push print string
    call  crt_printf
    add   esp, 12

    ;; Hanoi( ndisk-1, helpPeg, targetPeg)
    mov   eax, [ebp + 16]
    sub   eax, 1
    push  eax
    pushd [ebp - 4]
    pushd [ebp + 8]
    call  hanoi
    add   esp, 12


    mov   esp, ebp	;; De-allocate local variable 
    pop   ebp		;; Restore frame pointer for caller
    ret			;; return
    

end start
