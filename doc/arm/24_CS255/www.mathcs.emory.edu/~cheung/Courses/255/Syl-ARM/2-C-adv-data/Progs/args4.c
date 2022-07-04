

#include <stdio.h>
#include <stdlib.h>


int main(int argc, char **a )
{

   if ( argc < 3 )
   {
      printf("Needs 2 arguments !\n");
      exit(1);
   }

   printf("First 4 chars of arg 0: ");
   putchar( * ( *(a + 0) + 0 ) );
   putchar( * ( *(a + 0) + 1 ) );
   putchar( * ( *(a + 0) + 2 ) );
   putchar( * ( *(a + 0) + 3 ) );
   putchar( '\n' );

   printf("First 4 chars of arg 1: ");
   putchar( * ( *(a + 1) + 0 ) );
   putchar( * ( *(a + 1) + 1 ) );
   putchar( * ( *(a + 1) + 2 ) );
   putchar( * ( *(a + 1) + 3 ) );
   putchar( '\n' );

   printf("First 4 chars of arg 2: ");
   putchar( * ( *(a + 2) + 0 ) );
   putchar( * ( *(a + 2) + 1 ) );
   putchar( * ( *(a + 2) + 2 ) );
   putchar( * ( *(a + 2) + 3 ) );
   putchar( '\n' );

}
