#include <stdio.h>


int main(int argc, char *argv[])
{
    int a[10];
    int* p;

    p = &a[0];                      // p points to variable a[0]

    printf("staring p    = %u\n", p);
    p++;
    printf("after p++: p = %u\n", p );
    p++;
    printf("after p++: p = %u\n", p );
    p++;
    printf("after p++: p = %u\n", p );
}
