
#include <stdio.h>

void printBitFloat( float x )
{
   int i;
   int *y = (int *)&x;

   for ( i = 31; i >= 0; i-- )
   {
      if ( (*y & (1 << i)) != 0 )
         printf("1");
      else
         printf("0");
   }
}

void printBitInt( int x )
{
   int i;

   for ( i = 31; i >= 0; i-- )
   {
      if ( (x & (1 << i)) != 0 )
         printf("1");
      else
         printf("0");
   }
}


float f( float x)
{
   printf("   Inp param  x = %f , repr in bits: ", x);
   printBitFloat(x);
   printf("\n");

   float r;

   r = x*x;

   printf("   Return value = %f , repr in bits: ", r);
   printBitFloat(r);
   printf("\n\n");

   return(r);
}

int main(int argc, char *argv[] )
{
   int a, b;

   a = 2;
   printf("a = %d , repr in bits: ", a);
   printBitInt(a);
   printf("\n\n");

   b = f(a);

   printf("b = %d , repr in bits: ", b);
   printBitInt(b);
   printf("\n\n");
}



