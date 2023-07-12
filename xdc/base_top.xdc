### From Red Pitaya 125-14 Schematic
### Red_Pitaya_Schematics v1.0.1.pdf

### LED
set_property IOSTANDARD LVCMOS33 [get_ports {led_o[*]}]
set_property SLEW       SLOW     [get_ports {led_o[*]}]
set_property DRIVE      4        [get_ports {led_o[*]}]

set_property PACKAGE_PIN F16     [get_ports {led_o[0]}]
set_property PACKAGE_PIN F17     [get_ports {led_o[1]}]
set_property PACKAGE_PIN G15     [get_ports {led_o[2]}]
set_property PACKAGE_PIN H15     [get_ports {led_o[3]}]
set_property PACKAGE_PIN K14     [get_ports {led_o[4]}]
set_property PACKAGE_PIN G14     [get_ports {led_o[5]}]
set_property PACKAGE_PIN J15     [get_ports {led_o[6]}]
set_property PACKAGE_PIN J14     [get_ports {led_o[7]}]

### Expansion connector
### Change SLEW and DRIVE as needed
set_property IOSTANDARD LVCMOS33 [get_ports {exp_io[*]}]
set_property SLEW       slow     [get_ports {exp_io[*]}]
set_property DRIVE      4        [get_ports {exp_io[*]}]

set_property PACKAGE_PIN G17 [get_ports {exp_io[0]}]
set_property PACKAGE_PIN G18 [get_ports {exp_io[1]}]
set_property PACKAGE_PIN H16 [get_ports {exp_io[2]}]
set_property PACKAGE_PIN H17 [get_ports {exp_io[3]}]
set_property PACKAGE_PIN J18 [get_ports {exp_io[4]}]
set_property PACKAGE_PIN H18 [get_ports {exp_io[5]}]
set_property PACKAGE_PIN K17 [get_ports {exp_io[6]}]
set_property PACKAGE_PIN K18 [get_ports {exp_io[7]}]
set_property PACKAGE_PIN L14 [get_ports {exp_io[8]}]
set_property PACKAGE_PIN L15 [get_ports {exp_io[9]}]
set_property PACKAGE_PIN L16 [get_ports {exp_io[10]}]
set_property PACKAGE_PIN L17 [get_ports {exp_io[11]}]
set_property PACKAGE_PIN K16 [get_ports {exp_io[12]}]
set_property PACKAGE_PIN J16 [get_ports {exp_io[13]}]
set_property PACKAGE_PIN M14 [get_ports {exp_io[14]}]
set_property PACKAGE_PIN M15 [get_ports {exp_io[15]}]

### ADC
# ADC data
set_property IOSTANDARD LVCMOS18 [get_ports {adc_da_i[*]}]
set_property IOB        TRUE     [get_ports {adc_da_i[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {adc_db_i[*]}]
set_property IOB        TRUE     [get_ports {adc_db_i[*]}]

# ADC A data
set_property PACKAGE_PIN Y17     [get_ports {adc_da_i[0]}]
set_property PACKAGE_PIN W16     [get_ports {adc_da_i[1]}]
set_property PACKAGE_PIN Y16     [get_ports {adc_da_i[2]}]
set_property PACKAGE_PIN W15     [get_ports {adc_da_i[3]}]
set_property PACKAGE_PIN W14     [get_ports {adc_da_i[4]}]
set_property PACKAGE_PIN Y14     [get_ports {adc_da_i[5]}]
set_property PACKAGE_PIN W13     [get_ports {adc_da_i[6]}]
set_property PACKAGE_PIN V12     [get_ports {adc_da_i[7]}]
set_property PACKAGE_PIN V13     [get_ports {adc_da_i[8]}]
set_property PACKAGE_PIN T14     [get_ports {adc_da_i[9]}]
set_property PACKAGE_PIN T15     [get_ports {adc_da_i[10]}]
set_property PACKAGE_PIN V15     [get_ports {adc_da_i[11]}]
set_property PACKAGE_PIN T16     [get_ports {adc_da_i[12]}]
set_property PACKAGE_PIN V16     [get_ports {adc_da_i[13]}]

# ADC B data
set_property PACKAGE_PIN R18     [get_ports {adc_db_i[0]}]
set_property PACKAGE_PIN P16     [get_ports {adc_db_i[1]}]
set_property PACKAGE_PIN P18     [get_ports {adc_db_i[2]}]
set_property PACKAGE_PIN N17     [get_ports {adc_db_i[3]}]
set_property PACKAGE_PIN R19     [get_ports {adc_db_i[4]}]
set_property PACKAGE_PIN T20     [get_ports {adc_db_i[5]}]
set_property PACKAGE_PIN T19     [get_ports {adc_db_i[6]}]
set_property PACKAGE_PIN U20     [get_ports {adc_db_i[7]}]
set_property PACKAGE_PIN V20     [get_ports {adc_db_i[8]}]
set_property PACKAGE_PIN W20     [get_ports {adc_db_i[9]}]
set_property PACKAGE_PIN W19     [get_ports {adc_db_i[10]}]
set_property PACKAGE_PIN Y19     [get_ports {adc_db_i[11]}]
set_property PACKAGE_PIN W18     [get_ports {adc_db_i[12]}]
set_property PACKAGE_PIN Y18     [get_ports {adc_db_i[13]}]

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports adc_clk_i[*]]
set_property PACKAGE_PIN U18           [get_ports adc_clk_i[1]]
set_property PACKAGE_PIN U19           [get_ports adc_clk_i[0]]

# Output ADC clock
set_property IOSTANDARD LVCMOS18 [get_ports {adc_clk_o[*]}]
set_property SLEW       FAST     [get_ports {adc_clk_o[*]}]
set_property DRIVE      8        [get_ports {adc_clk_o[*]}]
#set_property IOB        TRUE     [get_ports {adc_clk_o[*]}]

set_property PACKAGE_PIN N20 [get_ports {adc_clk_o[0]}]
set_property PACKAGE_PIN P20 [get_ports {adc_clk_o[1]}]

# ADC clock stabilizer
set_property IOSTANDARD LVCMOS18 [get_ports adc_cdcs_o]
set_property PACKAGE_PIN V18     [get_ports adc_cdcs_o]
set_property SLEW       FAST     [get_ports adc_cdcs_o]
set_property DRIVE      8        [get_ports adc_cdcs_o]

### DAC
# data
set_property IOSTANDARD LVCMOS33 [get_ports {dac_dat_o[*]}]
set_property SLEW       SLOW     [get_ports {dac_dat_o[*]}]
set_property DRIVE      4        [get_ports {dac_dat_o[*]}]
#set_property IOB        TRUE     [get_ports {dac_dat_o[*]}]

set_property PACKAGE_PIN M19 [get_ports {dac_dat_o[0]}]
set_property PACKAGE_PIN M20 [get_ports {dac_dat_o[1]}]
set_property PACKAGE_PIN L19 [get_ports {dac_dat_o[2]}]
set_property PACKAGE_PIN L20 [get_ports {dac_dat_o[3]}]
set_property PACKAGE_PIN K19 [get_ports {dac_dat_o[4]}]
set_property PACKAGE_PIN J19 [get_ports {dac_dat_o[5]}]
set_property PACKAGE_PIN J20 [get_ports {dac_dat_o[6]}]
set_property PACKAGE_PIN H20 [get_ports {dac_dat_o[7]}]
set_property PACKAGE_PIN G19 [get_ports {dac_dat_o[8]}]
set_property PACKAGE_PIN G20 [get_ports {dac_dat_o[9]}]
set_property PACKAGE_PIN F19 [get_ports {dac_dat_o[10]}]
set_property PACKAGE_PIN F20 [get_ports {dac_dat_o[11]}]
set_property PACKAGE_PIN D20 [get_ports {dac_dat_o[12]}]
set_property PACKAGE_PIN D19 [get_ports {dac_dat_o[13]}]

# control
set_property IOSTANDARD LVCMOS33 [get_ports dac_wrt_o]
set_property SLEW       FAST     [get_ports dac_wrt_o]
set_property DRIVE      8        [get_ports dac_wrt_o]
set_property IOSTANDARD LVCMOS33 [get_ports dac_sel_o]
set_property SLEW       FAST     [get_ports dac_sel_o]
set_property DRIVE      8        [get_ports dac_sel_o]
set_property IOSTANDARD LVCMOS33 [get_ports dac_clk_o]
set_property SLEW       FAST     [get_ports dac_clk_o]
set_property DRIVE      8        [get_ports dac_clk_o]
set_property IOSTANDARD LVCMOS33 [get_ports dac_rst_o]
set_property SLEW       FAST     [get_ports dac_rst_o]
set_property DRIVE      8        [get_ports dac_rst_o]
#set_property IOB        TRUE     [get_ports dac_*_o]

set_property PACKAGE_PIN M17 [get_ports dac_wrt_o]
set_property PACKAGE_PIN N16 [get_ports dac_sel_o]
set_property PACKAGE_PIN M18 [get_ports dac_clk_o]
set_property PACKAGE_PIN N15 [get_ports dac_rst_o]

### Timing
create_clock -period 8.000 -name adc_clk_in [get_ports adc_clk_i[1]]

set_input_delay -clock adc_clk_in 3.400 [get_ports adc_da_i[*]]
set_input_delay -clock adc_clk_in 3.400 [get_ports adc_db_i[*]]

set_false_path -from [get_clocks adc_clk] -to [get_clocks dac_clk_1x]
set_false_path -from [get_clocks adc_clk] -to [get_clocks dac_clk_2x]
set_false_path -from [get_clocks adc_clk] -to [get_clocks dac_clk_2p]
set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks adc_clk]
set_false_path -from [get_clocks adc_clk] -to [get_clocks clk_fpga_0]
set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks dac_clk_1x]
set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks dac_clk_2x]
set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks dac_clk_2p]