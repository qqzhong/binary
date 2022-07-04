#include <stdio.h>


int main(int argc, char *argv[])
{
    int i1 = 4, i2 = 88;

    int *p;


    printf("Value of i1 = %d\n", i1 );

    p = &i1;                               // p points to variable i1
    *p = 1234;                             // Store 1234 in i1 !!!
    printf("Value of i1 = %d\n", i1 );

    printf("Value of i2 = %d\n", i2 );

    p = &i2;                               // p points to variable i2
    *p = 9999;                             // Store 9999 in i2 !!!
    printf("Value of i2 = %d\n", i2 );


}
