// module test;
//   typedef class B; //forwod declaration by doing like this compiler will assume class B is exist and it willwait ntil class B is available
    
//     class A;
//       B b1;    //So here error will not arise
//     endclass
    
//     class B;
//       A a;
//     endclass
//          endmodule
    
/////////////////////////////////////////////////////////////////////////////

// module top;

//   typedef struct  packed {            // *size
//     int a;
//     integer aba;
//     byte bb;
//     bit [3:0] GFC; 
//     bit [7:0] VPI; 
// bit [11:0] VCI; 
// bit CLP; 
// bit [3:0] PT ; 
// bit [7:0] HEC; 
// bit [7:0] Payload; 
// bit [2:0] filler;
//   } my_struct;

//   initial begin
//     my_struct s;
    

//    s.VPI = 100;
//    s.Payload = 12;
//     $display("VPI = %0d",s.VPI);
//      $display("VPI = %0d",s.Payload);
//   end
// endmodule

////////////////////////////////////////////

// module unionexample;

//   typedef union {
//     logic [31:0] word;
//     logic [31:0] data;
//     logic [31:0] data1;
//     byte vv;
//     bit kk;
//   } my_union;

//   my_union u;

//   initial begin

//     // Write through 'word'
//     u.word = 345;
//     u.data = 123;
    

//     $display("u.word = %0d", u.word);
//     $display("u.data = %0d", u.data);
//     $display("u.data1 = %0d", u.data1);

//     $display("--------------------------------");

//     // Write through 'data'
//      u.data1 = 43;

//     $display("u.word = %0d", u.word);
//     $display("u.data = %0d", u.data);
//     $display("u.data1=%0d", u.data1);
   
//     u.vv = 65;
    
//     $display("data1=%b",u.data1);
//     u.kk = 1'b1;
//     $display("data1=%b",u.data1);

//   end

// endmodule


/////////////////////////////////////////////////

// module union_struct_example;

//   typedef struct packed {

//     logic [15:0] addr;
//     logic [15:0] data;

//      union packed {
//       logic [31:0] word;
//        logic [31:0] word2;
//     } pkt;

//   } my_struct_t;

//   my_struct_t u;

//   initial begin

//     // Assign to struct members
//     u.addr = 16'hABCD;
//     u.data = 16'h1234;

//     // Assign to union member
//     u.pkt.word = 32'h56789ABC;

//     $display("addr = %h", u.addr);
//     $display("data = %h", u.data);
//     $display("word = %h", u.pkt.word);
//     $display("word = %h", u.pkt.word2);

//   end

// endmodule

///////////////////////////////////////////////////////

// module union_struct_example;

//   typedef union  {

//     logic [15:0] addr;
//     logic [15:0] data;
//      bit kk;
    
//      struct packed {
//        logic [31:0] word;
//        bit [7:0] sa;
//        byte sb;
//     } pkt;
    
//     union packed {
//       logic [31:0] un_word;
//       bit [31:0] un_sa;
      
//     } my_union;
//   } my_struct_t;

//   my_struct_t u;

//   initial begin

//     // Assign to struct members
//     u.addr = 16'hA;
//     u.data = 16'h1;
//     $display("addr = %b", u.addr);
//     $display("data = %b\n", u.data);

//     // Assign to union member
//     u.pkt.word = 32'h7;

   
//     $display("word = %b", u.pkt.word);
//     $display("addr = %b", u.addr);
//     u.kk = 1'b1;
//     $display("word = %b", u.pkt.word);
//     $display("addr = %b", u.kk);

//   end

// endmodule

///////////////////////////// ACcessing the variables of struct withi the union  /////////////////////////////////

// module union_struct_ex;

//   typedef union  {

//     logic [4:0] ua;   //6 bit
//     bit [5:0] ub;
    
//     struct {
//       byte sa; //40 bit
//       int sb;
//     } str1;
    
//     union {
//       logic [5:0] uua;
//       byte uub;           //32 bit
//       int uuc;
      
//       union {
//         int uuua;    //32 bit         
//         byte uuub;
        	
//         struct {
//           bit [5:0]ssa;
//           logic [2:0]ssb;  //18 bit
          
//           union {
//             int uuuua;
//             byte uuuub;  //32 bt 
//           } uuuu;
//         } str2;
//       }uuu;
//     } uu;
//   }u;
    
  

//   initial begin

//     u uk;
//     uk.uu.uuu.str2.uuuu.uuuua = 54;
    
//     $display("addr = %b", uk.uu.uuu.str2.uuuu.uuuua);

//   end

// endmodule


// module top;
  
//   typedef union{
//       int a;
//       byte b;
//     }union_ol ;
  
//   initial begin
//     union_ol x;
//     x.a=100;
    
//     $display("a=%b",x.a);
    
//     x.b = 1;
//     $display("b=%b",x.b);
//   end
// endmodule

////////// Packed struct within the packed union //////////////////////////////

// module union_struct_example;

//   typedef union packed {

//     logic [31:0] ua;  
//     bit [31:0] ub;
    
//     struct packed {       //within the packed union only packed structures are allowed
//       bit[15:0] sa;       // within the packed union even the structure should have same size of memory
//       bit [15:0] sb;
//     } str1_packed;
//   }u1_packed ;
  
//     union {
//       logic [5:0] uua;
//       byte uub;           //32 bit
//       int uuc;

//     } u2_unpacked;

//   initial begin

//   end

//  endmodule
    
///////// tagged union///////////

// typedef union tagged {
//     int  i;
//     byte b;
// } my_union_t;

// module test;

//     my_union_t u;

//     initial begin

//         u = tagged i 32'd25;

//         $display("i = %0d", u.i);
      
//         $display("b = %0d", u.b);

//          //it prevents reading a member that was not the last one assigned.
//         // Accessing u.b is invalid because the active member is i.
//        // Many simulators will report a runtime error.

//     end

// endmodule

//////////////////////// rand variables n struct //////////////////////////////

//  typedef struct {   //packed struct/union may not be declared 'rand' or 'randc'.
//  rand bit [31:0] word;
//   rand bit [15:0] half;
//    rand logic [30:0] fulll;
//   } data_u;


// class packet;

 
//   rand data_u data;

// endclass


// module top;

//   packet p;

//   initial begin

//     p = new();

//     if (p.randomize()) begin
//       $display("Word    = %0d", p.data.word);
//       $display("Half = %0d", p.data.half);
//       $display("Full = %0d", p.data.fulll);
//     end
//     else
//       $display("Randomization failed");

//   end

// endmodule


// typedef struct packed {
//   bit [3:0] a;
//   bit [7:0] b;
// } pkt_t;

// class test;
//   rand pkt_t pkt;

//   function void display();
//     $display("a=%0d b=%0d", pkt.a, pkt.b);
//   endfunction
// endclass

// module tb;
//   test t = new();

//   initial begin
//     t.randomize();
//     t.display();
//   end
// endmodule
