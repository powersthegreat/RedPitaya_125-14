module redpi_dac (
  input  wire dac_clk_1x,
  input  wire dac_clk_2x,
  input  wire dac_clk_2p,
  input  wire [15:0] dac_da,
  input  wire [15:0] dac_db,
  output wire dac_clk_o,
  output wire dac_wrt_o,
  output wire dac_sel_o,
  output wire dac_rst_o,
  output wire [13:0] dac_dat_o);

  wire dac_rst;
  assign dac_rst = 1'b0;

  localparam DDR_MODE = "SAME_EDGE";

  //                                            output signal      rising           falling          clock           enable     reset        ???
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_clk (.Q(dac_clk_o    ), .D1(1'b0      ), .D2(1'b1      ), .C(dac_clk_2p), .CE(1'b1), .R(1'b0   ), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_wrt (.Q(dac_wrt_o    ), .D1(1'b0      ), .D2(1'b1      ), .C(dac_clk_2x), .CE(1'b1), .R(1'b0   ), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_sel (.Q(dac_sel_o    ), .D1(1'b1      ), .D2(1'b0      ), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_rst (.Q(dac_rst_o    ), .D1(dac_rst   ), .D2(dac_rst   ), .C(dac_clk_1x), .CE(1'b1), .R(1'b0   ), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d13 (.Q(dac_dat_o[13]), .D1(dac_da[15]), .D2(dac_db[15]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d12 (.Q(dac_dat_o[12]), .D1(dac_da[14]), .D2(dac_db[14]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d11 (.Q(dac_dat_o[11]), .D1(dac_da[13]), .D2(dac_db[13]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d10 (.Q(dac_dat_o[10]), .D1(dac_da[12]), .D2(dac_db[12]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d09 (.Q(dac_dat_o[09]), .D1(dac_da[11]), .D2(dac_db[11]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d08 (.Q(dac_dat_o[08]), .D1(dac_da[10]), .D2(dac_db[10]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d07 (.Q(dac_dat_o[07]), .D1(dac_da[09]), .D2(dac_db[09]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d06 (.Q(dac_dat_o[06]), .D1(dac_da[08]), .D2(dac_db[08]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d05 (.Q(dac_dat_o[05]), .D1(dac_da[07]), .D2(dac_db[07]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d04 (.Q(dac_dat_o[04]), .D1(dac_da[06]), .D2(dac_db[06]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d03 (.Q(dac_dat_o[03]), .D1(dac_da[05]), .D2(dac_db[05]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d02 (.Q(dac_dat_o[02]), .D1(dac_da[04]), .D2(dac_db[04]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d01 (.Q(dac_dat_o[01]), .D1(dac_da[03]), .D2(dac_db[03]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
  ODDR #(.DDR_CLK_EDGE(DDR_MODE)) oddr_dac_d00 (.Q(dac_dat_o[00]), .D1(dac_da[02]), .D2(dac_db[02]), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));

endmodule: redpi_dac
