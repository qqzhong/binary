/* -------------------------
   Testing a certain bit
   ------------------------- */

#include <stdio.h>

int main( int argc, char* argv[] )
{
   char a = 31;         /* a = 00011111 (= 31) */


   if ( (a & 0b00001000) == 0 )
      printf( "bit is 0\n" );
   else
      printf( "bit is 1\n" );
}
