
/* =============================================================
   NOTE:

		MUST be run on Solar !!!
   ============================================================= */

#include <stdio.h>

struct Disk_Register
{
   unsigned int  ready:1 ;         // 1 bit field named "ready"
   unsigned int  error:1 ;         // 1 bit field named "error"
   unsigned int  wr_prot:1 ;    
   unsigned int  dsk_spinning:1 ;  
   unsigned int  command:4 ;       // 4 bits field named "command"
   unsigned int  error_code:8 ;
   unsigned int  sector_no:16 ; 
};


void printBits( int a )
{
   int i;
 
   for ( i = 31; i >= 0; i-- )
   {
	 if ( (a & (1<<i) ) != 0 )
	    putchar('1');
	 else
	    putchar('0');
   }
 
}
 
int main( int argc, char* argv[] )
{
   struct Disk_Register  r;

   printf( "sizeof(r) = %lu\n", sizeof(r) );

   int *p = (int *) &r;        // Make p point to r

   *p = 0;                     // Clear all 32 bits in r
   printBits( *p );            // Print the bits in r
   putchar('\n');

   r.error = 1;                // Set the error bit (bit #30)
   printBits( *p );            // Print the bits in r
   putchar('\n');

   r.dsk_spinning = 1;         // Set the disk spinning bit  (#28)
   printBits( *p );            // Print the bits in r
   putchar('\n');
}
