
#include <stdio.h>
#include <stdlib.h>

int f(int a, int b)
{
   int i, s;

   s = 0;
   for (i = a; i < b; i++)
   {
      s = s + f(a+1, b-1) + 1; 
   }
   return s;
}

int main(int argc, char *argv[])
{
   int a, b, z;

   if ( argc < 2 )
   {
      printf("Usage: %s a b\n", argv[0]);
      exit(1);
   }

   a = atoi(argv[1]);
   b = atoi(argv[2]);
   z = f(a,b);

   printf("\nf(%d,%d) = %d\n\n", a, b, z);

}
