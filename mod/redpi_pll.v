module redpi_pll # (
  parameter MULT = 10,
  parameter REF_PERIOD = 10.000) (
  input  wire clk_in,
  input  wire reset,
  input  wire power_down,
  output wire locked,
  output wire adc_clk,
  output wire dac_clk_1x, 
  output wire dac_clk_2x, 
  output wire dac_clk_2p);

  wire clk_fb;

  PLLE2_BASE #(
    .BANDWIDTH            ("OPTIMIZED"),
    .DIVCLK_DIVIDE        ( 1         ),
    //VCO is at 125 x 8 = 1000.00 MHz (between 600 and 1200 MHz)
    .CLKFBOUT_MULT        ( MULT      ),
    .CLKFBOUT_PHASE       ( 0.000     ),
    //CLKOUT0 - 125 MHz
    .CLKOUT0_DIVIDE       ( 8         ),
    .CLKOUT0_PHASE        ( 180.000   ),
    .CLKOUT0_DUTY_CYCLE   ( 0.5       ),
    //CLKOUT1 - 125 MHz
    .CLKOUT1_DIVIDE       ( 8         ),
    .CLKOUT1_PHASE        ( 180.000   ),
    .CLKOUT1_DUTY_CYCLE   ( 0.5       ),
    //CLKOUT2 - 250 MHz
    .CLKOUT2_DIVIDE       ( 4         ),
    .CLKOUT2_PHASE        ( 0.000     ),
    .CLKOUT2_DUTY_CYCLE   ( 0.5       ),
    //CLKOUT3 - 250 500ps offset
    .CLKOUT3_DIVIDE       ( 4         ),
    .CLKOUT3_PHASE        (-45.000    ),
    .CLKOUT3_DUTY_CYCLE   ( 0.5       ),
    //CLKOUT4 - 250 MHz
    .CLKOUT4_DIVIDE       ( 4         ),  // 4->250MHz
    .CLKOUT4_PHASE        ( 0.000     ),
    .CLKOUT4_DUTY_CYCLE   ( 0.5       ),
    //CLKOUT5 - 250 MHz
    .CLKOUT5_DIVIDE       ( 4         ),
    .CLKOUT5_PHASE        ( 0.000     ),
    .CLKOUT5_DUTY_CYCLE   ( 0.5       ),
    //CLKIN
    .CLKIN1_PERIOD        ( REF_PERIOD),
    .REF_JITTER1          ( 0.000     ))
  pll (
    // Output clocks
    .CLKFBOUT             (clk_fb     ),
    .CLKOUT0              (adc_clk    ),
    .CLKOUT1              (dac_clk_1x ),
    .CLKOUT2              (dac_clk_2x ),
    .CLKOUT3              (dac_clk_2p ),
    // Input clock control
    .CLKFBIN              (clk_fb     ),
    .CLKIN1               (clk_in     ),
    // Other control and status signals
    .LOCKED               (locked     ),
    .PWRDWN               (power_down ),
    .RST                  (reset      ));

endmodule: redpi_pll
