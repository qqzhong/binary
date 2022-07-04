// Simple GNU syntax example Comments
//
// Iterate round a loop 10 times, adding 1 to a register each time.

      .section .text,"x"     // Sections
      .balign 4

main:                          // Labels
      MOV      w5,#0x64      // W5 = 100  Numeric literals
      MOV      w4,#0         // W4 = 0
      B        test_loop     // branch to test_loop
loop:
      ADD      w5,w5,#1      // Add 1 to W5
      ADD      w4,w4,#1      // Add 1 to W4
test_loop:
      CMP      w4,#0xa       // if W4 < 10, branch back to loop
      BLT      loop
      .end                   // Miscellaneous directives
