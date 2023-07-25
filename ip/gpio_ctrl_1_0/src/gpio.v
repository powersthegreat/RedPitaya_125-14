`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CReSIS | University of Kansas
// Engineer: William Powers
//////////////////////////////////////////////////////////////////////////////////


module gpio_ctrl #(
    parameter DATA_WIDTH = 32
)(
    input [DATA_WIDTH-1:0] led_in,
    input [DATA_WIDTH-1:0] exp_in,
    output [DATA_WIDTH-1:0] led_out,
    output [DATA_WIDTH-1:0] exp_out
);

    genvar index;
    for (index = 0; index < DATA_WIDTH; index = index + 1) begin
        assign led_out[index] = led_in[index];
        assign exp_out[index] = exp_in[index];
    end

endmodule
