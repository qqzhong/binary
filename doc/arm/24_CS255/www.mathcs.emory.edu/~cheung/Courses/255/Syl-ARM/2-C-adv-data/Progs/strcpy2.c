
#include <stdio.h>


char *strcpy( char s1[], char s2[] )
{
   char * out = s1;

   /* ----------------------------------
      '\0' marks the end of the string !
	 ---------------------------------- */
   while ( (*s1++ = *s2++) != '\0' );

   return out;
}

int main(int argc, char *arg[])
{
   char a[] = "Hello";

   char b[10];

   strcpy(b, a);

   printf("b = %s\n", b);

}


