
public class testProg
{
   public static void main( String[] args )
   {
      Node head = null;
      Node e;

      e = new Node(4);
      head = RecursiveList.insert(head, e);
      RecursiveList.printList( head );

      e = new Node(1);
      head = RecursiveList.insert(head, e);
      RecursiveList.printList( head );

      e = new Node(3);
      head = RecursiveList.insert(head, e);
      RecursiveList.printList( head );

      e = new Node(7);
      head = RecursiveList.insert(head, e);
      RecursiveList.printList( head );


   }
}
