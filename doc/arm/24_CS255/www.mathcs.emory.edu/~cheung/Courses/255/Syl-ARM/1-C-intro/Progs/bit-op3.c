/* -------------------------
   Reset a certain bit
   ------------------------- */

#include <stdio.h>

int main( int argc, char* argv[] )
{
   char a = 31;         /* a = 00011111 (= 31) */

   // Clear the bit x: 000x1111
   // Use:             11101111 = NOT(00010000)
   a = a & (~0b00010000);       /* Now: a = 00001111 (= 15) */       
    
   printf( "a =  %d\n", a  );
    
   // Clear the bit x: 00001x11
   // Use:             11111011 = NOT(00000100)
   a = a & (~0b00000100);        /* Now: a = 00001011 (= 11) */
    
   printf( "a =  %d\n", a  );
}
