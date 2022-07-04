
#include <stdio.h>
#include <math.h>

#define epsilon 0.00001

double f( double x )
{
   return x*x*x + 2*x - 5 ;       // Solve: x^3 + 2x - 5 = 0
}

double g( double x )
{
   return x*log(x) + 3*sin(x) - 7 ;       // Solve: x*ln(x) + 3*sin(x) - 7
}

double BiSection( double f(double), double a, double b )
{
   double m, y_m, y_a;


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

   return (a+b)/2 ;

}


int main( int argc, char *argv[] )
{
   double r;

   r = BiSection( f, 0, 10 );
   printf("x^3 + 2x - 5 = 0, x = %lf\n" , r );

   r = BiSection( g, 0, 10 );
   printf("x*ln(x) + 3*sin(x) - 7, x = %lf\n" , r );
}
