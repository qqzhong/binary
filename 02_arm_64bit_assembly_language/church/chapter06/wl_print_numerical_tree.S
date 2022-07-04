Listing 6.11 AArch64 assembly implementation of wl_print_numerical with a tree.
### Definitions for the wordlistnode type
.equ wln_word, 0 // word field
.equ wln_count, 8 // count filed
.equ wln_left, 16 // left field
.equ wln_right, 24 // right field
.equ wln_height, 32 // height of this node
.equ wln_size, 40 // sizeof(wordlistnode)
### Definitions for the wordlist type

.equ wl_nwords, 0 // number of words in list
.equ wl_head, 8 // head of linked list
.equ wl_size, 16 // sizeof(wordlist)
### Define NULL
.equ NULL, 0
.data
failstr:.asciz "Unable to allocate index\n"
fmtstr: .asciz "%10d ’%s’\n"
.text
### ----------------------------------------------------------
### Recursively traverses the tree, filling in the array of
### pointers.
### wordlistnode **getptrs(wordlistnode *ptrs[], wordlistnode *node)
.type getptrs, %function
getptrs:
cmp x1, #0 // if (node == NULL)
beq getptrs_exit // return ptrs;
stp x29, x30, [sp, #-32]!
str x19, [sp, #16]
mov x19, x1 // save address of node
// ptrs = getptrs(ptrs, node->left)
ldr x1, [x19, #wln_left]
bl getptrs
// *(ptrs++)=node
str x19, [x0], #8
// return getptrs(ptrs, node->right)
ldr x1, [x19, #wln_right]
bl getptrs
ldr x19, [sp, #16]
ldp x29, x30, [sp], #32
getptrs_exit:
ret
.size getptrs,(. - getptrs)
### ----------------------------------------------------------
### wl_print_numerical prints a table showing the number
### of occurrences for each word, followed by the word,
### sorted in reverse order of occurence.
### void wl_print_numerical(wordlist *list)
.type wl_print_numerical, %function
.global wl_print_numerical
wl_print_numerical:
stp x29, x30, [sp, #-48]!
stp x19, x20, [sp, #16]
str x21, [sp, #32]
// wordlistnode **ptrs=malloc(list->nwords*sizeof(wordlistnode*));
mov x19, x0 // x19 = list
ldr w20, [x0, #wl_nwords] // w20 = list->nwords
lsl x0, x20, #3 // x0 = list->nwords*8
bl malloc // allocate storage
// check return value
cmp x0, #0
bne malloc_ok
adr x0, failstr // load pointer to string
bl printf
mov w0, #1
ldr x21, [sp, #32]
ldp x19, x20, [sp, #16]
ldp x29, x30, [sp], #48
bl exit // exit(1)
malloc_ok:
// getptrs(ptrs, list->root)
yp
mov x21, x0 // x21 = ptrs
ldr x1, [x19, #wl_head] // x1 = list->root
bl getptrs // fill in the pointers
// wl_quicksort(**start, **end)
mov x0, x21 // get pointer to array
add x1, x0, x20, lsl #3 // get pointer to end of array
sub x1, x1, #8
bl wl_quicksort // re-sort the array of pointers
// Print the word frequency list.
mov x19, #0 // do a for loop
// for(i = 0; i < list->nwords; i++)
loop: cmp x19, x20
bge done
// printf("%10d ’%s’\n", ptrs[i]->count, ptrs[i]->word)
adr x0, fmtstr
ldr x3, [x21, x19, lsl #3] // get next pointer
add x19, x19, #1
ldr w1, [x3, #wln_count] // load count
ldr x2, [x3, #wln_word] // load ptr to word
bl printf
b loop
done:
ldr x21, [sp, #32]
ldp x19, x20, [sp, #16]
ldp x29, x30, [sp], #48
ret
.size wl_print_numerical,(. - wl_print_numerical)
### ----------------------------------------------------------
### function wl_quicksort(wln **left,wln **right) quicksorts
### the array of pointers in order of the word counts
.type wl_quicksort, %function
wl_quicksort:
cmp x0, x1
bge wl_quicksort_exit // return if length<=1
stp x29, x30, [sp, #-48]!
stp x19, x20, [sp, #16]
stp x21, x22, [sp, #32]
ldr x12, [x0] // use count of first item as
ldr w12, [x12, #wln_count] // pivot value in x12
mov x19, x0 // current left
mov x20, x1 // current right
mov x21, x0 // original left(first)
mov x22, x1 // original right(last)
loopa: cmp x19, x20 // while left <= right &&

bgt finale
ldr x0, [x19] // (*left)->count > pivot
ldr w1, [x0, #wln_count]
cmp x1, x12
ble loopb
add x19, x19, #8 // increment left
b loopa
loopb: cmp x19, x20 // while left < right &&
bgt finale
ldr x2, [x20] // (*right)->count < pivot
ldr w3, [x2, #wln_count]
cmp x3, x12
bge cmp
sub x20, x20, #8 // decrement right
b loopb
cmp: cmp x19, x20 // if( left <= right )
bgt finale
str x0, [x20], #-8 // swap pointers and
str x2, [x19], #8 // change indices
b loopa
finale: mov x0, x21 // quicksort array from
mov x1, x20 // first to current right
bl wl_quicksort
mov x0, x19 // quicksort array from
mov x1, x22 // current left to last)
bl wl_quicksort
ldp x19, x20, [sp, #16]
ldp x21, x22, [sp, #32]
ldp x29, x30, [sp], #48
wl_quicksort_exit:
ret
.size wl_quicksort,(. - wl_quicksort)

