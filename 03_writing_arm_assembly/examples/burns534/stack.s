.text
.globl _s_create
.globl _s_push
.globl _s_pop
.globl _s_top
.globl _s_destroy
.globl _s_start_iterator
.globl _s_next

.equ DEFAULT_STACK_CAP, 8 ; 8 quads
.equ STACK_SIZE, 4 + 4 + 8 + 4

.p2align 2

; stack requires 20 bytes.
; word top      +0
; word capacity +4
; quad data     +8
; word iterator +16

; return stack in x0
_s_create:
    stp fp, lr, [sp, -32]!
    str x19, [sp, 16]
    ; initialize memory to zero for
    mov x0, STACK_SIZE
    bl _malloc
    mov x19, x0 ; store for later in x19

    mov w1, -1 ; top to -1 to start
    str w1, [x0] ; set count to zero

    mov w1, DEFAULT_STACK_CAP
    str w1, [x0, 4] ; set capacity

    str wzr, [x0, 16] ; set iterator 0

    ; allocate data
    mov w0, w1
    mov w1, 8 ; quads
    bl _calloc
    str x0, [x19, 8] ; assign pointer to stack structure
    mov x0, x19 ; return stack pointer from this procedure

    ldr x19, [sp, 16]
    ldp fp, lr, [sp], 32
    ret

; accept stack in x0
; quad value in x1
_s_push: ; cannot clobber x12
    stp fp, lr, [sp, -32]!
    stp x19, x20, [sp, 16]

    mov x19, x0 ; use x19 for stack
    mov x20, x1 ; use x20 for value

    ; load stack count and check if need to resize
    ldr w8, [x19] ; load count
    ldr w9, [x19, 4] ; load cap
    cmp w9, w8, lsl 1 ; compare cap to top times two
    bgt 0f ; if it's greater, do nothing, otherwise resize
    ; resize here
    lsl w9, w9, 1 ; double cap
    str w9, [x19, 4] ; store new cap

    ; call realloc
    ldr x0, [x19, 8] ; load current data address
    sxtw x1, w9 ; sign extend new size to x1 for argument
    ; use quad alignment for new size
    lsl x1, x1, 3
    bl _realloc
    str x0, [x19, 8] ; store new pointer
0:
    ; insert here
    ; load pointer to data
    ldr x8, [x19, 8]
    ldr w9, [x19] ; load count
    sxtw x9, w9 ; sign extend w1 to x1
    add x9, x9, 1 ; increment
    str w9, [x19] ; write new count
    str x20, [x8, x9, lsl 3] ; store value in data at count offset with quad alignment

; guarantee next element is zero
    add x9, x9, 1
    str xzr, [x8, x9, lsl 3]

    ldp x19, x20, [sp, 16]
    ldp fp, lr, [sp], 32
    ret
; accept stack in x0
; return value in x0
_s_pop: ; cannot clobber x12
    ; load current count
    ldr w8, [x0]
    ; guard to make sure stack isn't empty
    cmp w8, -1
    bgt 0f
    mov x0, xzr ; return zero
    ret
0:
    sxtw x10, w8
    ldr x9, [x0, 8] ; data
    ldr x11, [x9, x10, lsl 3] ; access value at top of stack, x0 for return
    str xzr, [x9, x10, lsl 3] ; overwrite value with zero
    subs w8, w8, 1 ; decrement top
    str w8, [x0] ; write new top
    mov x0, x11 ; return value
    ret
; stack in x0
; value in x0
_s_top: ; cannot clobber x12
    ldr w8, [x0]
    cmp w8, -1
    bgt 0f
    mov x0, xzr ; return zero
    ret
0:
    ; load current top
    ldr x9, [x0, 8]
    ldr x0, [x9, x8, lsl 3]
    ret

; stack in x0
; simply deallocates stack and its data
_s_destroy:
    stp fp, lr, [sp, -32]!
    str x19, [sp, 16]

    mov x19, x0 ; save
    
    ldr x0, [x0, 8]
    bl _free

    mov x0, x19
    bl _free

    ldr x19, [sp, 16]
    ldp fp, lr, [sp], 32
    ret

; stack in x0
_s_start_iterator:
    str wzr, [x0, 16] ; set iterator to bottom of stack
    ret

; stack in x0
_s_next:
    ldr w8, [x0, 16] ; load iterator
    sxtw x8, w8
    ldr x1, [x0, 8] ; data
    ldr x1, [x1, x8, lsl 3] ; load return value
    add w8, w8, 1
    str w8, [x0, 16] ; update iterator
    mov x0, x1
    ret


