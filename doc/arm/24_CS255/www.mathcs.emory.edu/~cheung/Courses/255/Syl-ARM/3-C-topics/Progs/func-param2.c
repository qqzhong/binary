
#include <stdio.h>


void f( char *s )      // f has a string parameter s
{
   printf("%s\n", s);
}


void g( int s )        // g has different parameter type
{
   printf("%d\n", s);
}

int h( char * s )      // h has different return type
{
   printf("%s\n", s);
   return 0;
}

/* ----------------------------------------------------------------
   run has a function parameter of the form:

           void h( char * ) --- i.e., a string (char[])

   Function f matches this function parameter declaration
   Function g does NOT match this function parameter declaration
   ---------------------------------------------------------------- */
void run( void h( char * ), char *a )
{
   h(a);
}


int main( int argc, char *argv[] )
{

   run( f, "Hello" );
   run( g, "Hello" );         // Error: argument 1 has wrong type !!!
   run( h, "Hello" );
}

