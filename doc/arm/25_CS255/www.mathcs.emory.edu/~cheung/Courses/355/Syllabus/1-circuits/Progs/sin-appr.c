
#include <stdio.h>
#include <math.h>


#define pi 3.14159265358979l

double mySine(double x)
{
    const double B = 4.0/pi;             // 2 special "interpolation constants
    const double C = 4.0/(pi*pi);

    double y;

    y = B*x - C*x*x;               // Highly optimized (= hokus pokus)
    y = 0.775*y + 0.225*y*y;       // approximation of sin(x)
    return y;
}


int main(int argc, char *argv)
{
   double x, y1, y2;

   for (x = 0.0; x < pi/2 ; x += 0.1 )
   {
      y1 = sin(x);
      y2 = mySine(x);

      printf("x = %3.1lf, sin(x) = %lf, mySine(x) = %lf, Diff = %lf (%4.2lf%%)\n",
		x, y1, y2, y1-y2, 100*fabs(y1-y2)/y1);
   }

}

