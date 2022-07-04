

#include <stdio.h>


void func( double x[ ][5] )
{
   int i, j;

   for ( i = 0; i < 3; i++ )
   {
      for ( j = 0; j < 5; j++ )
         printf( "x[%d][%d] = %lf  ", i, j, x[i][j] );

      putchar('\n');
   }
}


int main( int argc, char* argv[] )
{
   double a[3][5];
   int    i, j;

   for ( i = 0; i < 3; i++ )
      for ( j = 0; j < 5; j++ )
         a[i][j] = i + j;

   func( a );
}
