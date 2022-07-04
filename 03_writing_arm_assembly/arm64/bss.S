/* Defining Data: BSS Section
static char c;
static short s;
static int i;
static long l;

Notes:
.section instruction (to announce BSS section)
.skip instruction

 */

 .section ".bss"
c:
.skip 1
s:
.skip 2
i:
.skip 4
l:
.skip 8
