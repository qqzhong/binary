// Local Variables and Stack Frames

#if 0
long example(long x, long y) {
    long a, b, c;
    b = 7;
    return x * b + y;
}
#endif
/*
                +----------+
         rsp-24 |    a     |
                +----------+
         rsp-16 |    b     |
                +----------+
         rsp-8  |    c     |
                +----------+
         rsp    | retaddr  |
                +----------+
         rsp+8  | caller's |
                | stack    |
                | frame    |
                | ...      |
                +----------+
*/
#if 0
// leaf
  .text
        .globl  example
example:
        movl    $7, -16(%rsp)
        mov     %rdi, %rax
        imul    8(%rsp), %rax
        add     %rsi, %rax
        ret
#endif


        .text
        .globl  example
example:
        sub     $24, %rsp
        movl    $7, 8(%rsp)
        mov     %rdi, %rax
        imul    8(%rsp), %rax
        add     %rsi, %rax
        add     $24, %rsp
        ret
