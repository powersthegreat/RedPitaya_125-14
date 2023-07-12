module avb_gpio_ctrl # (
  //default AVB address, pin directions, output values
  parameter BASE_ADDRESS = 32'h0,
  parameter DEFAULT_DIR = 32'h0,
  parameter DEFAULT_OUT = 32'h0) (

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
  input  wire [31:0] avb_writedata,

  //external signals//
  inout  wire [31:0] gpio,
  output reg  [31:0] gpio_dir = DEFAULT_DIR);

  //define reset from resetn
  wire reset;
  assign reset = ~resetn;
  assign avb_waitrequest = reset;

  //internal registers
//  reg  [31:0] gpio_dir = DEFAULT_DIR;
  reg  [31:0] gpio_out = DEFAULT_OUT;

  //avb read controller PL -> AVB -> PS
  always@(posedge clock)
    if (avb_read)
      case (avb_address)
        (BASE_ADDRESS+0): begin
                            avb_readdata <= gpio;
                            avb_readdatavalid <= 1'b1;
                          end
        (BASE_ADDRESS+4): begin
                            avb_readdata <= gpio_dir;
                            avb_readdatavalid <= 1'b1;
                          end
        default:          avb_readdatavalid <= 1'b0;
      endcase
    else avb_readdatavalid <= 1'b0;

  //avb write controller PS -> AVB -> PL
  always@(posedge clock)
    if (reset) begin
      gpio_out <= DEFAULT_OUT;
      gpio_dir <= DEFAULT_DIR;
    end else
      if (avb_write)
        case (avb_address)
          (BASE_ADDRESS+0): gpio_out <= avb_writedata;
          (BASE_ADDRESS+4): gpio_dir <= avb_writedata;
        endcase

  //GPIO peripheral specific logic
  //tristate each gpio line based on gp_dir register
  genvar index;
  for (index = 0; index < 32; index = index + 1) begin
    assign gpio[index] = (gpio_dir[index]) ? gpio_out[index] : 1'bZ ;
  end

endmodule