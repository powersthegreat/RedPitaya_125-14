`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CReSIS | University of Kansas
// Engineer: William Powers
//////////////////////////////////////////////////////////////////////////////////


module bram #(
    parameter DATA_WIDTH = 8,
    parameter MEMORY_DEPTH = 1024,
    parameter ADDR_WIDTH = 10
)(
    input wire clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [ADDR_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0] wr_data,
    output reg [DATA_WIDTH-1:0] rd_data
);

    reg [DATA_WIDTH-1:0] bram [MEMORY_DEPTH-1:0];
    // initial $readmemh (ROM_FILENAME.bram);
    
    always@(posedge clk)
        if (~rst) rd_data = 0;
        else begin
            if (wr_en) bram[addr] = wr_data;
            if (rd_en) rd_data = bram[addr];
        end
        
endmodule
