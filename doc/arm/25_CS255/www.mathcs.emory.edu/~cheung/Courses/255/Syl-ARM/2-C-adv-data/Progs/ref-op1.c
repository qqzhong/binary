#include <stdio.h>

int    i1, i2;
short  s1, s2;
char   c1, c2;
float  f1, f2;
double d1, d2;

int main(int argc, char *argv[])
{
    printf("Address of i1 = %u\n", &i1 );  // %u = unsigned integer
    printf("Address of i2 = %u\n", &i2 );
    printf("Address of s1 = %u\n", &s1 );
    printf("Address of s2 = %u\n", &s2 );
    printf("Address of c1 = %u\n", &c1 );
    printf("Address of c2 = %u\n", &c2 );
    printf("Address of f1 = %u\n", &f1 );
    printf("Address of f2 = %u\n", &f2 );
    printf("Address of d1 = %u\n", &d1 );
    printf("Address of d2 = %u\n", &d2 );
}
