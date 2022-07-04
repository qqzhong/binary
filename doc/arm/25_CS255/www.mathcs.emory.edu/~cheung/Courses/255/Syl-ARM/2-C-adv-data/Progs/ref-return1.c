
#include <stdio.h>

/* ====================================
   f(A, i) returns the address of A[i]
   ==================================== */
int * f( int A[], int i )
{
   int *p;

   p = &A[i];

   return p;
}
 
int main(int argc, char *argv[])
{
   int A[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
   int *p, i;

   p = f( A, 4 );
   *p = 4000;

   for ( i = 0; i < 10; i++ )
      printf("%d ", A[i]);
   printf("\n\n");

}

