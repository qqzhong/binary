
import java.io.*;

class ShowIntTypes
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

   public static void PrintBits(short x)
    {
      int i;

      for (i = 15; i >= 0; i--)
         if ( (x & (1 << i)) != 0 )
	    System.out.print("1");
         else
	    System.out.print("0");
    }

   public static void PrintBits(int x)
    {
      int i;

      for (i = 31; i >= 0; i--)
         if ( (x & (1 << i)) != 0 )
	    System.out.print("1");
         else
	    System.out.print("0");
    }

   public static void main(String[] arg) throws IOException
    {
      BufferedReader stdin = new BufferedReader
                               (new InputStreamReader(System.in));

      // *************************************************************
      // byte size variables
      // *************************************************************
      byte b1, b2, b3;

      System.out.print ("Enter **byte** integer b1: ");
      b1 = (byte) Integer.parseInt(stdin.readLine());

      System.out.print ("Enter **byte** integer b2: ");
      b2 = (byte) Integer.parseInt(stdin.readLine());

      b3 = (byte) (b1+b2);

      System.out.println("The sum is " + b3);
      System.out.println();

      System.out.println("Reason for this result is:\n");

      System.out.print("b1 = " + b1 + "... 2's complement repr = "); 
      PrintBits(b1);
      System.out.println();

      System.out.print("b2 = " + b2 + "... 2's complement repr = "); 
      PrintBits(b2);
      System.out.println();

      System.out.print("b3 = " + b3 + "... 2's complement repr = "); 
      PrintBits(b3);
      System.out.println();

      System.out.println("=============================================\n");

      // *************************************************************
      // short size variables
      // *************************************************************
      short s1, s2, s3;

      System.out.print ("Enter **short**integer s1: ");
      s1 = (short) Integer.parseInt(stdin.readLine());

      System.out.print ("Enter **short** integer s2: ");
      s2 = (short) Integer.parseInt(stdin.readLine());

      s3 = (short) (s1+s2);

      System.out.println("The sum is " + s3);
      System.out.println();

      System.out.println("Reason for this result is:\n");

      System.out.print("s1 = " + s1 + "... 2's complement repr = "); 
      PrintBits(s1);
      System.out.println();

      System.out.print("s2 = " + s2 + "... 2's complement repr = "); 
      PrintBits(s2);
      System.out.println();

      System.out.print("s3 = " + s3 + "... 2's complement repr = "); 
      PrintBits(s3);
      System.out.println();

      System.out.println("=============================================\n");

      // *************************************************************
      // int size variables
      // *************************************************************
      int i1, i2, i3;

      System.out.print ("Enter **int**integer i1: ");
      i1 = (int) Integer.parseInt(stdin.readLine());

      System.out.print ("Enter **int** integer i2: ");
      i2 = (int) Integer.parseInt(stdin.readLine());

      i3 = (int) (i1+i2);

      System.out.println("The sum is " + i3);
      System.out.println();

      System.out.println("Reason for this result is:\n");

      System.out.print("i1 = " + i1 + "... 2's complement repr = "); 
      PrintBits(i1);
      System.out.println();

      System.out.print("i2 = " + i2 + "... 2's complement repr = "); 
      PrintBits(i2);
      System.out.println();

      System.out.print("i3 = " + i3 + "... 2's complement repr = "); 
      PrintBits(i3);
      System.out.println();

      System.out.println("=============================================\n");

   }
}

