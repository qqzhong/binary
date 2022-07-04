
#include <stdio.h>

/* ------------------------
   Structure definition
   ------------------------ */
struct BankAccount
{
   int    accNum;
   double balance;
};

int main(int argc, char *argv[])
{
   printf("sizeof(int) = %lu\n", sizeof(int) );
   printf("sizeof(double) = %lu\n", sizeof(double) );
   printf("sizeof(struct BankAccount) = %lu\n", sizeof(struct BankAccount) );

   struct BankAccount a;

   printf("address of a.accNum  = %u\n", &(a.accNum) );
   printf("address of a.balance = %u\n", &(a.balance) );
}
