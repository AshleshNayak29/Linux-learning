module AMBA_APB (
  Pclk, Prstn, Pselx, Paddr, Pwrite, Pwdata, Penable,
  Pready, Pslave_err, Prdata
);

  parameter DEPTH       = 1024;
  parameter WIDTH       = 32;
  parameter ADDR_WIDTH  = 32;

  input  Pclk, Prstn, Pwrite, Penable, Pselx;
  input  [ADDR_WIDTH-1:0] Paddr;
  input  [WIDTH-1:0]      Pwdata;
  output reg [WIDTH-1:0]  Prdata;
  output reg              Pslave_err;
  output reg              Pready;

  reg [WIDTH-1:0] APB_MEM [0:DEPTH-1];
  reg [2:0] Pstate, Nstate;

  parameter IDLE          = 3'b001;
  parameter SETUP         = 3'b010;
  parameter ACCESS        = 3'b100;
  parameter RESERVED_ADDR = 10'd1023;

  integer I;

  always @(posedge Pclk or negedge Prstn) begin
    if (!Prstn) begin
      Prdata     <= 0;
      Pslave_err <= 0;
      Pready     <= 0;
      Pstate     <= IDLE;
      Nstate     <= IDLE;
      for (I = 0; I < DEPTH; I = I + 1)
        APB_MEM[I] <= 0;
    end
    else begin
      case (Pstate)
        IDLE: begin
          Pready     <= 0;
          Pslave_err <= 0;
          if (Pselx && !Penable) begin
            Nstate <= SETUP;
            $display("Inside IDLE: going to SETUP state");
          end
          else begin
            Nstate <= IDLE;
            $display("Inside IDLE: staying in IDLE state");
          end
        end

        SETUP: begin
          Pready = 0;
          if (Pselx && Penable) begin
            Nstate <= ACCESS;
            $display("Inside SETUP: going to ACCESS state");
          end
          else begin
            Nstate <= SETUP;
          end
        end

        ACCESS: begin
          Pready = 1;
          if (Pwrite) begin
            if (Paddr >= 33) begin
              Pslave_err <= 1;
            end
            else if (Paddr == RESERVED_ADDR) begin
              Pslave_err <= 1; // Prevent writes to reserved address
            end
            else begin
              APB_MEM[Paddr] <= Pwdata;
              Pslave_err <= 0;
            end
          end
          else begin
            Prdata <= APB_MEM[Paddr];
          end

          if (!Pselx && !Penable)
            Nstate <= IDLE;
          else if (Pselx && !Penable)
            Nstate <= SETUP;
          else
            Nstate <= ACCESS;
        end
      endcase
    end
  end

  always @(Nstate) begin
    Pstate = Nstate;
  end

endmodule

