
#include <stdio.h>


int strcmp( char s1[], char s2[] )
{
   int i = ;

   /* ----------------------------------
      '\0' marks the end of the string !
      ---------------------------------- */
   while ( s2[i] != '\0' && s1[i] != 0 )
   {
      if ( s1[i] != s2[i] )          // If s1 and s2 differ in char i
         break;                      // exit while loop !

      i++;
   }

   /* ----------------------------------------------------------------
      If we reach here, then one or both of s1 and s2 are exhausted !
      ---------------------------------------------------------------- */

   return s1[i] - s2[i];     // The difference will tell you which string
                             // is lexicographically smaller
                             // If they are equal, we will have '\0' - '\0'
}

int main(int argc, char *arg[])
{
   char a[] = "Hell";
   char b[] = "Hello";
   char c[] = "Helloe";

   
   printf("strcmp(%s, %s) = %d\n", b, b, strcmp(b, b) );
   printf("strcmp(%s, %s) = %d\n", b, a, strcmp(b, a) );
   printf("strcmp(%s, %s) = %d\n", b, c, strcmp(b, c) );

}


