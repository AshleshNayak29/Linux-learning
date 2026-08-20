//// interface code for AXI

// interface axi_interface #(parameter addr_width = 32)(input logic ACLK,
//                                                      input logic ARESETn);

//   // WRITE ADDRESS CHANNEL
//   logic [3:0]            AWID;
//   logic [addr_width-1:0] AWADDR;
//   logic [3:0]            AWLEN;
//   logic [2:0]            AWSIZE;
//   logic [1:0]            AWLOCK;
//   logic [1:0]            AWBURST;
//   logic                  AWVALID;
//   logic                  AWREADY;

//   // WRITE DATA CHANNEL
//   logic [3:0]            WID;
//   logic [addr_width-1:0] WDATA;
//   logic [3:0]            WSTRB;
//   logic                  WLAST;
//   logic                  WVALID;
//   logic                  WREADY;

//   // WRITE RESPONSE CHANNEL
//   logic [3:0]            BID;
//   logic [1:0]            BRESP;
//   logic                  BVALID;
//   logic                  BREADY;

//   // READ ADDRESS CHANNEL
//   logic [3:0]            ARID;
//   logic [addr_width-1:0] ARADDR;
//   logic [3:0]            ARLEN;
//   logic [2:0]            ARSIZE;
//   logic [1:0]            ARBURST;
//   logic [1:0]            ARLOCK;
//   logic                  ARVALID;
//   logic                  ARREADY;

//   // READ DATA CHANNEL
//   logic [3:0]            RID;
//   logic [addr_width-1:0] RDATA;
//   logic [1:0]            RRESP;
//   logic                  RLAST;
//   logic                  RVALID;
//   logic                  RREADY;

//   // MODPORTS 
//   modport master (
//     input  ACLK, ARESETn,
//     output AWID, AWADDR, AWLEN, AWSIZE,AWBURST, AWLOCK, AWVALID,
//     input  AWREADY,
//     output WID, WDATA, WSTRB, WLAST, WVALID,
//     input  WREADY,
//     input  BID, BRESP, BVALID,
//     output BREADY,
//     output ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID,
//     input  ARREADY,
//     input  RID, RDATA, RRESP, RLAST, RVALID,
//     output RREADY
//   );
  
//     modport master_monitor (
//     input ACLK, ARESETn,

//     // WRITE ADDRESS
//     input AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWVALID, AWREADY,

//     // WRITE DATA
//     input WID, WDATA, WSTRB, WLAST, WVALID, WREADY,

//     // WRITE RESPONSE
//     input BID, BRESP, BVALID, BREADY,

//     // READ ADDRESS
//     input ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID, ARREADY,

//     // READ DATA
//     input RID, RDATA, RRESP, RLAST, RVALID, RREADY
//   );


//   modport slave (
//     input  ACLK, ARESETn,
//     input  AWID, AWADDR, AWLEN, AWSIZE,AWBURST, AWLOCK, AWVALID,
//     output AWREADY,
//     input  WID, WDATA, WSTRB, WLAST, WVALID,
//     output WREADY,
//     output BID, BRESP, BVALID,
//     input  BREADY,
//     input  ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID,
//     output ARREADY,
//     output RID, RDATA, RRESP, RLAST, RVALID,
//     input  RREADY
//   );
  
//     modport slave_monitor (
//     input ACLK, ARESETn,      
//     input AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWVALID, AWREADY,
//     input WID, WDATA, WSTRB, WLAST, WVALID, WREADY,
//     input BID, BRESP, BVALID, BREADY,
//     input ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID, ARREADY,
//     input RID, RDATA, RRESP, RLAST, RVALID, RREADY
//   );

//   clocking cb_master @(posedge ACLK);
    
//  //  default input #1 output #0;

//     output AWID, AWADDR, AWLEN, AWSIZE,AWBURST, AWLOCK, AWVALID;
//     input  AWREADY;
//     output WID, WDATA, WSTRB, WLAST, WVALID;
//     input  WREADY;
//     input  BID, BRESP, BVALID;
//     output BREADY;
//     output ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID;
//     input  ARREADY;
//     input  RID, RDATA, RRESP, RLAST, RVALID;
//     output RREADY;
//   endclocking
  
//     clocking cb_master_mon @(posedge ACLK);
//     default input #1;

//     input AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWVALID, AWREADY;
//     input WID, WDATA, WSTRB, WLAST, WVALID, WREADY;
//     input BID, BRESP, BVALID, BREADY;
//     input ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID, ARREADY;
//     input RID, RDATA, RRESP, RLAST, RVALID, RREADY;
//   endclocking

//   clocking cb_slave @(posedge ACLK);
    
//  //   default input #1 output #1;
//     input  AWID, AWADDR, AWLEN, AWSIZE,AWBURST, AWLOCK, AWVALID;
//     output AWREADY;
//     input  WID, WDATA, WSTRB, WLAST, WVALID;
//     output WREADY;
//     output BID, BRESP, BVALID;
//     input  BREADY;
//     input  ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID;
//     output ARREADY;
//     output RID, RDATA, RRESP, RLAST, RVALID;
//     input  RREADY;
    
//     endclocking
  
//       clocking cb_slave_mon @(posedge ACLK);
//     default input #1;

//     input AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWVALID, AWREADY;
//     input WID, WDATA, WSTRB, WLAST, WVALID, WREADY;
//     input BID, BRESP, BVALID, BREADY;
//     input ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARVALID, ARREADY;
//     input RID, RDATA, RRESP, RLAST, RVALID, RREADY;
//   endclocking
  
// endinterface


////////......function and tasks inside the interface.........////////////////

// interface intf;

//   logic clk;
//   logic wr;
//   logic [7:0] addr;
//   logic [7:0] data;

//   function bit valid_addr(input [7:0] a); //here function is used within the task

//     if(a < 100)
//       return 1;
//     else
//       return 0;

//   endfunction

//   task write(input [7:0] a,   // here task is written 
//              input [7:0] d);

//     @(posedge clk);

//     addr = a;
//     data = d;
//     wr   = 1;

//     $display("[%0t] task diplay addr=%0d data=%0d",$time,a,d);

//     @(posedge clk);

//     wr = 0; // write enable is should be 0 in next cycle

//     $display("[%0t] write enable is zero",$time);

//   endtask

// endinterface


// class driver;

//   virtual intf vif;  // here virtual function is called bcz Modules and interfaces are static constructs created during elaboration, whereas class objects are dynamic and created at runtime using new(). Since a dynamic class cannot contain or create a static interface instance, SystemVerilog provides a virtual interface, which is simply a reference (handle) to an already existing static interface instance. This allows dynamic class-based components like drivers and monitors to access the same interface without creating duplicate hardware structures.

//   function new(virtual intf vif);
//     this.vif = vif;
//   endfunction

//   task run();

//     bit status;

//     status = vif.valid_addr(20);   //function declred in thhe interface

//     if(status)
//       $display("\nAddress 20 is VALID\n");
//     else
//       $display("\nAddress 20 is INVALID\n");


//     status = vif.valid_addr(120);

//     if(status)
//       $display("Address 120 is VALID\n");
//     else
//       $display("Address 120 is INVALID\n");

//     vif.write(10,55);

//     vif.write(25,100);

//     vif.write(40,200);

//   endtask

// endclass


// module top;

//   intf inf();

//   driver drv;

//   initial
//     inf.clk = 0;

//   always #5 inf.clk = ~inf.clk;

//   initial begin

//     drv = new(inf);

//     drv.run();

//     #20;

//     $finish;

//   end

// endmodule


////......calling moduel task/function within the class....../////
// The module defines the task/function.
// The interface declares (imports) the task/function prototype.
// The modport exports the task/function so other modules/classes can call it through the interface.

// interface intf;

//   // Prototype (task is implemented elsewhere)
//   import task write(input int addr, input int data);  // here the interface knows this task exists somewhere

//   modport mod_port (
//     import task write   //here why import means here modport is expecting the task write from the module
//   );

// endinterface
    
///////{A class cannot directly call a task/function inside a module just by using the module name or creating a module variable. Classes and modules belong to different worlds in SystemVerilog.}//////

//     module module_task(intf inf);

//       task write(input int addr, input int data);  //this task modport is expecting
//     $display(" Addr=%0d Data=%0d", addr, data);
//   endtask

// endmodule
    
    
//     class driver;

//   virtual intf.mod_port vif;    //through mod port here class is accessing the task written inside the module

//       function new(virtual intf.mod_port vif);
//     this.vif = vif;
//   endfunction

//   task run();
//     vif.write(10, 55);
//   endtask

// endclass
    
    
//     module top;

//   intf inf();

//       module_task mod(inf);

//   driver drv;

//   initial begin
//     drv = new(inf);
//     drv.run();
//   end

// endmodule



//// Implements keyword//////

/*Classes can implement one or more interface classes through the implements keyword. No member types
or parameters are inherited through the implements keyword. A subclass implicitly implements all of the
interface classes implemented by its superclass. */

///We use the implements keyword in SystemVerilog when we want a class to follow a common contract (interface class) without inheriting any implementation or data. This is useful when multiple unrelated classes need to provide the same set of methods, but each class should implement those methods in its own way.


///We use an interface class when we want to define only a contract, not an implementation. A normal class can contain variables, implemented methods, and data, whereas an interface class contains only method declarations (typically pure virtual methods). An interface class says, "Any class that implements me must provide these methods

interface class mem_if;

  pure virtual function void write(int data);

  pure virtual function int read();

endclass
    
    class fifo implements mem_if;

  int q[$];

  virtual function void write(int data);
    q.push_back(data);
    $display("FIFO Write : %0d", data);
  endfunction

  virtual function int read();

    int temp;

    temp = q.pop_front();

    $display("FIFO Read : %0d", temp);

    return temp;

  endfunction

endclass
    
    class stack implements mem_if;

  int q[$];

  virtual function void write(int data);

    q.push_front(data);

    $display("Stack Push : %0d", data);

  endfunction

  virtual function int read();

    int temp;

    temp = q.pop_front();

    $display("Stack Pop : %0d", temp);

    return temp;

  endfunction

endclass
    
    
    
    module top;

  mem_if mem;      // Interface class handle

  fifo f;
  stack s;

  initial begin

    f = new();
    s = new();

    mem = f;

    mem.write(10);
    mem.write(20);

    $display("Read = %0d", mem.read());

    mem = s;

    mem.write(100);
    mem.write(200);

    $display("Read = %0d", mem.read());

  end

endmodule
