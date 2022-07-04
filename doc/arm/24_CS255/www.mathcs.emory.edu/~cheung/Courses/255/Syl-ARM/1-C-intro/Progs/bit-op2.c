

/* ---------------------------
   Set a certain bit
   --------------------------- */

#include <stdio.h>

int main( int argc, char* argv[] )
{
   char a = 0;		/* 0 = 00000000 */
   
                        /* Bit pos:   76543210 */
   a = a |  4;          /*       4  = 00000100 */
   printf( "a =  %d\n", a  );

   a = a | 16;          /* 16      = 00010000 */
   printf( "a =  %d\n", a  );
}
