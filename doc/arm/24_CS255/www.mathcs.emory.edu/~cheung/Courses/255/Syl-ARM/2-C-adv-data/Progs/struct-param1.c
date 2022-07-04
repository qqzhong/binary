
#include <stdio.h>

struct BankAccount
{
   int    accNum;
   double balance;
};
 
void update( struct BankAccount x )
{
   printf("Before update: x.accNum = %d  x.balance = %f\n",
		 x.accNum, x.balance);
 
   x.accNum = 1001;    // Update parameter
   x.balance = 999999; // variable
 
   printf("AFTER  update: x.accNum = %d  x.balance = %f\n",
		 x.accNum, x.balance);
 
}
 
int main(int argc, char *argv[])
{
   struct BankAccount a;
 
   a.accNum  = 123;
   a.balance = 1000.0;
 
   printf("Before calling update: a.accNum = %d  a.balance = %f\n",
		 a.accNum, a.balance);
 
   update (a); 
	// Demonstrate that struct is
	// passed-by-value
 
   printf("AFTER  calling update: a.accNum = %d  a.balance = %f\n",
		 a.accNum, a.balance);
}

