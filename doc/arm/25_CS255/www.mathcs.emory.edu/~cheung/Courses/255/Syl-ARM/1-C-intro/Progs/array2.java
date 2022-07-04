

public class array2
{
   public static void main( String[] args )
   {
      double[] a = new double[10];
      int    i;

      for ( i = 0; i < 10; i++ )
         a[i] = i;

      for ( i = 0; i < 30; i++ )
         System.out.println( "a[" + i + "] = " + a[i] );
   }
}
