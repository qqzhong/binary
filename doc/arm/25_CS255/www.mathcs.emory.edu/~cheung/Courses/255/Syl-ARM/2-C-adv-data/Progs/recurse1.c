
#include <stdio.h>
#include <stdlib.h>

/* ------------------------
   List element definition
   ------------------------ */
struct ListElem
{
   int              value;
   struct ListElem* next;
};

void printList( struct ListElem *h )
{
   if ( h == NULL )
   {
      /* EASY case: nothing to print !  */
      printf(" - END\n");  
      return;
   }
   else
   {
      /* ---------------------------------------------
         DIFFICULT case: 
	    1. give someone a smaller problem and 
	    2. use its sol to solve my problem
         ---------------------------------------------- */
      printf("%d ", h->value);  // I print the first elem out
      printList(h->next);       // Give someone the smaller problem
   }
}


struct ListElem *insertTail(struct ListElem *h, struct ListElem *e)
{
   struct ListElem *sol;      // The solution returned by my helper
   struct ListElem *mySol;    // My solution

   if ( h == NULL )
   {
      /* EASY case: list contains only element e */

      e->next = NULL;
      return(e);
   }
   else
   {
      /* ---------------------------------------------
         DIFFICULT case: 
	    1. give someone a smaller problem and 
	    2. use its sol to solve my problem
         ---------------------------------------------- */

      sol = insertTail( h->next, e);   // (1) Have someone solve smaller prob  
                                       //     (Insert e in shorter list)

      h->next = sol;                   // (2) use sol to solve my problem
                                       //     (Add sol after the first elem)

      return(h);		       // Claim glory...
   }
}

struct ListElem *deleteTail ( struct ListElem *h )
{

   struct ListElem *sol;      // The solution returned by my helper

   if ( h == NULL )
   {
      /* EASY case: list is empty */

      return(NULL);   // Return empty list
   }
   else if ( h->next == NULL )
   {
      /* EASY case: (last element !) after deleting, list is empty */

      free(h);        // De-allocate !!!

      return(NULL);   // Return empty list
   }
   else
   {
      /* ---------------------------------------------
         DIFFICULT case: 
	    1. give someone a smaller problem and 
	    2. use its sol to solve my problem
         ---------------------------------------------- */

      sol = deleteTail( h->next );  // (1) Have someone solve smaller prob  
                                    //     (Delete tail in shorter list)

      h->next = sol;                // (2) use sol to solve my problem
                                    //     (Add sol after the first elem)

      return(h);		    // Claim glory...
   }
}


int main(int argc, char *argv[])
{
   struct ListElem* head;   // Head of list
   struct ListElem* p;      // Help variable to allocate new list element

   head = NULL;           // Empty list
   printList(head);

   /* ========================================================
      Insert 123
      ======================================================== */
   p = malloc( sizeof(struct ListElem) ); 
   p->value = 123;			
   head = insertTail( head, p);		
   printList(head);

   /* ========================================================
      Insert 444
      ======================================================== */
   p = malloc( sizeof(struct ListElem) ); 
   p->value = 444;
   head = insertTail( head, p);		
   printList(head);

   /* ========================================================
      Insert 789
      ======================================================== */
   p = malloc( sizeof(struct ListElem) ); 
   p->value = 789;
   head = insertTail( head, p);		
   printList(head);


   head = deleteTail( head );		
   printList(head);

}
