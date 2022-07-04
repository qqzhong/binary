
#include <stdio.h>

union myUnion
{
   int    a;
   double b;
   short  c;
   char  d;
};

struct myStruct
{
   int    a;
   double b;
   short  c;
   char  d;
};



int main(int argc, char *argv[])
{
   struct myStruct s;
   union myUnion   u;

   printf("Structure variable:\n");
   printf("sizeof(s) = %d\n", sizeof(s) );
   printf("Address of s.a = %u\n", &(s.a) );
   printf("Address of s.b = %u\n", &(s.b) );
   printf("Address of s.c = %u\n", &(s.c) );
   printf("Address of s.d = %u\n", &(s.d) );

   putchar('\n');

   printf("Union variable:\n");
   printf("sizeof(u) = %d\n", sizeof(u) );
   printf("Address of u.a = %u\n", &(u.a) );
   printf("Address of u.b = %u\n", &(u.b) );
   printf("Address of u.c = %u\n", &(u.c) );
   printf("Address of u.d = %u\n", &(u.d) );
}
