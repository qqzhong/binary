
#include <stdio.h>

#include "func5b.h"


int main( int argc, char *argv[] )
{
   double a, b;

   a = 4.0;

   b = square( a );  // Call function square

   print( a );       // Call function print
   print( b );       // Call function print                  
}
