`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 18:26:50
// Design Name: 
// Module Name: Selector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Selector(
    input  wire [WIDTH-1:0]data_0,
	input  wire [WIDTH-1:0]data_1,
	input  wire sel,
    output wire [WIDTH-1:0]result
);

parameter  WIDTH = 8;

assign  result = (sel) ? data_1:data_0;

endmodule
