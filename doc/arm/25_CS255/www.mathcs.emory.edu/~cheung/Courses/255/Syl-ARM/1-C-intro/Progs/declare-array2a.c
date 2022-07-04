
/* -----------------------------------------
   File containing the array definition
   ----------------------------------------- */

#include <stdio.h>


double a[3][5];		// Array definition

void func( );           // Declare function func( )

int main( int argc, char* argv[] )
{
   int i, j;

   for ( i = 0; i < 3; i++ )
       for ( j = 0; j < 5; j++ )
  	   a[i][j] = i + j;

   func( );
}
