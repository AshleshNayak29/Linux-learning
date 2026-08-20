interface intf#(type t =int,int size=16)
  (input logic clk,input logic reset);
  t [size-1:0]a=5,b=6;
  t [size-1:0]a1,b1;
  modport Module_m (input clk,
                  input reset,
                  input a,
                  input b,
                  output a1,
                  output b1);
  modport module_n (input clk,
                 input reset,
                 input a1,
                 input b1,
                 output a,
                 output b);
endinterface

module top;

  logic clk;
  logic reset;
  int aq[$]; //from a
  int bq[$]; //from b
  int aq1[$]; //comng from a1
  int bq1[$]; //coming from b1
 
  intf inf(.clk(clk),.reset(reset));
  m m2(.m1(inf)); //Module M 
  n n2(.n1(inf)); //module n instantiation
 
  initial begin
   clk=0;
    reset=1;
    #5;
    reset=0;
    
//     repeat(3)
//       begin
//       inf.a=$urandom_range(0,10);
//         $display("generated value a=%d",inf.a);
//       inf.b=$urandom_range(10,20);
//         $display("generated value b=%d",inf.b);
//       end
    
    #40;
    $finish;
  end
   always #5 clk=~clk;
 
 //for module m
  always @(posedge clk) begin
    if(reset==0) begin
      aq1.push_back(inf.a1);
      bq1.push_back(inf.b1);
      $display("---------module(m)------------");
      $display("a1=%p",aq1);
      $display("b1=%p",bq1);
      $display("---------------------");
      aq.push_back(inf.a);
      bq.push_back(inf.b);
      $display("--------module(n)-------------");
      $display("a=%p",aq);
      $display("b=%p",bq);
      $display("============================");
      end
    end
 
//for module n
//   always @(posedge clk) begin
//     if(reset==0)begin
//       aq.push_back(inf.a);
//       bq.push_back(inf.b);
//       $display("--------module(n)-------------");
//       $display("a=%p",aq);
//       $display("b=%p",bq);
//       $display("============================");
//       end
//    end
endmodule         
//////////////////////////////////////////design code//////////////////////////////

module m(intf.Module_m m1);
//   input T [2:0] a;
//   input T [2:0] b;
//   output T[3:0] a1;
//   output T[3:0] b1;
  always@(posedge m1.clk)
  begin
    if(m1.reset==0)
      begin
        #1;
       m1.a1=m1.a+m1.b;
       m1.b1=m1.a*m1.b;
       $display("m module sum values a1=%d,b1=%d",m1.a1,m1.b1);
    end
  end
  
endmodule

module n(intf.module_n n1);
//           input T [SIZE-2:0] a1;
//           input T [SIZE-2:0] b1;
//           output T[SIZE-1:0] a;
//           output T[SIZE-1:0] b;
  always@(posedge n1.clk)
   begin
     if(n1.reset==0)
      begin
        #2;
       n1.a=n1.a1+n1.b1;
       n1.b=n1.a1*n1.b1;
        $display("n module sum values a=%d,b=%d",n1.a,n1.b);
    end
  end
endmodule
