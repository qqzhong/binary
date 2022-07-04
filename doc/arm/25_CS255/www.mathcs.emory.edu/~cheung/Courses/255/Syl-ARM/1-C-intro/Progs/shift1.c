/* 
     Demo >> on unsigned type
*/

#include <stdio.h>

void printBits( int a )
{
   int i;

   /*                    76543210  */
   unsigned int mask = 0b10000000;

   for ( i = 8; i >= 0; i-- )
   {
      if ( (a & mask) != 0 )
         putchar('1');
      else
         putchar('0');

      mask = mask >> 1;     /* Shift mask bit to right */
   }

}



int main( int argc, char* argv[] )
{
     unsigned char a = 0b00000100;          
     unsigned char b = 0b10000100; 

     char c;

     printf("unsigned char a = ");
     printBits( a );
     putchar('\n');
     c = a >> 1;
     printf("          a >> 1: ");
     printBits( c );
     putchar('\n');
     putchar('\n');

     printf("(signed) char b = ");
     printBits( b );
     putchar('\n');
     c = b >> 1;
     printf("          b >> 1: ");
     printBits( c );
     putchar('\n');
     putchar('\n');
}
