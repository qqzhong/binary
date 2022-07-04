.486
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\msvcrt.inc


includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\msvcrt.lib

include \masm32\macros\macros.asm

; -------------------------------------------
; Data segment
; -------------------------------------------
.data
Str1  db "Value = %d", 0


; -------------------------------------------
; Code segment
; -------------------------------------------
.code
start:

    mov  eax, 1234 	    ;; eax = 1234 (binary)   
    push eax                ;; Pass 1234 

    mov  eax, offset Str1   ;; eax = address of Str1
    push eax                ;; Pass parameter

    call crt_printf         ;; Call "printf"
    add  esp, 8		    ;; Pop parameters
    
    ; Exit....

    invoke ExitProcess, 0


end start


