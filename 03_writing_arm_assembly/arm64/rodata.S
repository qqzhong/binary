/*
Defining Data: RODATA Section

…
…"hello\n"…;
…

Notes:
.section instruction (to announce RODATA section)
.string instruction

*/

.section ".rodata"
helloLabel:
.string "hello\n"
