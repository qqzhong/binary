Listing 6.8 AArch64 assembly implementation of wl_print_numerical.
### Definitions for the wordlistnode type
.equ wln_word, 0 // word pointer field
.equ wln_count, 8 // count field and padding
.equ wln_next, 16 // next pointer field
.equ wln_size, 24 // sizeof(wordlistnode)
### Definitions for the wordlist type
.equ wl_nwords, 0 // number of words in list and padding
.equ wl_head, 8 // head of linked list
.equ wl_size, 16 // sizeof(wordlist)
### Define NULL
.equ NULL,0
### ----------------------------------------------------------
### The sort_numerical function sorts the list of words in
### reverse by number of occurrences, and returns a
### pointer to the head of the re-ordered list.
### Records with identical counts will maintain their
### original ordering with respect to each other.
### x0 holds head of source list (head)
### x1 holds destination list (dest)
### x2 holds pointer to node currently being moved (node)
### x3 holds pointer to current node in destination list (curr)
### x4 holds pointer to previous node in destination list (prev)
### w5 holds count of current node in destination list
### w6 holds count of node currently being moved
.type sort_numerical, %function
sort_numerical:
stp x29, x30, [sp, #-16]!
mov x1, #NULL // initialize new list to NULL
## loop until source list is empty
loopa: cmp x0, #NULL

beq endloopa
## detatch first node from source list
mov x2, x0 // node <- head
ldr w5, [x2, #wln_count] // load count for node
ldr x0, [x0, #wln_next] // head <- head->next
## find location to insert into destination list
mov x3, x1 // curr <- dest
mov x4, #NULL // prev <- NULL
loopb: cmp x3, #NULL // Reached end of list?
beq found
ldr w6, [x3, #wln_count] // load count for curr
cmp w5, w6 // compare with count for node
bgt found
mov x4, x3 // previous <- current
ldr x3, [x3, #wln_next] // current <- current->next
b loopb
## insert into destination list at current location
found: str x3, [x2, #wln_next] // node-> next <- current
cmp x4, #NULL // if prev == NULL
## repeat with next list item
csel x1, x2, x1, eq // dest <- node
beq loopa
str x2, [x4, #wln_next] // else prev->next <- node
b loopa
endloopa:
mov x0, x1 // return dest (sorted list)
ldp x29, x30, [sp], #16
ret
.size sort_numerical, (. - sort_numerical)
### ----------------------------------------------------------
### wl_print_numerical prints a table showing the number
### of occurrences for each word, followed by the word,
### sorted in reverse order of occurence.
.type wl_print_numerical, %function
.global wl_print_numerical
wl_print_numerical:
stp x29, x30, [sp, #-32]!
str x0, [sp, #16] // save pointer to wordlist
ldr x0, [x0, #wl_head] // load pointer to the linked list
bl sort_numerical // re-sort the list
ldr x1, [sp, #16] // load pointer to wordlist
str x0, [x1, #wl_head] // update list pointer
mov x0, x1 // prepare to print
bl wl_print // print the sorted list
ldp x29, x30, [sp], #32 // restore FP & LR
ret // return
.size wl_print_numerical, (. - wl_print_numerical)
