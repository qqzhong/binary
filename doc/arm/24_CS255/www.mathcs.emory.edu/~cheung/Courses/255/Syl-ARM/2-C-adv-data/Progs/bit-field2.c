
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


union U_Disk_Register
{
   struct Disk_Register  Reg;        // 32 bits mapped as struct Disk_Register
   int                   Whole_Reg;  // 32 bits as one int
};


void printBits( int a )
{
   int i;
 
   /*                    10987654321098765432109876543210  */      
   unsigned int mask = 0b10000000000000000000000000000000;
 
   for ( i = 31; i >= 0; i-- )
   {
	 if ( (a & mask) != 0 )
	    putchar('1');
	 else
	    putchar('0');
 
	 mask = mask >> 1;     /* Shift mask bit to right */
   }
 
}
 
int main( int argc, char* argv[] )
{
   union U_Disk_Register  r;

   printf( "sizeof(r) = %d\n", sizeof(r) );

   r.Whole_Reg = 0;          // Clear all 32 bits

   r.Reg.error = 1;          // Set the error bit (bit #30)
   printBits( r.Whole_Reg ); // Call the printBits() function 
   putchar('\n');

   r.Reg.dsk_spinning = 1;   // Set the dsk_spinning bit (bit #28)
   printBits( r.Whole_Reg ); // Call the printBits() function 
   putchar('\n');
}
