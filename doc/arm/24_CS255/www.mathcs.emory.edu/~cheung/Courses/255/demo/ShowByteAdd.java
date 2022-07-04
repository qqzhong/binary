
import java.io.*;

class ShowByteAdd
{
   public static void PrintBits(byte x)
    {
      int i;

      for (i = 7; i >= 0; i--)
         if ( (x & (1 << i)) != 0 )
	    System.out.print("1");
         else
	    System.out.print("0");
    }

   public static void main(String[] arg) throws IOException
    {
      BufferedReader stdin = new BufferedReader
                               (new InputStreamReader(System.in));
      byte a, b, c;

      while (true)
       { System.out.print ("Enter a: ");
         a = (byte) Integer.parseInt(stdin.readLine());

         System.out.print ("Enter b: ");
         b = (byte) Integer.parseInt(stdin.readLine());

         c = (byte) (a+b);

         System.out.println("The sum is " + c);
         System.out.println();

         System.out.println("Reason for this result is:\n");

         System.out.print("a = " + a + "... 2's complement repr = "); 
         PrintBits(a);
         System.out.println();

         System.out.print("b = " + b + "... 2's complement repr = "); 
         PrintBits(b);
         System.out.println();

         System.out.print("c = " + c + "... 2's complement repr = "); 
         PrintBits(c);
         System.out.println();

         System.out.println("=============================================\n");

      }
   }
}

