
#include <stdio.h>

int main( int argc, char* argv[] )
{
   char a = 0;		/* 0 = 00000000 */
   
                        /* Bit pos:   76543210 */
   a = a | 0b00000100;  /* Now:   a = 00000100 */
   printf( "a =  %d\n", a  );

   a = a | 0b00010000;  /* Now:   a = 00010100 */
   printf( "a =  %d\n", a  );
}
