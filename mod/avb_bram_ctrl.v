module avb_bram_ctrl # (
  parameter BASE_ADDRESS = 32'h0,
  parameter BRAM_DEPTH = 1024,
  parameter ADDR_WIDTH = 10) (
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
  
  //phy signals
  input  wire ext_clock,
  input  wire ext_wr_en,
  input  wire ext_rd_en,
  input  wire [ADDR_WIDTH-1:0] ext_addr,
  input  wire [31:0] ext_data_in,
  output wire [31:0] ext_data_out);
 
  wire reset;
  assign reset = ~resetn;
  assign avb_waitrequest = reset;
 
  wire [31:0] bm_rd_data;
  reg  [31:0] bm_wr_data = 32'h0;
  reg  [31:0] bm_addr = 32'h0;
  reg  bm_rd_nxt = 1'b0;
  reg  bm_wr_ena = 1'b0;
 
  //bus read operation (slave peripheral to bus)//
  always@(posedge clock)
    if (reset) begin
      bm_rd_nxt <= 1'b0;
      avb_readdatavalid <= 1'b0;
    end else begin
      bm_rd_nxt <= 1'b0;
      avb_readdatavalid <= 1'b0;
      if (avb_read)
        case (avb_address)
          (BASE_ADDRESS+0): begin
                              avb_readdata <= bm_addr;
                              avb_readdatavalid <= 1'b1;
                            end
          (BASE_ADDRESS+4): begin
                              avb_readdata <= bm_rd_data;
                              bm_rd_nxt <= 1'b1;
                              avb_readdatavalid <= 1'b1;
                            end
        endcase
    end
 
  //bus write operation (bus to slave peripheral//
  always@(posedge clock)
    if (reset) begin
      bm_addr <= 0;
      bm_wr_data <= 0;
      bm_wr_ena <= 1'b0;
    end else begin
      bm_wr_ena <= 1'b0;
      if (bm_wr_ena | bm_rd_nxt) bm_addr <= bm_addr + 1;
      if (avb_write)
        case (avb_address)
          (BASE_ADDRESS+0): bm_addr <= avb_writedata;
          (BASE_ADDRESS+4): begin
                              bm_wr_data <= avb_writedata;
                              bm_wr_ena <= 1'b1;
                            end
        endcase
    end
 
  bram_dp_ram # (
    .DATA_WIDTH(32),
    .MEM_DEPTH(BRAM_DEPTH),
    .ADDR_WIDTH(ADDR_WIDTH))
    
  data_block (
    .clk_a(ext_clock),
    .clk_b(clock),
    .reset(reset),
    .wr_en_a(ext_wr_en),
    .rd_en_a(ext_rd_en),
    .addr_a(ext_addr),
    .wr_data_a(ext_data_in),
    .rd_data_a(ext_data_out),
    .wr_en_b(bm_wr_ena),
    .rd_en_b(1'b1),
    .addr_b(bm_addr[ADDR_WIDTH-1:0]),
    .wr_data_b(bm_wr_data),
    .rd_data_b(bm_rd_data));

endmodule: avb_bram_ctrl