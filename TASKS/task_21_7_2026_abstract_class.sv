/*An abstract class with a derived class
A derived class can be extended from an abstract class is the same as how it is extended normally using the extends keyword. The child class is instantiated as shown in the below example.*/

// virtual class parent_trans;
//   bit [31:0] data;
//   int id;
  
//   function void display();
//      $display("Base: Value of data = %0h and id = %0h", data, id);
//   endfunction
// endclass

// class child_trans extends parent_trans;
// //   function void display();
// //     $display("Child: Value of data = %0h and id = %0h", data, id);
// //   endfunction  
// endclass

// module class_example;
//   initial begin
//     child_trans c_tr;
//   //  parent_trans p;
    
//   //  p = new();
//     c_tr = new();
    
//     c_tr.data = 5;
//     c_tr.id = 1;
//     c_tr.display();
//   end
// endmodule    
////////////////////////////////////////////////////////////////////////

/*An abstract class with child class handle assignment
In the below example, an object for the child class is created and its handle is assigned to its parent class handle. This is to show that the parent class handle can access its method.*/

// virtual class parent_trans;
//   bit [31:0] data;
//   int id;
  
//   function void display();
//      $display("Base: Value of data = %0h and id = %0h", data, id);
//   endfunction
// endclass

// class child_trans extends parent_trans;
//   function void display();
//     $display("Child: Value of data = %0h and id = %0h", data, id);
//   endfunction  
// endclass

// module class_example;
//   initial begin
//     parent_trans p_tr;
//     child_trans c_tr;
//     c_tr = new();
    
//     p_tr = c_tr;
//     p_tr.data = 5;
//     p_tr.id = 1;
//     p_tr.display();
//   end
// endmodule

//////////////////////////////////////////////////////////////

//An abstract class with a virtual method

// virtual class parent_trans;
//   bit [31:0] data;
//   int id;
  
//   virtual function void display();  
  
//   //If you do NOT use the virtual keyword in the parent class method, then:
// //  Child class can still override the method syntax-wise
// // BUT
// // Polymorphism will NOT work
// // i.e., when you call the method through a parent class handle, the parent method will execute, NOT the child method.


//      $display("Base: Value of data = %0h and id = %0h", data, id);
//   endfunction
// endclass

// class child_trans extends parent_trans;
//   function void display();
//     $display("Child: Value of data = %0h and id = %0h", data, id);
//   endfunction  
// endclass

// module class_example;
//   initial begin
//     parent_trans p_tr;
//     child_trans c_tr;
//     c_tr = new();
    
//     p_tr = c_tr;
//     p_tr.data = 5;
//     p_tr.id = 1;
//     p_tr.display();
//   end
// endmodule      

/////////////////////////////////////////////////////////////////////////

// /*Pure virtual method example
// Pure virtual methods include the pure virtual function and the pure virtual task. */

// virtual class parent_trans;
//   bit [31:0] data;
//   int id;
  
//   pure virtual function void display();
// endclass

// class child_trans extends parent_trans;
//   function void display();
//     $display("Child: Value of data = %0h and id = %0h", data, id);
//   endfunction  
  
// //    function void print();
     
// //   endfunction  
  
// endclass

// module class_example;
//   initial begin
//     parent_trans p_tr;
//     child_trans c_tr;
//     c_tr = new();
    
//     p_tr = c_tr;
//     p_tr.data = 5;
//     p_tr.id = 1;
// //      p_tr.display();
//     c_tr.display();
    
//   //  p_tr.print();
//   end
// endmodule

// difference between logic [7:0] a and logic [0:7] a

// module tb;

// logic [0:7] a;
// logic [7:0] b;

// initial begin

//     a = 8'b10110010;
//     b  = 8'b10110010;

//     $display("a = %b", a);
//     $display("a[0] = %b", a[0]);
//     $display("a[7] = %b", a[7]);
  
//   $display("\nb = %b", b);
//   $display("b[0] = %b", b[0]);
//   $display("b[7] = %b\n", b[7]);
  
//   $display("\na = %0d", a);
   
//   $display("\nb = %0d", b);

// end

// endmodule


//difference between logic [2:0] a [4] and logic [0:2] a [3:0]

// module test;
//   logic [2:0] a [2];
//   logic [0:2] b [2:0];
//   int i,j;
  
//   initial begin
//     foreach(a[i,j]) begin
//       a[i][j]=j;
//         $display("a[%0d][%0d]=%0d",i,j,a[i][j]);
//     end
    
//     $display("");
    
//      foreach(b[i,j]) begin
//         b[i][j]=j;
//        $display("b[%0d][%0d]=%0d",i,j,b[i][j]);
//     end
//   end
//   endmodule

////  STREAM OPERATOR/////

// //It is used to rearrange, pack, unpack, or reverse bits and bytes between variables.
// // Reverse bytes
// // Reverse bits
// // Pack arrays into vectors
// // Unpack vectors into arrays
// // Streaming operators do all these.

// //Left Stream
// // {<< slice_size {expression}}
// // Right Stream
// // {>> slice_size {expression}}

// // << = stream from left
// // >> = stream from right
// // slice_size = number of bits in each chunk

// module tb;

//   logic [7:0] a,b,c,d,e;
//   logic [31:0] x,f;
//   logic [15:0] ADDR=16'hAB;
//   logic [15:0] DATA=16'h12;
//   logic [15:0] CTC = 16'hEF;
  
//   logic [50:0] result;
  
// initial begin

// a = 8'b10110010;
  
//   x = 32'hABCDEF12;

//   b = {<<{a}};  // without giving the slice size bu default it will take 1 bit from left side
  
//   c = {>>{a}}; // // without giving the slice size bu default it will take 1 bit from left side
  
//   d = {<<3{a}}; //size has given and here every 3 bits are reversed
  
//   e = {>>3{a}};
  
// //   f = {<<2{x}};
// //  f = {<<4{x}};
//   //    f = {<<8{x}};
//       f = {<<16{x}};
  
//   result= {>>{ADDR,DATA,CTC}};

//   $display("%b",a); // original input will display
//   $display("%b",b);  // reversed input will display
//   $display("%b",c); // even if right stream has done still it will come same as input 
//   $display("%b",d); // with size 3 left streaming
//   $display("%b",e);// with size 3 right streaming
  
//   $display("%h",f);//
  
//   $display("%0h",result);
  
// end

// endmodule

////////////////////////// inside operator/////
// module top;
//  int a=10;
  
//   initial begin
//     if (a inside{11,20,30})
//       $display("yes");
//     else
//       $display("No");  
//   end
  
// endmodule


// modulus 

// module test;
//   int a ,b,result;
  
//   initial begin
// //     a=5; b=3;
// //       a=3; b=5; 
//      a=-5; b=3;
// //     a=5; b=3;
// //     a=5; b=3;
// //     a=5; b=3;
    
    
//     result = a%b;
    
//     $display("result = %0d",result);
    
//   end
// endmodule

/////////////////////OPrators/////////////////////

// module top;

//   int a = 20;
//   int b = 6;
//   int c;
  
//   logic [3:0] ww,yy;
//   logic zz;

//   logic [7:0] x = 8'b10101010;
//   logic [7:0] y = 8'b11001100;
//   logic [15:0] z;

//   initial begin

//     $display("\n ///// Arithmetic Operators //// ");
//     $display("a + b = %0d", a + b);
//     $display("a - b = %0d", a - b);
//     $display("a * b = %0d", a * b);
//     $display("a / b = %0d", a / b);
//     $display("a %% b = %0d", a % b);

//     $display("\n  ////////// Relational Operators ///////");
//     $display("a > b  = %0d", a > b);
//     $display("a < b  = %0d", a < b);
//     $display("a >= b = %0d", a >= b);
//     $display("a <= b = %0d", a <= b);

//     $display("\n //// Equality Operators /////");
//     $display("a == b  = %0d", a == b);
//     $display("a != b  = %0d", a != b);
//     $display("a === b = %0d", a === b);
//     $display("a !== b = %0d", a !== b);

//     $display("\n/////// Logical Operators /////");
//     $display("(a>b)&&(b>2) = %0d", (a>b)&&(b>2));
//     $display("(a<b)||(b>2) = %0d", (a<b)||(b>2));
//     $display("!(a>b) = %0d", !(a>b));

//     $display("\n///// Bitwise Operators /////");
//     $display("x      = %b", x);
//     $display("y      = %b", y);
//     $display("x & y  = %b", x & y);
//     $display("x | y  = %b", x | y);
//     $display("x ^ y  = %b", x ^ y);
//     $display("~x     = %b", ~x);
//     $display("x ~^ y = %b", x ~^ y);

//     $display("\n////// Reduction Operators ///////");
//     $display("&x  = %b", &x);
//     $display("|x  = %b", |x);
//     $display("^x  = %b", ^x);
//     $display("~&x = %b", ~&x);
//     $display("~|x = %b", ~|x);
//     $display("~^x = %b", ~^x);

//     $display("\n////// Shift Operators /////");
//     $display("x << 2 = %b", x << 2);
//     $display("x >> 2 = %b", x >> 2);

//     $display("\n/////// Concatenation //////");
//     z = {x,y};
//     $display("{x,y} = %h", z);

//     $display("\n//////// Replication ///////////");
//     $display("{4{2'b10}} = %b", {4{2'b10}});

//     $display("\n////// Streaming Operators /////");
//     $display("{>>{x}}   = %b", {>>{x}});
//     $display("{<<{x}}   = %b", {<<{x}});
//     $display("{<<4{x}}  = %b", {<<4{x}});

//     $display("\n//// Increment / Decrement /////");
//     c = a;
//     $display("c = %0d", c);
//     $display("c++ = %0d", c++);
//     $display("After c++ : %0d", c);
//     $display("++c = %0d", ++c);
//     $display("After ++c : %0d", c);

//     $display("\n////// Assignment Operators /////");
//     c = 10;
//     c += 5;
//     $display("+= : %0d", c);

//     c -= 3;
//     $display("-= : %0d", c);

//     c *= 2;
//     $display("*= : %0d", c);

//     c /= 4;
//     $display("/= : %0d", c);

//     c %= 3;
//     $display("%%= : %0d", c);

//     c = 8;
//     c <<= 2;
//     $display("<<= : %0d", c);

//     c >>= 1;
//     $display(">>= : %0d", c);

//     c &= 3;
//     $display("&= : %0d", c);

//     c |= 8;
//     $display("|= : %0d", c);

//     c ^= 2;
//     $display("^= : %0d", c);

//     $display("\n////// Conditional Operator /////");
//     $display("(a>b)?a:b = %0d", (a>b)?a:b);

//     $display("\n///// Inside Operator //////");
//     $display("a inside {[10:30]} = %0d", a inside {[10:30]});
//     $display("b inside {1,3,5}   = %0d", b inside {1,3,5});
    
   
//     ww= 3'b1x0;
//     yy= 3'b0xx;
//     zz = ww && yy;
//     $display("ZZ=%b",zz);

//   end

// endmodule

//////////////////////////////////////////////////
//     module test;
//       int i;
      
//       initial begin
        
//         for(i=0;i<10;++i)
//           $display("i=%0d",i);
//       end
//     endmodule

/////////////////////////////////////////////////


// module system_functions_demo;
  
//   logic [7:0]  a = 8'b10110100;
//   logic [7:0]  b = 8'hFF;
//   logic signed [7:0] c = -5;
//   logic [3:0]  d = 4'b0100;
//   logic [3:0]  e = 4'b10x1;
//   logic [31:0] data = 32'hABCD1234;

//   integer i;

//   initial begin

   

//     // Prints with newline
//     $display("$display statemt");

//     // Prints without newline
//     $write("$write : Hello ");
//     $write("World\n");

//     // Prints at end of current time slot
//     $strobe("$strobe : a = %b", a);

//     // Prints whenever variable changes
//     $monitor("$monitor : Time=%0t a=%b", $time, a);


//     #5;

//     $display("\n||||| TIME FUNCTIONS |||||");

//     // Current simulation time
//     $display("$time      = %0t", $time);

//     // Real simulation time
//     $display("$realtime  = %0f", $realtime);

//     $display("\n||||| ARRAY QUERY FUNCTIONS |||||");

//     $display("$left(a)      = %0d", $left(a));
//     $display("$right(a)     = %0d", $right(a));
//     $display("$high(a)      = %0d", $high(a));
//     $display("$low(a)       = %0d", $low(a));
//     $display("$size(a)      = %0d", $size(a));
//     $display("$increment(a) = %0d", $increment(a));

//     $display("\n||||| DATA SIZE FUNCTIONS |||||");

//     // Number of bits
//     $display("$bits(data) = %0d", $bits(data));

//     // Ceiling log2
//     $display("$clog2(8)  = %0d", $clog2(8));
//     $display("$clog2(9)  = %0d", $clog2(9));

//     $display("\n||||| TYPE CONVERSION |||||");

//     $display("$signed(b)   = %0d", $signed(b));
//     $display("$unsigned(c) = %0d", $unsigned(c));

//     $display("\n||||| RANDOM FUNCTIONS |||||");

//     $display("$random          = %0d", $random);
//     $display("$urandom         = %0d", $urandom);
//     $display("$urandom_range   = %0d", $urandom_range(100,50));

//     $display("\n||||| BIT UTILITY FUNCTIONS |||||");

//     // Count number of 1's
//     $display("$countones(a) = %0d", $countones(a));

//     // Exactly one bit is HIGH
//     $display("$onehot(d)   = %0d", $onehot(d));

//     // Zero or one bit HIGH
//     $display("$onehot0(d)  = %0d", $onehot0(d));

//     // Detect X/Z values
//     $display("$isunknown(e)= %0d", $isunknown(e));

//     $display("\n||||| MESSAGE TASKS |||||");

//     $info("This is INFO message");

//     $warning("This is WARNING message");

//     $error("This is ERROR message");
    
//     #10 a = 8'hAA;

//     #10 a = 8'h55;
    
//     #10;

//     $display("\n||||| SIMULATION CONTROL |||||");

//     //$stop;      // Pause simulation

//     //$fatal("Fatal Error");   // Stops simulation immediately

//   //  $finish;      // Ends simulation

//   end

// endmodule



/////////////////////////////////////////////////////////////////////

// Post-increment (i++): Use the current value first, then increment.
// Pre-increment (++i): Increment first, then use the new value.
// Post-decrement (i--): Use the current value first, then decrement.
// Pre-decrement (--i): Decrement first, then use the new value.

module top;

  int i, j;

  initial begin

    // Post Increment
    i = 10;
    j = i++;
    $display("i++  : i = %0d, j = %0d", i, j);

    // Pre Increment
    i = 10;
    j = ++i;
    $display("++i  : i = %0d, j = %0d", i, j);

    // Post Decrement
    i = 10;
    j = i--;
    $display("i--  : i = %0d, j = %0d", i, j);

    // Pre Decrement
    i = 10;
    j = --i;
    $display("--i  : i = %0d, j = %0d", i, j);

  end

endmodule
