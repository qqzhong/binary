
public class RecursiveList
{
   public static Node insert( Node head, Node e )
   {
      Node solution, smallerSol;

      /* --------------------------------------------
	  Base case: insert at the tail of an empty
         -------------------------------------------- */
      if ( head == null )
      {
         e.next = null;     // Mark e as the last node

         solution = e;      //

	  return(solution);         // e is the head node !
      }
      else
      {
         /* ===========================================================
            Solve the problem USING the solution of a smaller problem

            I know the list is not empty...
	     And "head.next" is a SHORTER list !
	     =========================================================== */

         smallerSol = insert( head.next, e ); // Have "someone else" solve
                                              // in smaller problem

         head.next = smallerSol;  // Find solution using smallerSol

         solution = head;

         /* ========================================================
	     I made the new list, I only need to return the work....
            ======================================================== */
         return solution;        // Return the solution
      }
   }

   public static Node delete( Node head )
   {
      Node solution, smallerSol;

      if ( head == null )
      {
         solution = null;

         return solution;
      }
      else if ( head.next == null )
      {
         solution = null;

         return solution;
      }
      else
      {
         /* =================================================
            I know the list is not empty...
            And "head.next" points to a SHORTER list !
            ================================================= */

         smallerSol = delete( head.next ); // Have someone else delete the last
                                           // node in a SHORTER list and return
                                           // back the new list

         head.next = smallerSol;    

         solution = head;

         return solution;        // Return the head of the new list
      }
   }

   /* ====================================================
      Convert all elems in the list into a string:

	Format:"v1,v2,v3,..."
      ==================================================== */
   public static void printList(Node head)
   {
      String out;
      Node p;

      p = head;     // Start at the first element

      out = "[";
	while( p != null )
	{
	  out += p;	      // Concat next list element  
	  p = p.next;        // Go to the next element in list
         if ( p != null )
            out += " , ";     // Not last elem: add a ","
	}
      out += "]";
      System.out.println(out);
   }
}
