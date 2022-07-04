

#include <stdio.h>


int main(int argc, char *argv[])
{
   char a[10] = { 'H', 'e', 'l', 'l', 'o', '\0' } ;

   printf( "sizeof(a) = %d\n", sizeof(a) );
   printf( "String a = %s\n", &a[0] );
   printf( "Strange string: %s\n", &a[3] );
}
