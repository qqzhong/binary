
#include <stdio.h>

static double x;


void func()
{
   x = 12345;
   printf( "x = %lf\n", x );    /* uses "static double x" */
}

