
/* -----------------------------------------
   File containing the array definition
   ----------------------------------------- */

#include <stdio.h>


double a[10];		// Array definition

void func( );           // Declare function func( )

int main( int argc, char* argv[] )
{
   int i;

   for ( i = 0; i < 10; i++ )
      a[i] = i*i;

   func( );
}
