// module test;
//   int a;
//   initial begin
//     a=7;
//     force a=1;
//     force a = 2;
//     $display("%0d",a);
//     release a;
//      $display("%0d",a);
//   end
//     endmodule

// module test;
//   bit [3:0] a;
  
//   initial begin
//     for(a=0;a<16;a++)  /// infinite loop
//       $display("%0d",a); 
//   end
// endmodule

// module test;
//   bit [3:0][2:0] a [100];
  
  
  
//   int i,j,k;
//   int temp;
  
//   initial begin
//     foreach(a[i])begin
//       a[i] = $urandom_range(1,100);
  
//   //  $display("a[%0d][%0d][%0d] = %0p",i,j,k,a[i][j][k]);
//       $display("a[%0d]",i,a[i]);
//     end
//      $display("\n");
//     for(i=0;i<50;i++)
//       begin 
//         temp=a[i];
//         a[i] = a[99-i];
//         a[99-i]=temp;
// // $display("a[%0d][%0d][%0d] = %0p",i,j,k,a[i][j][k]);
//         $display("a[%0d]=%0d,\ta[%0d]=%0d",i,a[i],99-i,a[99-i]);
//    //     $display("a[%0d]=%0d",i,a[i]);
//     end
   
//   end
// endmodule


// module test;
//   int a[],i;
  
  
//   initial begin
//     a=new[5];
//     foreach(a[i]) begin
//       a[i]=$urandom_range(1,100);
//       $display("a[%0d]=%0d",i,a[i]);
      
//       a=new[10](a);
      
//     end
//   end
// endmodule


// module test;
//   int a[][][],i,j,k;
  
  
//   initial begin
//     a=new[5];
//     foreach(a[i]) begin
//       a[i]=new[4];
 
//       foreach(a[i,j])begin
//         a[i][j]=new[2];
//         foreach(a[i,j,k]) begin
          
//           a[i][j][k]=$urandom_range(1,100);
//           $display("a[%0d][%0d][%0d]=%0d",i,j,k,a[i][j][k]);
    
//     end
//       end
//               end
//   end
// endmodule


// module test;
//  bit [3:0][2:0] a[100];

// int i;
// bit [3:0][2:0] temp;

// initial begin

//   // Fill array
//   foreach(a[i])
//     a[i] = i;

//   // Reverse every block of 4
//   for(i=0; i<100; i+=4) begin

//     temp   = a[i];
//     a[i]   = a[i+3];
//     a[i+3] = temp;

//     temp   = a[i+1];
//     a[i+1] = a[i+2];
//     a[i+2] = temp;

//   end

//   foreach(a[i])
//     $display("a[%0d] = %0d", i, a[i]);

// end
// endmodule

