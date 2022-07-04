#include <stdio.h>


int main(int argc, char *argv[])
{
    int a[10] = { 11, 22, 33, 44, 55, 66, 77, 88, 99, 777 };
    int b[10];
    int i;

    for ( i = 0; i < 10; i++ )
       b[i] = a[i];

    printf("Array a[]: ");
    for ( i = 0; i < 10; i++ )
       printf("%d ", a[i] );
    putchar('\n');

    printf("Array b[]: ");
    for ( i = 0; i < 10; i++ )
       printf("%d ", b[i] );
    putchar('\n');

}
