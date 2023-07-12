module bram_dp_ram # (
  parameter DATA_WIDTH = 8,
  parameter MEM_DEPTH = 1024,
  parameter ADDR_WIDTH = 10) (//,
  //parameter ROM_FILENAME = "") (
  input  wire clk_a,
  input  wire clk_b,
  input  wire reset,
  input  wire wr_en_a,
  input  wire rd_en_a,
  input  wire [ADDR_WIDTH-1:0] addr_a,
  input  wire [DATA_WIDTH-1:0] wr_data_a,
  output reg  [DATA_WIDTH-1:0] rd_data_a = 0,
  input  wire wr_en_b,
  input  wire rd_en_b,
  input  wire [ADDR_WIDTH-1:0] addr_b,
  input  wire [DATA_WIDTH-1:0] wr_data_b,
  output reg  [DATA_WIDTH-1:0] rd_data_b = 0);
 
  reg  [DATA_WIDTH-1:0] bram [MEM_DEPTH-1:0];
  //initial $readmemh(ROM_FILENAME,bram);
 
  always@(posedge clk_a)
    if (reset) rd_data_a <= 0;
    else begin
      if (wr_en_a) bram[addr_a] <= wr_data_a;
      if (rd_en_a) rd_data_a <= bram[addr_a];
    end
 
  always@(posedge clk_b)
    if (reset) rd_data_b <= 0;
    else begin
      if (wr_en_b) bram[addr_b] <= wr_data_b;
      if (rd_en_b) rd_data_b <= bram[addr_b];
    end

endmodule: bram_dp_ram