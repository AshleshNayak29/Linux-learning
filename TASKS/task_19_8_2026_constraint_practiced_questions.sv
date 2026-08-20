///fibonacci seeries
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



/// 2, 4, 12, 14, 42, 44, 132, 134...

// class con;
//   rand int a[];

//   constraint c1 {
//     a.size() == 20;
//   }

//   constraint c2 {
//     a[0] == 2;

//     foreach (a[i])
//       if (i > 0)
//         if (i % 2 == 0)
//           a[i] == a[i-1] * 3;
//         else
//           a[i] == a[i-1] + 2;
//   }
// endclass


// module test;
//   con c;

//   initial begin
//     c = new();

//     if (c.randomize())
//       foreach (c.a[i])
//         $display("a[%0d] = %0d", i, c.a[i]);
//     else
//       $display("Randomization failed");
//   end
// endmodule


////1, 2, 5, 10, 17, 26, 37, 50, 65, 82
// class A;
//   rand int a[10];

//   constraint c1 {
//     foreach (a[i])
//       a[i] == (i * i) + 1;
//   }
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize())
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d", i, aa.a[i]);
//     else
//       $display("Randomization failed");
//   end
// endmodule

///1, 2, 3, 4, 5, 4, 3, 2, 1

// class A;
//   rand int a[10];

//   constraint c1 {
//     foreach (a[i])
//       if(i<5)
//         a[i]==i+1;
    
//     else
//       a[i] == 9-i;
//   }
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize())
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d", i, aa.a[i]);
//     else
//       $display("Randomization failed");
//   end
// endmodule

///1221122112211..... 

// class A;
//   rand int a[10];

//   constraint c1 { 
//     foreach (a[i])
//       if(i%4 ==0 || i%4 ==3)
//         a[i] == 1;
    
//     else a[i] == 2;
//   }
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize())
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d", i, aa.a[i]);
//     else
//       $display("Randomization failed");
//   end
// endmodule


/// 2D ynamic array
// class A;
//   rand int a[][];

//   constraint c1 {
//     a.size() == 10;

//     foreach (a[i])
//       a[i].size() == 10;
//   }

//   constraint c2 {
//     foreach (a[i])
//       foreach (a[i][j])
//         a[i][j] == j + 1;
//   }
// endclass


// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize())
//       foreach (aa.a[i])
//         foreach (aa.a[i][j])
//           $display("a[%0d][%0d] = %0d", i, j, aa.a[i][j]);
//     else
//       $display("Randomization failed");
//   end
// endmodule


/////Armstrong number////

// class A;
//   rand int a;
//   rand int d1, d2, d3;

//   constraint c1 {
//     a == d1*100 + d2*10 + d3;

//     d1 inside {[1:9]};
//     d2 inside {[0:9]};
//     d3 inside {[0:9]};

//     a == d1**3 + d2**3 + d3**3;
//   }
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();
    
//     repeat(10) begin
    
//     aa.randomize();

//       $display("a = %0d", aa.a); end
//   end
// endmodule


////solve before constraint.///

// class A;
//   rand int a, b;
//   rand int sum1, sum2;

//   constraint c1 {
//     a inside {[10:20]};
//     b inside {[10:20]};

//     sum1 == a + b;
//     sum2 == sum1 + sum1;

//     solve sum1 before sum2;
//   }
// endclass


// module test;
//   A aa;

//   initial begin
//     aa = new();

//     repeat(10) begin
//       if (aa.randomize())
//         $display("a=%0d b=%0d sum1=%0d sum2=%0d",
//                  aa.a, aa.b, aa.sum1, aa.sum2);
//       else
//         $display("Randomization failed");
//     end
//   end
// endmodule


//Write a constraint of size 10 first five should be increment order and next five  should be decrement order and all the elements should be divisible by 5?

// class A;
//   rand int a[10];

//   constraint c1 {
//     foreach (a[i]) {
//       a[i] inside {[1:100]};
//       a[i] % 5 == 0;

//       if (i > 0)
//         if (i < 5)
//           a[i] > a[i-1];
//         else
//           a[i] < a[i-1];
//     }
//   }
// endclass


// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize())
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d", i, aa.a[i]);
//     else
//       $display("Randomization failed");
//   end
// endmodule


////Write a constraint every 3rd index in an array should be divisible by 2  ex 2, 5, 8 index the number should be divisible by 2.

// class A;
//   rand int a[10];

//   constraint c1 {
//     foreach (a[i]) {
//       a[i] inside {[10:100]};

//       if (i % 3 == 2)
//         a[i] % 2 == 0;
//     }
//   }
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize())
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d", i, aa.a[i]);
//     else
//       $display("Randomization failed");
//   end
// endmodule

//// 0,2,1,3,4,6,5,7,8
// class A;
//   rand int a[20];

//   constraint c1 {
//     foreach (a[i])
//       if (i % 4 == 0)
//         a[i] == i;
//       else if (i % 4 == 1)
//         a[i] == i + 1;
//       else if (i % 4 == 2)
//         a[i] == i - 1;
//       else
//         a[i] == i;
//   }
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize())
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d", i, aa.a[i]);
//     else
//       $display("Randomization failed");
//   end
// endmodule


//// Write a code random generate 10 real numbers between 1.356 to 2.683.

// class A;
//   rand real a[20];
//   real b[20];

//   constraint c1 {
//     foreach (a[i])
//       a[i] inside {[1356:2683]};
//   }

//   function void post_randomize();
//     foreach (a[i])
//       b[i] = a[i] / 1000.0;
//   endfunction
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize()) begin
//       foreach (aa.a[i])
//         $display("a[%0d] = %0.3f, b[%0d] = %0.3f",
//                  i, aa.a[i], i, aa.b[i]);
//     end
//     else
//       $display("Randomization failed");
//   end
// endmodule


//What is the constraint to generate the pattern 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 1 0 2 0 3 0 4 0 5

// class A;
//   rand int a[100];

//   constraint c1 {
//     foreach (a[i]) {
//       a[i] inside {[0:9]};
    
//   if(i<18)
//       if(i%2==0)
//         a[i]==0;
//     else
//       a[i] == (i+1)/2;
//   else 
//     a[i] == a[i-18];
//   }
      
//   }
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize()) begin
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d",
//                  i, aa.a[i]);
//     end
//     else
//       $display("Randomization failed");
//   end
// endmodule


///// Write a constraint to generate a random value for var1[7:0] with in 50 and var2[7:0] with the non epeated value in every randomization?

// class A;
//   rand int a[20];
//   int b[20];

//   constraint c1 {
//     foreach (a[i])
//       a[i] inside {[0:100]};
//   }

//   function void post_randomize();
//     int temp[$];

//     temp = a.unique();

//     foreach (temp[i])
//       b[i] = temp[i];
//   endfunction
// endclass

// module test;
//   A aa;

//   initial begin
//     aa = new();

//     if (aa.randomize()) begin
//       foreach (aa.a[i])
//         $display("a[%0d] = %0d", i, aa.a[i]);

//       foreach (aa.b[i])
//         $display("b[%0d] = %0d", i, aa.b[i]);
//     end
//     else
//       $display("Randomization failed");
//   end
// endmodule


////// What is the constraint to generate the pattern 9 7 5 3 1 8 6 4 2 0 

class A;
  rand int a[10];

  constraint c1 {
    foreach (a[i])
      if (i < 5)
        a[i] == 9 - (i * 2);
      else
        a[i] == 8 - ((i-5) * 2);
  }
endclass

module test;
  A aa;

  initial begin
    aa = new();

    if (aa.randomize()) begin
      foreach (aa.a[i])
        $display("a[%0d] = %0d", i, aa.a[i]);
    end else
      $display("Randomization failed");
  end
endmodule
