`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CReSIS | University of Kansas
// Engineer: William Powers
//////////////////////////////////////////////////////////////////////////////////


module cmult #(
    parameter DATA_WIDTH = 32
)
(
    input wire [DATA_WIDTH-1:0] a,
    input wire [DATA_WIDTH-1:0] b,
    output reg [DATA_WIDTH-1:0] cr,
    output reg [DATA_WIDTH-1:0] ci
);
    
    wire signed [(DATA_WIDTH/2)-1:0] ar;
    wire signed [(DATA_WIDTH/2)-1:0] ai;
    wire signed [(DATA_WIDTH/2)-1:0] br;
    wire signed [(DATA_WIDTH/2)-1:0] bi;
    
    assign ar = a[DATA_WIDTH-1: 16];
    assign ai = a[(DATA_WIDTH/2)-1:0];   
    assign br = b[DATA_WIDTH-1: 16];
    assign bi = b[(DATA_WIDTH/2)-1:0];
    
    always@(a, b) begin
        cr = ar*br - ai*bi;
        ci = ar*br + ai*bi;
    end
    
endmodule