

#include <stdio.h>

void update( double a )
{
   printf( "Inside update - before changing a, a = %lf\n", a);
   a = a + 1;
   printf( "Inside update - AFTER  changing a, a = %lf\n", a);
}

int main( int argc, char* argv[] )
{
   double a = 3.14;

   printf( "Inside main - before calling update(a), a = %lf\n", a);
   update ( a );
   printf( "Inside main - AFTER  calling update(a), a = %lf\n", a);
}
