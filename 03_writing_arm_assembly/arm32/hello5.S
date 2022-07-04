  .global main
  .global Stop, CodeEnd, DataStart, DataEnd


   .text
main:      // marks the start point of the program
   push    {lr}   // Save the return address on the stack
   push    {fp}   // Save the return address on the stack
                  // Explained later in CS255

  ldr     r0, =HelloStr
  //movw    r0, #:lower16:HelloStr
  //movt    r0, #:upper16:HelloStr

   bl      printf

   pop     {fp}   // Pop the frame pointer
   pop     {pc}   // Pop the return address
                  // Explained later in CS255
Stop:     // marks the stop point of the program
CodeEnd:  // mark the end of the code (= instructions)
   nop

   .data

DataStart:   // marks the start of the data
HelloStr:    // Label marking this location in memory
      .asciz "Hello World\n"  // ASCII codes for the string
DataEnd:     // marks the end of the data
      .end
