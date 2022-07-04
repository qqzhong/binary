/* -------------------------
   Left and right shifts
   ------------------------- */

#include <stdio.h>

int main( int argc, char* argv[] )
{
   char a = 1;          /* a = 00000001 (= 1) */

   a = a << 1;          /* Now: a = 00000010 (= 2) */
   printf( "a =  %d\n", a  );
    
   a = a << 1;          /* Now: a = 00000100 (= 4) */
   printf( "a =  %d\n", a  );
    
   a = a >> 1;          /* Now: a = 00000010 (= 2) */
   printf( "a =  %d\n", a  );
    
   a = a >> 1;          /* Now: a = 00000001 (= 1) */
   printf( "a =  %d\n", a  );
    
   a = a >> 1;          /* Now: a = 00000001 (= 0) */
   printf( "a =  %d\n", a  );
    
}
