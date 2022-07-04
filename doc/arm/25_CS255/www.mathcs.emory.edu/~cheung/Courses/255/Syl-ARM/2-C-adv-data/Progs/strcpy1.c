
#include <stdio.h>


char *strcpy( char s1[], char s2[] )
{
   int i = 0;

   /* ----------------------------------
      '\0' marks the end of the string !
	 ---------------------------------- */
   while ( s2[i] != '\0' )
   {
      s1[i] = s2[i];      // Copy character at position i       
      i++;                // Move to next character
   }

   s1[i] = '\0';   // Mark the end of the s1 string    

   return s1;
}

int main(int argc, char *arg[])
{
   char a[] = "Hello";

   char b[10];

   strcpy(b, a);

   printf("b = %s\n", b);

}


