
#include <stdio.h>


int Strcmp( char *s1,  char *s2 )
{
   int r = 0;

   while ( (r = (*s1 - *s2)) == 0 && *s1 != '\0' && *s2 != '\0' )
   {
      putchar(*s1);
      s1++;
      s2++;
   }

   return( r );
}

int main(int argc, char *arg[])
{
   char a[] = "Hell";
   char b[] = "Hello";
   char c[] = "Helloe";

   
   printf("strcmp(%s, %s) = %d\n\n", b, b, Strcmp(b, b) );
   printf("strcmp(%s, %s) = %d\n\n", a, b, Strcmp(a, b) );
   printf("strcmp(%s, %s) = %d\n\n", b, a, Strcmp(b, a) );
   printf("strcmp(%s, %s) = %d\n\n", b, c, Strcmp(b, c) );
   printf("strcmp(%s, %s) = %d\n\n", c, b, Strcmp(c, b) );

}


