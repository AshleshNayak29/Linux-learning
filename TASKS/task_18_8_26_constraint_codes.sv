//generating random numbers using quesue
// module test;
//   bit [3:0] a;
//   int queue[$];

//   initial begin
//     for (int i = 0; i < 15; i++) begin
//       queue.push_back(i);
//     end

//     queue.shuffle();
//     $display("Shuffled queue = %0p", queue);

//     while (queue.size() > 0) begin  ////// here don't use if because only one time it will pop
//       a = queue.pop_front();
//       $display("a = %0d", a);

//     end
//   end
// endmodule


///// fibonacci seeries using constraint

// class fib;
//   rand int fib[10];

//   constraint c1 {
//     foreach (fib[i]) {
//       if (i == 0)
//         fib[i] == 0;
//       else if (i == 1)
//         fib[i] == 1;
//       else
//         fib[i] == fib[i-1] + fib[i-2];
//     }
//   }
// endclass

// module test;
//   fib f;

//   initial begin
//     f = new();

//     f.randomize();
//       foreach (f.fib[i])
//         $display("fib[%0d] = %0d", i, f.fib[i]);
//     end

// endmodule


// class numbers;
//   rand int a[10];

//   constraint c1 {
//     foreach (a[i]) {
//       a[i] inside {[1025:1200]};
//     }
//   }
// endclass

// module test;
//   numbers num;

//   initial begin
//     num = new();

//     if (num.randomize()) begin
//       foreach (num.a[i])
//         $display("a[%0d] = %0d", i, num.a[i]);
//     end
//     else begin
//       $display("failed");
//     end
//   end
// endmodule
    
    
    
    
// ///////// constraints//////

//  1. 01010101010.....

// class packet;
//   rand int a[20];
 
//   constraint c1 {
//     foreach (a[i]) {
//       if (i % 2 == 0
//          )
//         a[i] == 0; 
//       else
//          a[i] ==1;
//     }
//   }
// endclass

// module test;
//   packet pkt;

//   initial begin
//     pkt = new();

//     if (pkt.randomize()) begin
//       foreach (pkt.a[i]) begin
//         $display("a[%0d] = %0d", i, pkt.a[i]);
//       end
//     end else begin
//       $display("failed");
//     end
//   end
// endmodule


// 2. 0011001100.......

// class packet;
//   rand int a[20];
 
//   constraint c1 {
//     foreach (a[i]) {
//       if (i % 4 < 2
//          )
//         a[i] == 0; 
//       else
//          a[i] ==1;
//     }
//   }
// endclass

// module test;
//   packet pkt;

//   initial begin
//     pkt = new();

//     if (pkt.randomize()) begin
//       foreach (pkt.a[i]) begin
//         $display("a[%0d] = %0d", i, pkt.a[i]);
//       end
//     end else begin
//       $display("failed");
//     end
//   end
// endmodule


// 3. 000111000111000....

// class packet;
//   rand int a[20];
 
//   constraint c1 {
//     foreach (a[i]) {
//       if (i % 6 < 3
//          )
//         a[i] == 0; 
//       else
//          a[i] ==1;
//     }
//   }
// endclass

// module test;
//   packet pkt;

//   initial begin
//     pkt = new();

//     if (pkt.randomize()) begin
//       foreach (pkt.a[i]) begin
//         $display("a[%0d] = %0d", i, pkt.a[i]);
//       end
//     end else begin
//       $display("failed");
//     end
//   end
// endmodule


// 4. 1,2,11,22,121,242,.....

// class packet;
//   rand int a[20];

//   constraint c1 {
//     foreach (a[i]) {

// //       if (i == 0)
// //         a[i] == 1;

//     //  else if (i % 2 == 0)
//       //  a[i] == a[i-2] * 11;
//      //  else
// //         a[i] == 2 * a[i-1];
      
//  //////////// ANOTHER LOGIC /////////////     
//       if (i % 2 == 0)
//       a[i] == 11**((i+1)/2); 

//       else
//         a[i] == 2 * 11**((i)/2);
//     }
//   }
// endclass

// module test;
//   packet pkt;

//   initial begin
//     pkt = new();

//     if (pkt.randomize()) begin
//       foreach (pkt.a[i]) begin
//         $display("a[%0d] = %0d", i, pkt.a[i]);
//       end
//     end else begin
//       $display("failed");
//     end
//   end
// endmodule

//5. 1,2,3,4,5,4,3,2,1

// class packet;
//   rand int a[9];
 
//   constraint c1 {
//     foreach (a[i]) {
//       if (i<5)
//         a[i] == i+1; 
//       else
//         a[i] ==9-i;
//     }
//   }
// endclass

// module test;
//   packet pkt;

//   initial begin
//     pkt = new();

//     if (pkt.randomize()) begin
//       foreach (pkt.a[i]) begin
//         $display("a[%0d] = %0d", i, pkt.a[i]);
//       end
//     end else begin
//       $display("failed");
//     end
//   end
// endmodule
    

////constraint for prime numbers

// class prime_num;

//   rand int a;
//   int b;

//   constraint c1 {
//     a inside {[1:100]};
//   }

//   function int prime();

//     if (a <= 1) begin
//       $display("%0d is not a prime number", a);
//       return 0;
//     end

//     for (int i = 2; i <= a/2; i++) begin

//       if (a % i == 0) begin
//         $display("%0d is NOT a prime number", a);
//         return 0;
//       end

//     end

//     $display("%0d is a PRIME number", a);
//     return 1;

//   endfunction

// endclass


// module top;

//   prime_num c;

//   initial begin

//     c = new();
//     repeat(20)
//     assert(c.randomize())
     
//     c.prime();

//   end

// endmodule


class aa;

  int i;
  rand int a[15];

  constraint aa_C {
    foreach (a[j])
      a[j] inside {[2:100]};
  }

  task tt;
    bit prime;

    foreach(a[j]) begin

      prime = 1;  // assume prime

      for(i = 2; i <= 100; i++) begin

        if (a[j] % i == 0 && a[j] != i) begin
          prime = 0;
          break;
        end

      end

      if (prime)
        $display("%0d is prme number ", a[j]);

    end
  endtask

endclass


module tb();

  aa a_h;

  initial begin
    a_h = new();

    repeat(10) begin
      a_h.randomize();
      a_h.tt();
    end

  end

endmodule


      
