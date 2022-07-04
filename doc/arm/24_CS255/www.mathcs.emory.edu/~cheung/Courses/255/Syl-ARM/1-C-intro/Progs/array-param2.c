

#include <stdio.h>


void func( double x[ ] )
{
    x[0] = 4444;
    x[5] = 4444;
}


int main( int argc, char* argv[] )
{
   double a[10];
   int    i;

   for ( i = 0; i < 10; i++ )
      a[i] = i;

   printf( "Array before the function call:\n");
   for ( i = 0; i < 10; i++ )
      printf( "a[%d] = %lf\n", i, a[i] );

   func( a );

   printf( "\nArray AFTER the function call:\n");
   for ( i = 0; i < 10; i++ )
      printf( "a[%d] = %lf\n", i, a[i] );

}
