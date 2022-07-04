// FILE: main.s
// This program reads from three buttons connected to GPIO3-5, and
// controls three leds connected to GPIO0-2. The main loop runs
// continuously.
  .global main
main: stp x29, x30, [sp, #-16]! // push lr and x29
  // Set the GPIO pins
  mov x0,#22 // Pin 0
  bl GPIO_dir_output // set for output
  mov x0,#23 // Pin 1
  bl GPIO_dir_output // set for output
  mov x0,#24 // Pin 2
  bl GPIO_dir_output // set for output
  mov x0,#25 // Pin 3
  bl GPIO_dir_input // set for input
  mov x0,#26 // Pin 4
  bl GPIO_dir_input // set for input
  mov x0,#27 // Pin 5
  bl GPIO_dir_input // set for input
  // Main loop just reads buttons and updates the LEDs.
loop:
  // Read the state of the inputs and
  // set the ouputs to the same state.
  mov x0,#22 // Pin 22
  bl GPIO_get_pin // read it
  mov x1,x0 // copy pin state to x1
  mov x0,#25 // Pin 25
  bl GPIO_set_pin // write it
  mov x0,#23 // Pin 23
  bl GPIO_get_pin // read it
  mov x1,x0 // copy pin state to i1
  mov x0,#26 // Pin 26
  bl GPIO_set_pin // write it
  mov x0,#24 // Pin 24
  bl GPIO_get_pin // read it
  mov x1,x0 // copy pin state to x1
  mov x0,#27 // pin 27
  bl GPIO_set_pin // write it
  b loop
  // We should never return, but just in case...
  ldp x29, x30, [sp],#16 // pop lr and x29
  ret
