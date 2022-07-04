
#include <stdio.h>

extern double a[][5]; 

void func( )
{
   int i, j;

   for ( i = 0; i < 3; i++ )
   {
      for ( j = 0; j < 5; j++ )
         printf("a[%d][%d] = %lf  ",
                          i, j, a[i][j]);   
      putchar('\n');
   }
}

