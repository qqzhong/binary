
#include <stdio.h>

/* ------------------------
   Emumeration declaration
   ------------------------ */
enum Day
{
   Sunday,
   Monday,
   Tuesday,
   Wednesday = 0,
   Thursday,
   Friday,
   Saturday
};

int main(int argc, char *argv[])
{
   printf("Sunday = %d\n", Sunday );
   printf("Monday= %d\n", Monday );
   printf("Tuesday = %d\n", Tuesday );
   printf("Wednesday = %d\n", Wednesday );
   printf("Thursday = %d\n", Thursday );
   printf("Friday = %d\n", Friday );
   printf("Saturday = %d\n", Saturday );
}
