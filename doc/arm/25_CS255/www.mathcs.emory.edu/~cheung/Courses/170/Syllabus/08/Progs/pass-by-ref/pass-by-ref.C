#include <iostream.h>


// & tells the C++ compiler to use Pass-by-reference
double fun ( double & a, double & b )
{
   double m;

   a = a + 1;
   b = b + 2;
   m = a + b;

   return(m);
}


int main(int argc, char **argv)
{
   double x = 1.0, y = 4.0;;
   double r;

   r = fun( x,  y );

   cout << x << endl;
   cout << y << endl;
   cout << r << endl;
}
