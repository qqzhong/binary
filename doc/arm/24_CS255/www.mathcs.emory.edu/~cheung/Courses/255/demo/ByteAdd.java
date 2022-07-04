import java.io.*;

class ByteAdd
{
   public static void main(String[] arg) throws IOException
    {
      BufferedReader stdin = new BufferedReader
                               (new InputStreamReader(System.in));
      byte a1, b1, c1;

      while (true)
       { System.out.print ("Enter a1: ");
         a1 = (byte) Integer.parseInt(stdin.readLine());

         System.out.print ("Enter b1: ");
         b1 = (byte) Integer.parseInt(stdin.readLine());

         c1 = (byte) (a1+b1);
         System.out.println ("The sum is " + c1);
         System.out.println ();
      }
   }
}

