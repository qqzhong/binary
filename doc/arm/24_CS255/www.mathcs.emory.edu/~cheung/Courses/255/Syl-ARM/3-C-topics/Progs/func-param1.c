
#include <stdio.h>


void f()
{
   printf("Hello\n");
}

void g()
{
   printf("Good-bye\n");
}

void run( void h() )
{
   h();
}



int main( int argc, char *argv[] )
{

   run( f );
   run( g );
}

