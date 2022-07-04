
#include <stdio.h>

extern double a[]; 

void func( )
{
   int i;

   for ( i = 0; i < 10; i++ )
      printf("a[%d] = %lf\n", i, a[i]);
}

