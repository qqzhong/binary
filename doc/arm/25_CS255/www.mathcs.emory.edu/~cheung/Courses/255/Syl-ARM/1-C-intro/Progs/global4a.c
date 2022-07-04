
#include <stdio.h>

extern double x;

extern void func();

int main( int argc, char* argv[] )
{
   func();
   printf( "x = %lf\n", x );    /* Try to uses "static double x" */
}

