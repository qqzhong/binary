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
    Str1  db "input = %d", 13, 10, 0
    Str2  db "return value = %d", 13, 10, 0
    Str3  db "fac = %d", 13, 10, 0
    n     dd  4


.code
start:


    push   n
    call   fac
    add    esp, 4

    push   eax
    push   offset Str3
    call   crt_printf
    add    esp, 8

    invoke ExitProcess, 0
 



;; --------------------------------------

fac:
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
;; |   n     |
;; +---------+


    mov   eax, [ebp + 8]	;; Get n in eax
    cmp   eax, 0		;; test n == 0

    jne   else1

    mov   eax, 1	;; Return 1

    mov   esp, ebp	;; De-allocate local variable (if any)
    pop   ebp		;; Restore frame pointer for caller
    ret			;; return

else1:

    mov   eax, [ebp + 8]
    sub   eax, 1		;; pass (n - 1)
    push  eax
    call  fac
    add   esp, 4

    mov   [ebp - 4], eax	;; local = fac(n-1)


    mov   eax, [ebp - 4]
    mov   edx, [ebp + 8]
    imul  dx

    ROL   edx, 16
    mov   dx, ax

    mov   eax, edx	;; Return value is not in eax


    mov   esp, ebp	;; De-allocate local variable 
    pop   ebp		;; Restore frame pointer for caller
    ret			;; return
    

end start
