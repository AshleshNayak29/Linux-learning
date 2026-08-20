// class A #(type T = int);   //type parameter
//   T data;
//   T name;
// endclass

// module top;
//   A a1;            
//   A #(string) a2; 
//   A #(logic[7:0]) a3;
  
//   initial begin
//     a1=new();
//     a2=new();
//     a3=new();
//     a1.data = 100;
    
//     a2.data ="ABC";
//     a2.name = "DEF";
    
//     $display("a1.data = %0d",a1.data);
//   end
// endmodule


// class A #(type T = int);
//   T data;
// endclass

// module top;
//   A a1;            
//   A #(string) a2; 
//   A #(logic[7:0]) a3;
  
//   initial begin
//     a1=new();
//     a2=new();
//     a3=new();
//     a1.data = 100;
    
//     a2.data ="ABC";
    
//     $display("a1.data = %0d",a1.data);
    
//     $display("a3.data =%0d",a3.data);
//   end
// endmodule


// class Packet;
//   int addr;
// endclass

// class Driver;
//   string name;
// endclass

// class Monitor;
//   int count;
// endclass

// class environment #(type PKT1 = Packet,
//                     type DRV = Driver,
//                     type MON = Monitor);

//   PKT1 pkt;
//   DRV drv;
//   MON mon;

//   function new();
//     pkt = new();
//     drv = new();
//     mon = new();
//   endfunction

// endclass

// module top;

//   environment env;

//   initial begin

//     env = new();

//     env.pkt.addr = 10;
//     env.drv.name = "DRV1";
//     env.mon.count = 25;

//     $display("%0d", env.pkt.addr);
//     $display("%s", env.drv.name);
//     $display("%0d", env.mon.count);

//   end

// endmodule


///// bit slicing using operators
// module test;

//   bit [31:0] a;

//   initial begin

//     a = 32'b10101010101010101010101010101010;
    
//     $display("+:\n");

//     $display("%b", a[0 +:4]);   
//     $display("%b", a[4 +:4]);   
//     $display("%b", a[8 +:4]);  
//     $display("%b", a[12+:4]); 
//     $display("%b", a[16+:4]);
//     $display("%b", a[20+:4]);
//     $display("%b", a[24+:4]);
//     $display("%b", a[28+:4]);
    
    
//     $display("\n-:\n");
    
//     $display("%b", a[31 -:4]);   
//     $display("%b", a[27 -:4]);   
//     $display("%b", a[23 -:4]);  
//     $display("%b", a[19-:4]); 
//     $display("%b", a[15-:4]);
//     $display("%b", a[11-:4]);
//     $display("%b", a[7-:4]);
//     $display("%b", a[3-:4]);
    
    
//   end

// endmodule



// class A #(int size = 32);  //value parameter
//   logic [size-1:0] data;
//   logic [size-5:0] name;
// endclass

// module top;
//   A a1;            
//   A #(80) a2; 
//   A #(100) a3;
  
//   initial begin
//     a1=new();
//     a2=new();
//     a3=new();
//     a1.data = 100;
    
//     a2.data ="ABC";
//     a2.name = "DEF";
    
//     $display("a1.data = %0d",a1.data);
    
//     $display("a1.data = %s",a2.data);
    
//     $display("a1.data = %s",a2.name);
//   end
// endmodule


// module top;
//   int a[][];
//   int i;
//   int b[2][2];
  
  
//   initial begin
//     b='{'{1,2},{3,4}};
    
//     a=new[2];
//     foreach(a[i]) begin
//       a[i]=new[2];
//     end
    
//     foreach(a[i,j]) begin
//       a[i][j] = b[i][j];
//     end
    
//     foreach(a[i,j]) begin
//       $display("a[%0d][%0d]=%0p",i,j,a[i][j]);
//     end
    
//   end
//     endmodule


// class A;
//   int a[][];
  
// endclass

// class B;
//  int b[][];
  
// endclass

// module test;
//   A a1;
//   B b1;
  
//   initial begin
    
//     a1=new();
//     b1 = a1;
    
//   end
// endmodule


// module tb;
//     class A;
      
      
//     endclass
//   A a_h [];
//   A b_h[];
//   initial begin
//     a_h = new[10];
//  //   b_h = new();
    
//     foreach(a_h[i])begin
//       a_h[i] = new();
//  //     b_h = new();
//      b_h =  a_h ;
//   //    $display("b[%0d]=%0p",i,b_h[i]);
    
//     end
    
    
//    foreach(b_h[i])begin
//      b_h[i]= i; 
//   $display("b[%0d]=%0p",i,b_h[i]);
//  end
//   end
  
// endmodule
  


// module tb;

//   class A;
//     int data;

//     function void display();
//       $display("data = %0d", data);
//     endfunction
//   endclass

//   A a_h[];
//   A b_h[];

//   initial begin

//     // Create and initialize a_h
//     a_h = new[10];

//     foreach(a_h[i]) begin
//       a_h[i] = new();
//       a_h[i].data = i;
//     end

//     // Create b_h with same size
//     b_h = new[a_h.size()];

//     // Copy contents from a_h to b_h
//     foreach(a_h[i]) begin
//       b_h[i] = new();
//       b_h[i].data = a_h[i].data;
//     end

//     // Display b_h
//     foreach(b_h[i]) begin
//       $display("b_h[%0d].data = %0d", i, b_h[i].data);
//     end

//   end

// endmodule


// 1. Define the child class
class Transaction;
  rand bit [7:0] data;
  rand bit [3:0] id;
  
  function void display(string name);
    $display(" %s -> ID: %0d, Data: 0x%0d", name, id, data);
  endfunction
endclass

// 2. Define the parent class containing the dynamic array of classes
class Packet;
  rand bit [5:0] packet_id;
  
  // Dynamic array of Transaction objects
  rand Transaction tx_array[]; 
  
  // Constraints for the array size
  constraint c_array_size {
    tx_array.size() inside {[3:6]}; // Randomize size between 3 and 6 elements
  }
  
  // Crucial: Construct the objects BEFORE randomization so the solver can randomize them,
  // or allocate them in post_randomize. Allocating in pre_randomize is best if you want 
  // the inner fields of the objects to be randomized by the parent's .randomize() call.
  
  function void pre_randomize();
    // Since we don't know the randomized size yet, we can provisionally 
    // allocate a maximum size or handle allocation in post_randomize.
    // However, the cleanest SV approach for randomizing *contents* of an array of objects
    // is to pre-allocate an array size, or use post_randomize if you just want to instantiate them.
  endfunction

  function void post_randomize();
    $display("Packet Randomized: ID = %0d, Array Size = %0d", packet_id, tx_array.size());
    
    // Allocate individual object handles for the newly sized array
    foreach (tx_array[i]) begin
      if (tx_array[i] == null) begin
        tx_array[i] = new();
      end
      // Inline randomization for the child object if it wasn't part of the tool's deep randomization
      void'(tx_array[i].randomize()); 
      tx_array[i].display($sformatf("Element[%0d]", i));
    end
  endfunction
endclass

// 3. Testbench Module to run the example
module tb;
  initial begin
    Packet pkt;
    pkt = new();
    
    $display("--- First Randomization ---");
    if (!pkt.randomize()) $error("Randomization failed");
    
    $display("\n--- Second Randomization ---");
    if (!pkt.randomize()) $error("Randomization failed");
  end
endmodule
