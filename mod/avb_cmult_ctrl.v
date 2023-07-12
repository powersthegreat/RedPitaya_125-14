module avb_cmult_ctrl # (
  parameter BASE_ADDRESS = 32'h0) (

  //ps7 clock and reset connections//
  input  wire clock,
  input  wire resetn,

  //avalon bus connections//
  input  wire [31:0] avb_address,
  output reg  [31:0] avb_readdata = 32'h0,
  output reg  avb_readdatavalid = 1'b0,
  output wire avb_waitrequest,
  input  wire [3:0] avb_byteenable,
  input  wire avb_read,
  input  wire avb_write,
  input  wire [31:0] avb_writedata

  //custom signals//
  //make sure to add a comma above if adding signals//
  );

  //define reset from resetn
  wire reset;
  assign reset = ~resetn;
  assign avb_waitrequest = reset;

  //internal registers for ps-pl comms
  reg  [31:0] a = 0;
  reg  [31:0] b = 0;
  reg  signed [31:0] cr;
  reg  signed [31:0] ci;

  //avb read controller PL -> AVB -> PS
  always@(posedge clock)
    if (avb_read)
      case (avb_address)
        (BASE_ADDRESS+0): begin
                            avb_readdata <= cr;
                            avb_readdatavalid <= 1'b1;
                          end
        (BASE_ADDRESS+4): begin
                            avb_readdata <= ci;
                            avb_readdatavalid <= 1'b1;
                          end
        default:          avb_readdatavalid <= 1'b0;
      endcase
    else avb_readdatavalid <= 1'b0;

  //avb write controller PS -> AVB -> PL
  always@(posedge clock)
    if (reset) begin
    end else
      if (avb_write)
        case (avb_address)
          (BASE_ADDRESS+0): a <= avb_writedata;
          (BASE_ADDRESS+4): b <= avb_writedata;
        endcase

  //peripheral specific logic
  wire signed [15:0] ar;
  wire signed [15:0] ai;
  wire signed [15:0] br;
  wire signed [15:0] bi;

  assign ar = a[31:16];
  assign ai = a[15:0];
  assign br = b[31:16];
  assign bi = b[15:0];
  always@(posedge clock) begin
    cr = ar*br - ai*bi;
    ci = ai*br + ar*bi;
  end

endmodule