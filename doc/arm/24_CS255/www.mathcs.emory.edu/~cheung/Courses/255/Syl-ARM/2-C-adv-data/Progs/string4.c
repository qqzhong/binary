

#include <stdio.h>

void print1( char x[] )
{
   printf( "print1: string x = %s\n", x);
}

void print2( char *x )
{
   printf( "print2: string x = %s\n", x);
}



int main(int argc, char *argv[])
{
   char a[10] = "Hello";

   print1( a );
   print2( a );
   
}
