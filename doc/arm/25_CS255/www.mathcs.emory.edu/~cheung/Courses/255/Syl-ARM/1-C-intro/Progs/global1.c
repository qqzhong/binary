
   void f4()
   {
      extern int x;   
      /* global var x is declared in scope */ 
                                                     
      x = 4;  // Access x in file global2.c !!!    
   }

   void f3()       
   {
      x = 4;  // *** Access error !
              // x is not defined nor declared      
   }

   extern int x;   /* global var x is declared in scope */ 
                               
   void f2()    
   {                               
      x = 4;  // Access x in file global2.c !!!   
   }                               
