

#include <stdio.h>


int main(int argc, char *argv[])
{
   int a = 4;
   int b = 7;

   int * const q = &a;    // q points to a, and you cannot update q
 
   
   printf ("a = %d, b = %d\n", a, b);
 
   *q = 555;              // You CAN update *q  (it is not the same as p)        
 
   printf ("a = %d, b = %d\n", a, b);
 
   q = &b;                // Illegal - can't update q !!!
 
 
   /* --------------------------
	 Contrast with this:
	 -------------------------- */
 
   int const * p = &a;    // *p is a const
 
   p = &b;                // You CAN update p
 
   *p = 555;              // Illegal: You CANNOT update *p
}
