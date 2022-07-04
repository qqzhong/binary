
#include <stdio.h>

int main( int argc, char* argv[] )
{   
   double a[3][6];	// Define 2 dim array
   int    i, j;
    
   for ( i = 0; i < 3; i++ )
      for ( j = 0; j < 6; j++ )
         a[i][j] = i+j;
    
   for ( i = 0; i < 3; i++ )
   {
      for ( j = 0; j < 6; j++ )
         printf( "%lf ", a[i][j] );       

      printf( "\n" );
   }
}     
