// class A;
//   int a;
//   bit [31:0] b;
  
// endclass

// module top;
//   A a1;
//   int ash;
  
//   initial begin
//     a1=new();
   
//     if(a1 == null)
//       $display("memory is not created .....1");
//     else
//       $display("memory is created .....1");
    
//     a1 = null;
//      if(a1 == null)
//        $display("memory is not created .....2");
    
//     std::randomize(ash);
//   end
// endmodule


// class A;
//   int a;
//   bit [31:0] b;
  
// endclass

// module top;
//   A a1,b1[],c1[$],d1[int], temp_obj;
//   int i,temp;
  
//   initial begin
//     a1=new();
//     b1 = new[5];
//     c1[i] =new();
//     d1[i] = new();
  
//     a1.a = 100;
//     $display("a= %0d",a1.a);
    
//     foreach(b1[i]) begin
//       b1[i] = new();
// //       b1[i].a={1,2,3,4,5};
// //       b1[i].b={6,7,8,9,0};
//       b1[i].a=$urandom_range(1,100);
//       b1[i].b=$urandom_range(1,100);
//   //  foreach(b1[i]) begin
//  //     $display("a= %0d\tb= %0d",b1[i].a,b1[i].b);
//     end  
    
  

// for(i = 0; i < 10; i++) begin
//     temp_obj = new();
//     temp_obj.a = $urandom_range(1,100);
//     temp_obj.b = $urandom_range(1,100);
//     c1.push_back(temp_obj);
  
//   foreach(c1[i])
//     $display("c1[%0d] : a=%0d b=%0d", i, c1[i].a, c1[i].b);
// end
//  //   end   
//   end
// endmodule


//// callng handle of one class inside another class
// class A;
//  // rand int a;
//  // rand bit[4:0] e;
//   byte aa;
// endclass

// class B;
//   rand A d[];
//   rand int c;
  
// endclass

// module test;
//   B b;
//  int i; 
//   initial begin
//     b =new();
    
//     b.d= new[5];
    
//     foreach(b.d[i]) begin
//       b.d[i]=new();	
//       std::randomize(b.d[i]);
      
      
//   //    b.d[i] = $urandom_range(1,100);
//       std::randomize(b.d[i].aa) with {
//             b.d[i].aa inside {[1:15]};
//         };
      
//       $display("b.d[%0d].aa=%0d",i,b.d[i].aa);
//     end
    
//  //   b.randomize(); 
//   end
// endmodule


///////////////////////////////////////////////////////

//two handles of same class pointing to the same object
// class A;
//   int a,b,c;
// endclass

// module test;
//   A a1,a2;
  
//   initial begin
//     a1=new();
//   //  a2=new();
//     a2 =a1;
    
//     a1.a =10;
    
//     a1.b=20;
//     a2.c = 44;
    
//     $display("a=%0d b=%0d c=%0d ",a1.a,a1.b,a1.c);  
//     $display("a=%0d b=%0d c=%0d ",a2.a,a2.b,a2.c);
//   end
// endmodule

//parameterized class

// class A #(type int size=55);
//   class A #(type size = int);
//     class A #(parameter int SIZE = 55);
//       logic [SIZE-1:0] a;
//       logic [SIZE-1:0] b;
// endclass

// module top;
//   A a1;
//   initial begin
//     A #(.SIZE(15)) a1;
//     a1 = new();
//     a1.a=10;
//     a1.b=11;
//     $display("a =  %d   b = %d",a1.a,a1.b);
//   end
// endmodule



//extern function

// class A;
//   int a;
//   string name;
  
//   extern function void display();
    
//     endclass
    
//     function void A :: display(); //class name
//       $display("Employee ID = %0d",a);
//       $display("Employee name = %s",name);
//     endfunction
    
//     module top;
      
//       A a1;
      
//       initial begin
//         a1 = new();
//          a1.a=1194;
        
//         a1.name="Ash";
        
//         a1.display();
//       end
//       endmodule
