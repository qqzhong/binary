#include <stdio.h>


int main(int argc, char *argv[])
{
    int a[10];
    int* p;

    p = &a[0];                      // p points to variable a[0]

    printf("p     = %u, &a[%d] = %u\n", p, 0, &a[0] );
    printf("p + 1 = %u, &a[%d] = %u\n", p+1, 1, &a[1] );
    printf("p + 2 = %u, &a[%d] = %u\n", p+2, 2, &a[2] );
    printf("p + 3 = %u, &a[%d] = %u\n", p+3, 3, &a[3] );
}
