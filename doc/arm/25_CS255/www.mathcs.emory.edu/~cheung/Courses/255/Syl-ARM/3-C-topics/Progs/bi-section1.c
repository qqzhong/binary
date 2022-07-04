
#include <stdio.h>

#define epsilon 0.00001

double f( double x )
{
   return x*x*x + 2*x - 5 ;       // Solve: x^3 + 2x - 5 = 0
}

int main( int argc, char *argv[] )
{
   double a, b, m, y_m, y_a;

   a = 0;  b = 10;

   while ( (b-a) > epsilon )
   {
      m = (a+b)/2;           // Mid point

      y_m = f(m);       // y_m = f(m)
      y_a = f(a);       // y_a = f(a)

      if ( (y_m > 0 && y_a < 0) || (y_m < 0 && y_a > 0) )
      {  // f(a) and f(m) have different signs: move b
         b = m;
      }
      else
      {  // f(a) and f(m) have same signs: move a
         a = m;
      }

      printf("New interval: [%lf .. %lf]\n", a, b);   // Print progress  
   }

   printf("Approximate solution = %lf\n" , (a+b)/2 );
}
