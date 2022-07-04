
#include <stdio.h>

struct s1
{
   char a;
   int  d;
};

struct s2
{
   char a;
   char b;
   int  d;
};

struct s3
{
   char a;
   char b;
   char c;
   int  d;
};



int main(int argc, char *argv[])
{
   printf("sizeof(char) = %d\n", sizeof(char) );
   printf("sizeof(int) = %d\n", sizeof(int) );
   printf("sizeof(struct s1) = %d\n", sizeof(struct s1) );
   printf("sizeof(struct s2) = %d\n", sizeof(struct s2) );
   printf("sizeof(struct s3) = %d\n", sizeof(struct s3) );
}
