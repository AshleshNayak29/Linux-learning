/////////////////fork join_any//////////////////////////
// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//       begin
//         #20 $display($time,"\tA");
//         #10 $display($time,"\tB");
//       end
//       begin
//         #10 $display($time,"\tC");
//         #2 $display($time,"\tD");
//       end
      
//     join_any
    
//     #4 $display($time,"\tE");
//     #3 $display($time,"\tF");
    
//     $display("END");
    
//     #30 $finish;
//   end
// endmodule


/////////////////////fork join_none//////////////////////////////

// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//       begin
//         #20 $display($time,"\tA");
//         #10 $display($time,"\tB");
//       end
//       begin
//         #10 $display($time,"\tC");
//         #2 $display($time,"\tD");
//       end
      
//     join_none
    
//     #4 $display($time,"\tE");
//     #3 $display($time,"\tF");
    
//     $display("END");
    
//     #40 $finish;
//   end
// endmodule


/////////////////////////wait fork with for join_any//////////////////////////

// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//       begin
//         #20 $display($time,"\tA");
//         #10 $display($time,"\tB");
//       end
//       begin
//         #10 $display($time,"\tC");
//         #2 $display($time,"\tD");
//       end
      
//     join_any
    
//     wait fork; /////////////////wait until all the thread gets executed
//       ///now this will act as fork join
    
//     #4 $display($time,"\tE");
//     #3 $display($time,"\tF");
    
//     $display("END");
    
//     #40 $finish;
//   end
// endmodule


///////////////////////////wait fork with for join_none///////////////////////

// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//       begin
//         #20 $display($time,"\tA");
//         #10 $display($time,"\tB");
//       end
//       begin
//         #10 $display($time,"\tC");
//         #2 $display($time,"\tD");
//       end
      
//     join_none
//     wait fork;
    
//     #4 $display($time,"\tE");
//     #3 $display($time,"\tF");
    
//     $display("END");
    
//     #40 $finish;
//   end
// endmodule


/////////////////////////disable fork////////////////////////////////

// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//       begin
//         #20 $display($time,"\tA");
//         #10 $display($time,"\tB");
//       end
//       begin
//         #10 $display($time,"\tC");
//         #2 $display($time,"\tD");
//       end
      
//     join_any
    
//     fork
//       begin
//         #20 $display($time,"\tA");
//         #10 $display($time,"\tB");
//       end
//       begin
//         #10 $display($time,"\tC");
//         #2 $display($time,"\tD");
//       end
      
//     join_none
    
//     disable fork;
  
    
//     #4 $display($time,"\tE");
//     #3 $display($time,"\tF");
    
//     $display("END");
    
//     #40 $finish;
//   end
// endmodule


//////////////////////////fork join_any with fork join_none////////////
// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//       begin
//         #20 $display($time,"\tfork join_any A");
//         #10 $display($time,"\tfork join_any B");
//       end
//       begin
//         #10 $display($time,"\tfork join_any C");
//         #2 $display($time,"\tfork join_any D");
//       end
      
//     join_any
    
//     fork
//       begin
//         #20 $display($time,"\tfork join_none A");
//         #10 $display($time,"\tfork join_none B");
//       end
//       begin
//         #10 $display($time,"\tfork join_none C");
//         #2 $display($time,"\tfork join_none D");
//       end
      
//     join_none
    
//     #4 $display($time,"\tE");
//     #3 $display($time,"\tF");
    
//     $display("END");
    
//     #40 $finish;
//   end
// endmodule

//////////////////////fork join///////////////////////////

// module test;
//   initial begin
//     fork
//       #1  $display($time,"\tA");
//       $display($time,"\tB");
//       $display($time,"\tC");
//     join
//   end
// endmodule

/////////////////////////////////////////////////////////////////////////

// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//       begin
//         $display($time,"\tfork join_none A");
//         $display($time,"\tfork join_none B");
//       end
//       begin
//         $display($time,"\tfork join_none C");
//         $display($time,"\tfork join_none D");
//       end
      
//     join_any
    
//     fork
//       begin
//         $display($time,"\tfork join_any A");
//         $display($time,"\tfork join_any B");
//       end
//       begin
//        $display($time,"\tfork join_any C");
//         $display($time,"\tfork join_any D");
//       end
      
//     join_none
    
//     $display($time,"\tE");
//     $display($time,"\tF");
    
//     $display("END");
    
//   #10 $finish ;
//   end
// endmodule

////////////////////////////////////////////////////////////////////

// module test;
//   initial begin
    
//     $display("BEGINNING");
    
//     fork
//      begin
//        $display($time,"\tfork join_none with for loop");
        
//         for(int i=0;i<=5;i++)
//           begin
//             $display($time,"\ti=%0d",i);
//       end
//       end
//       begin
//         $display($time,"\tfork join_none after for loop");
//       end
      
//     join_any
    
    
//       begin
//         $display($time,"\tfork join_any with for loop");
        
//         for(int i=0;i<=5;i++)
//           begin
//             fork
//               $display($time,"\ti=%0d",i);            
//           // #2 $display($time,"\ti2=%0d",i);

//             join_any
//           //  #1;
//       end
//       end
// //       begin
// //         $display($time,"\tfork join_any after for loop");
       
// //       end
      
    
    
//     $display($time,"\tstatements outside fork join");
    
//     $display("END");
    
//   #10 $finish ;
//   end
// endmodule

/////////////////////////////////////////////////////////////////////////////

// module test;
//   initial begin
    
//      begin
//        $display($time,"\tfork join_none with for loop");
        
//         for(int i=0;i<=5;i++)
//           begin
//             fork
//             $display($time,"\ti=%0d",i);
//             join_none
//             //    #1;  
//             //if we use fork join none without delay then the i values will be displayed in the background but it will not print on the output window but once the for loop ends i value will be 6 that one only print 6 times
// //if we use delay of one then it will print 012345 how because after 1ns it will go for next iteration
            
//           end
//      end
//       end
//       endmodule

////////////////  fork join inside another fork join//////

// module test;
//   initial begin
    
//     repeat(2) begin
    
//     fork
//       #10;//Here this 10 is not applicable for for display
//       $display("time=%0t\tA",$time);
//       $display("\ntime=%0t\tB",$time);
      
//       fork
//         $display("\ntime=%0t\tC",$time);
//         fork
//           $display("\ntime=%0t\tD",$time);
//           #10 $display("\ntime=%0t\tB",$time);
          
//         join_any
//       join
//   //  join_none
//     join
//   end
    
//     $display("\n  next iteration\n");
//   end
// endmodule


/////// for loop witin the fork join//////

// module test;
//   initial begin
    
//     for(int i=0;i<10;i++)begin
//     //  #1;
//       fork
//       begin
//         $display("i=%0d",i);
//       end
//     join_none
//   //    wait fork;
//     end end
// endmodule

// // Step-by-step execution
// // The for loop starts with i = 0.
// // fork...join_none creates a new process but does not wait for it to execute.
// // The parent process immediately continues to the next iteration.
// // This repeats until the loop finishes.
// // After the loop completes, i becomes 10.
// // Now the forked processes finally get CPU time to execute.
// // Since all the processes are referring to the same loop variable i, whose current value is now 10, every process prints:

///// disable the fork//////

//  module test;
//   initial begin
    
//     fork
//        $display("time=%0t\tA",$time);
//       $display("\ntime=%0t\tB",$time);
      
//       fork
//         $display("\ntime=%0t\tC",$time);
//         fork
//           $display("\ntime=%0t\tD",$time);
//        $display("\ntime=%0t\tB",$time);
          
//         join_any
//       join
//     join_none
//  disable fork;
// //  end
    
//    $display("\n  /////////////////\n");
//   end
// endmodule

        
///// how can disbale only perticular fork/////

// module test;
//   initial begin
    
//     fork : f1
//        $display("time=%0t\tA",$time);
//       $display("\ntime=%0t\tB",$time);
      
//       fork :f2
//         $display("\ntime=%0t\tC",$time);
//         fork : f3
//           $display("\ntime=%0t\tD",$time);
//        $display("\ntime=%0t\tB",$time);
          
//         join_any :f3
//       join :f2
//     join_none :f1

//   end
  
//   initial begin
//     disable f1;
//   end
// endmodule

///////////////////////////////////////////////

// module test;
//   int a,b,c,d,e;
 
//   initial begin
//     repeat(5) begin
//     fork
     
//         #10;
//       $display("0 ## delay  time = %t",$time);
//         #5
//       $display("5 ## delay time = %t",$time);
//         #9
//       $display("9 ## delay time = %t",$time);
     
//     join
//       $display("  **    time = %t",$time);
//     end
 
//   end
// endmodule

// module test;

//   int a,b,c,d,e;
 
//   initial begin
//    // repeat(2) begin
//     fork
     
//         #10
//       $display("0 ## delay  time = %t",$time); //10   //10     //  
//         #5
//       $display("5 ## delay time = %t",$time); // 5 //5 //
//         #9
//       $display("9 ## delay time = %t",$time); //9 //9  //
     
//     join_any
//     $display("  **    time = %t",$time);  //5 //5  //
//     #60  $display(" 60  ## delay time = %t",$time); // inside the begin and end delay is added  //65 //65
//   //  end
//     $display("\n next iteration time = %t",$time);//65   //65
   
//   end
 
//   task ta();
//     fork begin
//       #10 $display("inside task    fork join time = %t",$time);//10   //10 //
//     end
//       join
//   endtask
 
//   initial begin
//     ta();
//   end
 
//   task ta1();
//     fork begin
//       #7 $display("inside task  **TA1**   fork join time = %t",$time);//7    // 7   //
//       #9 $display("inside task  **TA2**   fork join time = %t",$time);//16    //9  // **

//     end
//       join
//     #7 $display("inside task  **TA3**   fork join time = %t",$time); //7 //18 //////23

//       fork begin
//         #6 $display("inside task  **TA4**   fork join_any time = %t",$time);//13   //24  ////29
//         #1 $display("inside task  **TA5**  fork join_any time = %t",$time);//14 //25  ///30
//         end
//       join_any
//     #2 $display("outside task   **TA6**   fork join_any time = %t",$time);//9   //26   //32
//     #2 $display("outside task   **TA7**   fork join_any time = %t",$time);//11   //29  //34
//     fork begin
//       #11 $display("inside task  **TA8**   fork join_none time = %t  ",$time);//22   //40  //  45
//       #10 $display("inside task   **TA9**   fork join_none time = %t  ",$time);//32 //39    //55
//     end
//       join_none
//     #1 $display("outside task   **TA10**   fork join_none time = %t",$time);//12 //30   //35
//     #13 $display("outside task  **TA11**   fork join_none time = %t",$time);//25 //43    //48
//     #15 $display("outside task  **TA12**  fork join_none time = %t",$time);//40 //58  //63


//   endtask
// //   initial begin
// //     ta1();
// //     $display(" ta 1 ************    time = %t",$time);//40 //63
// //   end
// // endmodule

// ////

// module test;
//   int a,b,c,d,e;
 
//   initial begin
//    // repeat(5) begin
//     fork
     
//       #10;                                  // none any join
//       $display("0 ## delay 1 time = %t",$time); //0  //0  //0
//         #5
//       $display("5 ## delay 2 time = %t",$time);  //5  //5  //5
//         #9
//       $display("9 ## delay 3  time = %t",$time); // 9  //9  //9
     
//     join
//     $display("  **   4   time = %t",$time);  //0  //0    //10
//        #5
//     $display("5 ## delay  5 time = %t",$time);  //5 //5   //15
//         #9
//     $display("9 ## delay   6  time = %t",$time); // 14  //14  //24
//    // end
 
//   end
// endmodule


///////////////// Process///////////////////////

// Method	Purpose
// process::self() -  Returns the handle of the currently executing process.
// status()	       -  Returns the current process state (RUNNING, WAITING,                           SUSPENDED, FINISHED, KILLED).
// suspend()	   -Temporarily pauses the process.
// resume()	       -Restarts a suspended process.
// kill()	       -Immediately terminates the process.

module test;

  process p;

  task automatic counter();
    int i = 1;

    p = process::self();

    forever begin
      $display("[%0t] Counter = %0d", $time, i);
      i++;
      #5;
    end
  endtask

  initial begin

    fork
      counter();
    join_none

    #1;

    $display("[%0t] Status = %s", $time,p.status().name());

    #14;

    $display("\nSuspending Process at %0t", $time);
    p.suspend();

    $display("Status = %s", p.status().name());

    #20;

    $display("\nResuming Process at %0t", $time);
    p.resume();

    $display("Status = %s", p.status().name());

    #20;

    $display("\nKilling Process at %0t", $time);
    p.kill();

    $display("Status = %s", p.status().name());

    #10;
    $finish;

  end
  
//   State	Meaning
// RUNNING	The process is currently executing.
// WAITING	The process is waiting for a delay (#), an event (@), or a wait statement.
// SUSPENDED	The process has been paused using suspend().
// FINISHED	The process has completed normally.
// KILLED	The process was terminated using kill().

endmodule


// module test;
//   initial begin
//     fork :f1
//       #35 $display("  ** 1 ** time = %0t ",$time);
//     fork :f2
//           #10 $display("  ** 2 ** time = %0t ",$time);
//         join :f2
//       fork :f3
//             #5 $display("  ** 3 ** time = %0t ",$time);
//             #20 $display("  ** 4 ** time = %0t ",$time);
//         join :f3
//       fork :f4
//           #50 $display("  ** 5 ** time = %0t ",$time);
//           fork :f5
//             #10 $display("  ** 6 ** time = %0t ",$time);
//             #15 $display("  ** 7 ** time = %0t ",$time);
//           join :f5
//         join :f4
//       fork :f6
//         #25 $display("  ** 8 ** time = %0t ",$time);
//       join :f6
//       fork :f7
//         #50 $display("  ** 9 ** time = %0t ",$time);
//         fork :f8
//           #20 $display("  ** 10 ** time = %0t ",$time);
//           #10 $display("  ** 11 ** time = %0t ",$time);
//           fork :f9
//             #30 $display("  ** 12 ** time = %0t ",$time);
//             fork :f10
//               #35 $display("  ** 13 ** time = %0t ",$time);
//             join :f10
//           join :f9
//         join :f8
//       join :f7
   
//     join :f1   
   
//   end
// //  initial begin
//   //  disable f1;
//   //    end
   

// endmodule


////all type of always blocks ////// 

// module top;

//   logic clk;
//   logic rst;
//   logic a, b;
//   logic sel;
//   logic d;

//   logic y1;      // Output from always
//   logic y2;      // Output from always_comb
//   logic q_ff;    // Output from always_ff
//   logic q_latch; // Output from always_latch

//   initial begin
//     clk = 0;
//     forever #5 clk = ~clk;
//   end

//   initial begin

//     rst = 0;
//     a     = 0;
//     b     = 0;
//     sel   = 0;
//     d     = 0;

//     #12 rst = 1;

//     #10 a = 1;
//     #10 b = 1;
//     #10 sel = 1;
//     #10 d = 1;
//     #10 d = 0;
//     #10 sel = 0;
//     #10 a = 0;
//     #20 $finish;

//   end


//   always @(a or b)  //This is the traditional Verilog always block here specify the sensitivity list.
//   begin
//     y1 = a & b;
//   end

//   always_comb   //Used only for combinational logic the simulator automatically determines the sensitivity list
//   begin
//     if(sel)
//       y2 = a;
//     else
//       y2 = b;
//   end

//   always_ff @(posedge clk or negedge rst) //Used only for sequential (flip-flop) logic.
//   begin
//     if(!rst)
//       q_ff <= 0;
//     else
//       q_ff <= d;
//   end

//   always_latch   //Used to model level-sensitive latches.
//   begin
//     if(sel)
//       q_latch = d;
//   end

//  initial begin

//     $monitor("time = %0t\tclk = %b  rst = %b   a=%b b=%b  sel=%b   d=%b |  y1=%b   y2=%b    q_ff=%b      q_latch=%b",
//               $time,clk,rst,a,b,sel,d,y1,y2,q_ff,q_latch);
//   end
  

// endmodule



/// fork join diagram question/////

// module test;

// initial
// fork

//   #35 $display("[%0t] A", $time);

//   fork
//     #10 $display("[%0t] B", $time);

//     fork
//       #20 $display("[%0t] C", $time);
//       #40 $display("[%0t] D", $time);
//       #5  $display("[%0t] E", $time);
//     join

//     #5 $display("[%0t] F", $time);

//     fork
//       #50 $display("[%0t] G", $time);

//       fork
//         #10 $display("[%0t] H", $time);
//         #15 $display("[%0t] I", $time);
//       join

//     join

//     #25
//     $display("[%0t] J", $time);

//     fork

//       #50 $display("[%0t] K", $time);

//       fork

//         #20 $display("[%0t] L", $time);

//      #10   fork
//           #30 $display("[%0t] M", $time);
//           #35 $display("[%0t] N", $time);
//         join

//       join

//     join

//   join

// join

// endmodule
                                              
