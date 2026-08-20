// module test;
//   initial begin
//     for (int i = 0; i < 3; i++) begin
//       automatic int j = i;
//       fork
//         $display("j = %0d", j);
//       join_none
//     end
//   end
// endmodule

// //// if we call function as void we cannot use return to return the value use int instead
// module test;
//     function void display(int a);
// //return a;
//   $display("a = %0d", a);

// endfunction
  
//   initial begin
//     display(1);
//   end
// endmodule

///// calling task inside a function without delay/////

// module test;
//   int a,b;
//     task display();
//       repeat(5) begin
//         #1   $display("[%0t] b = %0d",$time,b);  //calling inside a function with delay gives an error
//       end
//       #50 $display("[%0t] here b is repeating 5 times",$time);
//     endtask
  
//   function void display1();
//     fork                 /// here using fork join none we can call task inside a function even if delay is there
//     display();
//     join_none  //fork...join_none does not wait for the child process.So the function immediately reaches endfunctionand returns in zero time.The child process is now independent.
//   endfunction
  
// //   According to the IEEE 1800 SystemVerilog LRM, functions are not allowed to contain fork...join, fork...join_any, or fork...join_none. A compliant simulator should report this as illegal.

// // However, some simulators are more permissive and allow fork...join_none inside a function because the function itself does not consume time. They effectively treat it as spawning a background process and returning immediately.
  
  
  
//   initial begin
//     display1();
//   end
// endmodule


///////////////////caling functin nside a task ///////////

//module test;

//   function int add(int a, b);
//     return a + b;
//   endfunction

//   task run();
//     int result;
//     result = add(5, 2);
//     #4  $display("[%0t] Result = %0d",$time, result);
//   endtask

//   initial begin
//     run();
//   end

// endmodule


/////// fnction with all data types as return////

// module test;

//   typedef enum {IDLE, BUSY, DONE} state_t;

//   typedef struct {
//     int id;
//     int data;
//   } packet_t;

//   typedef bit [31:0] word_t;

// //   class Packet;
// //     int addr;

// //     function void display();
// //       $display("Packet Address = %0d", addr);
// //     endfunction
// //   endclass

//   function void show();
//     $display("Void Function");
//   endfunction

//   function bit get_bit();
//     return 1'b1;
//   endfunction

//   function logic get_logic();
//     return 1'b0;
//   endfunction

//   function byte get_byte();
//     return 8'hAA;
//   endfunction

//   function shortint get_shortint();
//     return 100;
//   endfunction

//   function int get_int();
//     return 200;
//   endfunction

//   function integer get_integer();
//     return 300;
//   endfunction

//   function longint get_longint();
//     return 64'd100000;
//   endfunction

//   function real get_real();
//     return 3.14;
//   endfunction

//   function shortreal get_shortreal();
//     return 2.71;
//   endfunction

//   function realtime get_realtime();
//     return $realtime;
//   endfunction

//   function time get_time();
//     return $time;
//   endfunction

//   function string get_string();
//     return "Ashlesh";
//   endfunction

//   function bit [7:0] get_array();
//     return 8'hF5;
//   endfunction

//   function state_t get_state();
//     return BUSY;
//   endfunction

//   function packet_t get_packet();
//     packet_t p;
//     p.id   = 10;
//     p.data = 100;
//     return p;
//   endfunction

//   function word_t get_word();
//     return 32'hABCD1234;
//   endfunction

// //   function Packet get_object();
// // //     Packet p = new();
// // //     p.addr = 500;
// // //     return p;
// //   endfunction

//   packet_t pkt;
//  // Packet obj;

//   initial begin
//     show();

//     $display("bit        = %0b", get_bit());
//     $display("logic      = %0b", get_logic());
//     $display("byte       = %0h", get_byte());
//     $display("shortint   = %0d", get_shortint());
//     $display("int        = %0d", get_int());
//     $display("integer    = %0d", get_integer());
//     $display("longint    = %0d", get_longint());
//     $display("real       = %0f", get_real());
//     $display("shortreal  = %0f", get_shortreal());
//     $display("realtime   = %0t", get_realtime());
//     $display("time       = %0t", get_time());
//     $display("string     = %s", get_string());
//     $display("array      = %0h", get_array());
//     $display("enum       = %s", get_state().name());

//     pkt = get_packet();
//     $display("struct     : id=%0d data=%0d", pkt.id, pkt.data);

//     $display("typedef    = %0h", get_word());

//   //  obj = get_object();
//   //  obj.display();
//   end

// endmodule

//Calling function within the same class and of class type////

// class Packet;

//   int data;

//   function Packet create();
//     Packet p = new();
//     p.data = 100;
//     return p;
//   endfunction

//   function void display();
//     Packet p1;

//     p1 = create();      // Calling function within the same class
//     $display("Data = %0d", p1.data);
//   endfunction

// endclass

// module test;
//   Packet p;

//   initial begin
//     p = new();
//     p.display();
//   end
// endmodule

/////// static function and automatic within module and class /////
/*
| `static function`                                | `function static`                                |
| ------------------------------------------------ | ------------------------------------------------ |
| Makes the **method** static.                     | Makes the **function's local variables** static. |
| Belongs to the **class**, not to an object.      | Belongs to an **object** (instance method).      |
| Can be called without creating an object.        | Requires an object to call it.                   |
| Cannot access non-static class members directly. | Can access all class members.                    |
| Syntax: `static function int add();`             | Syntax: `function static int add();`             |
*/


////In module, there is no static function because module subroutines are already static by default (unless declared automatic).

//Effect on a global (module) variable

// module test;

//   int i = 0;

//   function int count();
//     i++;
//     return i;
//   endfunction

//   initial begin
//     $display("%0d", count());
//     $display("%0d", count());
//     $display("%0d", count());
//   end

// endmodule

//Effect on local variables

// module test;
//int j = 0;
//   function int count();
//     j++;
//     return j;
//   endfunction

//   initial begin
//     $display("%0d", count());
//     $display("%0d", count());
//     $display("%0d", count());
//   end

// endmodule

// function static for global variables
// module test;

//   function static int count();
//     int j=0;
//     j++;
//     return j;
//   endfunction

//   initial begin
//     $display("%0d", count());
//     $display("%0d", count());
//     $display("%0d", count());
//   end

// endmodule

// function static for local variables
// module test;

//   function static int count();
//     int j=0;
//     j++;
//     return j;
//   endfunction

//   initial begin
//     $display("%0d", count());
//     $display("%0d", count());
//     $display("%0d", count());
//   end

// endmodule


//Automatic function for glbal variables

// module test;
// int j = 0;
//   function automatic int count();
    
//     j++;
//     return j;
//   endfunction

//   initial begin
//     $display("%0d", count());
//     $display("%0d", count());
//     $display("%0d", count());
//   end

// endmodule

//Automatic function for local variables
// module test;

//   function automatic int count();
//     int j = 0;
//     j++;
//     return j;
//   endfunction

//   initial begin
//     $display("%0d", count());
//     $display("%0d", count());
//     $display("%0d", count());
//   end

// endmodule

////////// Inside a class automatic for local variables //////////////

// class A;
  
//   function int count();   /// by default here function is automatic
//     int i;
//     i++;
//     return i;
//   endfunction
  
// endclass

// module test;
//   A a;
  
//   initial begin
//     a = new();
//     $display("%0d", a.count());
//     $display("%0d", a.count());
//     $display("%0d", a.count());
//   end

// endmodule


////////// Inside a class automatic for local variables //////////////

// class A;
  
//   function static int count(); //static applies to the local variable i inside the function
//     int i;
//     i++;
//     return i;
//   endfunction
  
// endclass

// module test;
//   A a;
  
//   initial begin
//     a = new();
//     $display("%0d", a.count());
//     $display("%0d", a.count());
//     $display("%0d", a.count());
//   end

// endmodule


// class A;
  
//   static function int count(); //static applies to the function itself, NOT the local variables.don't need to create an object (new()) to call this function
//     int i;
//     i++;
//     return i;
//   endfunction
  
// endclass

// module test;
  
//   initial begin
//     $display("%0d", A::count());
//     $display("%0d", A::count());
//     $display("%0d", A::count());
//   end

// endmodule

////////////////////calling function inside a function///////////////////////////////////////////

// module test;

//   function int add(int x, int y);
//     return x + y;
//   endfunction

//   int a = 10;
//   int b = 20;
//   int c = 30;
//   int d = 40;

//   initial begin
//     $display("Result = %0d", add(add(a, b), add(c, d)));
//   end

// endmodule

////////////////////////////////////////////////////////////////

          
//           module tryfact;
// // define the function
// function automatic integer factorial (input [31:0] operand);
// if (operand >= 2) 
// factorial = factorial (operand - 1) * operand;
// else 
// factorial = 1;
// endfunction: factorial
// // test the function
// integer result;
// initial begin 
// for (int n = 0; n <= 7; n++) begin 
// result = factorial(n);
// $display("%0d factorial=%0d", n, result);
// end 
// end
//           endmodule

///// calling same function inside a fork join/////

// module test;
//   int result;
  
//   function int add(int x,y);
//     return x+y;
//   endfunction
  
//   initial begin
//     fork
//       $display("result=%0d",add(2,4));
//       $display("result=%0d",add(3,5));
//       $display("result=%0d",add(1,2));
//     join_none
    
//   end
// endmodule




// module test;

// //  automatic int i;   //The keyword automatic cannot be used for module variables. so declare inside the initial block
  
//   initial begin
    
//     automatic int i;
//     for(i=0;i<5;i++)
//       begin
//         $display(i);
//       end
//   end
// endmodule

   


// module test;

//  // int i;

//   function automatic int count();  //apllicable only for the local variables
//      int i;
//     i++;
//     return i;
//   endfunction

//   initial begin
//     $display("%0d", count());
//     $display("%0d", count());
//     $display("%0d", count());
//   end

// endmodule


// module test;

// task automatic show();
//   int i;
//  // repeat(2)
// i++;
//   $display(i);
// endtask

// initial begin
//   show();
//   show();
// end

// endmodule



// class A;
//  //  static int i;
//   static function  int count();  //within the class static function can only call static variables
//     int i;
//     i++;
//     return i;
//   endfunction
  
// endclass

// module test;
//   A a;
  
//   initial begin
//    a = new();
//     $display("%0d", a.count());
//     $display("%0d", a.count());
//     $display("%0d", a.count());
//   end

// endmodule


////recursive function code////

///A recursive function is a function that calls itself until a stopping condition is reached.

// module test;

// function  int factorial(int n);

//   if (n <= 1)
//     return 1;
//   else
//     return n * factorial(n - 1);

// endfunction

// initial begin
//   $display("Factorial = %0d", factorial(5));
// end

// endmodule


/////Re entrant function////
//A re-entrant function is a function that can be executed simultaneously by multiple calls because each call gets its own separate memory.

module test;

function automatic int count();
  int i = 0;
  i++;
  return i;
endfunction

initial begin
  $display(count());
  $display(count());
end

endmodule



