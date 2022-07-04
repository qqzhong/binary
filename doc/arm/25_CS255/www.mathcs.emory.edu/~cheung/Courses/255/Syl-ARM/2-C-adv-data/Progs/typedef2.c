
#include <stdio.h>

/* -------------------------------------------------------------
   Structure definition

   Note: You MUST define the structure BEFORE you can
         define/declare any variable of this structure !!!
   ------------------------------------------------------------- */

typedef
   struct BankAccount
   {
      int    accNum;
      double balance;
   } 
   BankAccount_t;


int main(int argc, char *argv[])
{
   struct BankAccount a;
   BankAccount_t b;

   a.accNum = 123;
   a.balance = 4000;

   printf("a.accNum = %d  a.balance = %f\n", a.accNum, a.balance);

   b = a;
   printf("b.accNum = %d  b.balance = %f\n", b.accNum, b.balance);
}
