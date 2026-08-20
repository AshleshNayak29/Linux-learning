// In SystemVerilog, "compiler directives" (often called preprocessor directives) give instructions to the compiler before the actual code compilation or synthesis begins. They always start with a backtick (`) rather than a forward tick or single quote.

// 1. Text Substitution & Macros
// These directives allow you to define constants, shortcuts, or parameterized code snippets across your codebase.

// `define: Creates a macro for text substitution.
// `undef: Undefines a previously created macro so it no longer applies.

// `define width 32
// `define MAX(x,y) (((x) > (y)) ? (x) : (y))

// `define value_for_x 22
// `define value_for_y 31

// module test;
//   logic [`width-1:0] result;

//   initial begin
   
//     result = `MAX(`value_for_x, `value_for_y);
//     $display("Result is: %0d", result);
    
//     `undef value_for_x  /// here value_for_x got clear
//     `undef MAX   //// MAX is undefined
    
// //     result = `MAX(`value_for_x, `value_for_y);
// //     $display("Result is: %0d", result);
    
//   end
// endmodule



// 2. Conditional Compilation
// Conditional directives let you compile or bypass sections of code based on environment flags, simulation targets, or specific hardware configurations.

// `ifdef(if defined)	If Defined	The macro is defined
// `ifndef(if not defined)	If Not Defined	The macro is not defined
// `else → Executes when the previous condition is false. It cannot have a condition.
// `elsif → Checks another condition if the previous condition is false. It must be followed by a macro name.
//`endif: Closes a conditional block.

// `define value_for_x 
// `define value_for_y 

// `ifdef value_for_x

// `define width 32
// `define value_for_x 22
// `define value_for_y 31

// `endif

// `define MAX(x,y) (((x) > (y)) ? (x) : (y))

// module test;

// logic [`width-1:0] result;

// initial begin
//     result = `MAX(`value_for_x, `value_for_y);
//     $display("Result = %0d", result);
// end

// endmodule


// 3. File Inclusion
// `include: Inserts the contents of another file directly into the current file at the exact position of the directive.

// module test;
//   `include "code.sv"
//   initial begin
    
//   end
// endmodule
  

// 4. Time Scale Directives
// `timescale: Sets the reference time unit and precision for time-based operations like delays 

// `timescale 1ns/1ps

// module test;

//   reg clk1;
// initial begin
//     clk1 = 0;

//     forever begin
//         #2.512 clk1 = ~clk1;
//         $display("Time = %0t", $realtime);
//     end
// end

//   initial begin
//     $dumpfile("dump.vcd");
//     $dumpvars;

//     #100 $finish;
//   end

// endmodule

// module top;

//   reg clk2;

//   initial begin
//     clk2 = 0;
 
//     forever begin
//         #3.521 clk2 = ~clk2;
//         $display("Time = %0t", $realtime);
//     end
// end
//   initial begin
//     $dumpfile("dump.vcd");
//     $dumpvars;

//     #100 $finish;
//   end

// endmodule

// ///////////////////MUX or Decoder//////////////////

// // uncomment DUT

// // `define MUX

// `ifdef MUX   // control in Run options left side  by giving +define+decoder

// module tb;

// logic a, b, sel;
// logic out;

// mux2to1 dut (
//     .a(a),
//     .b(b),
//     .sel(sel),
//     .out(out)
// );

// initial begin
//     a = 0; b = 1;

//     sel = 0;
//     #10;

//     sel = 1;
//     #10;

//     $finish;
// end

// initial begin
//     $monitor("Time=%0t sel=%0b a=%0b b=%0b out=%0b",
//               $time, sel, a, b, out);
// end

// endmodule

// `elsif decoder  // control in Run options left side  by giving +define+decoder

// module tb;

// logic [1:0] in;
// logic [3:0] out;

// decoder2to4 dut (
//     .in(in),
//     .out(out)
// );

// initial begin
//     in = 2'b00; #10;
//     in = 2'b01; #10;
//     in = 2'b10; #10;
//     in = 2'b11; #10;

//     $finish;
// end

// initial begin
//     $monitor("Time=%0t in=%b out=%b", $time, in, out);
// end

// endmodule

// `endif


//////////////////connecting module to module using interface/////////////////////////

interface intf;
    logic [7:0] data;
    logic       valid;
endinterface

module transmitter(intf inf);
    initial begin
        inf.data  = 8'hAA;
        inf.valid = 1;

        #10;

        inf.data  = 8'h55;
        inf.valid = 0;
    end
endmodule

module receiver(intf inf);
  always @(inf.data or inf.valid) begin
    $display("Time=%0t Data=%0h Valid=%0b", $time, inf.data, inf.valid);
    end
endmodule

module top;
  
    intf top_inf();

  transmitter tx ( .inf(top_inf) );
  receiver    rx ( .inf(top_inf) );
endmodule


///////////////  module to classs //////////////

interface bus_if;

    logic clk;
    logic [7:0] data;

endinterface


module dut(bus_if bus);

always @(posedge bus.clk)
begin
    $display("[DUT] Data = %0d", bus.data);
end

endmodule

class driver;

    virtual bus_if bus;

    function new(virtual bus_if bus);
        this.bus = bus;
    endfunction

    task run();

        bus.data = 10;
        #10;

        bus.data = 20;
        #10;

        bus.data = 30;

    endtask

endclass


module top;

    bus_if bus();

    driver drv;

    initial begin
        bus.clk = 0;
        forever #5 bus.clk = ~bus.clk;
    end

    // DUT
    dut d1(bus);

    initial begin
        drv = new(bus);  
        drv.run();
    end

    initial begin
        #50 $finish;
    end

endmodule



////Pcakage 

// A package is a container that stores definitions that can be shared across multiple files.

// Instead of writing the same class, function, task, parameter, typedef, or enum in every file, you put them in one package and import them wherever needed.

 package ex;

function int add(int a, int  b);
  return a+b;
endfunction

function int mul(int a, int  b);
  return a*b;
endfunction

class A;
  int a;
  int b;
  
  function void display();
    $display("a =%0d b=%0d",a,b);
  endfunction
  
endclass

endpackage

package pkg2;

import ex::add;
export ex::*;  //export is like forwarding the imported symbols. here if we not use export then add method will be nly visible to pkg2 not for te class which imported pkg2

endpackage


module test;
  int result;
  
//   import ex::add; // only add function is imported
  
//   import ex::*;//here everything is imported
  
  import pkg2::*;
  
  initial begin
    
   // A A_h = new();
    
//     A_h.a=10;
//     A_h.b=1;
    
    
    result = add(10,20);
    
    $display("result = %0d",result);
    
 //   A_h.display();
    
  end
  
endmodule
  

