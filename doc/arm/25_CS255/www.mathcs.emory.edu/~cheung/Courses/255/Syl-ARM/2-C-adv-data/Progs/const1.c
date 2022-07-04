

#include <stdio.h>


int main(int argc, char *argv[])
{
   int a;

   int const *p;  // You CANNOT update *p !      

   a = 4;

   p = &a;
   *p = 100;      // Illegal !!!

}
