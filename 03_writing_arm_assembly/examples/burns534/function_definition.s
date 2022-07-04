.include "types.s"
.text
.p2align 2
.globl _function_definition

; tokens in x0
; cursor pointer in x1
; returns 1 if found
; called on func keyword
_function_definition:
    stp fp, lr, [sp, -64]!
    stp x21, x22, [sp, 48]
    stp x19, x20, [sp, 32]
    str x23, [sp, 16]

    mov x19, x0
    mov x23, x1 ; save cursor pointer
    ldr x20, [x23] ; load cursor
    add x20, x20, 1 ; skip func keyword
    bl _s_create ; create parameter stack
    mov x21, x0 

    ; check for identifier
    ldr x22, [x19, x20, lsl 3] ; save for later
    ldr x8, [x22]
    cmp x8, TS_IDENTIFIER
    bne _function_definition_runtime_error0

    add x20, x20, 1 ; increment cursor
    
    ; check for open paren
    ldr x8, [x19, x20, lsl 3]
    ldr x8, [x8]
    cmp x8, TS_OPEN_PAREN
    bne _function_definition_runtime_error1

    add x20, x20, 1 ; increment cursor
    ; now try to get all the parameters

0:
    ldr x9, [x19, x20, lsl 3]
    ldr x8, [x9]
    cmp x8, TS_IDENTIFIER
    bne 1f

    mov x0, x21
    ldr x1, [x9, 8]
    bl _s_push ; save identifier

    add x20, x20, 1 ; increment cursor
    ldr x8, [x19, x20, lsl 3]
    ldr x8, [x8]
    cmp x8, TS_CLOSE_PAREN
    beq 1f

    ; otherwise advance cursor again because it should be on a comma
    add x20, x20, 1
    b 0b

1:
    add x20, x20, 1 ; skip close paren

    ldr x8, [x19, x20, lsl 3]
    ldr x8, [x8]
    cmp x8, TS_OPEN_CURL_BRACE
    bne _function_definition_runtime_error2

    add x20, x20, 1 ; now create the function entry

    mov x0, x21 ; param stack
    mov x1, x20 ; entry point
    bl _create_function_entry

    mov x1, x0
    ldr x0, [x22, 8] ; load identifier
    bl _save_function_entry

; now advance cursor past the function body
    ; use x9 for nest depth
    mov x9, 1
0:
    ldr x8, [x19, x20, lsl 3]
    ldr x8, [x8]
    cmp x8, TS_OPEN_CURL_BRACE
    bne 1f
    add x9, x9, 1
    b 2f
1:
    cmp x8, TS_CLOSE_CURL_BRACE
    bne 2f
    subs x9, x9, 1
2:
    add x20, x20, 1 ; increment cursor
    ; check nest depth
    cbnz x9, 0b

    str x20, [x23] ; write cursor
50:
    mov x0, 1 ; return true

    ldr x23, [sp, 16]
    ldp x19, x20, [sp, 32]
    ldp x21, x22, [sp, 48]
    ldp fp, lr, [sp], 64
    ret

_function_definition_runtime_error0:
    adrp x0, function_def_error0@page
    add x0, x0, function_def_error0@pageoff
    str x8, [sp, -16]!
    bl _printf

    mov w0, 1
    bl _exit

_function_definition_runtime_error1:
    adrp x0, function_def_error1@page
    add x0, x0, function_def_error1@pageoff
    str x8, [sp, -16]!
    bl _printf

    mov w0, 1
    bl _exit

_function_definition_runtime_error2:
    adrp x0, function_def_error2@page
    add x0, x0, function_def_error2@pageoff
    str x8, [sp, -16]!
    bl _printf

    mov w0, 1
    bl _exit

.section __text,__cstring,cstring_literals
function_def_error0: .asciz "error: function_definition: expected identifier instead found %lu\n"
function_def_error1: .asciz "error: function_definition: expected ( instead found %lu\n"
function_def_error2: .asciz "error: function_definition: expected { instead found %lu\n"
debug_message: .asciz "about to save entry with key: %s\n"
debug_message1: .asciz "key value: %p\n"