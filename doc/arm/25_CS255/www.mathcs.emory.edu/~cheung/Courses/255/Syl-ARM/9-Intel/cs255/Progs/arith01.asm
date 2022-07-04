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

i       dd   1
j       dw   3
Str1  db "Result = %d", 13, 10, 0


; -------------------------------------------
; Code segment
; -------------------------------------------
.code
start:

    mov  eax, 12
    push eax
    push offset Str1
    call crt_printf
    add  esp, 8

    mov  eax, 12
    mov  ebx, 2
    add  eax, ebx
    push eax
    push offset Str1
    call crt_printf
    add  esp, 8

    mov  eax, 12
    mov  ebx, 2
    sub  eax, ebx
    push eax
    push offset Str1
    call crt_printf
    add  esp, 8

    mov  eax, 10000
    mov  bx, 8888
    imul bx		;; Result is in DX:AX

    ROL  EDX, 16	;; Rotate EDX 16 bits to the LEFT
			;; This will put lower EDX in upper EDX
    mov  dx, ax		
    push edx
    push offset Str1
    call crt_printf
    add  esp, 8


    mov  ax, 18
    cwd			;; DX:AX = 18
    mov  bx, 7
    idiv bx		;; AX = quotient, DX = remainder

    cwde
    push eax
    push offset Str1
    call crt_printf
    add  esp, 8

    mov  ax, 18
    cwd			;; DX:AX = 18
    mov  bx, 7
    idiv bx		;; AX = quotient, DX = remainder

    mov  ax, dx
    cwde
    push eax
    push offset Str1
    call crt_printf
    add  esp, 8

    ; Exit....

    invoke ExitProcess, 0



end start


