
enum Day
{
   Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
};

enum boolean
{
   false, true
};

int main(int argc, char *argv[])
{
   enum Day x;
   enum boolean y = 44;
   int z = 444;

   x = 1;   // OK
   printf("x = %d\n", x);
   x = Monday;
   printf("x = %d\n", x);
   x = true;
   printf("x = %d\n", x);
   x = y;
   printf("x = %d\n", x);
   x = z;
   printf("x = %d\n", x);

}

