// // change the default value of the class variables 
// class A;
//   int data;
//   byte B;
  
//   function new(int data1 = 100, byte B1=8);
//     data = data1;
//     B = B1;
    
//   endfunction
  
// endclass
//  module top;
   
//    A a1,a2,a3;
   
//    initial begin
//      a1 = new(); // Here it  default value
//      a2=new(10); // here nly data will change
//      a3 = new(10,20);// here both will change
     
//      $display("data = %0d \t B=%0d",a1.data,a1.B);
//      $display("data = %0d \t B=%0d",a2.data,a2.B);
//      $display("data = %0d \t B=%0d",a3.data,a3.B);
//    end
//  endmodule


/// same case but when both class variables and function arguments are same 

// class A;
//   int data;
//   byte B;
  
//   function new(int data = 100, byte B=8);
//     this.data = data; // without thsi keyword it will give 0
//     this.B = B;
    
//   endfunction
  
// endclass
//  module top;
   
//    A a1,a2,a3;
   
//    initial begin
//      a1 = new(); // Here it  default value
//      a2=new(10); // here nly data will change
//      a3 = new(10,20);// here both will change
     
//      $display("data = %0d \t B=%0d",a1.data,a1.B);
//      $display("data = %0d \t B=%0d",a2.data,a2.B);
//      $display("data = %0d \t B=%0d",a3.data,a3.B);
//    end
//  endmodule


//////////////inheritace concept/////////////////////////

// class parent;
//   int a;
//   byte b;
  
//   function void display();
//     $display("a=%0d\tb=%0d",a,b);
//   endfunction
  
// endclass
  
//   class child extends parent;
//     int e;
//     byte d;
    
//     function void display();
      
//       super.display();
//       //// here whenever the chld class has same ethod as parent class it will override theparent class method  so use SUPER keyword /////
      
//       $display("e=%0d\td=%0d",e,d);
//  endfunction
  
// endclass

// module top;
  
//   parent p;
//   child c;
  
//   initial begin
//     p=new();
//     c=new();
//     p=c;
    
//     c.e=100;
//     c.d=6;
//     c.a=20; // in inheritance child can access the the properties and methods of parent
//     c.b=2;
    
    
// //     p.e =100; // trying to acces the the child class variables using parent handle
// //     p.d =10; // so here without upcasting its not possible
    
// //     p.display();
    
//     c.display();
//   end
// endmodule


// class parent;
//   int a;
//   byte b;
  
//  virtual function void display();
//    $display("PARENT CLASS");
//   endfunction
  
// endclass
  
//    class child extends parent;
//     int e;
//     byte d;
    
//   function void display();
      
//     //  super.display();
      
//      $display("CHILD CLASS");
//  endfunction
  
// endclass

// module top;
  
//   parent p;
//   child c;
  
//   initial begin
  
//     c=new();
//     p=c;
    
//     p.display();
    
//   end
// endmodule

////////////////////////POLYMORPHISM//////////////////////////////

// class parent;
//   bit [31:0] data;
//   int id;

//   ///////both the parent class method and the child class method must have the exact same name.
  
//   virtual function void display();
//     $display("Parent clas====>>> Value of data = %0d, id = %0d", data, id);
//   endfunction
// endclass

// class child_A extends parent;
//   function void display();
//     $display("Child class_A:===>>> Value of data = %0d, id = %0d", data, id);
//   endfunction
// endclass

// class child_B extends parent;
//   function void display();
//     $display("Child class_B:===>>> Value of data = %0d, id = %0d", data, id);
//   endfunction
// endclass


// module class_example;
//   initial begin
//     parent p1,p2;
//     child_A c1 = new();
//     child_B c2 = new();
   
    
//     c1.data = 200;
//     c1.id   = 2;
    
//     c2.data = 300;
//     c2.id   = 3;
    
     
//     p1 = c1;
//     p2 = c2;
    
// //     p1.data = 100;
// //     p1.id   = 1;
    
//     p1.display();
//     p2.display();
 
//   end
// endmodule


// class parent;
//   int a;
//   byte b;
  
//   virtual function void display();
//     $display("I am in Parent class");
//     $display("a=%0d\tb=%0d",a,b);
//   endfunction
  
// endclass


// class child extends parent;
  
//    function void display();
//      $display("I am in child class");
//      $display("a=%0d\tb=%0d",a,b);
//   endfunction
// endclass
  
//   class child2 extends child;
  
//    function void display();
     
//  //    super.display();   // using super keyword it will point to upper class
//     $display("I am in child2 class");
//      $display("a=%0d\tb=%0d",a,b);
//   endfunction


// endclass


// module top;
//   parent p;
//   child c;
//   child2 c2;
  
//   initial begin
//     c2 = new();
//     c=c2;
//     p=c2;  // p is pointing to the child object
    
//   //  p.display();
//     c.display();
        
//     /// even it is not mentoned virtual in child class still  child function is virtual that's why both  p.display() and c.display() will print c2 statements
//   end
//   endmodule


// class Parent;

//   int a = 10;

// endclass


// class Child extends Parent;

//   int b = 20;

//   function void display();
//     $display("a = %0d, b = %0d", a, b);
//   endfunction

// endclass


// module top;

//   Parent p;
//   Child  c;
//   Child  ch;

//   initial begin

//     c = new();

//     // Parent handle points to Child object
//     p = c;

//     if ($cast(ch, p)) begin
//       $display("Cast Successful");
//       ch.display();
// //       p.a=10;
// //     p.b =9;
//     end
//     else begin
//       $display("Cast Failed");
//     end
    
//     p.a=10;
//  //   p.b =9; // can accesss the variables of child class class using $casting
    

//   end

// endmodule



//class Parent;

//   int a = 10;

// endclass


// class Child extends Parent;

//   int b = 20;

//   function void display();
//     $display("a = %0d, b = %0d", a, b);
//   endfunction

// endclass


// module top;

//   Parent p;
//   Child  c,c2;
//   Child  ch;

//   initial begin

//     c = new();

//     // Parent handle points to Child object
//     p = c;

//     if ($cast(ch, p)) begin
//       $display("Cast Successful");
//       ch.display();
// //       p.a=10;
// //     p.b =9;
//     end
//     else begin
//       $display("Cast Failed");
//     end
    
//     p.a=10;
//    // p.b =9; // can accesss the variables of child class class using $casting
    

//   end

// endmodule


class parent;
  int a;
  
  virtual function void display();
    $display("a=%0d",a);
  endfunction
  
endclass


class child1 extends parent;
  
  int b;
  
  function void print();  // in polymorphism method name should be same
     $display("b=%0d",b);
  endfunction
  
endclass

class child2 extends parent;
  
  int c;
  
   function void display();
    $display("c=%0d",c);
  endfunction
  
endclass


module test;
  
  parent p;
  child1 c1;
  child2 c2;
  
  initial begin
    c2 =new();
    c1 = new();
    
  //  c1= c2;
    
    p = c2;
    p = c1;
    p.print();
    
  end
endmodule
