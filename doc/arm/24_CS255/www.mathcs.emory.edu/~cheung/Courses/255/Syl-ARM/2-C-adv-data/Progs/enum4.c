
#include <stdio.h>

/* ------------------------
   Emumeration declaration
   ------------------------ */
enum Day
{
   Sunday,
   Monday,
   Tuesday,
   Wednesday,
   Thursday,
   Friday,
   Saturday
};

int main(int argc, char *argv[])
{
   enum Day today;

   today = Wednesday;

   printf("sizeof(today) = %d\n", sizeof(today) );
   printf("today = %d\n", today );


   /* ================================
      Note: no range check !!!
      ================================ */
   today = 1000;
   printf("an out of range value for today = %d\n", today );
}
