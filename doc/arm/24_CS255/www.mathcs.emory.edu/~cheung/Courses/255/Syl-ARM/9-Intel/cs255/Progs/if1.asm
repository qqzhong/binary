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
    Str1  db "%d >= %d", 13, 10, 0
    Str2  db "%d < %d", 13, 10, 0
    x     dd  40
    y     dd  6

.code
start:


    mov     eax, x
    mov     edx, y
    cmp     eax, edx    ;; x - y

    jl      Else1       ;; jump if x < y

    push y
    push x
    push offset Str1
    call crt_printf
    add  esp, 12

    jmp     Done

Else1:
    push y
    push x
    push offset Str2
    call crt_printf
    add  esp, 12

Done:
    
    invoke ExitProcess, 0

end start
