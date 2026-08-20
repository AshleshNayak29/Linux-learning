// //simple queue

// module top;

//   int a[$] ;
//   int i;
//   initial begin
    
//    for (i = 0; i < 10; i++) begin
//      // repeat(10) begin
//       a.push_back($urandom_range(1,100));

//     //foreach(a[i])
//       $display("a[%0d] = %0d", i, a[i]);
//     end
//   end

//  endmodule


///////////// queue inside a queue////////////////

// module array;
//   int queue1 [3:0][$];    
//   int queue2[$];          

//   int i, j;

//   initial begin
   
//     foreach(queue1[i])
//       repeat(5)
//         queue1[i].push_back($urandom % 20);

//     for(j=0;j<10;j++) begin
//     queue2.push_back($urandom % 20);
//     end
   
//     foreach(queue1[i,j])
//       $display("queue1[%0d][%0d] = %0d", i, j, queue1[i][j]);
  
//   $display("\n for QUEUE 2");

//     foreach(queue2[i])
//       $display("queue2[%0d] = %0d", i, queue2[i]);
    
//   end
// endmodule


///////////////// queue methods /////////////////////////////

// module queue;
//   int queue[$];
//   initial begin
    
//     for(int i=0;i<9;i++)
//       begin
//         queue.push_back($urandom%10); 
//       end
// //     queue.push_back(1);
// //     queue.push_back(2);
// //     queue.push_back(3);
// //     queue.push_back(4);
// //     queue.push_back(5);
// //     queue.push_back(6);
    
//     $display("queue=%p",queue);
    
//     queue.delete(0);/////////////////here first index value will get removed
//     $display("queue after deleting 0 location element=%p",queue);
    
//     queue.insert(7,9);/////////////in first index insert value 9
//     $display("queue after inserting first element=%p",queue);
    
//     queue.pop_front();
//     $display("queue after poping pront element=%p",queue);
    
//     queue.pop_back();
//     $display("queue after poping last element=%p",queue);
    
//     queue.push_front(8);
//     $display("queue after inserting 8 using push_front method=%p",queue);
    
//     queue={queue,9};////without using push back method inserting value at the end using 
//     $display("queue after inserting 9 without using push_front method=%p",queue);
      
//     $display("minimum value in queue=%0p\n",queue.min());
    
//     $display("maximum value in queue=%0p\n",queue.max());
    
//     $display("unique value in queue=%0p\n",queue.unique());
    
//     $display("Values greater than 3 in queue=%0p\n",queue.find with(item>3));////values greter than 3 will be displayed
    
//     $display("Index values greater than 3 in queue=%0p\n",queue.find_index with(item>5));///Indexes whose value is greater than 5 will bw printed
    
//     $display("The first value index mentioned in the condition of queue=%0p\n",queue.find_first_index with(item==5));
    
//     $display("The first value mentioned as in the condition of queue=%0p\n",queue.find_first with(item>5));
    
//     $display("The last value mentioned as in the condition of queue=%0p\n",queue.find_last with(item>5));
    
//     $display("The last index mentioned as in the condition of queue=%0p\n",queue.find_last_index with(item>5));
    
    
//     ////////////////////////////////array ordering methods////////////////////////////////
//     queue.reverse();
//     $display("After Reversing the elements of queue=%0p\n",queue);
//     queue.sort();
//     $display("After using the method sort() the elements of queue=%0p\n",queue);//ascending order
//     queue.rsort();
//     $display("After using the method rsort() of queue=%0p\n",queue);//descending order
//     queue.shuffle();
//     $display("After shuffling the elements of queue=%0p\n",queue);
    
    
//     $display("$left  = %0d", $left(queue));  //leftmost index 
//     $display("$right = %0d", $right(queue)); // rightmost index
    
//   end
// endmodule
    
    
    
/////// Associative Array /////////

//     module array;
//   int a[string];
//   string key;   

//   initial begin
//     a["AAA"]=100;
//     a["BBB"]=200;
//     a["CCC"]=300;
//     a["DDD"]=400;
    
//     $display("\nassociative array a=%p\n",a);
    
//     //////////////// To find size also we can use num//////////////////
//     $display("size of associative array  %0d \n",a.size());
//     $display("size of associative array  %0d \n",a.num());
    
//     ///////////////// delete method///////////////////////////////////
//     a.delete("AAA");
//     $display("after deleting the index of associative array a=%p\n",a);

//     /////////////////// exists method//////////////////////////////////
//     if(a.exists("BBB"))
//       $display("BBB exists in array\n");

//     ///////////////////FIRST method///////////////////////////////////////
//     if (a.first(key)) begin
//       $display("First index = %s\n", key);
//       $display("Value at first index = %0d\n", a[key]);
//     end

//     /////////////////////LAST method//////////////////////////////////////////
//     if (a.last(key)) begin
//       $display("Last index = %s\n", key);
//       $display("Value at last index = %0d\n", a[key]);
//     end

//     /////////////////////NEXT method////////////////////////////////////
//     key = "BBB"; 
//     if (a.next(key))
//       $display("Next index after BBB = %s value=%0d\n", key, a[key]);
//     else
//       $display("No next index after BBB\n");
//     ////////////////////////prev method//////////////////////////////////////
//      key = "BBB"; 
//     if (a.prev(key))
//       $display("Previous index after BBB = %s value=%0d\n", key, a[key]);
//     else
//       $display("No previous index after BBB\n");
//   end
// endmodule


//module asso;
//   int a[*]; // * will take all the integral type of index
//   int mm[string];
  
//   initial begin
    
//     a[100] = 10;
    
//     mm["AAA"] =20;
//   //  mm["BBB"] = 46;
    
    
//     $display("a[%0d]= %0d",100,a[100]);
//    // if(a.exists("BBB"))
//       if(mm.exists("BBB"))
    
//         $display("a[BBB]");
      
    
//     else
//       $display("   vv   ");
//   end
  
//   endmodule


// module top;
  
//   int a[][];
//   int b[][$];
//   int c[][string];
//   int d[$][$];
//   int e [$][];
//   int f[$][string];
//   int g[int][int];
//   int h[int][];
//   int x[int][$];
//   int i,j,k;
  
//   initial begin
//     a=new[3];
//     b=new[2];
//     c=new[1];
    
//     foreach(a[i]) begin
//       a[i]=new[2];
//       foreach (a[i,j]) begin
//         a[i][j] = $urandom_range(1,100);
//  //     $display("a[%0d][%0d] =%0d",i,j,a[i][j]);
//       end
//     end
    
//     foreach(b[i]) begin
//       repeat(5)
//         b[i].push_back($urandom_range(1,100));
// //      $display("b[%0d][%0d]= %0d",i,j,b[i][j]);
//   end
    
//     c[100]["ABC"] = 100;
    
//     if(c[100]["ABC"])
   
//     $display("c[10][ABC]=%0d",  c[10]["ABC"]);
    
//    for (int i=0; i<3; i++) begin
//             d.push_back('{});          // Empty inner queue

//             for (int j=0; j<5; j++)
//                 d[i].push_back(10+j);
//         end

//         $display("Before = %p", d);

//         foreach(d[i])
//             d[i].push_back(999);

//         $display("After  = %p", d);
    
    
//     for (i=0;i<5;i++)
//       e.push_back('{});
    
//     foreach(e[i]) begin
//       e[i]=new[3];
//       e[i,j]=i*3;
//     end
//   end
// endmodule
      


// module top;

//   int a[][];         
//   int b[][$];     
//   int c[][string];   
//   int d[$][$];      
//   int e[$][];       
//   int f[$][string];   
//   int g[int][int];   
//   int h[int][];       
//   int x[int][$];      

//   int i,j;

//   initial begin


//     a = new[3];
//     foreach(a[i]) begin
//       a[i] = new[2];
//       foreach(a[i,j])
//         a[i][j] = i*10 + j;
//     end

//     $display("\na[][]");
//     foreach(a[i,j])
//       $display("a[%0d][%0d] = %0d",i,j,a[i][j]);

//     b = new[3];

//     foreach(b[i])
//       for(j=0;j<4;j++)
//         b[i].push_back(i*10+j);

//     $display("\nb[][$]");
//     foreach(b[i,j])
//       $display("b[%0d][%0d] = %0d",i,j,b[i][j]);

//     c = new[2];

//     c[0]["A"] = 10;
//     c[0]["B"] = 20;
//     c[1]["X"] = 30;
//     c[1]["Y"] = 40;

//     $display("\nc[][string]");
//     foreach(c[i,s])
//       $display("c[%0d][%s] = %0d",i,s,c[i][s]);

//     for(i=0;i<5;i++) begin
//      // d.push_back('{});      // empty inner queue

//       for(j=0;j<4;j++)
//         d[i].push_back(i*10+j);
//     end

//     $display("\nd[$][$]");
//     foreach(d[i,j])
//       $display("d[%0d][%0d] = %0d",i,j,d[i][j]);


//     for(i=0;i<3;i++)
//       e.push_back('{});      // empty dynamic array

//     foreach(e[i]) begin
//       e[i] = new[4];
//       foreach(e[i,j])
//         e[i][j] = i*100+j;
//     end

//     $display("\ne[$][]");
//     foreach(e[i,j])
//       $display("e[%0d][%0d] = %0d",i,j,e[i][j]);


//     for(i=0;i<3;i++)
//       f.push_back('{});      // create empty associative array

//     f[0]["A"] = 1;
//     f[0]["B"] = 2;

//     f[1]["X"] = 3;
//     f[1]["Y"] = 4;

//     f[2]["P"] = 5;
//     f[2]["Q"] = 6;

//     $display("\nf[$][string]");
//     foreach(f[i,s])
//       $display("f[%0d][%s] = %0d",i,s,f[i][s]);


//     g[10][100] = 1;
//     g[10][200] = 2;
//     g[20][300] = 3;
//     g[20][400] = 4;

//     $display("\ng[int][int]");
//     foreach(g[i,j])
//       $display("g[%0d][%0d] = %0d",i,j,g[i][j]);


//     h[10] = new[3];
//     h[20] = new[2];

//     foreach(h[i,j])
//       h[i][j] = 100+j;

//     foreach(h[i,j])
//       h[i][j] = 200+j;

//     $display("\nh[int][]");
//     foreach(h[i,j])
//       $display("h[%0d][%0d] = %0d",i,j,h[i][j]);

//     x[1].push_back(10);
//     x[1].push_back(20);
//     x[1].push_back(30);

//     x[2].push_back(40);
//     x[2].push_back(50);

//     $display("\nx[int][$]");
//     foreach(x[i,j])
//       $display("x[%0d][%0d] = %0d",i,j,x[i][j]);

//   end

// endmodule
   
      


    
