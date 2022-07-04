#include <stdio.h>


int main(int argc, char *argv[])
{
    int i1 = 4, i2 = 88;

    int *p;


    printf("Address of i1 = %u\n", &i1 );  // %u = unsigned integer
    printf("Address of i2 = %u\n\n", &i2 );

    p = &i1;                               // p points to variable i1
    printf("Value of p  = %u\n", p );
    printf("Value of *p = %d\n\n", *p );


    p = &i2;                               // p points to variable i1
    printf("Value of p  = %u\n", p );
    printf("Value of *p = %d\n\n", *p );

}
