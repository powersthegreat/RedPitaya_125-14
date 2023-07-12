module redpi_adc (
  input  wire adc_clk,
  input  wire [13:0] adc_da_i,
  input  wire [13:0] adc_db_i,
  output wire signed [15:0] adc_da,
  output wire signed [15:0] adc_db,
  output wire [1:0] adc_clk_o,
  output wire adc_cdcs_o);

//------------------------------------------------------------------//
// ADC -------------------------------------------------------------//
//------------------------------------------------------------------//
  assign adc_clk_o = 2'b10; // generating ADC clock is disabled
  assign adc_cdcs_o = 1'b1; //ADC clock duty cycle stabilizer is enabled

  //sync adc input data to adc_clk
  reg  [13:0] adc_db_raw = 0;
  reg  [13:0] adc_da_raw = 0;

  always@(posedge adc_clk) begin
    adc_db_raw <= adc_db_i;
    adc_da_raw <= adc_da_i;
  end
  assign adc_db = {{3{~adc_db_raw[13]}}, adc_db_raw[12:0]};
  assign adc_da = {{3{~adc_da_raw[13]}}, adc_da_raw[12:0]};
//------------------------------------------------------------------//

endmodule: redpi_adc
