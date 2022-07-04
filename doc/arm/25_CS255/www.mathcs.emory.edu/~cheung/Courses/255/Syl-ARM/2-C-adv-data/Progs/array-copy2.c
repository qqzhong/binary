#include <stdio.h>


int main(int argc, char *argv[])
{
    int a[10] = { 11, 22, 33, 44, 55, 66, 77, 88, 99, 777 };
    int b[10];
    int i;

    int *p, *q;  // Defines 2 reference variables
                 // Incorrect:  int *p, q;  - q will be an int

    p = &a[0];
    q = &b[0];

    for ( i = 0; i < 10; i++ )
       *(q++) = *(p++);

    printf("Array a[]: ");
    for ( i = 0; i < 10; i++ )
       printf("%d ", a[i] );
    putchar('\n');

    printf("Array b[]: ");
    for ( i = 0; i < 10; i++ )
       printf("%d ", b[i] );
    putchar('\n');

}
