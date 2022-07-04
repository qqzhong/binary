
#include <stdio.h>

void printBits(int x)
{
   int i;

   for ( i = 8*sizeof(int)-1; i >=0; i-- )
   {
      if ( x & (1 << i) )
         putchar('1');
      else
         putchar('0');
   }
   putchar('\n');
}

int main(int argc, char *argv[])
{
   int   a, *p;
   float b, *q;


   b = 2;
   a = b;

   printf("a = %d, b = %f\n\n", a, b);     // Conversion took place (implicitly)

   printf("In binary: a = ");
   printBits(a);
   printf("           b = ");
   printBits(*(int *)&b);
   printf("\n");


   /* ===========================================
      How to circumvent C's implicit conversion
      =========================================== */
   p = (int *)&b;     // We can now use *p to access the variable b as an int
   a = *p;

   printf("a = %d, b = %f\n\n", a, b);     // NO conversion !

   printf("In binary: a = ");
   printBits(a);
   printf("           b = ");
   printBits(*(int *)&b);
   printf("\n");
}
