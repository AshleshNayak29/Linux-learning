// //generate unique values without using unique keyword and randc

// class unique_generator;
//   rand int a[10];

//   constraint c1 {
//     foreach (a[i]) {
//       a[i] inside {[1:10]};

//       foreach (a[j]) {
//         if (i != j) {
//           a[i] != a[j];
//         }
//       }
//     }
//   }
// endclass
          
//          module test;

//   unique_generator u;

//   initial begin
//     u = new();

//     assert(u.randomize());

//     foreach (u.a[i]) begin
//       $display("a[%0d] = %0d", i, u.a[i]);
//     end

//   end

// endmodule


// class unique_value;
 
//   rand bit [3:0] value; 
  
//   bit [3:0] queue[$];

//   constraint unique_c {
//     !(value inside {queue});
//   }

//   function void post_randomize();
//     queue.push_back(value);
    
//     if (queue.size() == 16) begin
     
//       queue.delete();
//     end
//   endfunction
// endclass

// module tb;
//   unique_value gen;

//   initial begin
//     gen = new();
  
//     repeat (10) begin
//       if (gen.randomize()) begin
//         $display("Generated Value: %0d", gen.value);
//       end
//     end
//   end
// endmodule


///// Difference between rand and randc  /////////////////////

// class packet;
//   rand int rand_value;
//   randc int randc_value;
  
//   constraint c1 {
//     rand_value inside {[1:5]};
//   }
  
//   constraint c2 {
//     randc_value inside {[1:5]};
//   }
  
// endclass


// module test;

//   packet p = new();

//   initial begin
//     repeat (10) begin
//       assert(p.randomize());
//       $display("rand_value = %0d\trandc_value = %0d", p.rand_value, p.randc_value);
      
      
//     end
//   end

// endmodule

/////pre and post randomization ////////

// class A;

//   rand int a;
//   rand int b;

//   real aaa;
//   real bbb;

//   constraint c1 {
//     a inside {[1:100]};
//     b inside {[1:100]};
//   }

//   function void pre_randomize();
//     $display("Before randomization");
//   endfunction

//   function void post_randomize();
//     $display("After randomization");

//     aaa = a / 4;
//     bbb = b / 4;   ///SV randomize doesnot produce random real values so make changes in postrandomization
//   endfunction

// endclass


// module test;

//   A aa;

//   initial begin

//     aa = new();

//     repeat(10) begin

//       assert(aa.randomize());

//       $display("a = %0.2f  b = %0.2f", aa.aaa, aa.bbb);

//     end

//   end

// endmodule



//////constraints/////
// class packet;

//   rand int addr;
//   rand int data;
//   rand bit write;
//   rand bit enable;

//   rand int array[5];

//   // RANGE CONSTRAINT
 
//   constraint c {
//     addr inside {[0:100]};
//     data inside {[1:255]};
//   }
// // INSIDE CONSTRAINT
  
//   constraint c_inside {
//     addr inside {10, 20, 30, 40, 50};
//   }

//   /// DIST CONSTRAINT
//   constraint c_dist1 { /// equal weight distribution
//     data dist {
//       10 := 50,
//       20 := 30,
//       30 := 20
//     };
//   }
  
  
//   constraint c_dist2 { /// proportional weight distribution
//     data dist {
//       10 :/ 50,
//       20 :/ 30,
//       30 :/ 20
//     };
//   }

//   // CONDITIONAL CONSTRAINT
 
//   constraint c_if {
//     if (write)
//       data inside {[100:200]};
//     else
//       data inside {[1:50]};
//   }

//   // IMPLICATION CONSTRAINT
  
//   constraint c_implication {
//     enable -> addr inside {[0:50]};
//   }

//   // ARRAY CONSTRAINT
  
//   constraint c_array {
//     foreach (array[i])
//       array[i] inside {[0:100]};
//   }

//   // ARRAY RELATIONSHIP
  
//   constraint c_array_relation {
//     foreach (array[i])
//       if (i > 0)
//         array[i] > array[i-1];
//   }

//   // UNIQUE VALUES
  
//   constraint c_unique {
//     unique {array};
//   }

//   //  SOLVE BEFORE
 
//   constraint c_solve {
//     solve write before data;
//   }

// endclass


// module test;

//   packet p;

//   initial begin

//     p = new();

//     repeat (5) begin

//       if (p.randomize() with {p.addr >10;p.data>20;}) //inline constraint
//       begin

//         $display("addr  = %0d", p.addr);
//         $display("data  = %0d", p.data);
//         $display("write = %0d", p.write);
//         $display("enable = %0d", p.enable);

//         foreach (p.array[i]) begin
//           $display("array[%0d] = %0d", i, p.array[i]);

//       end
//       $display("\n");
//       end
      
//       else begin
//         $display("Randomization FAIlED");
//       end

//     end

//   end

// endmodule


////// rand mode and constraint mode//////
// class packet;

//   rand int addr;
//   rand int data;

//   constraint c1 {
//     addr inside {[10:20]};
//     data inside {[100:200]};
//   }

// endclass


// module test;

//   packet p;

//   initial begin
//     p = new();

//     p.addr.rand_mode(1);
//     p.data.rand_mode(1);

//     p.randomize();
//     $display("rand mode(1) addr = %0d, data = %0d", p.addr, p.data);

//     p.addr.rand_mode(0); //disable only addr

//     p.randomize();
//     $display("rand mode(0): addr = %0d, data = %0d", 
//              p.addr, p.data);

//     p.addr.rand_mode(1);// here enabling again

//     p.randomize();
//     $display("second time addr rand_mode(1): addr = %0d, data = %0d", 
//              p.addr, p.data);
    
//     p.rand_mode(0);  /// disabling whole randomization
//     p.randomize();
    
//     $display("p.rand_mode(0): addr = %0d, data = %0d", 
//              p.addr, p.data);
//   end

// endmodule


// class packet;

//   rand int addr;
//   rand int data;

//   constraint c_addr {
//     addr inside {[10:20]};
//   }

//   constraint c_data {
//     data inside {[100:200]};
//   }

// endclass


// module test;

//   packet p;

//   initial begin
//     p = new();

//     p.c_addr.constraint_mode(1);
//     p.c_data.constraint_mode(1);

//     p.randomize();

//     $display("here both constraints are on addr = %0d, data = %0d", p.addr, p.data);


//     p.c_addr.constraint_mode(0);

//     p.randomize();

//     $display("here c_addr disabled: addr = %0d, data = %0d", p.addr, p.data);

//     p.c_addr.constraint_mode(1);

//     p.randomize();

//     $display("here c_addr enabled again addr = %0d, data = %0d", p.addr, p.data);
    
//     p.constraint_mode(0); // here both constarits are disabled
//     $display("here both constraints are disabled addr = %0d, data = %0d", p.addr, p.data);

//   end

// endmodule




////// constraint for AXI aligned address //////

// class axi_transaction;

//   rand bit [31:0] addr;
//   rand bit [2:0]  awsize;

//   constraint c_addr {
//     addr % (2 ** awsize) == 0;
//   }

// endclass





