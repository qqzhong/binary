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

ArrayA  dd   1111, 2222, 3333, 4444
i       dd   1
Str1  db "Result = %d", 13, 10, 0


; -------------------------------------------
; Code segment
; -------------------------------------------
.code
start:

    mov  ebx, offset ArrayA
    mov  ebx, [ebx]
    push ebx
    push offset Str1
    call crt_printf
    add  esp, 8

    mov  ebx, offset ArrayA
    mov  ebx, [ebx+4]
    push ebx
    push offset Str1
    call crt_printf
    add  esp, 8

    mov  ebx, offset ArrayA
    mov  eax, i
    mov  ebx, [ebx + 4*eax]
    push ebx
    push offset Str1
    call crt_printf
    add  esp, 8

    mov  ebx, offset ArrayA
    mov  eax, i
    mov  ebx, [ebx + 4*eax + 4]
    push ebx
    push offset Str1
    call crt_printf
    add  esp, 8

    ; Exit....

    invoke ExitProcess, 0



end start


